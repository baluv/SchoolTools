package com.school.dto;

public class MaincatinfoDto {

	String maincat;
	String School;	
	String Standard;	
	String type;	
	public MaincatinfoDto(String maincat,String School,String Standard,String type) {
		super();
		this.maincat=maincat;
		this.School=School;
		this.Standard=Standard;
		this.type=type;		
		
	}
	public String getMaincat() {
		return maincat;
	}
	public void setMaincat(String maincat) {
		this.maincat = maincat;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

}
