package pl.coderslab.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String code;
    private String name;
    private String description;

    @ManyToOne
    private ProductGroup productGroup;

    private int outerHeight;
    private int outerWidth;
    private int outerLength;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private List<ProductColor> productColors = new ArrayList<>();

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private List<ProductMaterial> productMaterials = new ArrayList<>();

    private String notes;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ProductGroup getProductGroup() {
        return productGroup;
    }

    public void setProductGroup(ProductGroup productGroup) {
        this.productGroup = productGroup;
    }

    public int getOuterHeight() {
        return outerHeight;
    }

    public void setOuterHeight(int outerHeight) {
        this.outerHeight = outerHeight;
    }

    public int getOuterWidth() {
        return outerWidth;
    }

    public void setOuterWidth(int outerWidth) {
        this.outerWidth = outerWidth;
    }

    public int getOuterLength() {
        return outerLength;
    }

    public void setOuterLength(int outerLength) {
        this.outerLength = outerLength;
    }

    public List<ProductColor> getProductColors() {
        return productColors;
    }

    public void setProductColors(List<ProductColor> productColors) {
        this.productColors = productColors;
    }

    public List<ProductMaterial> getProductMaterials() {
        return productMaterials;
    }

    public void setProductMaterials(List<ProductMaterial> productMaterials) {
        this.productMaterials = productMaterials;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", productGroup=" + productGroup +
                ", outerHeight=" + outerHeight +
                ", outerWidth=" + outerWidth +
                ", outerLength=" + outerLength +
                ", productColors=" + productColors +
                ", productMaterials=" + productMaterials +
                ", notes='" + notes + '\'' +
                '}';
    }
}
