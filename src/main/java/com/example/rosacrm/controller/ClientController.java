package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.service.ClientService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientController {

    private final ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @GetMapping("/all")

    public String displayClientList(Model model, @Param("clientName") String clientName) {
        List<ClientDTO> clientDTOList = clientService.searchContacts(clientName);
        model.addAttribute("clients", clientDTOList);
        model.addAttribute("clientName", clientName);
        return "clientList";
    }
}
