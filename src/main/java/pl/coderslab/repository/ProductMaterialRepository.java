package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.ProductMaterial;

public interface ProductMaterialRepository extends JpaRepository<ProductMaterial,Long> {
}
