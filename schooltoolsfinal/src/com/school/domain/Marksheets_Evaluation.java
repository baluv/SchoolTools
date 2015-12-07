package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="marksheets_evaluation")

public class Marksheets_Evaluation implements java.io.Serializable {

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

	
	@Column(name="skills_id")
	private int skills_id;
	
	
	@Column(name="aditional_skill")
	private int aditional_skill;
	
	@Column(name="term_id")
	private int term_id;

	
	@Column(name="grade")
	private String grade;

	
	@Column(name="description")
	private String description;
	
	@Column(name="evaluation_created_by_id")
	private int evaluation_created_by_id;
	
	@Column(name="created_on")
	private Date created_on;
	
	@Column(name="evaluation_updated_by_id")
	private int evaluation_updated_by_id;
	
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

	public int getSkills_id() {
		return skills_id;
	}

	public void setSkills_id(int skills_id) {
		this.skills_id = skills_id;
	}

	public int getAditional_skill() {
		return aditional_skill;
	}

	public void setAditional_skill(int aditional_skill) {
		this.aditional_skill = aditional_skill;
	}

	public int getTerm_id() {
		return term_id;
	}

	public void setTerm_id(int term_id) {
		this.term_id = term_id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getEvaluation_created_by_id() {
		return evaluation_created_by_id;
	}

	public void setEvaluation_created_by_id(int evaluation_created_by_id) {
		this.evaluation_created_by_id = evaluation_created_by_id;
	}

	public Date getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public int getEvaluation_updated_by_id() {
		return evaluation_updated_by_id;
	}

	public void setEvaluation_updated_by_id(int evaluation_updated_by_id) {
		this.evaluation_updated_by_id = evaluation_updated_by_id;
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
