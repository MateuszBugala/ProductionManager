package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.ProductColor;
import pl.coderslab.repository.ProductColorRepository;

import java.util.List;

@Service
@Transactional
public class ProductColorService {

    @Autowired
    private ProductColorRepository productColorRepository;

    public List<ProductColor> findAll() {
        return productColorRepository.findAll();
    }

    public ProductColor findById(Long id) {
        return productColorRepository.findOne(id);
    }

    public void save(ProductColor entity) {
        productColorRepository.save(entity);
    }

    public void delete(Long id) {
        productColorRepository.delete(id);
    }
}
