package com.school.dto;

public class SubcatinfoDto {

	String subcat;
	String maincat;	
	public SubcatinfoDto(String subcat,String maincat) {
		super();
		this.subcat=subcat;
		this.maincat=maincat;
		

		
		
	}
	public String getSubcat() {
		return subcat;
	}
	public void setSubcat(String subcat) {
		this.subcat = subcat;
	}
	public String getMaincat() {
		return maincat;
	}
	public void setMaincat(String maincat) {
		this.maincat = maincat;
	}
	
}
