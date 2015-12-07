package com.school.dto;

public class HouseinfoDto {
	
	String School;	
	String House;
	String Colour;
	public HouseinfoDto(String School,String House,String Colour) {
		super();
		this.School=School;
		this.House=House;
		this.Colour=Colour;
		

		
		
	}
	public String getSchool() {
		return School;
	}
	public void setSchool(String school) {
		School = school;
	}
	public String getHouse() {
		return House;
	}
	public void setHouse(String house) {
		House = house;
	}
	public String getColour() {
		return Colour;
	}
	public void setColour(String colour) {
		Colour = colour;
	}
	
}
