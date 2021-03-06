package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.coderslab.model.Product;
import pl.coderslab.model.User;
import pl.coderslab.service.*;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Component
public class DataLoader {

    @Autowired
    private UserService userService;

    @Autowired
    private UserGroupService userGroupService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductGroupService productGroupService;

    @Autowired
    private ProductColorService productColorService;

    @Autowired
    private ProductMaterialService productMaterialService;

    //method invoked during the startup
    @PostConstruct
    public void loadData() {

        if (userService.findById(1L) == null) {
            userService.save(new User("John", "Doe", "sales@sales.com", "1", userGroupService.findById(1L)));
            userService.save(new User("Jane", "Doe", "production@production.com", "1", userGroupService.findById(2L)));
            userService.save(new User("Adam", "Smith", "admin@admin.com", "1", userGroupService.findById(3L)));

            productService.save(new Product("ABC001", "name1", "description1", productGroupService.findById(1L), 100,100,100,  "notes1"));
            productService.save(new Product("ABC002", "name2", "description2", productGroupService.findById(2L), 200,200,200,  "notes2"));
            productService.save(new Product("ABC003", "name3", "description3", productGroupService.findById(3L), 300,300,300,  "notes3"));

        }
    }

//
//    //method invoked during the shutdown
//    @PreDestroy
//    public void removeData() {
//        userService.deleteAll();
//    }
}
