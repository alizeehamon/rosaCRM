package com.example.rosacrm.service;

import com.example.rosacrm.dto.CompanyDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Sector;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.SectorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CompanyService {

    private final CompanyRepository companyRepository;

    private final SectorRepository sectorRepository;
    private final ClientService clientService;
    private final ProspectService prospectService;

    private final SectorService sectorService;

    public CompanyService(CompanyRepository companyRepository, ClientService clientService, ProspectService prospectService, SectorService sectorService, SectorRepository sectorRepository) {
        this.companyRepository = companyRepository;
        this.clientService = clientService;
        this.prospectService = prospectService;
        this.sectorService = sectorService;
        this.sectorRepository = sectorRepository;
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
        return findCompaniesByUser(user);
    }

    public Optional<CompanyDTO> findCompanyDTOById(Long id) {
        return Optional.ofNullable(this.companyRepository.findById(id).get().toDTO());
    }

    public void createCompany(CompanyDTO companyDTO, User user) {
        Company company = new Company(companyDTO);
        company.setUser(user);
        Optional<Sector> sectorOpt = sectorService.findSectorByActivitySector(companyDTO.getSector());
        if (sectorOpt.isPresent()){
            company.setSector(sectorOpt.get());
        }else{
            Sector sector = new Sector(companyDTO.getSector());
            company.setSector(sector);
            sectorRepository.save(sector);
        }
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

    public Company findCompanyById(Long companyId) {
        Optional<Company> companyOptional = companyRepository.findById(companyId);
        if (companyOptional.isPresent()) {
            return companyOptional.get();
        }
        return companyOptional.orElseThrow(() -> new NoSuchElementException("Company not found with id " + companyId));
    }

    public List<CompanyDTO> findCompaniesByUser(User user) {
        List<Company> entreprises = this.companyRepository.findAllByUser(user);
        return entreprises.stream().map(e -> e.toDTO()).collect(Collectors.toList());
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
