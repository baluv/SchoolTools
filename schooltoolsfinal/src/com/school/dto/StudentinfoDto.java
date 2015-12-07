package com.school.dto;

public class StudentinfoDto {

	String student_name;
	String roll_no;
	String academic_year;
	String standard;
	String section;
	String mail;
	public StudentinfoDto(String student_name,String roll_no,String academic_year,String standard,String section,String mail) {
		super();
		this.student_name=student_name;
		this.roll_no=roll_no;
		this.academic_year=academic_year;
		this.standard=standard;
		this.section=section;
		this.mail=mail;	
		
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
	
}
