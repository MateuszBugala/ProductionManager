package pl.coderslab.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class ProductMaterial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany
    private List<Product> products;
}
