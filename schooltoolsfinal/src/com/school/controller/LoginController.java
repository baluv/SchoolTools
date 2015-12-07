package com.school.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.school.domain.*;
import com.school.service.SchoolService;

@Controller
@RequestMapping("/school123")
public class LoginController {	
	@Autowired(required = true)
	public SchoolService schoolservice;	
	@RequestMapping(value = "/checklogin1")
	public ModelAndView checklogin1(Map<String, Object> model,HttpSession session,HttpServletRequest req){
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		model.put("standard_id", req.getParameter("standard_id"));
		model.put("dob", req.getParameter("dob"));
		model.put("name", req.getParameter("name"));
		model.put("Rollno", req.getParameter("Rollno"));
		model.put("standard", req.getParameter("standard"));
		System.out.println("name"+req.getParameter("name")+"::dob::"+req.getParameter("dob")+"::rno::"+req.getParameter("Rollno")+"::standard::"+req.getParameter("standard")+"::sid::"+req.getParameter("standard_id"));
		return new ModelAndView("home");
	}

	@RequestMapping(value="/home")
	public String getHome(Map<String, Object> model,HttpServletRequest req){
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		return "home";}	
	@RequestMapping(value="/admission")
	public String getAdmission(Map<String, Object> model,HttpServletRequest req){
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		return "admission";}	
	@RequestMapping(value="/student_admission")
	public String getstudent_admission(Map<String,Object>model,HttpServletRequest req,@ModelAttribute("student_admission")Student_Admission student_admission) throws ParseException{
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));		
		Date date=new Date();
		String dob=req.getParameter("dob1");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		Date dob1 = formatter.parse(dob);
		student_admission.setDob(dob1);
		student_admission.setCreated_on(date);
		student_admission.setLast_modified_on(date);
		student_admission.setDatamode("A");
		student_admission.setDocument_enclosed(" ");
		student_admission.setCreated_by_id(14);
		student_admission.setUpdated_by_id(14);
		int i= schoolservice.addstudent_admission(student_admission);
		return "Success";}
	@RequestMapping(value = "/login")
	public String getLogin(Map<String, Object> model, @ModelAttribute("login")
	Auth_User login){
		return "login";}
	@RequestMapping(value = "/checklogin")
	public String checklogin(Map<String, Object> model,
			@ModelAttribute("login")
	Auth_User login){
		int check = schoolservice.checklogin(login.getUsername(),login.getPassword());
		if(check==1){
			List<String> name=schoolservice.getname(login.getUsername(),login.getPassword());
			model.put("user", name.get(0));
			model.put("username", login.getUsername());
			return "home";
		}else{return "login";}}
	@RequestMapping(value = "/logout")
	public ModelAndView logOut(Map<String, Object> model) {
		model.put("msg", "you have succesfully logged out");
		return new ModelAndView("login");
	}}
