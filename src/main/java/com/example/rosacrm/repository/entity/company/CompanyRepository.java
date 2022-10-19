package com.example.rosacrm.repository.entity.company;

import com.example.rosacrm.entity.Company;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends CrudRepository<Company, Long> {
}
