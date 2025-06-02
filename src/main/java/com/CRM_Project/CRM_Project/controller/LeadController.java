package com.CRM_Project.CRM_Project.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.CRM_Project.CRM_Project.dto.LeadAssignmentRequestDTO;
import com.CRM_Project.CRM_Project.dto.ResponseMessage;
import com.CRM_Project.CRM_Project.exception.CrmException;
import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.repository.LeadRepo;
import com.CRM_Project.CRM_Project.service.LeadAssignmentService;

import jakarta.validation.Valid;

@RestController
public class LeadController {

    @Autowired
    private LeadRepo leadRepo;

    @Autowired
    private LeadAssignmentService leadAssignmentService;

    @PostMapping("/api/create")
    public ResponseEntity<?> createLead(@Valid @RequestBody LeadForm leadForm) {
        leadRepo.save(leadForm);
        return ResponseEntity.status(HttpStatus.CREATED).body(new ResponseMessage("Lead created successfully"));
    }

    @GetMapping("/api/all")
    public List<LeadForm> getAllLeads() {
        return leadRepo.findAll();
    }

    @GetMapping("/api/leadsByDate")
    public List<LeadForm> getLeadsByDate(@RequestParam("date") String date) {
        LocalDate followUpDate = LocalDate.parse(date);
        return leadRepo.findByFollowUpDate(followUpDate);
    }

    @PutMapping("/api/update/{number}")
    public ResponseEntity<String> updateLead(@PathVariable String number, @RequestBody LeadForm leadForm) {
        LeadForm existingLead = leadRepo.findByNumber(number).orElse(null);

        if (existingLead == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Lead not found");
        }

        leadForm.setId(existingLead.getId());  // keep same ID to update
        leadForm.setNumber(number);            // set same number
        leadRepo.save(leadForm);

        return ResponseEntity.ok("Lead updated successfully");
    }


    @DeleteMapping("/api/delete/{number}")
    public ResponseEntity<String> deleteLead(@PathVariable String number) {
        LeadForm existingLead = leadRepo.findByNumber(number).orElse(null);

        if (existingLead == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Lead not found");
        }

        leadRepo.delete(existingLead);
        return ResponseEntity.ok("Lead deleted successfully");
    }

    @PostMapping("/api/assignLead")
    public ResponseEntity<String> assignLead(@RequestBody LeadAssignmentRequestDTO request) {
        if (request.getLeadId() == null || request.getEmployeeId() == null) {
            throw new CrmException("Lead ID and Employee ID are required", "INVALID_ASSIGNMENT_REQUEST");
        }
        leadAssignmentService.assignLead(request.getLeadId(), request.getEmployeeId());
        return ResponseEntity.ok("Lead assigned successfully to " + request.getEmployeeId());
    }
}