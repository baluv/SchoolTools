package com.school.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.school.domain.School_Student;
import com.school.domain.Student_Admission;
import com.school.domain.User_Profile;

import com.school.domain.Auth_User;
import com.school.dto.StudentinfoDto1;
import com.school.service.SchoolService;




@Controller
@RequestMapping("/school123")
public class StudentController {
	@Autowired(required = true)
	public SchoolService schoolservice;
	
	@RequestMapping(value = "/student_profile")
	public String student_profile(Map<String, Object> model,HttpServletRequest req){		
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));    
		return"student_profile";
	}
	
	
	
	
	@RequestMapping(value = "/deleteStudent")
	public String deleteStudent(@RequestParam("st_user")
	String st_username, Map<String, Object> model,HttpServletRequest req) {

	
		System.out.println(st_username);
		Integer user_id=schoolservice.getUser_id(st_username);
		System.out.println(user_id);
		
		
		
			schoolservice.deleteStudent(user_id);
			
			schoolservice.deleteUser_Profile(user_id);
			
			schoolservice.deleteAuth_User(user_id);
			
			
			
			
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		model.put("user_id", user_id);
		
		
		
      ArrayList<StudentinfoDto1> al=schoolservice.getstudent_info_view();
      
		model.put("list", schoolservice.getstudent_info_view()); 
	
		return "Student_Info_View";
	}	
	@RequestMapping(value = "/save_student_profile")
	public String save_student_profile(Map<String, Object> model, HttpServletRequest req,@ModelAttribute("au")Auth_User au,@ModelAttribute("ss")School_Student ss,@ModelAttribute("up")User_Profile up) throws ParseException{
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
	    String dob=req.getParameter("dob");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dob1;
		try{
		int auid=Integer.parseInt(req.getParameter("auid"));
		au.setId(auid);
		int ssid=Integer.parseInt(req.getParameter("ssid"));
		ss.setId(ssid);
		int upid=Integer.parseInt(req.getParameter("upid"));
		up.setId(upid);
		}catch(NumberFormatException ne){
			au.setId(au.getId());
			ss.setId(ss.getId());
			up.setId(up.getId());
		}
		
		try{
			dob1 = formatter.parse(dob);
			}catch(ParseException pe){
				model.put("msg", "Check the Date formate");
				model.put("user", req.getParameter("user"));
				model.put("username", req.getParameter("username"));    
				return "student_profile";
				
			}
						
			au.setIs_staff(1);
			au.setIs_active(1);
			au.setIs_superuser(1);
			Date date=new Date();
			au.setLast_login(date);
			au.setDate_joined(date);
			int user_id;
			try{
			schoolservice.saveUser(au);
			user_id=schoolservice.getUser_id(req.getParameter("username"));
			}
			catch(Exception e){
				e.printStackTrace();
				model.put("msg", "User name already exist or Check the Date formate");
				model.put("user", req.getParameter("user"));
				model.put("username", req.getParameter("username"));    
				return"student_profile";
			}
			//System.out.println(req.getParameter("section")+"***"+ss.getStandard_id());
			int section_id=schoolservice.getSection_id(req.getParameter("section"), ss.getStandard_id());
			ss.setSection_id(section_id);
			ss.setUser_id(user_id);
			ss.setDate_of_birth(dob1);
			ss.setCreated_on(date);
			ss.setLast_modified_on(date);
			ss.setDatamode("A");
			ss.setStudent_created_by_id(14);
			ss.setStudent_updated_by_id(14);
			ss.setPhoto(" ");
			try{
			schoolservice.save_student(ss);
			}
			catch(Exception e){
				e.printStackTrace();
				model.put("user", req.getParameter("user"));
				model.put("username", req.getParameter("username"));    
				return"student_profile";
			}
			
			String school_id=req.getParameter("school");
			
			if(school_id.equals("1")){
				//System.out.println(school_id+"%%%%%%");
				up.setSchool_id(1);
			}else up.setSchool_id(2);
			up.setState_id(1);
			up.setCountry_id(1);
			up.setCreated_on(date);
			up.setLast_modified_on(date);
			up.setUser_id(user_id);
			schoolservice.saveUser_profile(up);
			
			ArrayList<StudentinfoDto1> al=schoolservice.getstudent_info_view();
			model.put("list", schoolservice.getstudent_info_view());
			return "Student_Info_View";
	

		
	}
}
