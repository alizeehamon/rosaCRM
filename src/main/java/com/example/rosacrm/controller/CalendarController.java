package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Event;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.service.ClientService;
import com.example.rosacrm.service.CompanyService;
import com.example.rosacrm.service.ProspectService;
import com.example.rosacrm.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    private final ProspectService prospectService;

    private final ClientService clientService;

    private final CompanyService companyService;
    private final UserService userService;

    public CalendarController(ProspectService prospectService, ClientService clientService, CompanyService companyService, UserService userService) {
        this.prospectService = prospectService;
        this.companyService = companyService;
        this.userService = userService;
        this.clientService = clientService;
    }

    @GetMapping()
    public String displayCalendar(Model model, Authentication authentication) {
        User user = userService.getCurrentUser(authentication.getName());
        List<ProspectDTO> prospectDTOList = prospectService.findAllProspectsByUser(user);
        List<ClientDTO> clientDTOList = clientService.findAllClientsByUser(user);
        List<Event> eventList = new ArrayList<>();
        if (prospectDTOList != null) {
            prospectDTOList.forEach(prospectDTO -> {
                if (prospectDTO.getEventsById() != null) {
                    prospectDTO.getEventsById().forEach(event -> eventList.add(event));
                }
            });
        }
        if (clientDTOList != null) {
            clientDTOList.forEach(clientDTO -> {
                if (clientDTO.getEventsById() != null) {
                    clientDTO.getEventsById().forEach(event -> eventList.add(event));
                }
            });
        }
        model.addAttribute("eventList", eventList);

        return "calendarPage";
    }
}
