package com.example.rosacrm.repository;

import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {

    @Query("select c from Client c where c.firstName like %?1% or c.lastName like %?1% and c.user = ?2")
    List<Client> findAllByName(String clientName, User user);

    @Query("select c from Client c where c.firstName like %?1% and c.lastName like %?2% and c.user = ?3")
    List<Client> findAllByFullName(String firstName, String lastName, User user);

    @Query("select c from Client c where c.user = ?1")
    List<Client> findAllByUser(User user);

    @Query("select c from Client c where c.user = ?1 AND c.company.id = ?2")
    List<Client> findAllByUserandCompanyId(User user , Long id);

}
