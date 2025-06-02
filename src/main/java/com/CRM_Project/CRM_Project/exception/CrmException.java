package com.CRM_Project.CRM_Project.exception;

public class CrmException extends RuntimeException {
    private final String errorCode;

    public CrmException(String message, String errorCode) {
        super(message);
        this.errorCode = errorCode;
    }

    public String getErrorCode() {
        return errorCode;
    }
}