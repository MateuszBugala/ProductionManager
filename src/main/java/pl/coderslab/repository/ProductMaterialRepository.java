package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Product;
import pl.coderslab.model.ProductMaterial;

import java.util.List;

public interface ProductMaterialRepository extends JpaRepository<ProductMaterial,Long> {

    List<ProductMaterial> findProductMaterialsByProducts(Product product);

}
