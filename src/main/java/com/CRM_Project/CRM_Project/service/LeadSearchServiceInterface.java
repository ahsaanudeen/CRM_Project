package com.CRM_Project.CRM_Project.service;

import java.util.Optional;

import com.CRM_Project.CRM_Project.dto.LeadSearchRequestDTO;
import com.CRM_Project.CRM_Project.module.LeadForm;

public interface LeadSearchServiceInterface {
	
	Optional<LeadForm> searchLeadByEmailOrNumber(LeadSearchRequestDTO  requestDTO);

}
