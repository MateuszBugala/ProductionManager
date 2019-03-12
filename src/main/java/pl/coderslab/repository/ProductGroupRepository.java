package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.ProductGroup;

public interface ProductGroupRepository extends JpaRepository<ProductGroup,Long> {
}
