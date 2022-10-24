package com.example.rosacrm.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Sector {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private long id;

    private String activitySector;
    @OneToMany(mappedBy = "sector", cascade = CascadeType.PERSIST)
    private List<Company> entreprisesById;

    public Sector() {
    }

    public Sector(String activitySector) {
        this.activitySector = activitySector;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getActivitySector() {
        return activitySector;
    }

    public void setActivitySector(String activitySector) {
        this.activitySector = activitySector;
    }

    public List<Company> getEntreprisesById() {
        return entreprisesById;
    }

    public void setEntreprisesById(List<Company> entreprisesById) {
        this.entreprisesById = entreprisesById;
    }
}
