package com.example.rosacrm.dto;

import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.Prospect;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class NoteDTO {

    private long id;

    private String message;

    private String noteCreationDate;

    private Client client;

    private Prospect prospect;

    public NoteDTO() {
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

    public String getNoteCreationDate() {
        return noteCreationDate;
    }

    public void setNoteCreationDate(String noteCreationDate) {
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

    public Note toNote() {
        Note n = new Note();
        n.setClient(this.getClient());
        n.setId(this.getId());
        n.setMessage(this.getMessage());
        n.setNoteCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        n.setProspect(this.getProspect());
        return n;
    }
}
