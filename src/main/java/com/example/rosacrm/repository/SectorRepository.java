package com.example.rosacrm.repository;

import com.example.rosacrm.dto.entity.Sector;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface SectorRepository extends CrudRepository<Sector, Long> {
    @Query("select s from Sector s where s.activitySector = ?1")
    Optional<Sector> findByActivitySector(String activitySector);
}
