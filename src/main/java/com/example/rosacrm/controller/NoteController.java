package com.example.rosacrm.controller;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.service.NoteService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notes")
public class NoteController {

    private final NoteService noteService;


    public NoteController(NoteService noteService) {
        this.noteService = noteService;
    }

    @PostMapping("/add")
    public String addNote(NoteDTO noteDTO) {
        noteService.addNote(noteDTO);
        return "redirect:/clients/see/" + noteDTO.getClient().getId();
    }

}
