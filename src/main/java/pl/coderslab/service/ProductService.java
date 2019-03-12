package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Product;
import pl.coderslab.repository.ProductRepository;

import java.util.List;

@Service
@Transactional
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    public Product findById(Long id) {
        return productRepository.findOne(id);
    }

    public void save(Product entity) {
        productRepository.save(entity);
    }

    public void delete(Long id) {
        productRepository.delete(id);
    }
}
