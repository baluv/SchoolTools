package com.school.dto;

public class promotioninfoDto {

	String student_name;
	String roll_no;
	int student_id;
	public promotioninfoDto(String student_name,String roll_no,int student_id) {
		super();
		this.student_name=student_name;
		this.roll_no=roll_no;
		this.student_id=student_id;
			
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
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	
}
