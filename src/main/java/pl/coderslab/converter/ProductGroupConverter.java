package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.ProductGroup;
import pl.coderslab.service.ProductGroupService;

public class ProductGroupConverter implements Converter<String, ProductGroup> {

    @Autowired
    private ProductGroupService productGroupService;

    @Override
    public ProductGroup convert(String s) {
        return productGroupService.findById(Long.parseLong(s));
    }
}
