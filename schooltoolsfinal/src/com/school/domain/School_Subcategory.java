package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_subcategory")

public class School_Subcategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	
	@Column(name="subject_id")
	private int subject_id;

	@Column(name="name")
	private String name;

	@Column(name="sub_category_created_by_id")
	private int sub_category_created_by_id;
	
	@Column(name="created_on")
	private Date created_on;
	
	
	@Column(name="sub_category_updated_by_id")
	private int sub_category_updated_by_id;

	
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


	public int getSubject_id() {
		return subject_id;
	}


	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getSub_category_created_by_id() {
		return sub_category_created_by_id;
	}


	public void setSub_category_created_by_id(int sub_category_created_by_id) {
		this.sub_category_created_by_id = sub_category_created_by_id;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public int getSub_category_updated_by_id() {
		return sub_category_updated_by_id;
	}


	public void setSub_category_updated_by_id(int sub_category_updated_by_id) {
		this.sub_category_updated_by_id = sub_category_updated_by_id;
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
