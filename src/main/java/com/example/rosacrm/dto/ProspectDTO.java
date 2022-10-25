package com.example.rosacrm.dto;

import com.example.rosacrm.dto.entity.Company;
import com.example.rosacrm.dto.entity.Note;
import com.example.rosacrm.dto.entity.Event;



import java.util.List;

public class ProspectDTO {

    private long id;

    private String firstName;

    private String lastName;

    private String picture;

    private String email;

    private String cellPhone;

    private String homePhone;

    private String roleEntreprise;

    private String prospectionStatus;

    private String creationDate;

    private String startDate;

    private Integer relanceDuration;

    private String address1;
    private String address2;
    private String zipCode;
    private String city;
    private String country;

    private Company company;

    private Long companyId;

    private List<Note> notesById;

    private List<Event> eventsById;

    public ProspectDTO() {
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

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public Integer getRelanceDuration() {
        return relanceDuration;
    }

    public void setRelanceDuration(Integer relanceDuration) {
        this.relanceDuration = relanceDuration;
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

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public List<Note> getNotesById() {
        return notesById;
    }

    public void setNotesById(List<Note> notesById) {
        this.notesById = notesById;
    }

    public List<Event> getEventsById() {
        return eventsById;
    }

    public void setEventsById(List<Event> eventsById) {
        this.eventsById = eventsById;
    }
}
