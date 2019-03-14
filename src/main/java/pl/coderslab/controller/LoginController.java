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
@SessionAttributes({"currentUser"})
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String login(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null) {
            return "redirect:/dashboard";
        } else {
            model.addAttribute("user", new User());
            return "login/login";
        }
    }

    /*poniżej osobno należy "wyciągnąć" password, bo inaczej (przez user.getPassword()) jest zahashowane*/
    @PostMapping("/")
    public String authorize(@Valid User user, @RequestParam String password, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "login/login";
        }
        String emailCandidate = user.getEmail();
        String passwordCandidate = password;
        User authorizedUser = userService.authorization(emailCandidate, passwordCandidate);


        if (authorizedUser != null) {
            model.addAttribute("currentUser", authorizedUser);
            return "redirect:/dashboard";
        } else {
            return "redirect:/login/login?error=true";
        }

    }


    //    poniższe działa tylk po dodaniu session.invalidate() również w widoku
    @RequestMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        return "login/logout";
    }

}
