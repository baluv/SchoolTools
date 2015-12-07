package com.school.dto;

public class StandardinfoDto {

	String School;
	String Standard;	
	public StandardinfoDto(String School,String Standard) {
		super();
		this.School=School;
		this.Standard=Standard;
		

		
		
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	public String getStandard() {
		return Standard;
	}
	public void setStandard(String standard) {
		Standard = standard;
	}
	
}
