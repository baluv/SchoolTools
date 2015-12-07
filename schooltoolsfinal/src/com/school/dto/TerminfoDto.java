package com.school.dto;

public class TerminfoDto {

	String Term;
	String School;	
	String Standard;
	public TerminfoDto(String Term,String School,String Standard) {
		super();
		this.Term=Term;
		this.School=School;
		this.Standard=Standard;	
		
	}
	public String getTerm() {
		return Term;
	}
	public void setTerm(String term) {
		Term = term;
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
