package com.CRM_Project.CRM_Project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // ✅ Correct import
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.CRM_Project.CRM_Project.module.LoginForm;
import com.CRM_Project.CRM_Project.module.Role;
import com.CRM_Project.CRM_Project.service.LoginService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginDashController {

    @Autowired
    private LoginService loginService; // ✅ Autowire the service

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        LoginForm user = loginService.findByUsernameAndPassword(username, password); // ✅ Proper service call

        if (user != null) {
            if (user.getRole() == Role.ADMIN) {
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole().name());
                return "redirect:/adminDashboard";

            } else if (user.getRole() == Role.EMPLOYEE) {
                if (!user.isApproved()) {
                    model.addAttribute("error", "Your employee ID is not approved by admin.");
                    return "login";
                }
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole().name());
                return "redirect:/employee/dashboard";
            } else {
                model.addAttribute("error", "Unknown role");
                return "login";
            }
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }

    @GetMapping("/admin/dashboard")
    public String showAdminDashboard() {
        return "adminDashboard"; // Should match JSP file name
    }

    @GetMapping("/employee/dashboard")
    public String showEmployeeDashboard() {
        return "employeeDashboard";
    }
}
