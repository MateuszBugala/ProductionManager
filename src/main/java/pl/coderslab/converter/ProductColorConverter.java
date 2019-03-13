package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.ProductColor;
import pl.coderslab.service.ProductColorService;

public class ProductColorConverter implements Converter<String, ProductColor> {

    @Autowired
    private ProductColorService productColorService;

    @Override
    public ProductColor convert(String s) {
        return productColorService.findById(Long.parseLong(s));
    }
}
