package com.CRM_Project.CRM_Project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CRM_Project.CRM_Project.exception.CrmException;
import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.repository.LeadRepo;

@Service
public class LeadAssignmentService {

    @Autowired
    private LeadRepo leadRepo;

    public void assignLead(Long leadId, String employeeId) {
        LeadForm lead = leadRepo.findById(leadId)
            .orElseThrow(() -> new CrmException("Lead not found with ID: " + leadId, "LEAD_NOT_FOUND"));
        lead.setAssignedTo(employeeId);
        lead.setStatus("Pending");
        leadRepo.save(lead);
    }

    public void updateLeadStatus(Long leadId, String status) {
        LeadForm lead = leadRepo.findById(leadId)
            .orElseThrow(() -> new CrmException("Lead not found with ID: " + leadId, "LEAD_NOT_FOUND"));
        lead.setStatus(status);
        leadRepo.save(lead);
    }
}