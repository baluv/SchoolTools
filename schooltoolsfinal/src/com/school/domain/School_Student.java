package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_student")

public class School_Student implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	
	@Column(name="user_id")
	private int user_id;
	
	
	@Column(name="application_no")
	private String application_no;	
	
	@Column(name="admission_no")
	private String admission_no;	
	
	@Column(name="roll_no")
	private String roll_no;	
	
	@Column(name="academic_year")
	private String academic_year;	
	
	@Column(name="standard_id")
	private int standard_id;	
	
	@Column(name="section_id")
	private int section_id;	
	
	@Column(name="schoolhouse_id")
	private int schoolhouse_id;	
	
	@Column(name="student_type")
	private String student_type;	
	
	@Column(name="mode_of_transport")
	private String mode_of_transport;	
		
	@Column(name="date_of_birth")
	private Date date_of_birth;
		
	@Column(name="bloodgroup")
	private String bloodgroup;	
	
	@Column(name="religion")
	private String religion;	
	
	@Column(name="community")
	private String community;	
	
	@Column(name="living_with")
	private String living_with;	
	
	@Column(name="report_to_email")
	private String report_to_email;	
	
	@Column(name="photo")
	private String photo;	
	
	@Column(name="allergic_medicine_food")
	private String allergic_medicine_food;

	@Column(name="student_created_by_id")
	private int student_created_by_id;

	@Column(name="created_on")
	private Date created_on;
	
	@Column(name="student_updated_by_id")
	private int student_updated_by_id;
	
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

	

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getApplication_no() {
		return application_no;
	}

	public void setApplication_no(String application_no) {
		this.application_no = application_no;
	}

	public String getAdmission_no() {
		return admission_no;
	}

	public void setAdmission_no(String admission_no) {
		this.admission_no = admission_no;
	}

	public String getRoll_no() {
		return roll_no;
	}

	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}

	public String getAcademic_year() {
		return academic_year;
	}

	public void setAcademic_year(String academic_year) {
		this.academic_year = academic_year;
	}

	public int getStandard_id() {
		return standard_id;
	}

	public void setStandard_id(int standard_id) {
		this.standard_id = standard_id;
	}

	public int getSection_id() {
		return section_id;
	}

	public void setSection_id(int section_id) {
		this.section_id = section_id;
	}

	public int getSchoolhouse_id() {
		return schoolhouse_id;
	}

	public void setSchoolhouse_id(int schoolhouse_id) {
		this.schoolhouse_id = schoolhouse_id;
	}

	public String getStudent_type() {
		return student_type;
	}

	public void setStudent_type(String student_type) {
		this.student_type = student_type;
	}

	public String getMode_of_transport() {
		return mode_of_transport;
	}

	public void setMode_of_transport(String mode_of_transport) {
		this.mode_of_transport = mode_of_transport;
	}

	public Date getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public String getBloodgroup() {
		return bloodgroup;
	}

	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getCommunity() {
		return community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getLiving_with() {
		return living_with;
	}

	public void setLiving_with(String living_with) {
		this.living_with = living_with;
	}

	public String getReport_to_email() {
		return report_to_email;
	}

	public void setReport_to_email(String report_to_email) {
		this.report_to_email = report_to_email;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAllergic_medicine_food() {
		return allergic_medicine_food;
	}

	public void setAllergic_medicine_food(String allergic_medicine_food) {
		this.allergic_medicine_food = allergic_medicine_food;
	}

	public int getStudent_created_by_id() {
		return student_created_by_id;
	}

	public void setStudent_created_by_id(int student_created_by_id) {
		this.student_created_by_id = student_created_by_id;
	}

	public Date getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public int getStudent_updated_by_id() {
		return student_updated_by_id;
	}

	public void setStudent_updated_by_id(int student_updated_by_id) {
		this.student_updated_by_id = student_updated_by_id;
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
