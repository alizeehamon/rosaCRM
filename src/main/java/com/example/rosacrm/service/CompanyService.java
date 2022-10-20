package com.example.rosacrm.service;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.CompanyRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
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

    public List<CompanyDTO> getAllCompanies(String companyName, User user) {
        if (companyName != null) {
            List<Company> searchCompanies = this.companyRepository.findAllByNameAndUser(companyName, user);
            return searchCompanies.stream().map(e -> e.toDTO()).collect(Collectors.toList());
        }
        List<Company> entreprises = this.companyRepository.findAllByUser(user);
        return entreprises.stream().map(e -> e.toDTO()).collect(Collectors.toList());
    }

    public Optional<Company> findCompanyById(Long id) {
        return this.companyRepository.findById(id);
    }

    public void createCompany(CompanyDTO companyDTO, User user) {
        Company company = new Company(companyDTO);
        company.setUser(user);
        companyRepository.save(company);
    }

    public void editCompany(Long id, CompanyDTO companyDTO) {
        Optional<Company> company = this.companyRepository.findById(id);

        company.ifPresent(company1 -> {
            company1.setName(companyDTO.getName());
            company1.setSiret(companyDTO.getSiret());
            company1.setEmail(companyDTO.getEmail());
            company1.setCellPhone(companyDTO.getCellPhone());
            company1.setHomePhone(companyDTO.getHomePhone());
            company1.setLogo(companyDTO.getLogo());
            company1.setCity(companyDTO.getCity());
            company1.setCountry(companyDTO.getCountry());
            company1.setAddress1(companyDTO.getAddress1());
            company1.setAddress2(companyDTO.getAddress2());
            company1.setEntrepriseCreationDate(companyDTO.getEntrepriseCreationDate());
            company1.setSiteUrl(companyDTO.getSiteUrl());
            company1.setSector(company1.getSector());
            company1.setClientsById(company1.getClientsById());
            company1.setProspectsById(company1.getProspectsById());
            this.companyRepository.save(company1);
        });
    }

    public void deleteCompanyById(Long id){
        this.companyRepository.deleteById(id);
    }

}
