package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="marksheets_assessments")

public class Marksheets_Assessments implements java.io.Serializable {

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

	
	@Column(name="subject_id")
	private int subject_id;

	
	@Column(name="term_id")
	private int term_id;

	
	@Column(name="tag_id")
	private int tag_id;

	
	@Column(name="grade_id")
	private int grade_id;

	
	@Column(name="notes")
	private String notes;
	
	@Column(name="assessments_created_by_id")
	private int assessments_created_by_id;
	
	@Column(name="created_on")
	private Date created_on;
	
	@Column(name="assessments_updated_by_id")
	private int assessments_updated_by_id;
	
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

	public int getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}

	public int getTerm_id() {
		return term_id;
	}

	public void setTerm_id(int term_id) {
		this.term_id = term_id;
	}

	public int getTag_id() {
		return tag_id;
	}

	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}

	public int getGrade_id() {
		return grade_id;
	}

	public void setGrade_id(int grade_id) {
		this.grade_id = grade_id;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getAssessments_created_by_id() {
		return assessments_created_by_id;
	}

	public void setAssessments_created_by_id(int assessments_created_by_id) {
		this.assessments_created_by_id = assessments_created_by_id;
	}

	public Date getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public int getAssessments_updated_by_id() {
		return assessments_updated_by_id;
	}

	public void setAssessments_updated_by_id(int assessments_updated_by_id) {
		this.assessments_updated_by_id = assessments_updated_by_id;
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
