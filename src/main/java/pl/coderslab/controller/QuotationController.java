package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.*;
import pl.coderslab.service.ProductService;
import pl.coderslab.service.QuotationItemService;
import pl.coderslab.service.QuotationService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping(path = "/quotations", produces = "text/html; charset=UTF-8")
public class QuotationController {


    @Autowired
    private QuotationService quotationService;

    @Autowired
    private QuotationItemService quotationItemService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("quotations", quotationService.findAll());
        return "quotations/all";
    }


    @RequestMapping("/details/{id}")
    public String details(@PathVariable Long id, Model model) {
        model.addAttribute("quotation", quotationService.findById(id));
        model.addAttribute("quotationItems", quotationItemService.findAllByQuotationId(id));
        return "quotations/details";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("quotation", new Quotation());
        return "quotations/add";
    }


    @PostMapping("/add")
    public String save(@Valid Quotation quotation, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "quotations/add";
        }
        User user = (User)session.getAttribute("currentUser");
        quotationService.create(quotation, user);
        return "redirect:/quotations/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("quotation", quotationService.findById(id));
        return "quotations/edit";
    }


    @PostMapping("/edit/{id}")
    public String update(@Valid Quotation quotation, BindingResult result, @PathVariable Long id) {
        if (result.hasErrors()) {
            return "quotations/edit";
        }
        quotationService.update(quotation);
        return "redirect:/quotations/details/"+id;
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            quotationService.delete(id);
            return "redirect:/quotations/all/";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/quotations/details/" + id + "?error=true";
        }
    }


    @GetMapping("/addItem/{id}")
    public String addItem(@PathVariable Long id, Model model) {
        model.addAttribute("products", productService.findAll());
        return "quotationItems/productlist";
    }


    @RequestMapping("/sent/{id}")
    public String sent(@PathVariable Long id) {
        List<QuotationItem> quotationItems = quotationItemService.findAllByQuotationId(id);
        if (quotationItems.size() != 0) {
            quotationService.changeStatus(id,2);
            return "quotations/sent";
        } else {
            return "redirect:/quotations/details/" + id + "?noItems=true";
        }
    }
}
