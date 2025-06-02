package com.CRM_Project.CRM_Project.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CRM_Project.CRM_Project.module.LeadForm;



@Repository
public interface LeadRepo extends JpaRepository<LeadForm, Long>
{
    Optional<LeadForm> findByNumber(String number);
	List<LeadForm> findAll();
	 List<LeadForm> findByFollowUpDate(LocalDate followUpDate);
	 LeadForm findByEmail(String email);
	 void deleteByNumber(String number);


	
}
