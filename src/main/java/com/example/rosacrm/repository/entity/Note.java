package com.example.rosacrm.repository.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
public class Note {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "message")
    private String message;
    @Basic
    @Column(name = "note_creation_date")
    private Timestamp noteCreationDate;
    @Basic
    @Column(name = "id_client")
    private Long idClient;
    @Basic
    @Column(name = "id_prospect")
    private Long idProspect;

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

    public Long getIdClient() {
        return idClient;
    }

    public void setIdClient(Long idClient) {
        this.idClient = idClient;
    }

    public Long getIdProspect() {
        return idProspect;
    }

    public void setIdProspect(Long idProspect) {
        this.idProspect = idProspect;
    }

}
