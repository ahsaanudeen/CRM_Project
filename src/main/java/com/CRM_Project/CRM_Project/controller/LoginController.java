package com.CRM_Project.CRM_Project.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.CRM_Project.CRM_Project.dto.LoginRequestDTO;
import com.CRM_Project.CRM_Project.dto.LoginResponceDTO;
import com.CRM_Project.CRM_Project.module.LoginForm;
import com.CRM_Project.CRM_Project.service.LoginServiceInterface;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private LoginServiceInterface loginServiceInterface;

    @PostMapping("/login")
    public ResponseEntity<LoginResponceDTO> loginUser(@Valid @RequestBody LoginRequestDTO loginRequestDTO, HttpSession session) {
        LoginResponceDTO loginResponceDTO = loginServiceInterface.loginUser(loginRequestDTO);
        if (loginResponceDTO.isSuccess()) {
            LoginForm user = loginServiceInterface.findByUsername(loginRequestDTO.getUsername());
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole().toString());
            return ResponseEntity.ok(loginResponceDTO);
        } else {
            return ResponseEntity.badRequest().body(loginResponceDTO);
        }
    }

    @GetMapping("/logout")
    public ResponseEntity<LoginResponceDTO> logout(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok(new LoginResponceDTO("Logout successful!", true));
    }
    @GetMapping("/get-role")
    public ResponseEntity<Map<String, String>> getRole(HttpSession session) {
        String role = (String) session.getAttribute("role");
        if (role == null) {
            return ResponseEntity.status(401).body(Map.of("error", "Not logged in"));
        }
        return ResponseEntity.ok(Map.of("role", role));
    }
}