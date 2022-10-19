package com.example.rosacrm.repository.entity.company;

import com.example.rosacrm.repository.entity.Entreprise;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends CrudRepository<Entreprise , Long> {
}
