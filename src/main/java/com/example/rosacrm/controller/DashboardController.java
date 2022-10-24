package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.enumeration.ProspectionStatus;
import com.example.rosacrm.service.*;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/")
public class DashboardController {

    private final ProspectService prospectService;
    private final UserService userService;
    private final ClientService clientService;
    private final CompanyService companyService;

    private final NoteService noteService;

    public DashboardController(ProspectService prospectService, UserService userService, ClientService clientService, CompanyService companyService, NoteService noteService) {
        this.prospectService = prospectService;
        this.userService = userService;
        this.clientService = clientService;
        this.companyService = companyService;
        this.noteService = noteService;
    }

    @GetMapping
    public String displayDashboard(Model model, Authentication authentication) {
        if (authentication != null) {
            User user = userService.getCurrentUser(authentication.getName());
            List<ProspectDTO> prospectDTOList = prospectService.findAllProspectsByUser(user);
            List<ClientDTO> clientDTOList = clientService.findAllClientsByUser(user);
            List<CompanyDTO> companyDTOList = companyService.findCompaniesByUser(user);
            List<NoteDTO> noteDTOprospect = noteService.findProspectNoteByUser(user);
            List<NoteDTO> noteDTOclient = noteService.findClientNoteByUser(user);
            int companyNumber = companyDTOList.size();
            int clientNumber = clientDTOList.size();
            int prospectNumber = prospectDTOList.size();
            int prospectInProgress = prospectDTOList.stream().filter(p -> Objects.equals(p.getProspectionStatus(), ProspectionStatus.IN_PROGRESS.getValue())).toList().size();
            int prospectToContact = prospectDTOList.stream().filter(p -> Objects.equals(p.getProspectionStatus(), ProspectionStatus.TO_CONTACT.getValue())).toList().size();
            int prospectNotStarted = prospectDTOList.stream().filter(p -> Objects.equals(p.getProspectionStatus(), ProspectionStatus.NOT_STARTED.getValue())).toList().size();
            int prospectNotes = noteDTOprospect.size();
            int clientNotes = noteDTOclient.size();
            model.addAttribute("companyNumber", companyNumber);
            model.addAttribute("clientNumber", clientNumber);
            model.addAttribute("prospectNumber", prospectNumber);
            model.addAttribute("prospectInProgress", prospectInProgress);
            model.addAttribute("prospectToContact", prospectToContact);
            model.addAttribute("prospectNotStarted", prospectNotStarted);
            model.addAttribute("prospectNotes", prospectNotes);
            model.addAttribute("clientNotes", clientNotes);
        }
        return "dashboard";
    }
}
