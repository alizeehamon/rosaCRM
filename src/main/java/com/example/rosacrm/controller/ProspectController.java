package com.example.rosacrm.controller;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.service.CompanyService;
import com.example.rosacrm.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/prospects")
public class ProspectController {

    private final ProspectService prospectService;

    private final CompanyService companyService;

    public ProspectController(ProspectService prospectService, CompanyService companyService) {
        this.prospectService = prospectService;
        this.companyService = companyService;
    }

    @GetMapping("/all")
    public String displayProspectList(Model model) {
        List<ProspectDTO> prospectList = prospectService.findAll();
        List<CompanyDTO> companyList = companyService.getAllCompanies();
        model.addAttribute("prospects", prospectList);
        model.addAttribute("companies", companyList);
        return "prospectList";
    }

    @PostMapping("/add")
    public String addProspect(ProspectDTO prospectDTO){
        prospectService.addProspect(prospectDTO);
        return "redirect:/prospects/all";
    }
}
