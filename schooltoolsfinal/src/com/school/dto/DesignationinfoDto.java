package com.school.dto;

public class DesignationinfoDto {

	String Designation;
	String School;	
	public DesignationinfoDto(String Designation,String School) {
		super();
		this.Designation=Designation;
		this.School=School;
		

		
		
	}
	public String getDesignation() {
		return Designation;
	}
	public void setDesignation(String designation) {
		Designation = designation;
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	



}
