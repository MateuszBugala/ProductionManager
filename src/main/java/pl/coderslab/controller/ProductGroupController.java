package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.ProductGroup;
import pl.coderslab.service.ProductGroupService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/productGroups", produces = "text/html; charset=UTF-8")
public class ProductGroupController {

    @Autowired
    private ProductGroupService productGroupService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("productGroups", productGroupService.findAll());
        return "productGroups/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("productGroup", new ProductGroup());
        return "productGroups/add";
    }


    @PostMapping("/add")
    public String save(@Valid ProductGroup productGroup, BindingResult result) {
        if (result.hasErrors()) {
            return "productGroups/add";
        }
        productGroupService.save(productGroup);
        return "redirect:/productGroups/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("productGroup", productGroupService.findById(id));
        return "productGroups/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid ProductGroup productGroup, BindingResult result) {
        if (result.hasErrors()) {
            return "productGroups/edit";
        }
        productGroupService.save(productGroup);
        return "redirect:/productGroups/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            productGroupService.delete(id);
            return "redirect:/productGroups/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/productGroups/all?error=true";
        }
    }
}
