package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.mail.EmailSender;

import javax.naming.Context;

@Controller
@RequestMapping(path = "/email", produces = "text/html; charset=UTF-8")
public class EmailController {
    private final EmailSender emailSender;

    @Autowired
    public EmailController(EmailSender emailSender){
        this.emailSender = emailSender;
    }

    @RequestMapping("/")
    public String send() {
//        Context context = new Context();
//        context.setVariable("header", "Nowy artykuł na CodeCouple");
//        context.setVariable("title", "#8 Spring Boot – email - szablon i wysyłanie");
//        context.setVariable("description", "Tutaj jakis opis...");
//        String body = templateEngine.process("template", context);
        emailSender.sendEmail("mateusz.bugala@gmail.com", "Newsletter", "Test email");
        return "index";
    }
}