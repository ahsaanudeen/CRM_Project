package com.CRM_Project.CRM_Project.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CRM_Project.CRM_Project.module.LoginForm;

@Repository
public interface LoginRepo extends JpaRepository<LoginForm, Long> {
    LoginForm findByUsernameAndPassword(String username, String password);
    LoginForm findByUsername(String username);
    boolean existsByEmployeeId(String employeeId);
    List<LoginForm> findByApprovedFalse(); // For admin to see pending users

}

