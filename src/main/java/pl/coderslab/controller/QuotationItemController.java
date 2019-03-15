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
import pl.coderslab.model.Quotation;
import pl.coderslab.model.QuotationItem;
import pl.coderslab.service.ProductService;
import pl.coderslab.service.QuotationItemService;
import pl.coderslab.service.QuotationService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping(path = "/quotationItems", produces = "text/html; charset=UTF-8")
public class QuotationItemController {

    @Autowired
    private QuotationItemService quotationItemService;

    @Autowired
    private ProductService productService;

    @Autowired
    private QuotationService quotationService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("quotationItems", quotationItemService.findAll());
        return "quotationItems/all";
    }


    @GetMapping("/add/{quotationId}/{productId}")
    public String add(@PathVariable Long quotationId, @PathVariable Long productId, Model model) {
        model.addAttribute("product", productService.findById(productId));
        model.addAttribute("quotationItem", new QuotationItem());
        return "quotationItems/add";
    }


    @PostMapping("/add/{quotationId}/{productId}")
    public String save(@Valid QuotationItem quotationItem, BindingResult result, @PathVariable Long quotationId, @PathVariable Long productId) {
        if (result.hasErrors()) {
            return "quotationItems/add";
        }
        quotationItem.setProduct(productService.findById(productId));
        quotationItem.setQuotation(quotationService.findById(quotationId));
        quotationItemService.save(quotationItem);
        return "redirect:/quotations/details/" + quotationId;
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model, HttpSession session) {
        QuotationItem quotationItem = quotationItemService.findById(id);
        Long quotationId = quotationItem.getQuotation().getId();
        Product product = quotationItem.getProduct();
        model.addAttribute("quotationItem", quotationItem);
        model.addAttribute("product", product);

        Long userGroup = (Long) session.getAttribute("userGroup");
        int quotStat = quotationService.findById(quotationId).getStatus();

        if (userGroup == 1 && (quotStat == 1 || quotStat == 2)) {
            return "quotationItems/ug1/edit";
        } else if (userGroup == 1 && (quotStat != 1 && quotStat != 2)) {
            return "redirect:/noAccess";
        }

        else if (userGroup == 2 && (quotStat == 2 || quotStat == 3)) {
            return "quotationItems/ug2/edit";
        } else if (userGroup == 2 && (quotStat != 2 && quotStat != 3)) {
            return "redirect:/noAccess";
        }

        return "quotationItems/ug3/edit";
    }


    @PostMapping("/edit/{quotationId}/{productId}")
    public String update(@Valid QuotationItem quotationItem, BindingResult result, @PathVariable Long quotationId, @PathVariable Long productId) {
        if (result.hasErrors()) {
            return "quotationItems/edit";
        }
        quotationItem.setProduct(productService.findById(productId));
        quotationItem.setQuotation(quotationService.findById(quotationId));
        quotationItemService.save(quotationItem);
        return "redirect:/quotations/details/" + quotationId;
    }


    @RequestMapping("/delete/{quotationId}/{quotationItemId}")
    public String delete(@PathVariable Long quotationId, @PathVariable Long quotationItemId) {
        int quotStat = quotationService.findById(quotationId).getStatus();
        if (quotStat == 1) {
            try {
                quotationItemService.delete(quotationItemId);
                return "redirect:/quotations/details/" + quotationId + "?deleted=true";
            } catch (Exception ConstraintViolationException) {
                return "redirect:/quotations/details/" + quotationId + "?error=true";
//            return "redirect:/quotationItems/all?error=true";
            }
        } else {
            return "redirect:/quotations/details/" + quotationId + "?sent=true";
//            return "redirect:/noAccess";
        }


    }

}
