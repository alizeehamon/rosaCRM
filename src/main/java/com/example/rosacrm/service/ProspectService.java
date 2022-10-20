package com.example.rosacrm.service;

import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.ProspectRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProspectService {

    private final ProspectRepository prospectRepository;

    private  final CompanyRepository companyRepository;


    public ProspectService(ProspectRepository prospectRepository, CompanyRepository companyRepository) {
        this.prospectRepository = prospectRepository;
        this.companyRepository = companyRepository;
    }


    public List<ProspectDTO> findAll() {
        //List<Prospect> prospects = this.prospectRepository.findAllActiveProspects();
        List<Prospect> prospects = (List<Prospect>) this.prospectRepository.findAll();
        return prospects.stream().map((p -> p.toDTO())).collect(Collectors.toList());
    }

    public void addProspect(ProspectDTO prospectDTO) {
        Prospect prospect = new Prospect(prospectDTO);
        Optional<Company> company = companyRepository.findById(prospectDTO.getCompanyId());
        if(company.isPresent()){
            prospect.setCompany(company.get());
        }
        prospect.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        prospectRepository.save(prospect);
    }

    public List<ProspectDTO> searchProspects(String prospectName) {
        if (prospectName != null && prospectName.contains(" ")) {
            List<String> param = List.of(prospectName.split(" "));
            String firstName = param.get(0);
            String lastName = param.get(1);
            List<Prospect> prospects = this.prospectRepository.findAllActiveProspectsByFullName(firstName, lastName);
            return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
        } else if (prospectName != null) {
            List<Prospect> prospects = this.prospectRepository.findAllActiveProspectsByName(prospectName);
            return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
        }
        List<Prospect> prospects = this.prospectRepository.findAllActiveProspects();
        return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }
}
