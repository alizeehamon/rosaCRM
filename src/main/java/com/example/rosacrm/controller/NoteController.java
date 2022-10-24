package com.example.rosacrm.controller;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.service.NoteService;
import com.example.rosacrm.service.ProspectService;
import org.aspectj.weaver.ast.Not;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

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

    @PostMapping("/prospects/add")
    public String addNoteProspect(NoteDTO noteDTO) {
        noteService.addNote(noteDTO);
        return "redirect:/prospects/see/" + noteDTO.getProspect().getId();
    }

    @PostMapping("/start")
    public String startProspection(NoteDTO noteDTO) {
        noteService.addNote(noteDTO);
        prospectService.changeProspectionStatus(noteDTO.getProspect());
        return "redirect:/prospects/see/" + noteDTO.getProspect().getId();
    }
    @PostMapping("/prospects/edit/")
    public String editNoteProspect(NoteDTO noteDTO){
        noteService.editNote(noteDTO);
        return "redirect:/prospects/see/" + noteDTO.getProspect().getId();
    }

    @PostMapping("/prospects/delete/{note}")
    public String deleteNoteProspect(@PathVariable("note")Long id){
        Optional<Note> note = this.noteService.findNoteById(id);

        if(note.isPresent()){
            NoteDTO noteDTO = note.get().toNoteDTO();
            this.noteService.deleteNote(noteDTO.getId());
            return "redirect:/prospects/see/" + noteDTO.getProspect().getId();
        }
        return "redirect:/prospects/all/";
    }

    @PostMapping("/clients/edit/")
    public String editNoteClient(NoteDTO noteDTO){
        noteService.editNote(noteDTO);
        return "redirect:/clients/see/" + noteDTO.getClient().getId();
    }

    @PostMapping("/clients/delete/{note}")
    public String deleteNoteClient(@PathVariable("note")Long id){
        Optional<Note> note = this.noteService.findNoteById(id);
        if(note.isPresent()){
            NoteDTO noteDTO = note.get().toNoteDTO();
            this.noteService.deleteNote(noteDTO.getId());
            return "redirect:/clients/see/" + noteDTO.getClient().getId();
        }
        return "redirect:/clients/all/";
    }
}
