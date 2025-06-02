package com.CRM_Project.CRM_Project.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.CRM_Project.CRM_Project.module.LeadForm;

public interface LeadSearchRepo extends  JpaRepository<LeadForm, Long>{
	
	Optional<LeadForm>findByEmail(String email);
	Optional<LeadForm>findByNumber(String number);

}
