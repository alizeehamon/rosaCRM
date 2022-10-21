package com.example.rosacrm.service;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

    public UserDTO findUserByEmail(String email) {
        User user = this.userRepository.findByEmail(email);
        return toDTO(user);
    }

    private UserDTO toDTO(User user) {
        UserDTO u = new UserDTO();
        u.setFirstName(user.getFirstName());
        u.setLastName(user.getLastName());
        return u;
    }

    public void edit(UserDTO userDTO, String email) {
        User user = this.userRepository.findByEmail(email);
        if (user != null) {
            user.setFirstName(userDTO.getFirstName());
            user.setLastName(userDTO.getLastName());
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            String encodedPassword = passwordEncoder.encode(userDTO.getPassword());
            user.setPassword(encodedPassword);
            this.userRepository.save(user);
        }
    }
}
