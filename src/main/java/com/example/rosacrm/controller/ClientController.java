package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.ClientToProspectDTO;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.service.*;
import com.example.rosacrm.utils.SortByDate;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ClientService clientService;

    private final CompanyService companyService;
    private final UserService userService;

    private final NoteService noteService;
    private final ProspectService prospectService;

    public ClientController(ClientService clientService, CompanyService companyService, UserService userService, NoteService noteService, ProspectService prospectService) {
        this.clientService = clientService;
        this.companyService = companyService;
        this.userService = userService;
        this.noteService = noteService;
        this.prospectService = prospectService;
    }

    @GetMapping("/all")
    public String displayClientList(Model model, @Param("clientName") String clientName, Authentication authentication) {
        User user = userService.getCurrentUser(authentication.getName());
        List<ClientDTO> clientDTOList = clientService.searchContacts(clientName, user);
        clientDTOList.forEach(clientDTO -> clientService.updateContactStatus(clientDTO));
        List<CompanyDTO> companyList = companyService.getAllCompanies();
        model.addAttribute("clients", clientDTOList);
        model.addAttribute("clientName", clientName);
        model.addAttribute("companies", companyList);
        return "clientList";
    }

    @PostMapping("/add")
    public String addProspect(ClientDTO clientDTO, Authentication authentication) {
        User user = userService.getCurrentUser(authentication.getName());
        clientService.addClient(clientDTO, user);
        return "redirect:/clients/all";
    }

    @GetMapping("/see/{id}")
    public String displayProspectDetails(Authentication authentication, Model model, @PathVariable Long id) {
        User user = userService.getCurrentUser(authentication.getName());
        ClientDTO clientDTO = clientService.findClientById(id);
        model.addAttribute("client", clientDTO);
        List<CompanyDTO> companyList = companyService.getAllCompanies(null, user);
        companyList = companyList.stream().filter(c -> c.getId() != clientDTO.getCompany().getId()).collect(Collectors.toList());
        model.addAttribute("companies", companyList);
        List<Note> notes = clientDTO.getNotesById();
        notes.sort(new SortByDate());
        model.addAttribute("notes", notes);
        return "clientPage";
    }

    @PostMapping("/change")
    public String changeCompany(Authentication authentication, ClientToProspectDTO clientToProspectDTO) {
        User user = userService.getCurrentUser(authentication.getName());
        Client client = clientService.findClientByClientDTOId(clientToProspectDTO.getClientId());
        Company company = companyService.findCompanyById(clientToProspectDTO.getCompanyId());
        prospectService.clientToProspect(client, clientToProspectDTO, company, user);
        clientService.deleteClient(clientToProspectDTO.getClientId());
        return "redirect:/prospects/all";
    }


}
