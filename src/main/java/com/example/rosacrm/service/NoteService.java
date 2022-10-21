package com.example.rosacrm.service;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.repository.NoteRepository;
import org.springframework.stereotype.Service;

@Service
public class NoteService {

    private final NoteRepository noteRepository;


    public NoteService(NoteRepository noteRepository) {
        this.noteRepository = noteRepository;
    }


    public void addNote(NoteDTO noteDTO) {
        noteRepository.save(noteDTO.toNote());
    }
}
