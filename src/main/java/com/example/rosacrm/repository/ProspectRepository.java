package com.example.rosacrm.repository;

import com.example.rosacrm.dto.entity.Prospect;
import com.example.rosacrm.dto.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    @Query("select p from Prospect p where p.prospectionStatus <> 'Over' and p.user = ?1")
    List<Prospect> findAllActiveProspects(User user);

    @Query("select p from Prospect p where p.prospectionStatus <> 'Over' and p.firstName like %?1% and p.lastName like %?2% and p.user = ?3")
    List<Prospect> findAllActiveProspectsByFullNameAndUser(String firstName, String lastName, User user);

    @Query("select p from Prospect p where (p.firstName like %?1% or p.lastName like %?1%) and p.prospectionStatus <> 'Over' and p.user = ?2")
    List<Prospect> findAllActiveProspectsByNameAndUser(String prospectName, User user);

    @Query("select p from Prospect p where p.prospectionStatus = ?1 and p.user = ?2")
    List<Prospect> filterByStatusAndUser(String prospectStatus, User user);

    @Query("select p from Prospect p where (p.firstName like %?1% or p.lastName like %?1%) and p.prospectionStatus = ?2 and p.user = ?3")
    List<Prospect> filterByStatusUserAndName(String prospectName, String filterByStatus, User user);

    @Query("select p from Prospect p where (p.firstName like %?1% and p.lastName like %?2%) and p.prospectionStatus = ?3 and p.user = ?4")
    List<Prospect> filterByStatusUserAndFullName(String firstName, String lastName, String filterByStatus, User user);

    @Query("select p from Prospect p where p.user = ?1 AND p.company.id = ?2")
    List<Prospect> findAllByUserandCompanyId(User user, Long id);

}
