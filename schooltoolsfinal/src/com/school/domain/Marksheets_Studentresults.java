package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="marksheets_studentresults")

public class Marksheets_Studentresults implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="id")
	private int id;
	
	
	@Column(name="student_id")
	private int student_id;

	@Column(name="standard_id")
	private int standard_id;
	
	@Column(name="result")
	private String result;

	
	@Column(name="student_results_created_by_id")
	private int student_results_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

	
	@Column(name="student_results_updated_by_id")
	private int student_results_updated_by_id;

	
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


	public int getStudent_id() {
		return student_id;
	}


	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}


	public int getStandard_id() {
		return standard_id;
	}


	public void setStandard_id(int standard_id) {
		this.standard_id = standard_id;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public int getStudent_results_created_by_id() {
		return student_results_created_by_id;
	}


	public void setStudent_results_created_by_id(int student_results_created_by_id) {
		this.student_results_created_by_id = student_results_created_by_id;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public int getStudent_results_updated_by_id() {
		return student_results_updated_by_id;
	}


	public void setStudent_results_updated_by_id(int student_results_updated_by_id) {
		this.student_results_updated_by_id = student_results_updated_by_id;
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
