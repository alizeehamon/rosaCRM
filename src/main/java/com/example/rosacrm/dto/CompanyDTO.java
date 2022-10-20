package com.example.rosacrm.dto;

import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.entity.Sector;

import java.sql.Date;
import java.util.List;

public class CompanyDTO {

    private long id;

    private String logo;

    private String name;

    private String siret;

    private String email;

    private String cellPhone;

    private String homePhone;

    private String siteUrl;

    private String address1;
    private String address2;
    private String city;
    private String zipCode;
    private String country;
    private Sector sector;

    private Date entrepriseCreationDate;

    private List<Client> clientsById;

    private List<Prospect> prospectsById;

    public CompanyDTO() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSiret() {
        return siret;
    }

    public void setSiret(String siret) {
        this.siret = siret;
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

    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    public Date getEntrepriseCreationDate() {
        return entrepriseCreationDate;
    }

    public void setEntrepriseCreationDate(Date entrepriseCreationDate) {
        this.entrepriseCreationDate = entrepriseCreationDate;
    }

    public List<Client> getClientsById() {
        return clientsById;
    }

    public void setClientsById(List<Client> clientsById) {
        this.clientsById = clientsById;
    }

    public List<Prospect> getProspectsById() {
        return prospectsById;
    }

    public void setProspectsById(List<Prospect> prospectsById) {
        this.prospectsById = prospectsById;
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

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Sector getSector() {
        return sector;
    }

    public void setSector(Sector sector) {
        this.sector = sector;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
