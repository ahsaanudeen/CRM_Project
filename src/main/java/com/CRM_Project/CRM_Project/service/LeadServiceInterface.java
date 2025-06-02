package com.CRM_Project.CRM_Project.service;

import java.util.List;
import java.util.Optional;

import com.CRM_Project.CRM_Project.dto.LeadRequestDTO;
import com.CRM_Project.CRM_Project.module.LeadForm;


public interface LeadServiceInterface {

	

    Optional<LeadForm>createNewLead(LeadRequestDTO leadRequestDTO);
	List<LeadForm> getAllLead();
	boolean delete(String number);
	boolean updateLead(String number, LeadRequestDTO leadDTO);
	



}
