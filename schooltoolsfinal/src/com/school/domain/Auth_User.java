package com.school.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="auth_user")

public class Auth_User implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="username")
	private String username;

	@Column(name="first_name")
	private String first_name;

	@Column(name="last_name")
	private String last_name;

	@Column(name="email")
	private String email;

	@Column(name="password")
	private String password;

	@Column(name="is_staff")
	private int is_staff;

	
	@Column(name="is_active")
	private int is_active;

	@Column(name="is_superuser")
	private int is_superuser;
	
	@Column(name="last_login")
	private Date last_login;
	
	@Column(name="date_joined")
	private Date date_joined;
	
	
	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirst_name() {
		return first_name;
	}


	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}


	public String getLast_name() {
		return last_name;
	}


	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getIs_staff() {
		return is_staff;
	}


	public void setIs_staff(int is_staff) {
		this.is_staff = is_staff;
	}


	public int getIs_active() {
		return is_active;
	}


	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}


	public int getIs_superuser() {
		return is_superuser;
	}


	public void setIs_superuser(int is_superuser) {
		this.is_superuser = is_superuser;
	}


	public Date getLast_login() {
		return last_login;
	}


	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}


	public Date getDate_joined() {
		return date_joined;
	}


	public void setDate_joined(Date date_joined) {
		this.date_joined = date_joined;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}


	
	

}
