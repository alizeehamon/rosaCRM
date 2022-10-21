package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.ProspectRepository;
import com.example.rosacrm.utils.DateUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;
    private final ClientService clientService;
    private final ProspectService prospectService;

    public CompanyService(CompanyRepository companyRepository, ClientService clientService, ProspectService prospectService) {
        this.companyRepository = companyRepository;
        this.clientService = clientService;
        this.prospectService = prospectService;
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

    public Optional<CompanyDTO> findCompanyById(Long id) {
        return Optional.ofNullable(this.companyRepository.findById(id).get().toDTO());
    }

    public void createCompany(CompanyDTO companyDTO, User user) {
        Company company = new Company(companyDTO);
        company.setUser(user);
        companyRepository.save(company);
    }

    public void editCompany(CompanyDTO companyDTO) {
        Optional<Company> company = this.companyRepository.findById(companyDTO.getId());
        company.ifPresent(company1 -> {
            company1.fromDTO(companyDTO);
            this.companyRepository.save(company1);
        });
    }

    public void deleteCompanyById(Long id) {
        this.companyRepository.deleteById(id);
    }

/*
    public List<ClientDTO> findAllCompanyClients(User user,Long id ){
        return this.clientService.findAllClientsByCompanyId(user, id);
    }

    public List<ProspectDTO> findAllCompanyProspects(User user, Long id){
        return this.prospectService.findAllProspectsByCompanyId(user, id);
    }
    */

}
