package com.example.rosacrm.controller;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {

    private final UserService userService;


    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signin")
    public String displayLoginForm() {
        return "login";
    }

    @GetMapping("/register")
    public String displaySignupForm() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(UserDTO userDTO) {
        userService.register(userDTO);
        return "redirect:/signin";
    }

    @GetMapping("/logout")
    public String displayLogoutForm() {
        return "logout";
    }

    @GetMapping("/account")
    public String modifyAccount(Principal principal, Model model) {
        String email = principal.getName();
        UserDTO userDTO = userService.findUserByEmail(email);
        model.addAttribute("user", userDTO);
        return "editAccount";
    }


    @PostMapping("/account")
    public String ModifySpecifyAccount(Principal principal, @Valid UserDTO userDTO, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("user", userDTO);
            return "editAccount";
        } else {
            String email = principal.getName();
            userService.edit(userDTO, email);
            return "redirect:/";
        }
    }

}
