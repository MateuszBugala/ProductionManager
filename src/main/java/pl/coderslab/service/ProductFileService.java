package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.ProductFile;
import pl.coderslab.repository.ProductFileRepository;

import java.util.List;

@Service
@Transactional
public class ProductFileService {

    @Autowired
    private ProductFileRepository productFileRepository;

    public List<ProductFile> findAll() {
        return productFileRepository.findAll();
    }

    public List<ProductFile> findAllByProductId(Long id) {
        return productFileRepository.findAllByProductId(id);
    }

    public ProductFile findById(Long id) {
        return productFileRepository.findOne(id);
    }

    public ProductFile findById(int id) {
        return productFileRepository.findById(id);
    }

    public void save(ProductFile entity) {
        productFileRepository.save(entity);
    }

    public void delete(Long id) {
        productFileRepository.delete(id);
    }
}
