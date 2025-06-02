package com.CRM_Project.CRM_Project.dto;

public class LoginResponceDTO {
    private String message;
    private boolean success;

    // Constructors
    public LoginResponceDTO() {}

    public LoginResponceDTO(String message, boolean success) {
        this.message = message;
        this.success = success;
    }

    // Getters and Setters
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public boolean isSuccess() { return success; }
    public void setSuccess(boolean success) { this.success = success; }
}


