package com.example.rosacrm.service;

import com.example.rosacrm.dto.EventDTO;
import com.example.rosacrm.entity.Event;
import com.example.rosacrm.repository.EventRepository;
import com.example.rosacrm.repository.ProspectRepository;
import org.springframework.stereotype.Service;

@Service
public class EventService {

    EventRepository eventRepository;
    ProspectRepository prospectRepository;

    public EventService(EventRepository eventRepository    ,ProspectRepository prospectRepository) {
        this.eventRepository = eventRepository;
        this.prospectRepository = prospectRepository;
    }

    public void addEvent(EventDTO eventDTO) {
        Event event = new Event(eventDTO);
        eventRepository.save(event);
    }

}
