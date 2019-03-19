package pl.coderslab.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pl.coderslab.model.ProductFile;
import pl.coderslab.service.ProductFileService;
import pl.coderslab.service.ProductService;

@Controller
@RequestMapping(path = "/files", produces = "text/html; charset=UTF-8")
public class ProductFileController {

    @Autowired
    private ProductFileService productFileService;

    @Autowired
    private ProductService productService;

    @GetMapping("/add/{id}")
    public String showUploadFileForm(@PathVariable Long id, ModelMap model) {
        model.addAttribute("productId", id);
        return "productFiles/fileupload";
    }

    @PostMapping("/add/{id}")
    public String saveUploadedFileInDatabase(@PathVariable Long id, HttpServletRequest request, final @RequestParam CommonsMultipartFile[] attachedFile) throws IllegalStateException, IOException {

        String fileDescription = request.getParameter("description");


        // Determine If There Is An File Upload. If Yes, Attach It To The Client Email
        if ((attachedFile != null) && (attachedFile.length > 0) && (!attachedFile.equals(""))) {

            for (CommonsMultipartFile aFile : attachedFile) {

                if(aFile.isEmpty()) {
                    continue;
                } else {
//                    System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
                    if (!aFile.getOriginalFilename().equals("")) {
                        ProductFile fileUploadObj = new ProductFile();
                        fileUploadObj.setFileName(aFile.getOriginalFilename());
                        fileUploadObj.setFileDescription(fileDescription);
                        fileUploadObj.setData(aFile.getBytes());
                        fileUploadObj.setProduct(productService.findById(id));

                        productFileService.save(fileUploadObj);
                    }
                }
//                System.out.println("File Is Successfully Uploaded & Saved In The Database.... Hurrey!\n");
            }
        } else {
            // Do Nothing
        }
        return  "productFiles/success";
    }




    @GetMapping("/download/{id}")
    public String downloadDocument(@PathVariable Long id, HttpServletResponse response) throws IOException {

        ProductFile document = productFileService.findById(id);

//        bez poniższego pliki automatycznie otworzą się w przeglądarce
        response.setContentLength(document.getData().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getFileName() +"\"");

        FileCopyUtils.copy(document.getData(), response.getOutputStream());

        return "redirect:/files";
    }


}
