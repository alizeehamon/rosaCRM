package com.example.rosacrm.service;

import com.example.rosacrm.dto.ProspectDTO;
import com.example.rosacrm.entity.Prospect;
import com.example.rosacrm.repository.ProspectRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProspectService {

    private final ProspectRepository prospectRepository;


    public ProspectService(ProspectRepository prospectRepository) {
        this.prospectRepository = prospectRepository;
    }


    public List<ProspectDTO> findAll() {
        //List<Prospect> prospects = this.prospectRepository.findAllActiveProspects();
        List<Prospect> prospects = (List<Prospect>) this.prospectRepository.findAll();
        return prospects.stream().map((p -> p.toDTO())).collect(Collectors.toList());
    }

    public void addProspect(ProspectDTO prospectDTO) {
        Prospect prospect = new Prospect(prospectDTO);
        prospectRepository.save(prospect);
    }
}
