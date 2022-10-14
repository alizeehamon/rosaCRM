package com.example.rosacrm.repository.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Sector {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private long id;
    @Basic
    @Column(name = "activity__sector")
    private String activitySector;
    @OneToMany(mappedBy = "idSector")
    private List<Entreprise> entreprisesById;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Sector sector = (Sector) o;

        if (id != sector.id) return false;
        if (activitySector != null ? !activitySector.equals(sector.activitySector) : sector.activitySector != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (activitySector != null ? activitySector.hashCode() : 0);
        return result;
    }

    public List<Entreprise> getEntreprisesById() {
        return entreprisesById;
    }

    public void setEntreprisesById(List<Entreprise> entreprisesById) {
        this.entreprisesById = entreprisesById;
    }
}
