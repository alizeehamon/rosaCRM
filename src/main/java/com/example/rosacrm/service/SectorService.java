package com.example.rosacrm.service;

import com.example.rosacrm.entity.Sector;
import com.example.rosacrm.repository.SectorRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SectorService {

    private final SectorRepository sectorRepository;

    public SectorService(SectorRepository sectorRepository) {
        this.sectorRepository = sectorRepository;
    }
    public List<Sector> getAllSectors(){
        return (List<Sector>) this.sectorRepository.findAll();
    }
}
