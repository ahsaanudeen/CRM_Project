package com.CRM_Project.CRM_Project.controller;


import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.service.LeadServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminLeadController {

    @Autowired
    private LeadServiceInterface leadService;

    // Show all leads
    @GetMapping("/leads")
    public String getAllLeads(Model model) {
        List<LeadForm> leads = leadService.getAllLead();
        model.addAttribute("leads", leads);
        return "leadList"; // JSP/HTML page to show lead list
    }

    // Show create form
    @GetMapping("/leads/create")
    public String showCreateForm(Model model) {
        model.addAttribute("leadForm", new LeadForm());
        return "leadCreate";
    }

    // Save lead
    @PostMapping("/leads/save")
    public String saveLead(@ModelAttribute LeadForm leadForm) {
        leadForm.setStatus("Pending");
        leadService.createNewLead(new com.CRM_Project.CRM_Project.dto.LeadRequestDTO(
                leadForm.getName(),
                leadForm.getNumber(),
                leadForm.getEmail(),
                leadForm.getStage(),
                leadForm.getDegree(),
                leadForm.getCollege()
        ));
        return "redirect:/admin/leads";
    }

    // Show edit form
    @GetMapping("/leads/edit/{number}")
    public String showEditForm(@PathVariable String number, Model model) {
        LeadForm lead = leadService.getAllLead().stream()
                .filter(l -> l.getNumber().equals(number))
                .findFirst()
                .orElse(null);

        model.addAttribute("leadForm", lead);
        return "leadEdit";
    }

    // Update lead
    @PostMapping("/leads/update")
    public String updateLead(@ModelAttribute LeadForm leadForm) {
        leadService.updateLead(leadForm.getNumber(), new com.CRM_Project.CRM_Project.dto.LeadRequestDTO(
                leadForm.getName(),
                leadForm.getNumber(),
                leadForm.getEmail(),
                leadForm.getStage(),
                leadForm.getDegree(),
                leadForm.getCollege()
        ));
        return "redirect:/admin/leads";
    }

    // Delete lead
    @GetMapping("/leads/delete/{number}")
    public String deleteLead(@PathVariable String number) {
        leadService.delete(number);
        return "redirect:/admin/leads";
    }
}
