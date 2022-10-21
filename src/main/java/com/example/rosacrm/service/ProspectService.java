package com.example.rosacrm.service;

import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.enumeration.ProspectionStatus;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.ProspectRepository;
import com.example.rosacrm.utils.DateUtils;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProspectService {

    private final ProspectRepository prospectRepository;

    private final CompanyRepository companyRepository;


    public ProspectService(ProspectRepository prospectRepository, CompanyRepository companyRepository) {
        this.prospectRepository = prospectRepository;
        this.companyRepository = companyRepository;
    }


    public void addProspect(ProspectDTO prospectDTO, User user) {
        Prospect prospect = new Prospect(prospectDTO);
        Optional<Company> company = companyRepository.findById(prospectDTO.getCompanyId());
        if (company.isPresent()) {
            prospect.setCompany(company.get());
        }
        prospect.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        prospect.setUser(user);
        prospectRepository.save(prospect);
    }

    public List<ProspectDTO> searchProspectsByStatusUserAndFullName(String prospectName, String filterByStatus, User user) {
        List<String> param = List.of(prospectName.split(" "));
        String firstName = param.get(0);
        String lastName = param.get(1);
        List<Prospect> prospectsByStatusAndFullName = this.prospectRepository.filterByStatusUserAndFullName(firstName, lastName, filterByStatus, user);
        return prospectsByStatusAndFullName.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    public List<ProspectDTO> searchActiveProspectsByNameUserAndStatus(String prospectName, String filterByStatus, User user) {
        List<Prospect> prospectsByStatusAndName = this.prospectRepository.filterByStatusUserAndName(prospectName, filterByStatus, user);
        return prospectsByStatusAndName.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    List<ProspectDTO> searchActiveProspectsByFullNameAndUser(String prospectName, User user) {
        List<String> param = List.of(prospectName.split(" "));
        String firstName = param.get(0);
        String lastName = param.get(1);
        List<Prospect> prospects = this.prospectRepository.findAllActiveProspectsByFullNameAndUser(firstName, lastName, user);
        return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    List<ProspectDTO> searchActiveProspectsByNameAndUser(String prospectName, User user) {
        List<Prospect> prospects = this.prospectRepository.findAllActiveProspectsByNameAndUser(prospectName, user);
        return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }


    List<ProspectDTO> searchActiveProspectsByStatusAndUser(String filterByStatus, User user) {
        List<Prospect> prospectsByStatus = this.prospectRepository.filterByStatusAndUser(filterByStatus, user);
        return prospectsByStatus.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    public List<ProspectDTO> searchProspectsByStatusAndName(String prospectName, String filterByStatus, User user) {
        if (prospectName != null && prospectName != "" && prospectName.contains(" ") && !Objects.equals(filterByStatus, "All prospection status")) {
            return searchProspectsByStatusUserAndFullName(prospectName, filterByStatus, user);
        } else if (prospectName != null && prospectName != "" && !Objects.equals(filterByStatus, "All prospection status")) {
            return searchActiveProspectsByNameUserAndStatus(prospectName, filterByStatus, user);
        } else if (prospectName != null && prospectName != "" && prospectName.contains(" ")) {
            return searchActiveProspectsByFullNameAndUser(prospectName, user);
        } else if (prospectName != null && prospectName != "") {
            return searchActiveProspectsByNameAndUser(prospectName, user);
        } else if (!Objects.equals(filterByStatus, "All prospection status") && filterByStatus != null) {
            return searchActiveProspectsByStatusAndUser(filterByStatus, user);
        }
        List<Prospect> prospects = this.prospectRepository.findAllActiveProspects(user);
        return prospects.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    public void deleteProspect(long prospectId) {
        Prospect prospect = prospectRepository.findById(prospectId).get();
        prospectRepository.delete(prospect);
    }

    public List<ProspectDTO> findAllProspectsByCompanyId(User user, Long id) {
        List<Prospect> prospectsList = prospectRepository.findAllByUserandCompanyId(user, id);
        return prospectsList.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }

    public ProspectDTO findProspectById(Long id) {
        Optional<Prospect> prospectOpt = this.prospectRepository.findById(id);
        return prospectOpt.orElseThrow(() -> new NoSuchElementException("Prospect not found with the id " + id)).toDTO();
    }


    public void changeProspectionStatus(Prospect prospect) {
        prospect.setProspectionStatus(ProspectionStatus.IN_PROGRESS.getValue());
        prospect.setStartDate(Timestamp.valueOf(LocalDateTime.now()));
        this.prospectRepository.save(prospect);
    }
    
    public void editProspect(ProspectDTO prospectDTO) {
        Optional<Prospect> prospect = prospectRepository.findById(prospectDTO.getId());
        prospect.ifPresent(prospect1 -> {
            prospect1.fromDTO(prospectDTO);
            this.prospectRepository.save(prospect1);
        });
    }
}
