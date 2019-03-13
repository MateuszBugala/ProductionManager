package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.Quotation;
import pl.coderslab.model.QuotationItem;
import pl.coderslab.service.ProductService;
import pl.coderslab.service.QuotationItemService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/quotationItems", produces = "text/html; charset=UTF-8")
public class QuotationItemController {

    @Autowired
    private QuotationItemService quotationItemService;

    @Autowired
    private ProductService productService;

    @Autowired
    private Quotation quotation;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("quotationItems", quotationItemService.findAll());
        return "quotationItems/all";
    }


    @GetMapping("/add/{id}")
    public String add(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("quotationItem", new QuotationItem());
        return "quotationItems/add";
    }


    @PostMapping("/add")
    public String save(@Valid QuotationItem quotationItem, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "quotationItems/add";
        }
        Long productId = quotationItem.getId();
        quotationItem.setId(null);
        quotationItem.setProduct(productService.findById(productId));

        quotation.addQuotation(quotationItem);

        model.addAttribute("quotation", quotation);
//        quotationItemService.save(quotationItem);
//        return "redirect:/quotationItems/all";
        return "redirect:/products/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("quotationItem", quotationItemService.findById(id));
        return "quotationItems/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid QuotationItem quotationItem, BindingResult result) {
        if (result.hasErrors()) {
            return "quotationItems/edit";
        }
        quotationItemService.save(quotationItem);
        return "redirect:/quotationItems/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            quotationItemService.delete(id);
            return "redirect:/quotationItems/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/quotationItems/all?error=true";
        }
    }

}
