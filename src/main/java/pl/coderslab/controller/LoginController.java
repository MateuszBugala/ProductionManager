package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
@RequestMapping(path = "/login", produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser", "currentUserGroup"})
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String login(Model model, HttpSession session) {
        model.addAttribute("user", new User());
        return "login/login";
    }

    @PostMapping("/")
    public String authorize(@RequestParam String email, @RequestParam String password,Model model) {
        String emailCandidate = email;
        String passwordCandidate = password;
        User authorizedUser = userService.authorization(emailCandidate, passwordCandidate);


        if (authorizedUser != null) {
            Long userGroupId = authorizedUser.getUserGroup().getId();
            model.addAttribute("currentUser", authorizedUser);
            model.addAttribute("currentUserGroup", userGroupId);
            return "login/loginSuccess";
        } else {
            return "redirect:/login/?error=true";
        }

    }


    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        return "login/logout";
    }

}
