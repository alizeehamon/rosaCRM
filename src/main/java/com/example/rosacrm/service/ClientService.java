package com.example.rosacrm.service;

import com.example.rosacrm.dto.ClientDTO;
import com.example.rosacrm.entity.Client;
import com.example.rosacrm.entity.Company;
import com.example.rosacrm.repository.ClientRepository;
import com.example.rosacrm.repository.CompanyRepository;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
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

    public void addClient(ClientDTO clientDTO) {
        Client client = new Client(clientDTO);
        Optional<Company> company = companyRepository.findById(clientDTO.getCompanyId());
        if(company.isPresent()){
            client.setCompany(company.get());
        }
        client.setCreationDate(Timestamp.valueOf(LocalDateTime.now()));
        clientRepository.save(client);
    }
}
