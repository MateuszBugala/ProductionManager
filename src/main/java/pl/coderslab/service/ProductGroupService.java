package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.ProductGroup;
import pl.coderslab.repository.ProductGroupRepository;

import java.util.List;


@Service
@Transactional
public class ProductGroupService {

    @Autowired
    private ProductGroupRepository productGroupRepository;

    public List<ProductGroup> findAll() {
        return productGroupRepository.findAll();
    }

    public ProductGroup findById(Long id) {
        return productGroupRepository.findOne(id);
    }

    public void save(ProductGroup entity) {
        productGroupRepository.save(entity);
    }

    public void delete(Long id) {
        productGroupRepository.delete(id);
    }
}
