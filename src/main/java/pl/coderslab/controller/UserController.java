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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/users", produces = "text/html; charset=UTF-8")
@SessionAttributes({"currentUser", "currentUserGroup"})
public class UserController {

    @Autowired
    private UserService userService;


    @Autowired
    private UserGroupService userGroupService;


    @ModelAttribute("userGroups")
    public List<UserGroup> getUserGroups() {
        List<UserGroup> userGroupList = new ArrayList<>();
        userGroupList.add(userGroupService.findById(1L));
        userGroupList.add(userGroupService.findById(2L));
        return userGroupList;
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
        try {
            if (result.hasErrors()) {
                return "users/add";
            }
            userService.save(user);
            return "redirect:/";
        } catch (Exception e) {
            return "redirect:/users/add?duplicatedemail=true";
        }
    }


    @GetMapping("/edit/{id}")
    public String update(@PathVariable Long id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        Long userGroupId = (Long) session.getAttribute("currentUserGroup");
        if (user.getId() == id || userGroupId == 3) {
            model.addAttribute("user", userService.findById(id));
            return "users/edit";
        } else {
            return "redirect:/noAccess";
        }

    }


    @PostMapping("/edit")
    public String update(@Valid User user, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "users/edit";
        }
//        ważne po zmianie danych usera, trzeba przkazać go do sesji
        userService.update(user);
        model.addAttribute("currentUser", user);

        Long userId = user.getId();
        Long userGroupId = (Long) session.getAttribute("currentUserGroup");
        if (userGroupId == 3) {
            return "redirect:/users/all";
        } else {
            return "redirect:/users/myAccount/" + userId;
        }
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

    @RequestMapping("/myAccount/{id}")
    public String all(Model model, @PathVariable Long id, HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        if (user.getId() == id) {
            return "users/myAccount";
        } else {
            return "redirect:/dashboard";
        }
    }
}
