package com.example.rosacrm.controller;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.service.CompanyService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/companies")
public class CompanyController {

    private final CompanyService companyService;

    public CompanyController(CompanyService companyService) {
        this.companyService = companyService;
    }

    @GetMapping("/all")
    public String displayCompanies(Model model, @Param("companyName") String companyName) {
        List<CompanyDTO> companyList = companyService.getAllCompanies(companyName);
        model.addAttribute("companies", companyList);
        model.addAttribute("companyName", companyName);
        return "companyList";
    }
}
