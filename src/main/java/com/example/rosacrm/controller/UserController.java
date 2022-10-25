package com.example.rosacrm.controller;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.dto.UserDeleteDTO;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.security.CustomLogoutHandler;
import com.example.rosacrm.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

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
        List<UserDTO> userDTOList = userService.findAllUsers();
        model.addAttribute("users", userDTOList);
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

    @PostMapping("/users/delete")
    public void DeleteAccount(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
        User user = userService.getCurrentUser(authentication.getName());
        CustomLogoutHandler clh = new CustomLogoutHandler();
        clh.logout(request, response, authentication);
        userService.deleteUser(user);
    }

    @PostMapping("/admin/delete")
    public String DeleteWhenAdminAccount(UserDeleteDTO userDTO) {
        User userToDelete = userService.findUserById(userDTO.getUserId());
        userService.removeSession(userToDelete.getEmail());
        userService.deleteUser(userToDelete);
        return "redirect:/account";
    }

}
