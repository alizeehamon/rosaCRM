package com.example.rosacrm.controller;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.service.NoteService;
import com.example.rosacrm.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notes")
public class NoteController {

    private final NoteService noteService;
    private final ProspectService prospectService;


    public NoteController(NoteService noteService, ProspectService prospectService) {
        this.noteService = noteService;
        this.prospectService = prospectService;
    }

    @PostMapping("/add")
    public String addNoteClient(NoteDTO noteDTO) {
        noteService.addNote(noteDTO);
        return "redirect:/clients/see/" + noteDTO.getClient().getId();
    }

    @PostMapping("/start")
    public String startProspection(NoteDTO noteDTO) {
        noteService.addNote(noteDTO);
        prospectService.changeProspectionStatus(noteDTO.getProspect());
        return "redirect:/prospects/see/" + noteDTO.getProspect().getId();
    }

}
