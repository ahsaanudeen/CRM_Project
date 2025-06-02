package com.CRM_Project.CRM_Project.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CRM_Project.CRM_Project.dto.LeadSearchRequestDTO;
import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.repository.LeadSearchRepo;

@Service
public class LeadSearchService implements LeadSearchServiceInterface {

	@Autowired
	private LeadSearchRepo leadSearchRepo;
	
	@Override
	public Optional<LeadForm> searchLeadByEmailOrNumber(LeadSearchRequestDTO requestDTO) {
		if(requestDTO.getEmail()!=null && !requestDTO.getEmail().isEmpty())
		{
			return leadSearchRepo.findByEmail(requestDTO.getEmail());
	    } else if (requestDTO.getNumber() != null) {
	        return leadSearchRepo.findByNumber(requestDTO.getNumber());
	    }
	    return Optional.empty();
	    }

}
