package com.example.rosacrm.service;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.repository.CompanyRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyService(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    public List<CompanyDTO> getAllCompanies() {
        List<Company> entreprises = (List<Company>) this.companyRepository.findAll();
        List<CompanyDTO> entreprisesDTO = entreprises.stream().map(e -> e.toDTO()).collect(Collectors.toList());
        return entreprisesDTO;
    }

    public List<CompanyDTO> getAllCompanies(String companyName) {
        if (companyName != null) {
            List<Company> searchCompanies = this.companyRepository.findAllByName(companyName);
            return searchCompanies.stream().map(e -> e.toDTO()).collect(Collectors.toList());
        }
        return getAllCompanies();
    }

}
