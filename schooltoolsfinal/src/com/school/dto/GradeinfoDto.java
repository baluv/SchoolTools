package com.school.dto;


public class GradeinfoDto {

	String Grade;
	String Standard;
	String mark_range;
	String grade_point;
	String school;
	String description;
	public GradeinfoDto(String Grade,String Standard,String mark_range,String grade_point,String school,String description) {
		super();
		this.Grade=Grade;
		this.Standard=Standard;
		this.mark_range = mark_range;
		this.grade_point = grade_point;
		this.school=school;
		this.description=description;	
		
	}
	public String getGrade() {
		return Grade;
	}
	public void setGrade(String grade) {
		Grade = grade;
	}
	public String getStandard() {
		return Standard;
	}
	public void setStandard(String standard) {
		Standard = standard;
	}
	public String getMark_range() {
		return mark_range;
	}
	public void setMark_range(String mark_range) {
		this.mark_range = mark_range;
	}
	public String getGrade_point() {
		return grade_point;
	}
	public void setGrade_point(String grade_point) {
		this.grade_point = grade_point;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	
}
