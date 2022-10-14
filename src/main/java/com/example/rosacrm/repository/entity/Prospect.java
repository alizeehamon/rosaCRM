package com.example.rosacrm.repository.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class Prospect {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "first_name")
    private String firstName;
    @Basic
    @Column(name = "last_name")
    private String lastName;
    @Basic
    @Column(name = "picture")
    private String picture;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "cell_phone")
    private String cellPhone;
    @Basic
    @Column(name = "home_phone")
    private String homePhone;
    @Basic
    @Column(name = "role_entreprise")
    private String roleEntreprise;
    @Basic
    @Column(name = "prospection_status")
    private String prospectionStatus;
    @Basic
    @Column(name = "creation_date")
    private Timestamp creationDate;
    @Basic
    @Column(name = "start_date")
    private Timestamp startDate;
    @Basic
    @Column(name = "relance_duration")
    private Integer relanceDuration;
    @Basic
    @Column(name = "id_user")
    private Long idUser;
    @Basic
    @Column(name = "id_address")
    private Long idAddress;
    @Basic
    @Column(name = "id_entreprise")
    private Long idEntreprise;
    @OneToMany(mappedBy = "idProspect")
    private List<Event> eventsById;
    @OneToMany(mappedBy = "idProspect")
    private List<Note> notesById;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public String getRoleEntreprise() {
        return roleEntreprise;
    }

    public void setRoleEntreprise(String roleEntreprise) {
        this.roleEntreprise = roleEntreprise;
    }

    public String getProspectionStatus() {
        return prospectionStatus;
    }

    public void setProspectionStatus(String prospectionStatus) {
        this.prospectionStatus = prospectionStatus;
    }

    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Integer getRelanceDuration() {
        return relanceDuration;
    }

    public void setRelanceDuration(Integer relanceDuration) {
        this.relanceDuration = relanceDuration;
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public Long getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(Long idAddress) {
        this.idAddress = idAddress;
    }

    public Long getIdEntreprise() {
        return idEntreprise;
    }

    public void setIdEntreprise(Long idEntreprise) {
        this.idEntreprise = idEntreprise;
    }

    public List<Event> getEventsById() {
        return eventsById;
    }

    public void setEventsById(List<Event> eventsById) {
        this.eventsById = eventsById;
    }

    public List<Note> getNotesById() {
        return notesById;
    }

    public void setNotesById(List<Note> notesById) {
        this.notesById = notesById;
    }
}
