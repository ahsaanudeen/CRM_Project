package com.CRM_Project.CRM_Project.service;

import com.CRM_Project.CRM_Project.dto.LoginRequestDTO;
import com.CRM_Project.CRM_Project.dto.LoginResponceDTO;
import com.CRM_Project.CRM_Project.module.LoginForm;

public interface LoginServiceInterface {
    LoginResponceDTO loginUser(LoginRequestDTO loginRequestDTO);
    LoginForm findByUsername(String username);
}