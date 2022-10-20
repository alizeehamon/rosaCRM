package com.example.rosacrm.controller;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

}
