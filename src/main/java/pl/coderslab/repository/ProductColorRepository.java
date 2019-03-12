package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.ProductColor;

public interface ProductColorRepository extends JpaRepository<ProductColor,Long> {
}
