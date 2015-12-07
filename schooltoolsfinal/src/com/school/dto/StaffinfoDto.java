package com.school.dto;

import java.util.Date;

public class StaffinfoDto {
	
	String staff_name;	
	String emp_no;
	Date date_of_join;
	String department;	
	String designation;
	public StaffinfoDto(String staff_name,String emp_no,Date date_of_join,String department,String designation) {
		super();
		this.staff_name=staff_name;
		this.emp_no=emp_no;
		this.date_of_join=date_of_join;
		this.department=department;
		this.designation=designation;	
		
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public Date getDate_of_join() {
		return date_of_join;
	}
	public void setDate_of_join(Date date_of_join) {
		this.date_of_join = date_of_join;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}

	
}
