package com.CRM_Project.CRM_Project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.CRM_Project.CRM_Project.dto.LeadStatusUpdateRequestDTO;
import com.CRM_Project.CRM_Project.service.LeadAssignmentService;

@RestController

public class LeadAssignmentController {

    @Autowired
    private LeadAssignmentService leadAssignmentService;
    @PostMapping("/api/admin/update-lead-status")
    public ResponseEntity<String> updateLeadStatus(@RequestBody LeadStatusUpdateRequestDTO request) {
        leadAssignmentService.updateLeadStatus(request.getLeadId(), request.getStatus());
        return ResponseEntity.ok("Lead status updated");
    }
}
	

