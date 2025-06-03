package com.CRM_Project.CRM_Project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.CRM_Project.CRM_Project.module.LeadForm;
import com.CRM_Project.CRM_Project.service.LeadService;

@Controller
public class DashboardController {
//
//    @Autowired
//    private LeadService leadService;
//
//    @GetMapping("/admin/dashboard")
//    public String showDashboard(Model model) {
//        List<LeadForm> leads = leadService.getAllLead();
//        model.addAttribute("leads", leads);
//        return "admin";
//    }
}
