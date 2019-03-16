package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.ProductMaterial;
import pl.coderslab.service.ProductMaterialService;

import javax.validation.Valid;


@Controller
@RequestMapping(path = "/productMaterials", produces = "text/html; charset=UTF-8")
public class ProductMaterialController {

    @Autowired
    private ProductMaterialService productMaterialService;


    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("productMaterials", productMaterialService.findAll());
        return "productMaterials/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("productMaterial", new ProductMaterial());
        return "productMaterials/add";
    }


    @PostMapping("/add")
    public String save(@Valid ProductMaterial productMaterial, BindingResult result) {
        if (result.hasErrors()) {
            return "productMaterials/add";
        }
        productMaterialService.save(productMaterial);
        return "redirect:/productMaterials/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("productMaterial", productMaterialService.findById(id));
        return "productMaterials/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid ProductMaterial productMaterial, BindingResult result) {
        if (result.hasErrors()) {
            return "productMaterials/edit";
        }
        productMaterialService.save(productMaterial);
        return "redirect:/productMaterials/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            productMaterialService.delete(id);
            return "redirect:/productMaterials/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/productMaterials/all?error=true";
        }
    }



}
