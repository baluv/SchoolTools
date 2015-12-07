package com.school.dto;

import java.util.Date;





public class ListAllStudentsDto {

	String first_name;
	String last_name;
	String roll_no;
	String academic_year;
	String report_to_email;
	Date date_of_birth;
	String admission_no;
	Integer standard_id;
	String standard_name;
	String section_name;
	
	public ListAllStudentsDto(String first_name,String last_name,String roll_no,String academic_year,String standard_name,String section_name,String report_to_email,Date date_of_birth,String admission_no,Integer standard_id) {
		super();
		this.first_name=first_name;
		this.last_name=last_name;
		this.roll_no = roll_no;
		this.academic_year = academic_year;
		this.report_to_email=report_to_email;
		this.date_of_birth=date_of_birth;
		this.admission_no = admission_no;
		this.standard_id = standard_id;
		this.standard_name=standard_name;
		this.section_name=section_name;

		
		
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getRoll_no() {
		return roll_no;
	}

	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}

	public String getAcademic_year() {
		return academic_year;
	}

	public void setAcademic_year(String academic_year) {
		this.academic_year = academic_year;
	}

	public String getReport_to_email() {
		return report_to_email;
	}

	public void setReport_to_email(String report_to_email) {
		this.report_to_email = report_to_email;
	}

	public Date getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getAdmission_no() {
		return admission_no;
	}

	public void setAdmission_no(String admission_no) {
		this.admission_no = admission_no;
	}

	public Integer getStandard_id() {
		return standard_id;
	}

	public void setStandard_id(Integer standard_id) {
		this.standard_id = standard_id;
	}

	public String getStandard_name() {
		return standard_name;
	}

	public void setStandard_name(String standard_name) {
		this.standard_name = standard_name;
	}

	public String getSection_name() {
		return section_name;
	}

	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}
	
	
	
	

}
