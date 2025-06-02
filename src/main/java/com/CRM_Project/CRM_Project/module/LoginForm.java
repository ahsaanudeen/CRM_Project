package com.CRM_Project.CRM_Project.module;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;

@Entity(name = "login_form")
public class LoginForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Username must not be null")
    private String username;

    @NotNull(message = "Password must not be null")
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Role role; // Use enum instead of String

    @Column(nullable = true, unique = true)
    private String employeeId;

    private boolean approved = false;

    
    // Constructors, Getters, Setters, and toString (same as your code)
    public LoginForm() {}

    public LoginForm(Long id, @NotNull(message = "Username must not be null") String username,
                    @NotNull(message = "Password must not be null") String password, Role role,
                    String employeeId, boolean approved) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.employeeId = employeeId;
        this.approved = approved;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
    public String getEmployeeId() { return employeeId; }
    public void setEmployeeId(String employeeId) { this.employeeId = employeeId; }
    public boolean isApproved() { return approved; }
    public void setApproved(boolean approved) { this.approved = approved; }

    @Override
    public String toString() {
        return "LoginForm [id=" + id + ", username=" + username + ", password=" + password + ", role=" + role
                + ", employeeId=" + employeeId + ", approved=" + approved + "]";
    }
}