package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.Product;
import pl.coderslab.service.ProductService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/products", produces = "text/html; charset=UTF-8")
public class ProductController {


    @Autowired
    private ProductService productService;


    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("products", productService.findAll());
        return "products/all";
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
        model.addAttribute("product", productService.findById(id));
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
