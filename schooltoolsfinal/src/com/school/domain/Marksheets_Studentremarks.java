package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="marksheets_studentremarks")

public class Marksheets_Studentremarks implements java.io.Serializable {

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
	
	@Column(name="term_id")
	private int term_id;

	@Column(name="tag_id")
	private int tag_id;
	
	
	@Column(name="remark")
	private String remark;
	
	
	@Column(name="by_principal")
	private String by_principal;
	
	
	@Column(name="by_coordinator")
	private String by_coordinator;
	
	
	@Column(name="by_class_teacher")
	private String by_class_teacher;
	
		
	@Column(name="student_remarks_created_by_id")
	private int student_remarks_created_by_id;

	
	@Column(name="created_on")
	private Date created_on;

	
	@Column(name="student_remarks_updated_by_id")
	private int student_remarks_updated_by_id;

	
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


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getBy_principal() {
		return by_principal;
	}


	public void setBy_principal(String by_principal) {
		this.by_principal = by_principal;
	}


	public String getBy_coordinator() {
		return by_coordinator;
	}


	public void setBy_coordinator(String by_coordinator) {
		this.by_coordinator = by_coordinator;
	}


	public String getBy_class_teacher() {
		return by_class_teacher;
	}


	public void setBy_class_teacher(String by_class_teacher) {
		this.by_class_teacher = by_class_teacher;
	}


	public int getStudent_remarks_created_by_id() {
		return student_remarks_created_by_id;
	}


	public void setStudent_remarks_created_by_id(int student_remarks_created_by_id) {
		this.student_remarks_created_by_id = student_remarks_created_by_id;
	}


	public Date getCreated_on() {
		return created_on;
	}


	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}


	public int getStudent_remarks_updated_by_id() {
		return student_remarks_updated_by_id;
	}


	public void setStudent_remarks_updated_by_id(int student_remarks_updated_by_id) {
		this.student_remarks_updated_by_id = student_remarks_updated_by_id;
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
