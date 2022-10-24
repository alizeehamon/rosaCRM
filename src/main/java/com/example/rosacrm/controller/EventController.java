package com.example.rosacrm.controller;

import com.example.rosacrm.dto.EventDTO;
import com.example.rosacrm.service.EventService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/event")
public class EventController {

    private EventService eventService;

    public EventController(EventService eventService) {
        this.eventService = eventService;
    }

    @PostMapping("/prospects/add")
    public RedirectView createProspectEvent(EventDTO eventDTO){
        eventService.addProspectEvent(eventDTO);
        return new RedirectView("/prospects/see/" + eventDTO.getProspect().getId());
    }
}
