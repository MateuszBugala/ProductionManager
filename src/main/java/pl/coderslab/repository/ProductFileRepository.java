package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.ProductFile;


public interface ProductFileRepository extends JpaRepository<ProductFile,Long> {


    ProductFile findById(int id);
}
