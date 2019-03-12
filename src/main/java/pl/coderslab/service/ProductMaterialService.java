package pl.coderslab.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.ProductMaterial;
import pl.coderslab.repository.ProductMaterialRepository;

import java.util.List;

@Service
@Transactional
public class ProductMaterialService {

    @Autowired
    private ProductMaterialRepository productMaterialRepository;


    public List<ProductMaterial> findAll() {
        return productMaterialRepository.findAll();
    }

    public ProductMaterial findById(Long id) {
        return productMaterialRepository.findOne(id);
    }

    public void save(ProductMaterial entity) {
        productMaterialRepository.save(entity);
    }

    public void delete(Long id) {
        productMaterialRepository.delete(id);
    }

}
