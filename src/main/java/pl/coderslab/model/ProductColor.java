package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product_colors")
public class ProductColor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

//    cascade, aby prawidłowe wyświetlanie kolorów na liście produktów i dodawania prod
    @ManyToMany(mappedBy = "productColors"/*, cascade = CascadeType.MERGE*/)
    private List<Product> products;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }


    @Override
    public String toString() {
        return "ProductColor{" +
                "id=" + id +
                ", name='" + name + '\'' +
//                ", products=" + products +
                '}';
    }
}
