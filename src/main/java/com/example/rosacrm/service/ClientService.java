package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.ClientRepository;
import com.example.rosacrm.repository.CompanyRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ClientService {

    private final ClientRepository clientRepository;

    private final CompanyRepository companyRepository;

    public ClientService(ClientRepository clientRepository, CompanyRepository companyRepository) {
        this.clientRepository = clientRepository;
        this.companyRepository = companyRepository;
    }

    public List<ClientDTO> findAll() {
        List<Client> clients = (List<Client>) this.clientRepository.findAll();
        return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }


    public List<ClientDTO> searchContacts(String clientName, User user) {
        if (clientName != null && clientName.contains(" ")) {
            List<String> param = List.of(clientName.split(" "));
            String firstName = param.get(0);
            String lastName = param.get(1);
            List<Client> clients = this.clientRepository.findAllByFullName(firstName, lastName, user);
            return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
        } else if (clientName != null) {
            List<Client> clients = this.clientRepository.findAllByName(clientName, user);
            return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
        }
        List<Client> clients = this.clientRepository.findAllByUser(user);
        return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }

    public void addClient(ClientDTO clientDTO, User user) {
        Client client = new Client(clientDTO);
        Optional<Company> company = companyRepository.findById(clientDTO.getCompanyId());
        if (company.isPresent()) {
            client.setCompany(company.get());
        }
        client.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        client.setUser(user);
        clientRepository.save(client);
    }

    public ClientDTO findClientById(Long id) {
        Optional<Client> clientOpt = this.clientRepository.findById(id);
        return clientOpt.orElseThrow(() -> new NoSuchElementException("Client not found with the id " + id)).toDTO();
    }

    public void updateContactStatus(ClientDTO clientDTO) {
        List<Note> notes = clientDTO.getNotesById();
        Calendar contactDate = Calendar.getInstance();
        contactDate.setTimeInMillis(notes.get(notes.size()-1).getNoteCreationDate().getTime());
        contactDate.add(Calendar.DATE, clientDTO.getContactDuration());
        contactDate.set(Calendar.HOUR_OF_DAY, 0);
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        if(contactDate.compareTo(today)<0){
            clientDTO.setContactStatus("To contact");
        }else {
            clientDTO.setContactStatus(contactDate.getTime().toString());
        }
    }
}
