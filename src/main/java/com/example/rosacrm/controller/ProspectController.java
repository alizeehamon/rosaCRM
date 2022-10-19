package com.example.rosacrm.controller;

import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/prospects")
public class ProspectController {

    private final ProspectService prospectService;

    public ProspectController(ProspectService prospectService) {
        this.prospectService = prospectService;
    }

    @GetMapping("/all")
    public String displayProspectList(Model model) {
        List<ProspectDTO> prospectList = prospectService.findAll();
        model.addAttribute("prospects", prospectList);
        return "prospectList";
    }
}
