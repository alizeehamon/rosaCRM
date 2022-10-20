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

    @Query("select p from Prospect p where p.prospectionStatus <> 'Over' and p.firstName like %?1% and p.lastName like %?2%")
    List<Prospect> findAllActiveProspectsByFullName(String firstName, String lastName);

    @Query("select p from Prospect p where (p.firstName like %?1% or p.lastName like %?1%) and p.prospectionStatus <> 'Over'")
    List<Prospect> findAllActiveProspectsByName(String prospectName);

    @Query("select distinct p.prospectionStatus from Prospect p where p.prospectionStatus <> 'Over'")
    List<String> findAllProspectStatus();

    @Query("select p from Prospect p where p.prospectionStatus = ?1")
    List<Prospect> filterByStatus(String prospectStatus);

    @Query("select p from Prospect p where (p.firstName like %?1% or p.lastName like %?1%) and p.prospectionStatus = ?2")
    List<Prospect> filterByStatusAndName(String prospectName, String filterByStatus);

    @Query("select p from Prospect p where (p.firstName like %?1% and p.lastName like %?2%) and p.prospectionStatus = ?3")
    List<Prospect> filterByStatusAndFullName(String firstName, String lastName, String filterByStatus);
}
