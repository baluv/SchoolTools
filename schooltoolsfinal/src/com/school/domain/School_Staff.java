package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_staff")

public class School_Staff implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	
	@Column(name="user_id")
	private int user_id;

	
	@Column(name="employee_code")
	private String employee_code;

	@Column(name="father_name")
	private int father_name;

	
	@Column(name="date_of_birth")
	private Date date_of_birth;
	
	
	@Column(name="date_of_joining")
	private Date date_of_joining;

	
	@Column(name="department_id")
	private int department_id;
	
	@Column(name="designation_id")
	private int designation_id;
	
	
	@Column(name="total_experience")
	private int total_experience;
	
	@Column(name="photo")
	private String photo;
	
	@Column(name="staff_created_by_id")
	private int staff_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

	
	@Column(name="staff_updated_by_id")
	private int staff_updated_by_id;

	
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


	public String getEmployee_code() {
		return employee_code;
	}


	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}


	public int getFather_name() {
		return father_name;
	}


	public void setFather_name(int father_name) {
		this.father_name = father_name;
	}


	public Date getDate_of_birth() {
		return date_of_birth;
	}


	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}


	public Date getDate_of_joining() {
		return date_of_joining;
	}


	public void setDate_of_joining(Date date_of_joining) {
		this.date_of_joining = date_of_joining;
	}


	public int getDepartment_id() {
		return department_id;
	}


	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}


	public int getDesignation_id() {
		return designation_id;
	}


	public void setDesignation_id(int designation_id) {
		this.designation_id = designation_id;
	}


	public int getTotal_experience() {
		return total_experience;
	}


	public void setTotal_experience(int total_experience) {
		this.total_experience = total_experience;
	}


	public String getPhoto() {
		return photo;
	}


	public void setPhoto(String photo) {
		this.photo = photo;
	}


	public int getStaff_created_by_id() {
		return staff_created_by_id;
	}


	public void setStaff_created_by_id(int staff_created_by_id) {
		this.staff_created_by_id = staff_created_by_id;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public int getStaff_updated_by_id() {
		return staff_updated_by_id;
	}


	public void setStaff_updated_by_id(int staff_updated_by_id) {
		this.staff_updated_by_id = staff_updated_by_id;
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
