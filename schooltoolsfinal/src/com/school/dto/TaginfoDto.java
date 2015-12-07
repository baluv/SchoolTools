package com.school.dto;

public class TaginfoDto {

	String tag;
	String School;	
	String Standard;
	String Term;	
	public TaginfoDto(String tag,String School,String Standard,String Term) {
		super();
		this.tag=tag;
		this.School=School;
		this.Standard=Standard;
		this.Term=Term;
		

		
		
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	public String getTerm() {
		return Term;
	}
	public void setTerm(String term) {
		Term = term;
	}
	
}
