package com.CRM_Project.CRM_Project.dto;

public class LeadResponseDTO {

	   private String message;

	public LeadResponseDTO() {}

	public LeadResponseDTO(String message) {
		super();
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "LeadResponseDTO [message=" + message + "]";
	}
	
	
	   
	   
}
