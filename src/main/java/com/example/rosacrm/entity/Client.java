package com.example.rosacrm.entity;

import com.example.rosacrm.dto.ClientDTO;

import javax.persistence.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

@Entity
public class Client {
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

    private Timestamp creationDate;

    private Integer contactDuration;

    private String address1;
    private String address2;
    private String zipCode;
    private String city;
    private String country;

    @ManyToOne
    private User user;

    @ManyToOne
    private Company company;
    @OneToMany(mappedBy = "client", cascade = {CascadeType.ALL})
    private List<Event> eventsById;
    @OneToMany(mappedBy = "client", cascade = {CascadeType.ALL})
    private List<Note> notesById;

    public Client() {
    }

    public Client(ClientDTO clientDTO) {
        this.firstName = clientDTO.getFirstName();
        this.lastName = clientDTO.getLastName();
        this.picture = clientDTO.getPicture();
        this.email = clientDTO.getEmail();
        this.cellPhone = clientDTO.getCellPhone();
        this.homePhone = clientDTO.getHomePhone();
        this.roleEntreprise = clientDTO.getRoleEntreprise();
        this.address1 = clientDTO.getAddress1();
        this.address2 = clientDTO.getAddress2();
        this.zipCode = clientDTO.getZipCode();
        this.city = clientDTO.getCity();
        this.country = clientDTO.getCountry();
        this.company = clientDTO.getCompany();
        this.contactDuration = clientDTO.getContactDuration();
        this.notesById = clientDTO.getNotesById();
        this.eventsById = clientDTO.getEventsById();
    }

    public Client(Prospect prospect) {
        this.firstName = prospect.getFirstName();
        this.lastName = prospect.getLastName();
        this.picture = prospect.getPicture();
        this.email = prospect.getEmail();
        this.cellPhone = prospect.getCellPhone();
        this.homePhone = prospect.getHomePhone();
        this.roleEntreprise = prospect.getRoleEntreprise();
        this.address1 = prospect.getAddress1();
        this.address2 = prospect.getAddress2();
        this.zipCode = prospect.getZipCode();
        this.city = prospect.getCity();
        this.country = prospect.getCountry();
        this.company = prospect.getCompany();
        this.user = prospect.getUser();
        this.contactDuration = prospect.getRelanceDuration();
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

    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public Integer getContactDuration() {
        return contactDuration;
    }

    public void setContactDuration(Integer contactDuration) {
        this.contactDuration = contactDuration;
    }

    public ClientDTO toDTO() {
        ClientDTO dto = new ClientDTO();
        dto.setId(this.getId());
        dto.setFirstName(this.getFirstName());
        dto.setLastName(this.getLastName());
        dto.setEmail(this.getEmail());
        dto.setCellPhone(this.getCellPhone());
        dto.setAddress1(this.getAddress1());
        dto.setAddress2(this.getAddress2());
        dto.setZipCode(this.getZipCode());
        dto.setCity(this.getCity());
        dto.setCountry(this.getCountry());
        dto.setHomePhone(this.getHomePhone());
        dto.setCreationDate(convertDateToString(this.getCreationDate()));
        dto.setContactDuration(this.contactDuration);
        dto.setCompany(this.getCompany());
        dto.setPicture(this.getPicture());
        dto.setRoleEntreprise(this.getRoleEntreprise());
        dto.setNotesById(this.getNotesById());
        return dto;
    }

    private String convertDateToString(Timestamp date) {
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            return sdf.format(date);
        }
        return "";
    }


    public void fromDTO(ClientDTO clientDTO) {
        this.firstName = clientDTO.getFirstName();
        this.lastName = clientDTO.getLastName();
        this.picture = clientDTO.getPicture();
        this.email = clientDTO.getEmail();
        this.cellPhone = clientDTO.getCellPhone();
        this.homePhone = clientDTO.getHomePhone();
        this.roleEntreprise = clientDTO.getRoleEntreprise();
        this.address1 = clientDTO.getAddress1();
        this.address2 = clientDTO.getAddress2();
        this.zipCode = clientDTO.getZipCode();
        this.city = clientDTO.getCity();
        this.country = clientDTO.getCountry();
        this.company = clientDTO.getCompany();
        this.contactDuration = clientDTO.getContactDuration();
        this.notesById = clientDTO.getNotesById();
        this.eventsById = clientDTO.getEventsById();
    }
}
