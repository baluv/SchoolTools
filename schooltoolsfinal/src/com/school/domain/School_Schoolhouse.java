package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_schoolhouse")

public class School_Schoolhouse implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	
	@Column(name="school_id")
	private int school_id;

	
	@Column(name="name")
	private String name;

	
	@Column(name="colour")
	private String colour;

	@Column(name="school_house_created_by_id")
	private int school_house_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

	
	@Column(name="school_house_updated_by_id")
	private int school_house_updated_by_id;

	
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


	public int getSchool_id() {
		return school_id;
	}


	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getColour() {
		return colour;
	}


	public void setColour(String colour) {
		this.colour = colour;
	}


	public int getSchool_house_created_by_id() {
		return school_house_created_by_id;
	}


	public void setSchool_house_created_by_id(int school_house_created_by_id) {
		this.school_house_created_by_id = school_house_created_by_id;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public int getSchool_house_updated_by_id() {
		return school_house_updated_by_id;
	}


	public void setSchool_house_updated_by_id(int school_house_updated_by_id) {
		this.school_house_updated_by_id = school_house_updated_by_id;
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
