package com.example.rosacrm.repository;

import com.example.rosacrm.entity.Prospect;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    @Query("select p from Prospect p where p.prospectionStatus <> 'Over'")
    List<Prospect> findAllActiveProspects();
}
