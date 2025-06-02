package com.CRM_Project.CRM_Project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CRM_Project.CRM_Project.dto.LoginRequestDTO;
import com.CRM_Project.CRM_Project.dto.LoginResponceDTO;
import com.CRM_Project.CRM_Project.module.LoginForm;
import com.CRM_Project.CRM_Project.module.Role;
import com.CRM_Project.CRM_Project.repository.LoginRepo;

@Service
public class LoginService implements LoginServiceInterface {

    @Autowired
    private LoginRepo loginRepo;

    @Override
    public LoginResponceDTO loginUser(LoginRequestDTO dto) {
        LoginForm user = loginRepo.findByUsernameAndPassword(dto.getUsername(), dto.getPassword());
        if (user == null) {
            return new LoginResponceDTO("Invalid username or password.", false);
        }

        if (user.getRole() == Role.Role.ADMIN) {
            return new LoginResponceDTO("Admin login successful!", true);
        }

        if (!user.isApproved()) {
            return new LoginResponceDTO("Your employee ID is not approved by admin.", false);
        }

        return new LoginResponceDTO("User login successful!", true);
    }

    @Override
    public LoginForm findByUsername(String username) {
        return loginRepo.findByUsername(username);
    }
}