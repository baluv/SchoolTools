package com.school.dto;

import java.util.Date;

public class StudentinfoDto1 {
	String username;
	String student_name;
	String student_lastname;
	String roll_no;
	String academic_year;
	String standard;
	String section;
	String mail;
	
	int standard_id;
	Date dob;
	public StudentinfoDto1(String username,String student_name,String student_lastname,String roll_no,String academic_year,String standard,String section,String mail,int standard_id,Date dob) {
		super();
		this.username=username;
		this.student_name=student_name;
		this.student_lastname=student_lastname;
		this.roll_no=roll_no;
		this.academic_year=academic_year;
		this.standard=standard;
		this.section=section;
		this.mail=mail;	
		this.standard_id=standard_id;
		this.dob=dob;
		
	}
	
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getStudent_lastname() {
		return student_lastname;
	}

	public void setStudent_lastname(String student_lastname) {
		this.student_lastname = student_lastname;
	}

	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
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
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getStandard_id() {
		return standard_id;
	}
	public void setStandard_id(int standard_id) {
		this.standard_id = standard_id;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
}
