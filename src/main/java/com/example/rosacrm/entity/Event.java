package com.example.rosacrm.entity;

import com.example.rosacrm.dto.EventDTO;
import com.example.rosacrm.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Date;

@Entity
public class Event {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;

    private String name;

    private String description;

    private String address1;
    private String address2;
    private String zipCode;
    private String city;
    private String country;

    private String link;

    private Timestamp startTime;

    private Timestamp endTime;

    @ManyToOne
    private Prospect prospect;

    @ManyToOne
    private Client client;

    public Event() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Prospect getProspect() {
        return prospect;
    }

    public void setProspect(Prospect prospect) {
        this.prospect = prospect;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Event(EventDTO eventDTO){
        this.name = eventDTO.getName();
        this.client = eventDTO.getClient();
        this.prospect = eventDTO.getProspect();
        this.description = eventDTO.getDescription();
        this.link = eventDTO.getLink();
        this.address1 = eventDTO.getAddress1();
        this.address2 = eventDTO.getAddress2();
        this.city = eventDTO.getCity();
        this.country = eventDTO.getCountry();
        this.zipCode = eventDTO.getZipCode();
        this.startTime =  DateUtils.convertHtmlDateToDateStamp(eventDTO.getStartTime());
        this.endTime = DateUtils.convertHtmlDateToDateStamp(eventDTO.getEndTime());
    }
}
