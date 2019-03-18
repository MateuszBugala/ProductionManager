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
import org.springframework.web.servlet.ModelAndView;
import pl.coderslab.model.FileUpload;
import pl.coderslab.service.FileUploadService;

@Controller
@RequestMapping(path = "/files", produces = "text/html; charset=UTF-8")
public class FileuploadController {

    static String fileDescription;
    static pl.coderslab.model.FileUpload fileUploadObj;
    static String saveDirectory = "uploadedFiles";
    static ModelAndView modelViewObj;

    @Autowired
    private FileUploadService fileUploadService;

    @GetMapping("/")
    public String showUploadFileForm(ModelMap model) {
        return "files/fileupload";
    }



    // This Method Is Used To Get Or Retrieve The Uploaded File And Save It In The Db
    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
    public String saveUploadedFileInDatabase(HttpServletRequest request, final @RequestParam CommonsMultipartFile[] attachFileObj) throws IllegalStateException, IOException {

        // Reading File Upload Form Input Parameters
        fileDescription = request.getParameter("description");

        // Logging The Input Parameter (i.e. File Description) For The Debugging Purpose
        System.out.println("\nFile Description Is?= " + fileDescription + "\n");

        // Determine If There Is An File Upload. If Yes, Attach It To The Client Email
        if ((attachFileObj != null) && (attachFileObj.length > 0) && (!attachFileObj.equals(""))) {
            for (CommonsMultipartFile aFile : attachFileObj) {
                if(aFile.isEmpty()) {
                    continue;
                } else {
                    System.out.println("Attachment Name?= " + aFile.getOriginalFilename() + "\n");
                    if (!aFile.getOriginalFilename().equals("")) {
                        fileUploadObj = new pl.coderslab.model.FileUpload();

                        fileUploadObj.setFileName(aFile.getOriginalFilename());
                        fileUploadObj.setFileDescription(fileDescription);
                        fileUploadObj.setData(aFile.getBytes());

//                        // Calling The Db Method To Save The Uploaded File In The Db
//                        FileUploadInDb.fileSaveInDb(fileUploadObj);
                        fileUploadService.save(fileUploadObj);
                    }
                }
                System.out.println("File Is Successfully Uploaded & Saved In The Database.... Hurrey!\n");
            }
        } else {
            // Do Nothing
        }
        return  "files/success";
    }




    @GetMapping("/download/{id}")
    public String downloadDocument(@PathVariable int id, HttpServletResponse response) throws IOException {

        FileUpload document = fileUploadService.findById(id);

//        bez poniższego pliki automatycznie otworzą się w przeglądarce
        response.setContentLength(document.getData().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getFileName() +"\"");

        FileCopyUtils.copy(document.getData(), response.getOutputStream());

        return "redirect:/files";
    }


}
