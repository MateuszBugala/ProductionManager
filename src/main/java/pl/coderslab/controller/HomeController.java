package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping(path = "/", produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser"})
public class HomeController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null) {
            return "redirect:/dashboard";
        } else {
            model.addAttribute("user", new User());
            return "users/login";
        }
    }


    /*poniżej osobno należy "wyciągnąć" password, bo inaczej (przez user.getPassword()) jest zahashowane*/
    @PostMapping("/login")
    public String authorize(@Valid User user, @RequestParam String password, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "users/login";
        }
        String emailCandidate = user.getEmail();
        String passwordCandidate = password;
        User authorizedUser = userService.authorization(emailCandidate, passwordCandidate);


        if (authorizedUser != null) {
            model.addAttribute("currentUser", authorizedUser);
            return "redirect:/dashboard";
        } else {
            return "redirect:/login?error=true";
        }

    }

    @RequestMapping("/dashboard")
    public String loginSuccess() {
        return "main";
    }

//    poniższe działa tylk po dodaniu session.invalidate() również w widoku
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        return "users/logout";
    }

}
