
package com.CRM_Project.CRM_Project.dto;

public class LeadStatusUpdateRequestDTO {

	private Long leadId;
    private String status;

    public Long getLeadId() {
        return leadId;
    }

    public void setLeadId(Long leadId) {
        this.leadId = leadId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
