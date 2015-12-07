package com.school.dto;

public class SectioninfoDto {

	String School;
	String Standard;
	String Section;
	public SectioninfoDto(String School,String Standard,String Section) {
		super();
		this.School=School;
		this.Standard=Standard;
		this.Section=Section;
		

		
		
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
	public String getSection() {
		return Section;
	}
	public void setSection(String section) {
		Section = section;
	}


}
