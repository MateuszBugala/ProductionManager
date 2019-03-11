package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.model.UserGroup;
import pl.coderslab.service.UserGroupService;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "/userGroups", produces = "text/html; charset=UTF-8")
public class UserGroupController {

    @Autowired
    private UserGroupService userGroupService;

    @RequestMapping("/all")
    public String all(Model model) {
        model.addAttribute("userGroups", userGroupService.findAll());
        return "userGroups/all";
    }


    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("userGroup", new UserGroup());
        return "userGroups/add";
    }


    @PostMapping("/add")
    public String save(@Valid UserGroup userGroup, BindingResult result) {
        if (result.hasErrors()) {
            return "userGroups/add";
        }
        userGroupService.save(userGroup);
        return "redirect:/userGroups/all";
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model) {
        model.addAttribute("userGroup", userGroupService.findById(id));
        return "userGroups/edit";
    }


    @PostMapping("/edit")
    public String update(@Valid UserGroup userGroup, BindingResult result) {
        if (result.hasErrors()) {
            return "userGroups/edit";
        }
        userGroupService.save(userGroup);
        return "redirect:/userGroups/all";
    }


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        try {
            userGroupService.delete(id);
            return "redirect:/userGroups/all?deleted=true";
        } catch (Exception ConstraintViolationException) {
            return "redirect:/userGroups/all?error=true";
        }
    }

}
