package com.example.rosacrm.entity;

import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.utils.DateUtils;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class Prospect {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;

    private String firstName;

    private String lastName;

    private String picture;

    private String email;

    private String cellPhone;

    private String homePhone;

    private String roleEntreprise;

    private String prospectionStatus;

    private Timestamp creationDate;

    private Timestamp startDate;

    private Integer relanceDuration;
    @ManyToOne
    private User user;

    private String address1;
    private String address2;
    private String zipCode;
    private String city;
    private String country;

    @ManyToOne
    private Company company;
    @OneToMany(mappedBy = "prospect")
    private List<Event> eventsById;
    @OneToMany(mappedBy = "prospect")
    private List<Note> notesById;

    public Prospect() {
    }

    public Prospect(ProspectDTO prospectDTO) {
        this.firstName = prospectDTO.getFirstName();
        this.lastName = prospectDTO.getLastName();
        this.picture = prospectDTO.getPicture();
        this.email = prospectDTO.getEmail();
        this.cellPhone = prospectDTO.getCellPhone();
        this.homePhone = prospectDTO.getHomePhone();
        this.roleEntreprise = prospectDTO.getRoleEntreprise();
        this.relanceDuration = prospectDTO.getRelanceDuration();
        this.address1 = prospectDTO.getAddress1();
        this.address2 = prospectDTO.getAddress2();
        this.zipCode = prospectDTO.getZipCode();
        this.city = prospectDTO.getCity();
        this.country = prospectDTO.getCountry();
        this.prospectionStatus = prospectDTO.getProspectionStatus();
    }

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
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

    public ProspectDTO toDTO() {
        ProspectDTO dto = new ProspectDTO();
        dto.setId(this.getId());
        dto.setFirstName(this.getFirstName());
        dto.setLastName(this.getLastName());
        dto.setCellPhone(this.getCellPhone());
        dto.setHomePhone(this.getHomePhone());
        dto.setCompany(this.getCompany());
        dto.setAddress1(this.getAddress1());
        dto.setAddress2(this.getAddress2());
        dto.setCity(this.getCity());
        dto.setCountry(this.getCountry());
        dto.setCreationDate(DateUtils.convertDateToString(this.getCreationDate()));
        dto.setEmail(this.getEmail());
        dto.setPicture(this.getPicture());
        dto.setProspectionStatus(this.getProspectionStatus());
        dto.setZipCode(this.getZipCode());
        dto.setRoleEntreprise(this.getRoleEntreprise());
        dto.setRelanceDuration(this.getRelanceDuration());
        dto.setStartDate(DateUtils.convertDateToString(this.getStartDate()));
        return dto;
    }

    public Prospect fromDTO(ProspectDTO prospectDTO){
        this.firstName = prospectDTO.getFirstName();
        this.lastName = prospectDTO.getLastName();
        this.picture = prospectDTO.getPicture();
        this.email = prospectDTO.getEmail();
        this.cellPhone = prospectDTO.getCellPhone();
        this.homePhone = prospectDTO.getHomePhone();
        this.roleEntreprise = prospectDTO.getRoleEntreprise();
        this.relanceDuration = prospectDTO.getRelanceDuration();
        this.address1 = prospectDTO.getAddress1();
        this.address2 = prospectDTO.getAddress2();
        this.zipCode = prospectDTO.getZipCode();
        this.city = prospectDTO.getCity();
        this.country = prospectDTO.getCountry();
        this.prospectionStatus = prospectDTO.getProspectionStatus();
        return this;
    }

}
