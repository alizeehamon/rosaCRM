package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.ClientToProspectDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.dto.entity.*;
import enumeration.ProspectionStatus;
import com.example.rosacrm.repository.CompanyRepository;
import com.example.rosacrm.repository.ProspectRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProspectService {

    private final ProspectRepository prospectRepository;

    private final CompanyRepository companyRepository;

    private final ClientService clientService;


    public ProspectService(ProspectRepository prospectRepository, CompanyRepository companyRepository, ClientService clientService) {
        this.prospectRepository = prospectRepository;
        this.companyRepository = companyRepository;
        this.clientService = clientService;
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
        return findAllProspectsByUser(user);
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
            prospectDTO.setProspectionStatus(prospect1.getProspectionStatus());
            prospect1.fromDTO(prospectDTO);
            this.prospectRepository.save(prospect1);
        });
    }

    public void postEditProspectStatusToContact(ProspectDTO prospectDTO) {
        Optional<Prospect> prospect = prospectRepository.findById(prospectDTO.getId());
        prospect.ifPresent(prospect1 -> {
            prospect1.setProspectionStatus(prospectDTO.getProspectionStatus());
            Note note = new Note();
            note.setProspect(prospect1);
            note.setNoteCreationDate(Timestamp.valueOf(LocalDateTime.now()));
            note.setMessage("The prospection need to be relaunched");
            prospect1.getNotesById().add(note);
            this.prospectRepository.save(prospect1);
        });
    }

    public void clientToProspect(Client client, ClientToProspectDTO clientToProspectDTO, Company company, User user) {
        Prospect prospect = new Prospect();
        prospect.setEmail(client.getEmail());
        prospect.setUser(user);
        prospect.setProspectionStatus(ProspectionStatus.NOT_STARTED.getValue());
        prospect.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        prospect.setAddress1(client.getAddress1());
        prospect.setAddress2(client.getAddress2());
        prospect.setCity(client.getCity());
        prospect.setCountry(client.getCountry());
        prospect.setCellPhone(client.getCellPhone());
        prospect.setHomePhone(client.getHomePhone());
        prospect.setFirstName(client.getFirstName());
        prospect.setLastName(client.getLastName());
        prospect.setPicture(client.getPicture());
        prospect.setZipCode(client.getZipCode());
        prospect.setCompany(company);
        prospect.setRoleEntreprise(clientToProspectDTO.getRoleEntreprise());
        prospect.setRelanceDuration(client.getContactDuration());
        prospectRepository.save(prospect);
    }

    public Long prospectToClient(Long prospectId) {
        Optional<Prospect> prospectOpt = prospectRepository.findById(prospectId);
        Long clientId = null;
        if (prospectOpt.isPresent()) {
            Prospect prospect = prospectOpt.get();
            prospect.setProspectionStatus("Over");
            prospectRepository.save(prospect);
            ClientDTO clientDTO = new Client(prospect).toDTO();
            Client client = clientService.addClient(clientDTO, prospect.getUser());
            clientId = client.getId();
        }
        return clientId;
    }

    public List<ProspectDTO> findAllProspectsByUser(User user) {
        List<Prospect> prospectList = prospectRepository.findAllActiveProspects(user);
        return prospectList.stream().map(p -> p.toDTO()).collect(Collectors.toList());
    }

    public void setReminderProspect(ProspectDTO prospectDTO) {
        Optional<Prospect> prospect = this.prospectRepository.findById(prospectDTO.getId());
        if (prospect.isPresent()) {
            prospect.get().setRelanceDuration(prospectDTO.getRelanceDuration());
            this.prospectRepository.save(prospect.get());
        }
    }

    public void updateContactStatus(ProspectDTO prospectDTO) {
        List<Note> notes = prospectDTO.getNotesById();
        Calendar contactDate = Calendar.getInstance();
        if (notes.size() > 0) {
            contactDate.setTimeInMillis(notes.get(notes.size() - 1).getNoteCreationDate().getTime());
        }
        contactDate.add(Calendar.DATE, prospectDTO.getRelanceDuration());
        contactDate.set(Calendar.HOUR_OF_DAY, 0);
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        if (contactDate.compareTo(today) < 0) {
            prospectDTO.setProspectionStatus(ProspectionStatus.TO_CONTACT.getValue());
        }
    }
}