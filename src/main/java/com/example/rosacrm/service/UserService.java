package com.example.rosacrm.service;

import com.example.rosacrm.dto.UserDTO;
import com.example.rosacrm.entity.User;
import com.example.rosacrm.repository.UserRepository;
import com.example.rosacrm.security.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    private SessionRegistry sessionRegistry;


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
        u.setRole(user.getRole());
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

    public void deleteUser(User user) {
        userRepository.deleteById(user.getId());
    }

    public List<UserDTO> findAllUsers() {
        List<User> userList = userRepository.findAllSimpleUsers();
        return userList.stream().map(u -> u.toDTO()).collect(Collectors.toList());
    }

    public User findUserById(long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return user.get();
        }
        return user.orElseThrow(() -> new NoSuchElementException("User not found with the id " + id));
    }

    public void removeSession(String email) {
        Optional<Object> principal = sessionRegistry.getAllPrincipals()
                .stream()
                .filter(u -> ((CustomUserDetails) u).getUsername().equals(email))
                .findFirst();
        if (principal.isPresent()) {
            List<SessionInformation> sessions = sessionRegistry.getAllSessions(principal.get(), false);
            sessions.forEach(session -> session.expireNow());
        }
    }
}
