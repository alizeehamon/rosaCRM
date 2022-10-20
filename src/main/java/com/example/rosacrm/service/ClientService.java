package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.entity.Client;
import com.example.rosacrm.repository.ClientRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClientService {

    private final ClientRepository clientRepository;

    public ClientService(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public List<ClientDTO> findAll() {
        List<Client> clients = (List<Client>) this.clientRepository.findAll();
        return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }

    public List<ClientDTO> searchContacts(String clientName) {
        if (clientName != null && clientName.contains(" ")) {
            List<String> param = List.of(clientName.split(" "));
            String firstName = param.get(0);
            String lastName = param.get(1);
            List<Client> clients = this.clientRepository.findAllByFullName(firstName, lastName);
            return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
        } else if (clientName != null) {
            List<Client> clients = this.clientRepository.findAllByName(clientName);
            return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
        }
        List<Client> clients = (List<Client>) this.clientRepository.findAll();
        return clients.stream().map(c -> c.toDTO()).collect(Collectors.toList());
    }
}
