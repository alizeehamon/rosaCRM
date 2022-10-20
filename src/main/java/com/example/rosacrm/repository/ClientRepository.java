package com.example.rosacrm.repository;

import com.example.rosacrm.entity.Client;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends CrudRepository<Client, Long> {

    @Query("select c from Client c where c.firstName like %?1% or c.lastName like %?1%")
    List<Client> findAllByName(String clientName);

    @Query("select c from Client c where c.firstName like %?1% and c.lastName like %?2%")
    List<Client> findAllByFullName(String firstName, String lastName);
}
