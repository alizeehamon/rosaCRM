package com.example.rosacrm.dto.entity;

import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.utils.DateUtils;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class Note {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;

    private String message;

    private Timestamp noteCreationDate;

    @ManyToOne
    private Client client;
    @ManyToOne
    private Prospect prospect;

    public Note() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getNoteCreationDate() {
        return noteCreationDate;
    }

    public void setNoteCreationDate(Timestamp noteCreationDate) {
        this.noteCreationDate = noteCreationDate;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Prospect getProspect() {
        return prospect;
    }

    public void setProspect(Prospect prospect) {
        this.prospect = prospect;
    }

    public NoteDTO toNoteDTO() {
        NoteDTO noteDTO = new NoteDTO();
        noteDTO.setId(this.getId());
        noteDTO.setClient(this.getClient());
        noteDTO.setNoteCreationDate(DateUtils.convertDateToString(this.getNoteCreationDate()));
        noteDTO.setProspect(this.getProspect());
        noteDTO.setMessage(this.getMessage());
        return noteDTO;
    }

    public Note FromNoteDTO(NoteDTO noteDTO) {
        this.client = noteDTO.getClient();
        this.id = noteDTO.getId();
        this.message = noteDTO.getMessage();
        this.noteCreationDate = (Timestamp) DateUtils.convertStringToDate(noteDTO.getNoteCreationDate());
        this.prospect = noteDTO.getProspect();
        return this;
    }
}
