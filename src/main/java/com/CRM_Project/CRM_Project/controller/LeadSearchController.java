package com.CRM_Project.CRM_Project.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.CRM_Project.CRM_Project.dto.LeadSearchRequestDTO;
import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.service.LeadSearchServiceInterface;

import jakarta.validation.Valid;


@RestController
public class LeadSearchController {
	
	@Autowired LeadSearchServiceInterface leadSearchServiceInterface;
	
	@PostMapping("/search")
	public ResponseEntity<?> searchLead(@Valid @RequestBody  LeadSearchRequestDTO requestDTO)
	{
		Optional<LeadForm> lead=leadSearchServiceInterface.searchLeadByEmailOrNumber(requestDTO);
				if(lead.isPresent())
				{
					return ResponseEntity.ok(lead.get());
				}
				else
				{
					return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No Lead Found");
				}
}
}