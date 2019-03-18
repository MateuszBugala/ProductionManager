package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pl.coderslab.model.UploadFile;
import pl.coderslab.service.FileUploadService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path = "/files", produces = "text/html; charset=UTF-8")
public class FileUploadController {

    @Autowired
    private FileUploadService fileUploadService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showUploadForm(HttpServletRequest request) {
        return "files/Upload";
    }

    @RequestMapping(value = "/doUpload", method = RequestMethod.POST)
    public String handleFileUpload(HttpServletRequest request,
                                   @RequestParam CommonsMultipartFile[] fileUpload) throws Exception {

        if (fileUpload != null && fileUpload.length > 0) {
            for (CommonsMultipartFile aFile : fileUpload){

                System.out.println("Saving file: " + aFile.getOriginalFilename());

                UploadFile uploadFile = new UploadFile();
                uploadFile.setFileName(aFile.getOriginalFilename());
                uploadFile.setData(aFile.getBytes());
                fileUploadService.save(uploadFile);
            }
        }

        return "files/Success";
    }
}
