package com.example.rosacrm.controller;

import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Sector;
import com.example.rosacrm.service.SectorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.service.CompanyService;
import org.springframework.data.repository.query.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/companies")
public class CompanyController {

    private final CompanyService companyService;
    private final SectorService sectorService;

    public CompanyController(CompanyService companyService, SectorService sectorService) {
        this.companyService = companyService;
        this.sectorService = sectorService;
    }

    @GetMapping("/all")
    public String displayCompanies(Model model, @Param("companyName") String companyName) {
        List<CompanyDTO> companyList = companyService.getAllCompanies(companyName);
        List<Sector> sectorList = sectorService.getAllSectors();
        model.addAttribute("sectorList", sectorList);
        model.addAttribute("companies", companyList);
        model.addAttribute("companyName", companyName);
        return "companyList";
    }

    @PostMapping("/add")
    public RedirectView postCreateCompany(CompanyDTO companyDTO){
        companyService.createCompany(companyDTO);
        return new RedirectView("/companies/all");
    }

    @GetMapping("/edit/{id}")
    public String getEditCompany(@PathVariable("id") Long id, Model  model){
        List<Sector> sectorList = sectorService.getAllSectors();
        Optional<Company> company = companyService.findCompanyById(id);
        company.ifPresent(company1 -> model.addAttribute("company", company1));
        model.addAttribute("sectorList", sectorList);
        return "editCompany";
    }

    @PostMapping("/edit/{id}")
    public RedirectView postEditCompany(@PathVariable("id") Long id , CompanyDTO companyDTO){
        companyService.editCompany(id, companyDTO);
        return new RedirectView("/companies/all");
    }


}
