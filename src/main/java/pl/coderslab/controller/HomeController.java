package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
public class HomeController {

    @RequestMapping("/dashboard")
    public String loginSuccess() {
        return "main";
    }


    @RequestMapping("/noAccess")
    public String noAccess() {
        return "noAccess";
    }
}
