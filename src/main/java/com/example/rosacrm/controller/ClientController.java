package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.service.ClientService;
import com.example.rosacrm.service.CompanyService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ClientService clientService;

    private final CompanyService companyService;

    public ClientController(ClientService clientService, CompanyService companyService) {
        this.clientService = clientService;
        this.companyService = companyService;
    }

    @GetMapping("/all")
    public String displayClientList(Model model, @Param("clientName") String clientName) {
        List<ClientDTO> clientDTOList = clientService.searchContacts(clientName);
        List<CompanyDTO> companyList = companyService.getAllCompanies();
        model.addAttribute("clients", clientDTOList);
        model.addAttribute("clientName", clientName);
        model.addAttribute("companies", companyList);
        return "clientList";
    }

    @PostMapping("/add")
    public String addProspect(ClientDTO clientDTO) {
        clientService.addClient(clientDTO);
        return "redirect:/clients/all";
    }
}
