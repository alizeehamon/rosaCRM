package com.example.rosacrm.dto;

import com.example.rosacrm.dto.entity.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class UserDTO {

    private long id;

    private String firstName;

    private String lastName;

    private String email;

    private String password;

    public UserDTO() {
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

    public User toEntity() {
        User u = new User();
        u.setEmail(this.getEmail());
        u.setFirstName(this.getFirstName());
        u.setLastName(this.getLastName());
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(this.getPassword());
        u.setPassword(encodedPassword);
        u.setRole("user");
        return u;
    }
}
