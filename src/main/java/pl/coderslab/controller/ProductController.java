package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Product;
import pl.coderslab.model.ProductColor;
import pl.coderslab.model.ProductGroup;
import pl.coderslab.model.ProductMaterial;
import pl.coderslab.service.ProductColorService;
import pl.coderslab.service.ProductGroupService;
import pl.coderslab.service.ProductMaterialService;
import pl.coderslab.service.ProductService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path = "/products", produces = "text/html; charset=UTF-8")
public class ProductController {


    @Autowired
    private ProductService productService;

    @Autowired
    private ProductGroupService productGroupService;

    @Autowired
    private ProductColorService productColorService;

    @Autowired
    private ProductMaterialService productMaterialService;


    @ModelAttribute("productGroups")
    public List<ProductGroup> getProductGroups() {
        return productGroupService.findAll();
    }

    @ModelAttribute("productColors")
    public List<ProductColor> getProductColors() {
        return productColorService.findAll();
    }

        @ModelAttribute("productMaterials")
    public List<ProductMaterial> getProductMaterials() {
        return productMaterialService.findAll();
    }




    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("products", productService.findAll());
        return "products/all";
    }

    @RequestMapping("/details/{id}")
    public String details(@PathVariable Long id, Model model) {
        Product product = productService.findById(id);
        List<ProductMaterial> productMaterials= productMaterialService.findProductMaterialsByProducts(product);
        product.setProductMaterials(productMaterials);
        model.addAttribute("product", product);
        return "products/details";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("product", new Product());
        return "products/add";
    }


    @PostMapping("/add")
    public String save(@Valid Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "products/add";
        }
        productService.save(product);
        return "redirect:/products/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        Product product = productService.findById(id);
        List<ProductMaterial> productMaterials= productMaterialService.findProductMaterialsByProducts(product);
        product.setProductMaterials(productMaterials);
        model.addAttribute("product", product);
//        model.addAttribute("product", productService.findById(id));
        return "products/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "products/edit";
        }
        productService.save(product);
        return "redirect:/products/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            productService.delete(id);
            return "redirect:/products/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/products/all?error=true";
        }
    }
}
