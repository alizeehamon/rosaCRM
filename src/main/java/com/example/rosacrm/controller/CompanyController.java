package com.example.rosacrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class CompanyController {


    @PostMapping
    public RedirectView createCompany (){

        new RedirectView("/dashboard");
    }


}
