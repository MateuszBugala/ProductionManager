package pl.coderslab.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.ProductColor;
import pl.coderslab.service.ProductColorService;

import javax.validation.Valid;


@Controller
@RequestMapping(path = "/productColors", produces = "text/html; charset=UTF-8")
public class ProductColorController {

    @Autowired
    private ProductColorService productColorService;


    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("productColors", productColorService.findAll());
        return "productColors/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("productColor", new ProductColor());
        return "productColors/add";
    }


    @PostMapping("/add")
    public String save(@Valid ProductColor productColor, BindingResult result) {
        if (result.hasErrors()) {
            return "productColors/add";
        }
        productColorService.save(productColor);
        return "redirect:/productColors/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("productColor", productColorService.findById(id));
        return "productColors/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid ProductColor productColor, BindingResult result) {
        if (result.hasErrors()) {
            return "productColors/edit";
        }
        productColorService.save(productColor);
        return "redirect:/productColors/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            productColorService.delete(id);
            return "redirect:/productColors/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/productColors/all?error=true";
        }
    }
}


