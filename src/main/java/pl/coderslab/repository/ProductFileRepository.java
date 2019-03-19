package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.ProductFile;

import java.util.List;


public interface ProductFileRepository extends JpaRepository<ProductFile,Long> {

    List<ProductFile> findAllByProductId (Long id);

    ProductFile findById(int id);
}
