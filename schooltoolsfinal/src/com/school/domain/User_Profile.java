package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="account_userprofile")
public class User_Profile {
	@Id
	@Column(name="id")
	@GeneratedValue
	private Integer id;
	
	@Column(name="user_id")
	private int user_id;
	
	@Column(name="school_id")
	private int school_id;
	
	@Column(name="nationality_id")
	private int nationality_id=1;
	
	@Column(name="gender")
	private String gender;
	
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
	
	@Column(name="mobile")
	private String mobile;
	
	@Column(name="user_profile_created_by_id")
	private int user_profile_created_by_id=1;
	
	@Column(name="created_on")
	private Date created_on;
	
	@Column(name="user_profile_updated_by_id")
	private int user_profile_updated_by_id=1;
	
	@Column(name="last_modified_on")
	private Date last_modified_on;
	
	@Column(name="datamode")
	private String datamode="A";
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getSchool_id() {
		return school_id;
	}

	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}

	public int getNationality_id() {
		return nationality_id;
	}

	public void setNationality_id(int nationality_id) {
		this.nationality_id = nationality_id;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getUser_profile_created_by_id() {
		return user_profile_created_by_id;
	}

	public void setUser_profile_created_by_id(int user_profile_created_by_id) {
		this.user_profile_created_by_id = user_profile_created_by_id;
	}

	public Date getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public int getUser_profile_updated_by_id() {
		return user_profile_updated_by_id;
	}

	public void setUser_profile_updated_by_id(int user_profile_updated_by_id) {
		this.user_profile_updated_by_id = user_profile_updated_by_id;
	}

	public Date getLast_modified_on() {
		return last_modified_on;
	}

	public void setLast_modified_on(Date last_modified_on) {
		
		this.last_modified_on = last_modified_on ;
	}

	public String getDatamode() {
		return datamode;
	}

	public void setDatamode(String datamode) {
		this.datamode =datamode;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
