package com.CRM_Project.CRM_Project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.CRM_Project.CRM_Project.dto.LeadStatusUpdateRequestDTO;
import com.CRM_Project.CRM_Project.exception.CrmException;
import com.CRM_Project.CRM_Project.service.LeadAssignmentService;

@RestController
public class EmployeeLeadController {

    @Autowired
    private LeadAssignmentService leadAssignmentService;

    @PostMapping("/api/update-lead-status")
    public ResponseEntity<String> updateLeadStatus(@RequestBody LeadStatusUpdateRequestDTO request) {
        if (request.getLeadId() == null || request.getStatus() == null) {
            throw new CrmException("Lead ID and Status are required", "INVALID_STATUS_UPDATE_REQUEST");
        }
        leadAssignmentService.updateLeadStatus(request.getLeadId(), request.getStatus());
        return ResponseEntity.ok("Lead status updated to " + request.getStatus());
    }
}
