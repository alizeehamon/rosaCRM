package com.example.rosacrm.repository.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
public class Entreprise {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "logo")
    private String logo;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "siret")
    private String siret;
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
    @Column(name = "site_url")
    private String siteUrl;
    @Basic
    @Column(name = "id_address")
    private Long idAddress;
    @Basic
    @Column(name = "id_sector")
    private Long idSector;
    @Basic
    @Column(name = "entreprise_creation_date")
    private Date entrepriseCreationDate;
    @OneToMany(mappedBy = "idEntreprise")
    private List<Client> clientsById;
    @OneToMany(mappedBy = "idEntreprise")
    private List<Prospect> prospectsById;

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

    public Long getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(Long idAddress) {
        this.idAddress = idAddress;
    }

    public Long getIdSector() {
        return idSector;
    }

    public void setIdSector(Long idSector) {
        this.idSector = idSector;
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
}
