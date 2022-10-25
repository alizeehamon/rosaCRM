package com.example.rosacrm.service;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.dto.entity.Note;
import com.example.rosacrm.dto.entity.User;
import com.example.rosacrm.repository.NoteRepository;
import com.example.rosacrm.utils.DateUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NoteService {

    private final NoteRepository noteRepository;


    public NoteService(NoteRepository noteRepository) {
        this.noteRepository = noteRepository;
    }

    public Optional<Note> findNoteById(Long id) {
        return this.noteRepository.findById(id);
    }

    public void addNote(NoteDTO noteDTO) {
        noteRepository.save(noteDTO.toNote());
    }

    public void editNote(NoteDTO noteDTO) {
        Optional<Note> note = this.noteRepository.findById(noteDTO.getId());
        note.ifPresent(note1 -> {
            note1.setMessage(noteDTO.getMessage());
            this.noteRepository.save(note1);
            noteDTO.setClient(note1.getClient());
            noteDTO.setProspect(note1.getProspect());
            noteDTO.setNoteCreationDate(DateUtils.convertDateToString(note1.getNoteCreationDate()));
        });

    }

    public void deleteNote(Long id) {
        noteRepository.deleteById(id);
    }

    public List<NoteDTO> findProspectNoteByUser(User user) {
        List<Note> noteList = noteRepository.findProspectNoteByUser(user);
        return noteList.stream().map(n -> n.toNoteDTO()).collect(Collectors.toList());
    }

    public List<NoteDTO> findClientNoteByUser(User user) {
        List<Note> noteList = noteRepository.findClientNoteByUser(user);
        return noteList.stream().map(n -> n.toNoteDTO()).collect(Collectors.toList());
    }
}
