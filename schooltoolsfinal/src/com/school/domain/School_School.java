package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_school")

public class School_School implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="established_year")
	private Date established_year;

	
	@Column(name="affiliation_id")
	private int affiliation_id;

	
	@Column(name="affiliation_renewal_date")
	private Date affiliation_renewal_date;

	
	@Column(name="license_number")
	private String license_number;
	
	
	@Column(name="address1")
	private String address1;
	
	
	@Column(name="address2")
	private String address2;
	
	
	@Column(name="address3")
	private String address3;
	
	@Column(name="address4")
	private String address4;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state_id")
	private int state_id;
	
	@Column(name="country_id")
	private int country_id;
	
	@Column(name="zip_code")
	private String zip_code;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="fax")
	private String fax;
	
	@Column(name="e_mail")
	private String e_mail;
	
	@Column(name="website")
	private String website;
	
	@Column(name="emblem")
	private String emblem;
	
	@Column(name="school_created_by_id")
	private int school_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

		
	@Column(name="school_updated_by_id")
	private int school_updated_by_id;

	
	@Column(name="last_modified_on")
	private Date last_modified_on;

	
	@Column(name="datamode")
	private String datamode;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public Date getLast_modified_on() {
		return last_modified_on;
	}


	public void setLast_modified_on(Date last_modified_on) {
		this.last_modified_on = last_modified_on;
	}


	public String getDatamode() {
		return datamode;
	}


	public void setDatamode(String datamode) {
		this.datamode = datamode;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}


	public Date getEstablished_year() {
		return established_year;
	}


	public void setEstablished_year(Date established_year) {
		this.established_year = established_year;
	}


	public int getAffiliation_id() {
		return affiliation_id;
	}


	public void setAffiliation_id(int affiliation_id) {
		this.affiliation_id = affiliation_id;
	}


	public Date getAffiliation_renewal_date() {
		return affiliation_renewal_date;
	}


	public void setAffiliation_renewal_date(Date affiliation_renewal_date) {
		this.affiliation_renewal_date = affiliation_renewal_date;
	}


	public String getLicense_number() {
		return license_number;
	}


	public void setLicense_number(String license_number) {
		this.license_number = license_number;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getAddress3() {
		return address3;
	}


	public void setAddress3(String address3) {
		this.address3 = address3;
	}


	public String getAddress4() {
		return address4;
	}


	public void setAddress4(String address4) {
		this.address4 = address4;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public int getState_id() {
		return state_id;
	}


	public void setState_id(int state_id) {
		this.state_id = state_id;
	}


	public int getCountry_id() {
		return country_id;
	}


	public void setCountry_id(int country_id) {
		this.country_id = country_id;
	}


	public String getZip_code() {
		return zip_code;
	}


	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getFax() {
		return fax;
	}


	public void setFax(String fax) {
		this.fax = fax;
	}


	public String getE_mail() {
		return e_mail;
	}


	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}


	public String getWebsite() {
		return website;
	}


	public void setWebsite(String website) {
		this.website = website;
	}


	public String getEmblem() {
		return emblem;
	}


	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}


	public int getSchool_created_by_id() {
		return school_created_by_id;
	}


	public void setSchool_created_by_id(int school_created_by_id) {
		this.school_created_by_id = school_created_by_id;
	}


	public int getSchool_updated_by_id() {
		return school_updated_by_id;
	}


	public void setSchool_updated_by_id(int school_updated_by_id) {
		this.school_updated_by_id = school_updated_by_id;
	}



}
