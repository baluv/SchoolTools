package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admission_studentadmission")
public class Student_Admission implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="std_name")
	private String std_name;
	
	@Column(name="name")
	private String name;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="dob")
	private Date dob;
	
	@Column(name="age")
	private int age;
	
	@Column(name="mother_tongue")
	private String mother_tongue;
	
	@Column(name="nationality")
	private String nationality;
	
	@Column(name="religion")
	private String religion;
	
	@Column(name="caste")
	private String caste;
	
	@Column(name="bloodgroup")
	private String bloodgroup;
	
	@Column(name="address1")
	private String address1;
	
	@Column(name="address2")
	private String address2;
	
	@Column(name="address3")
	private String address3;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="mobile")
	private String mobile;
	
	@Column(name="pre_school_name")
	private String pre_school_name;
	
	@Column(name="location")
	private String location;
	
	@Column(name="city")
	private String city;
	
	@Column(name="studying_present_std")
	private String studying_present_std;
	
	@Column(name="second_language")
	private String second_language;
	
	@Column(name="third_language")
	private String third_language;
	
	@Column(name="referred_by")
	private String referred_by;
	
	@Column(name="father_name")
	private String father_name;
	
	@Column(name="fa_qulaification")
	private String fa_qulaification;
	
	@Column(name="fa_occupation")
	private String fa_occupation;
	
	@Column(name="fa_organization")
	private String fa_organization;
	
	@Column(name="fa_off_address1")
	private String fa_off_address1;
	
	@Column(name="fa_off_address2")
	private String fa_off_address2;
	
	@Column(name="fa_off_address3")
	private String fa_off_address3;
	
	@Column(name="fa_phone")
	private String fa_phone;
	
	@Column(name="fa_mobile")
	private String fa_mobile;
	
	@Column(name="fa_email")
	private String fa_email;
	
	@Column(name="mother_name")
	private String mother_name;
	
	@Column(name="mo_qulaification")
	private String mo_qulaification;
	
	@Column(name="mo_occupation")
	private String mo_occupation;
	
	@Column(name="mo_organization")
	private String mo_organization;
	
	@Column(name="mo_off_address1")
	private String mo_off_address1;
	
	@Column(name="mo_off_address2")
	private String mo_off_address2;
	
	@Column(name="mo_off_address3")
	private String mo_off_address3;
	
	@Column(name="mo_phone")
	private String mo_phone;
	
	@Column(name="mo_mobile")
	private String mo_mobile;
	
	@Column(name="mo_email")
	private String mo_email;
	
	@Column(name="father_monthly_income")
	private String father_monthly_income;
	
	@Column(name="mother_monthly_income")
	private String mother_monthly_income;
	
	@Column(name="parent_transfer")
	private String parent_transfer;
	
	@Column(name="transport")
	private String transport;
	
	@Column(name="pickup")
	private String pickup;

	
	@Column(name="app_distance")
	private String app_distance;
	
	@Column(name="document_enclosed")
	private String document_enclosed;
	
	@Column(name="created_by_id")
	private int created_by_id;
	
	@Column(name="updated_by_id")
	private int updated_by_id;
	
	@Column(name="created_on")
	private Date created_on;
	
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

	public String getStd_name() {
		return std_name;
	}

	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMother_tongue() {
		return mother_tongue;
	}

	public void setMother_tongue(String mother_tongue) {
		this.mother_tongue = mother_tongue;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getCaste() {
		return caste;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
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

	public String getPre_school_name() {
		return pre_school_name;
	}

	public void setPre_school_name(String pre_school_name) {
		this.pre_school_name = pre_school_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStudying_present_std() {
		return studying_present_std;
	}

	public void setStudying_present_std(String studying_present_std) {
		this.studying_present_std = studying_present_std;
	}

	public String getSecond_language() {
		return second_language;
	}

	public void setSecond_language(String second_language) {
		this.second_language = second_language;
	}

	public String getThird_language() {
		return third_language;
	}

	public void setThird_language(String third_language) {
		this.third_language = third_language;
	}

	public String getReferred_by() {
		return referred_by;
	}

	public void setReferred_by(String referred_by) {
		this.referred_by = referred_by;
	}

	public String getFather_name() {
		return father_name;
	}

	public void setFather_name(String father_name) {
		this.father_name = father_name;
	}

	public String getFa_qulaification() {
		return fa_qulaification;
	}

	public void setFa_qulaification(String fa_qulaification) {
		this.fa_qulaification = fa_qulaification;
	}

	public String getFa_occupation() {
		return fa_occupation;
	}

	public void setFa_occupation(String fa_occupation) {
		this.fa_occupation = fa_occupation;
	}

	public String getFa_organization() {
		return fa_organization;
	}

	public void setFa_organization(String fa_organization) {
		this.fa_organization = fa_organization;
	}

	public String getFa_off_address1() {
		return fa_off_address1;
	}

	public void setFa_off_address1(String fa_off_address1) {
		this.fa_off_address1 = fa_off_address1;
	}

	public String getFa_off_address2() {
		return fa_off_address2;
	}

	public void setFa_off_address2(String fa_off_address2) {
		this.fa_off_address2 = fa_off_address2;
	}

	public String getFa_off_address3() {
		return fa_off_address3;
	}

	public void setFa_off_address3(String fa_off_address3) {
		this.fa_off_address3 = fa_off_address3;
	}

	public String getFa_phone() {
		return fa_phone;
	}

	public void setFa_phone(String fa_phone) {
		this.fa_phone = fa_phone;
	}

	public String getFa_mobile() {
		return fa_mobile;
	}

	public void setFa_mobile(String fa_mobile) {
		this.fa_mobile = fa_mobile;
	}

	public String getFa_email() {
		return fa_email;
	}

	public void setFa_email(String fa_email) {
		this.fa_email = fa_email;
	}

	public String getMother_name() {
		return mother_name;
	}

	public void setMother_name(String mother_name) {
		this.mother_name = mother_name;
	}

	public String getMo_qulaification() {
		return mo_qulaification;
	}

	public void setMo_qulaification(String mo_qulaification) {
		this.mo_qulaification = mo_qulaification;
	}

	public String getMo_occupation() {
		return mo_occupation;
	}

	public void setMo_occupation(String mo_occupation) {
		this.mo_occupation = mo_occupation;
	}

	public String getMo_organization() {
		return mo_organization;
	}

	public void setMo_organization(String mo_organization) {
		this.mo_organization = mo_organization;
	}

	public String getMo_off_address1() {
		return mo_off_address1;
	}

	public void setMo_off_address1(String mo_off_address1) {
		this.mo_off_address1 = mo_off_address1;
	}

	public String getMo_off_address2() {
		return mo_off_address2;
	}

	public void setMo_off_address2(String mo_off_address2) {
		this.mo_off_address2 = mo_off_address2;
	}

	public String getMo_off_address3() {
		return mo_off_address3;
	}

	public void setMo_off_address3(String mo_off_address3) {
		this.mo_off_address3 = mo_off_address3;
	}

	public String getMo_phone() {
		return mo_phone;
	}

	public void setMo_phone(String mo_phone) {
		this.mo_phone = mo_phone;
	}

	public String getMo_mobile() {
		return mo_mobile;
	}

	public void setMo_mobile(String mo_mobile) {
		this.mo_mobile = mo_mobile;
	}

	public String getMo_email() {
		return mo_email;
	}

	public void setMo_email(String mo_email) {
		this.mo_email = mo_email;
	}

	public String getFather_monthly_income() {
		return father_monthly_income;
	}

	public void setFather_monthly_income(String father_monthly_income) {
		this.father_monthly_income = father_monthly_income;
	}

	public String getMother_monthly_income() {
		return mother_monthly_income;
	}

	public void setMother_monthly_income(String mother_monthly_income) {
		this.mother_monthly_income = mother_monthly_income;
	}

	public String getParent_transfer() {
		return parent_transfer;
	}

	public void setParent_transfer(String parent_transfer) {
		this.parent_transfer = parent_transfer;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	
	public String getApp_distance() {
		return app_distance;
	}

	public void setApp_distance(String app_distance) {
		this.app_distance = app_distance;
	}

	public String getDocument_enclosed() {
		return document_enclosed;
	}

	public void setDocument_enclosed(String document_enclosed) {
		this.document_enclosed = document_enclosed;
	}

	public int getCreated_by_id() {
		return created_by_id;
	}

	public void setCreated_by_id(int created_by_id) {
		this.created_by_id = created_by_id;
	}

	public int getUpdated_by_id() {
		return updated_by_id;
	}

	public void setUpdated_by_id(int updated_by_id) {
		this.updated_by_id = updated_by_id;
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
	
	
	
	

}
