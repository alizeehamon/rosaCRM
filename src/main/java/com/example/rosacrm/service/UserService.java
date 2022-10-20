package com.example.rosacrm.service;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;


    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void register(UserDTO userDTO) {
        User user = userDTO.toEntity();
        this.userRepository.save(user);
    }

    public User getCurrentUser(String name) {
        return this.userRepository.findByEmail(name);
    }
}
