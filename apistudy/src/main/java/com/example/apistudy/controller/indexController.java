package com.example.apistudy.controller;

import com.example.apistudy.dto.UserDTO;
import com.example.apistudy.entity.User;
import com.example.apistudy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class indexController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/user")
    public String user() {
        return "user";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }

    @GetMapping("/joinForm")
    public String joinForm() {
        return "joinForm";
    }

    @PostMapping("/join")
    public String join(UserDTO userDTO) {
        userDTO.setRole("ROLE_USER");
        String prevPassword = userDTO.getPassword();
        String encPassword = bCryptPasswordEncoder.encode(prevPassword);
        userDTO.setPassword(encPassword);
        User user = userDTO.toEntity();
        User saved = userRepository.save(user);
        System.out.println(user.toString());

        return "redirect:/loginForm";
    }

    @GetMapping("/success")
    public String success() {
        return "success";
    }
}
