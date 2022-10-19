package com.example.rosacrm.entity;

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
}
