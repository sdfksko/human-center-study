package com.example.apistudy.dto;

import com.example.apistudy.entity.User;
import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDTO {
    private Long id;
    private String username;
    private String password;
    private String email;
    private String role;
    private String provider;
    private String providerId;
    private Timestamp createDate;

    public User toEntity() {
        return new User(id, username, password, email, role, provider, providerId, createDate);
    }
}
