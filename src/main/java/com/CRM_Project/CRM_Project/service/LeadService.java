package com.CRM_Project.CRM_Project.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CRM_Project.CRM_Project.dto.LeadRequestDTO;
import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.repository.LeadRepo;


@Service
public class LeadService implements LeadServiceInterface {
	
	@Autowired
	private LeadRepo leadRepo;
	
	@Override
	public Optional<LeadForm>createNewLead(LeadRequestDTO leadRequestDTO)
	{
		Optional<LeadForm>exit=leadRepo.findByNumber(leadRequestDTO.getNumber());
		
		if(exit.isPresent())
		{
			return exit;
		}
		LeadForm lead= new LeadForm();
		
		lead.setName(leadRequestDTO.getName());
        lead.setNumber(leadRequestDTO.getNumber());
        lead.setEmail(leadRequestDTO.getEmail());
        lead.setStage(leadRequestDTO.getStage());
        lead.setDegree(leadRequestDTO.getDegree());
        lead.setCollege(leadRequestDTO.getCollege());

        leadRepo.save(lead);
        return Optional.of(lead);
	}
	
	//get all lead
	@Override
	public List<LeadForm> getAllLead()
	{
		return leadRepo.findAll();
	}

	@Override  //delete
	public boolean delete(String number)
	{
		Optional<LeadForm> lead=leadRepo.findByNumber(number);
		if(lead.isPresent())
		{
			 leadRepo.delete(lead.get());
        return true;
	}
    return false;
	}
	
	@Override
	public boolean updateLead(String number, LeadRequestDTO leadRequestDTO) {
	    Optional<LeadForm> optionalLead = leadRepo.findByNumber(number);

	    if (optionalLead.isPresent()) {
	        LeadForm lead =  optionalLead.get(); 
	        lead.setName(leadRequestDTO.getName());
	        lead.setNumber(leadRequestDTO.getNumber());
	        lead.setEmail(leadRequestDTO.getEmail());
	        lead.setStage(leadRequestDTO.getStage());
	        lead.setDegree(leadRequestDTO.getDegree());
	        lead.setCollege(leadRequestDTO.getCollege());
	        lead.setModifiedOn(LocalDateTime.now());
	        leadRepo.save(lead); 
	        return true;
	    }
	    return false;
	}


}
