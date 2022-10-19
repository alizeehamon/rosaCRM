package com.example.rosacrm.repository;

import com.example.rosacrm.entity.Company;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long> {

    @Query("select c from Company c where c.name LIKE %?1%")
    List<Company> findAllByName(String companyName);
}
