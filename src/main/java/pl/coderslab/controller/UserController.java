package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.model.UserGroup;
import pl.coderslab.service.UserGroupService;
import pl.coderslab.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path = "/users", produces = "text/html; charset=UTF-8")
public class UserController {

    @Autowired
    private UserService userService;


    @Autowired
    private UserGroupService userGroupService;


    @ModelAttribute("userGroups")
    public List<UserGroup> getUserGroups() {
        return userGroupService.findAll();
    }


    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("users", userService.findAll());
        return "users/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "users/add";
    }


    @PostMapping("/add")
    public String save(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "users/add";
        }
        userService.save(user);
        return "redirect:/users/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "users/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "users/edit";
        }
        userService.save(user);
        return "redirect:/users/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            userService.delete(id);
            return "redirect:/users/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/users/all?error=true";
        }
    }
}
