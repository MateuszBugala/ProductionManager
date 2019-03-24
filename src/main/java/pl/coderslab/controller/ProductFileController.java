package pl.coderslab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pl.coderslab.model.ProductFile;
import pl.coderslab.service.ProductFileService;
import pl.coderslab.service.ProductService;
import pl.coderslab.service.QuotationItemService;

@Controller
@RequestMapping(path = "/files", produces = "text/html; charset=UTF-8")
public class ProductFileController {

    @Autowired
    private ProductFileService productFileService;

    @Autowired
    private ProductService productService;

    @Autowired
    private QuotationItemService quotationItemService;

    @RequestMapping("/all/{id}")
    public String all(@PathVariable Long id, Model model) {
        model.addAttribute("files", productFileService.findAllByProductId(id));
        model.addAttribute("productId", id);
        return "productFiles/all";

    }


    @GetMapping("/add/{id}")
    public String showUploadFileForm(@PathVariable Long id, ModelMap model) {
        if (quotationItemService.findAllByProductId(id).size() == 0) {
            model.addAttribute("productId", id);
            return "productFiles/add";
        } else {
            return "redirect:/products/details/" + id + "?quoted=true";
        }

    }

    @PostMapping("/add/{productId}")
    public String saveUploadedFileInDatabase(@PathVariable Long productId, HttpServletRequest request, final @RequestParam CommonsMultipartFile[] attachedFile) throws IllegalStateException, IOException {

        String fileDescription = request.getParameter("description");

        // Determine If There Is An File Upload
        if ((attachedFile != null) && (attachedFile.length > 0) && (!attachedFile.equals(""))) {
            for (CommonsMultipartFile aFile : attachedFile) {
                if (aFile.isEmpty()) {
                    continue;
                } else {
//                    System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
                    if (!aFile.getOriginalFilename().equals("")) {
                        ProductFile fileUploadObj = new ProductFile();
                        fileUploadObj.setFileName(aFile.getOriginalFilename());
                        fileUploadObj.setFileDescription(fileDescription);
                        fileUploadObj.setData(aFile.getBytes());
                        fileUploadObj.setProduct(productService.findById(productId));

                        productFileService.save(fileUploadObj);
                    }
                }
//                System.out.println("File Is Successfully Uploaded & Saved In The Database.... Hurrey!\n");
            }
        } else {
            // Do Nothing
        }
//        return  "productFiles/success";
        return "redirect:/files/all/" + productId;
    }


    @GetMapping("/download/{id}")
    public String downloadDocument(@PathVariable Long id, HttpServletResponse response) throws IOException {
        ProductFile document = productFileService.findById(id);
        Long productId = document.getProduct().getId();

//        bez poniższego pliki automatycznie otworzą się w przeglądarce
        response.setContentLength(document.getData().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + document.getFileName() + "\"");

        FileCopyUtils.copy(document.getData(), response.getOutputStream());

        return "redirect:/files/all/" + productId;
    }

    @GetMapping("/view/{id}")
    public String viewDocument(@PathVariable Long id, HttpServletResponse response) throws IOException {
        ProductFile document = productFileService.findById(id);
        Long productId = document.getProduct().getId();
        FileCopyUtils.copy(document.getData(), response.getOutputStream());

        return "redirect:/files/all/" + productId;
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        ProductFile document = productFileService.findById(id);
        Long productId = document.getProduct().getId();
        if (quotationItemService.findAllByProductId(productId).size() == 0) {
        try {
            productFileService.delete(id);
            return "redirect:/files/all/" + productId + "?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/files/all/" + productId + "?error=true";
        }
        } else {
            return "redirect:/products/details/" + productId + "?quoted=true";
        }
    }

}
