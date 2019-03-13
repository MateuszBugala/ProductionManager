package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.ProductMaterial;
import pl.coderslab.service.ProductMaterialService;

public class ProductMaterialConverter implements Converter<String, ProductMaterial> {

    @Autowired
    private ProductMaterialService productMaterialService;


    @Override
    public ProductMaterial convert(String s) {
        return productMaterialService.findById(Long.parseLong(s));
    }
}
