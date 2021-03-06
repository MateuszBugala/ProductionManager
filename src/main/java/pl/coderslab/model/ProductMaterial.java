package pl.coderslab.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "product_materials")
public class ProductMaterial {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    //    cascade, aby prawidłowe wyświetlanie materiałów na liście produktów
    @ManyToMany(mappedBy = "productMaterials"/*, cascade = CascadeType.MERGE*/)
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
        return "ProductMaterial{" +
                "id=" + id +
                ", name='" + name + '\'' +
//                ", products=" + products +
                '}';
    }
}
