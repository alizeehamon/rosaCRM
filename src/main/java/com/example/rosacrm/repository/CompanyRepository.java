package com.example.rosacrm.repository;

import com.example.rosacrm.dto.entity.Company;
import com.example.rosacrm.dto.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long> {

    @Query("select c from Company c where c.name LIKE %?1%")
    List<Company> findAllByName(String companyName);

    @Query("select c from Company c where c.name LIKE %?1% and c.user = ?2")
    List<Company> findAllByNameAndUser(String companyName, User user);

    @Query("select c from Company c where c.user = ?1")
    List<Company> findAllByUser(User user);
}
