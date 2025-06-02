package com.CRM_Project.CRM_Project.dto;

public class LeadAssignmentRequestDTO {
	    private String employeeId;
	    private Long leadId;

	    public void LeadAssignmentRequestDTO(String employeeId,Long leadId) {
	        this.employeeId = employeeId;
	        this.leadId= leadId;
	    }

	    public Long getLeadId() {
	        return leadId;
	    }

	    public void setLeadId(Long leadId) {
	        this.leadId = leadId;
	    }

	    public String getEmployeeId() {
	        return employeeId;
	    }

	
}
