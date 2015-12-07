package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="school_term")

public class School_Term implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	
	@Column(name="school_id")
	private int school_id;
	
	
	@Column(name="standard_id")
	private int standard_id;
	
	@Column(name="name")
	private String name;

	
	@Column(name="term_created_by_id")
	private int term_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

	
	@Column(name="term_updated_by_id")
	private int term_updated_by_id;

	
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


	public int getStandard_id() {
		return standard_id;
	}


	public void setStandard_id(int standard_id) {
		this.standard_id = standard_id;
	}


	public int getTerm_created_by_id() {
		return term_created_by_id;
	}


	public void setTerm_created_by_id(int term_created_by_id) {
		this.term_created_by_id = term_created_by_id;
	}


	public int getTerm_updated_by_id() {
		return term_updated_by_id;
	}


	public void setTerm_updated_by_id(int term_updated_by_id) {
		this.term_updated_by_id = term_updated_by_id;
	}

	
	

		

}
