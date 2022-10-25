package com.example.rosacrm.dto.entity;

import com.example.rosacrm.dto.UserDTO;

import javax.persistence.*;
import java.util.List;

@Entity
public class User {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;

    private String firstName;

    private String lastName;

    private String email;

    private String password;

    private String role;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Client> clientsById;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Prospect> prospectsById;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Company> companiesById;

    public User() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public UserDTO toDTO() {
        UserDTO dto = new UserDTO();
        dto.setId(this.getId());
        dto.setEmail(this.getEmail());
        dto.setFirstName(this.getFirstName());
        dto.setLastName(this.getLastName());
        dto.setPassword(this.getPassword());
        return dto;
    }
}
