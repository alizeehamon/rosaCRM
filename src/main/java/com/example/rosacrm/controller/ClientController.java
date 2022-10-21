package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.service.ClientService;
import com.example.rosacrm.service.CompanyService;
import com.example.rosacrm.service.NoteService;
import com.example.rosacrm.service.UserService;
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

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ClientService clientService;

    private final CompanyService companyService;
    private final UserService userService;

    private final NoteService noteService;

    public ClientController(ClientService clientService, CompanyService companyService, UserService userService, NoteService noteService) {
        this.clientService = clientService;
        this.companyService = companyService;
        this.userService = userService;
        this.noteService = noteService;
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
    public String displayProspectDetails(Model model, @PathVariable Long id) {
        ClientDTO clientDTO = clientService.findClientById(id);
        model.addAttribute("client", clientDTO);
        List<Note> notes = clientDTO.getNotesById();
        notes.sort(new SortByDate());
        model.addAttribute("notes", notes);
        return "clientPage";
    }


}
