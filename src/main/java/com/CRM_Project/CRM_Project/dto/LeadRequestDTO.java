package com.CRM_Project.CRM_Project.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class LeadRequestDTO {
	
	   @NotBlank(message = "Name is required")
	    private String name;
	    @NotNull(message =  "Number is required")
	    private String  number;

	    @NotBlank(message = "Email is required")
	    @Email(message = "Enter a valid email address")
	    private String email;

	    @NotBlank(message = "Stage is required")
	    private String Stage;

	    @NotBlank(message = "Degree is required")
	    private String degree;

	    @NotBlank(message = "College is required")
	    private String college;
	    
	    public LeadRequestDTO() {}

		public LeadRequestDTO(String name, String  number, String email, String stage, String degree, String college) 
			
			{
			
			this.name = name;
			this.number = number;
			this.email = email;
			Stage = stage;
			this.degree = degree;
			this.college = college;
			
		}


		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String  getNumber() {
			return number;
		}

		public void setNumber(String  number) {
			this.number = number;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getStage() {
			return Stage;
		}

		public void setStage(String stage) {
			Stage = stage;
		}

		public String getDegree() {
			return degree;
		}

		public void setDegree(String degree) {
			this.degree = degree;
		}

		public String getCollege() {
			return college;
		}

		public void setCollege(String college) {
			this.college = college;
		}


		@Override
		public String toString() {
			return "LeadForm [ name=" + name + ", number=" + number + ", email=" + email + ", Stage=" + Stage
					+ ", degree=" + degree + ", college=" + college + "]";
		}
	
	
}
