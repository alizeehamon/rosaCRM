package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.dto.NoteDTO;
import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.dto.entity.*;
import enumeration.ProspectionStatus;
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

    private final NoteService noteService;

    public ClientService(ClientRepository clientRepository, CompanyRepository companyRepository, NoteService noteService) {
        this.clientRepository = clientRepository;
        this.companyRepository = companyRepository;
        this.noteService = noteService;
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

    public Client addClient(ClientDTO clientDTO, User user) {
        Client client = new Client(clientDTO);
        Optional<Company> company = companyRepository.findById(client.getCompany().getId());
        if (company.isPresent()) {
            client.setCompany(company.get());
        }
        client.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        client.setUser(user);
        if(client.getContactDuration()==null){
            client.setContactDuration(7);
        }
        clientRepository.save(client);
        NoteDTO noteDTO = new NoteDTO();
        noteDTO.setClient(client);
        noteDTO.setMessage("Client created");
        noteDTO.setNoteCreationDate(String.valueOf(LocalDateTime.now()));
        noteService.addNote(noteDTO);
        return client;
    }


    public List<ClientDTO> findAllClientsByCompanyId(User user, Long id) {
        List<Client> clientList = clientRepository.findAllByUserandCompanyId(user, id);
        return clientList.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }

    public ClientDTO findClientById(Long id) {
        Optional<Client> clientOpt = this.clientRepository.findById(id);
        return clientOpt.orElseThrow(() -> new NoSuchElementException("Client not found with the id " + id)).toDTO();
    }

    public void updateContactStatus(ClientDTO clientDTO) {
        List<Note> notes = clientDTO.getNotesById();
        Calendar contactDate = Calendar.getInstance();
        if (notes.size() > 0) {
            contactDate.setTimeInMillis(notes.get(notes.size() - 1).getNoteCreationDate().getTime());
        }
        contactDate.add(Calendar.DATE, clientDTO.getContactDuration());
        contactDate.set(Calendar.HOUR_OF_DAY, 0);
        Calendar today = Calendar.getInstance();
        today.set(Calendar.HOUR_OF_DAY, 0);
        if (contactDate.compareTo(today) < 0) {
            clientDTO.setContactStatus(ProspectionStatus.TO_CONTACT.getValue());
        } else {
            clientDTO.setContactStatus(contactDate.getTime().toString());
        }
    }

    public Client findClientByClientDTOId(Long id) {
        Optional<Client> clientOptional = clientRepository.findById(id);
        if (clientOptional.isPresent()) {
            return clientOptional.get();
        }
        return clientOptional.orElseThrow(() -> new NoSuchElementException("Client not found with the id " + id));
    }

    public void deleteClient(Long clientId) {
        clientRepository.deleteById(clientId);
    }

    public void editClient(ClientDTO clientDTO) {
        Optional<Client> client = clientRepository.findById(clientDTO.getId());
        client.ifPresent(client1 -> {
            client1.fromDTO(clientDTO);
            this.clientRepository.save(client1);
        });
    }

    public List<ClientDTO> findAllClientsByUser(User user) {
        List<Client> clientList = clientRepository.findAllByUser(user);
        return clientList.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }

    public void  setClientContactDuration(ClientDTO clientDTO){
        Optional <Client> client = this.clientRepository.findById(clientDTO.getId());
        if(client.isPresent()){
            client.get().setContactDuration(clientDTO.getContactDuration());
            this.clientRepository.save(client.get());
        }
    }
}
