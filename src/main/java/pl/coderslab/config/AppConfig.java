package pl.coderslab.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.format.FormatterRegistry;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
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

import javax.persistence.EntityManagerFactory;
import java.util.Locale;

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
        emfb.setPersistenceUnitName("prodManPersistenceUnit");        /*ważne ta nazwa musi zgadzać się z persistence.xml*/
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



}
