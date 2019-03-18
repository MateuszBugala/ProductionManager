package pl.coderslab.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.format.FormatterRegistry;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.LocaleContextResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import pl.coderslab.converter.ProductColorConverter;
import pl.coderslab.converter.ProductGroupConverter;
import pl.coderslab.converter.ProductMaterialConverter;
import pl.coderslab.converter.UserGroupConverter;
import pl.coderslab.dao.FileUploadDAO;
import pl.coderslab.dao.FileUploadDAOImpl;
import pl.coderslab.model.User;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.util.Locale;
import java.util.Properties;

@Configuration
@EnableWebMvc
@ComponentScan("pl.coderslab")
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "pl.coderslab.repository")        /*========= ważne Spring data =======*/
public class AppConfig extends WebMvcConfigurerAdapter {

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Override
    public void configureDefaultServletHandling(
            DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

//    Hibernate ============================

    @Bean
    public LocalEntityManagerFactoryBean entityManagerFactory() {
        LocalEntityManagerFactoryBean emfb = new LocalEntityManagerFactoryBean();
//        emfb.setPersistenceUnitName("prodManPersistenceUnit");
        return emfb;
    }


    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
        JpaTransactionManager tm = new JpaTransactionManager(emf);
        return tm;
    }

    //    Konwertery ============================

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(getUserGroupConverter());
        registry.addConverter(getProductColorConverter());
        registry.addConverter(getProductMaterialConverter());
        registry.addConverter(getProductGroupConverter());
    }


    @Bean
    public UserGroupConverter getUserGroupConverter() {
        return new UserGroupConverter();
    }

    @Bean
    public ProductColorConverter getProductColorConverter() {
        return new ProductColorConverter();
    }

    @Bean
    public ProductMaterialConverter getProductMaterialConverter() {
        return new ProductMaterialConverter();
    }

    @Bean
    public ProductGroupConverter getProductGroupConverter() {
        return new ProductGroupConverter();
    }



//    Validator - poniższe ustawia domyślnie język polski; wtedy załaduje plik wiadomości walidatora z /resources============================

    @Bean(name="localeResolver")
    public LocaleContextResolver getLocaleContextResolver() {
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("pl","PL"));
        return localeResolver; }


//File upload ============================

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver getCommonsMultipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(20971520);   // 20MB
        multipartResolver.setMaxInMemorySize(1048576);  // 1MB
        return multipartResolver;
    }

    @Autowired
    @Bean(name = "fileUploadDao")
    public FileUploadDAO getUserDao(SessionFactory sessionFactory) {
        return new FileUploadDAOImpl(sessionFactory);
    }

    @Autowired
    @Bean(name = "sessionFactory")
    public SessionFactory getSessionFactory(DataSource dataSource) {

        LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);

        sessionBuilder.scanPackages("pl.coderslab");
        sessionBuilder.addProperties(getHibernateProperties());

        return sessionBuilder.buildSessionFactory();
    }

    @Bean(name = "dataSource")
    public DataSource getDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/productionManager?useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("coderslab");

        return dataSource;
    }

    private Properties getHibernateProperties() {
        Properties properties = new Properties();
        properties.put("javax.persistence.schema-generation.database.action", "none");
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQL57Dialect");
        properties.put("hibernate.connection.useUnicode", "true");
        properties.put("hibernate.connection.characterEncoding", "utf8");
        properties.put("hibernate.connection.CharSet", "utf8");
        return properties;
    }


}
