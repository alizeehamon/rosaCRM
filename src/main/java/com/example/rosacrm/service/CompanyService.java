package com.example.rosacrm.service;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.SectorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;
    private final SectorRepository sectorRepository;

    public CompanyService(CompanyRepository companyRepository, SectorRepository sectorRepository) {
        this.companyRepository = companyRepository;
        this.sectorRepository = sectorRepository;
    }

    public List<CompanyDTO> getAllCompanies() {
        List<Company> entreprises = (List<Company>) this.companyRepository.findAll();
        List<CompanyDTO> entreprisesDTO = entreprises.stream().map(e -> e.toDTO()).collect(Collectors.toList());
        return entreprisesDTO;
    }
}
