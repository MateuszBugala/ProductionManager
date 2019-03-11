package pl.coderslab.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String code;
    private String name;
    private String description;


    private ProductGroup productGroup;

    private int outerHeight;
    private int outerWidth;
    private int outerLength;

    @ManyToMany
    private List<ProductColor> productColors;

    @ManyToMany
    private List<ProductMaterial> productMaterials;

    private String notes;


}
