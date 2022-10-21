package com.example.rosacrm.controller;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.entity.Sector;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.service.CompanyService;
import com.example.rosacrm.service.SectorService;
import com.example.rosacrm.service.UserService;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/companies")
public class CompanyController {

    private final CompanyService companyService;
    private final SectorService sectorService;
    private final UserService userService;

    public CompanyController(CompanyService companyService, SectorService sectorService, UserService userService) {
        this.companyService = companyService;
        this.sectorService = sectorService;
        this.userService = userService;
    }

    @GetMapping("/all")
    public String displayCompanies(Authentication authentication, Model model, @Param("companyName") String companyName, RedirectAttributes redir) {
        User user = userService.getCurrentUser(authentication.getName());
        List<CompanyDTO> companyList = companyService.getAllCompanies(companyName, user);
        List<Sector> sectorList = sectorService.getAllSectors();
        model.addAttribute("sectorList", sectorList);
        model.addAttribute("companies", companyList);
        model.addAttribute("companyName", companyName);
        return "companyList";
    }

    @PostMapping("/add")
    public RedirectView postCreateCompany(Authentication authentication, CompanyDTO companyDTO) {
        User user = userService.getCurrentUser(authentication.getName());
        companyService.createCompany(companyDTO, user);
        return new RedirectView("/companies/all");
    }

    @GetMapping("/edit/{id}")
    public String getEditCompany(@PathVariable("id") Long id, Model model) {
        List<Sector> sectorList = sectorService.getAllSectors();
        Optional<CompanyDTO> company = companyService.findCompanyById(id);
        company.ifPresent(company1 -> model.addAttribute("company", company1));
        model.addAttribute("sectorList", sectorList);
        return "editCompany";
    }

    @PostMapping("/edit/{id}")
    public RedirectView postEditCompany(@PathVariable("id") Long id, CompanyDTO companyDTO) {
        companyService.editCompany(id, companyDTO);
        return new RedirectView("/companies/all");
    }
    /* get company id -> check if present -> if yes -> check is they are clients or prospects connected to it */
    @RequestMapping("/delete/{id}")
    public RedirectView deleteCompany(@PathVariable("id") Long id, RedirectAttributes redir){
        Optional<CompanyDTO> company = companyService.findCompanyById(id);
        if (company.isPresent()) {
            if (!company.get().getClientsById().isEmpty() || !company.get().getProspectsById().isEmpty()) {
                redir.addFlashAttribute("errorsql" , true);
                return new RedirectView("/companies/all/");
            } else {
                this.companyService.deleteCompanyById(id);
            }
        }
        return new RedirectView("/companies/all");
    }

/*
    @RequestMapping("/{id}")
    public String showCompanyChildren(@PathVariable("id") Long id, Authentication authentication, Model model){
        User user = userService.getCurrentUser(authentication.getName());
        List<ClientDTO> companyClients = this.companyService.findAllCompanyClients(user, id);
        List<ProspectDTO> companyProspects = this.companyService.findAllCompanyProspects(user, id);
        model.addAttribute("compClients" , companyClients);
        model.addAttribute("compProspects" , companyProspects);
        return "companyList";
    }*/

    @GetMapping("/see/{id}")
    public String displayProspectDetails(Model model, @PathVariable Long id) {
        CompanyDTO companyDTO = companyService.findCompanyById(id).get();
        List<Prospect> prospectsById = companyDTO.getProspectsById();
        List<Client> clientList = companyDTO.getClientsById();
        model.addAttribute("company", companyDTO);
        model.addAttribute("prospects" , prospectsById);
        model.addAttribute("clients" , prospectsById);
        return "companyPage";
    }
}

