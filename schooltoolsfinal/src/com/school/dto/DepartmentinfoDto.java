package com.school.dto;

public class DepartmentinfoDto {

	String Department;
	String School;	
	public DepartmentinfoDto(String Department,String School) {
		super();
		this.Department=Department;
		this.School=School;
		

		
		
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}



}
