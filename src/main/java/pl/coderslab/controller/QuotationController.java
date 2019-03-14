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
import pl.coderslab.model.ProductMaterial;
import pl.coderslab.model.Quotation;
import pl.coderslab.model.User;
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


    @PostMapping("/edit")
    public String update(@Valid Quotation quotation, BindingResult result) {
        if (result.hasErrors()) {
            return "quotations/edit";
        }
        quotationService.update(quotation);
        return "redirect:/quotations/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            quotationService.delete(id);
            return "redirect:/quotations/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/quotations/all?error=true";
        }
    }
}
