package com.school.controller;

import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.school.dto.*;
import com.school.domain.*;
import com.school.service.SchoolService;

@Controller
@RequestMapping("/school123")
public class InfoController {
	
	@Autowired(required = true)
	public SchoolService schoolservice;
	
	@RequestMapping(value = "/result")
	public ModelAndView result(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		return new ModelAndView("result");
	}
	@RequestMapping(value = "/result_entry")
	public ModelAndView result_entry(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		int standard=Integer.parseInt(req.getParameter("standards"));
		List<promotioninfoDto> al=schoolservice.getpromotionlist(standard);
		model.put("list", schoolservice.getpromotionlist(standard));
		return new ModelAndView("result_entry");
	}
	@RequestMapping(value = "/result_promote")
	public ModelAndView result_promote(Map<String, Object> model,HttpServletRequest req,HttpSession session) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		String check[]=req.getParameterValues("check");
		
		String to_standard=req.getParameter("standards1");
		System.out.println(to_standard);
		try{
		String name[]=new String[check.length];String roll_no[]=new String[check.length];
		for(int i=0;i<check.length;i++){
			System.out.println(check[i]);
			int r=schoolservice.updatepromotionlist(check[i],to_standard,"2015-2016");
			List<promotioninfoDto> al=schoolservice.getpromotedlist(Integer.parseInt(check[i]));
			name[i]=al.get(0).getStudent_name();
			roll_no[i]=al.get(0).getRoll_no();
		}
		List<String> standard=schoolservice.getsid(Integer.parseInt(to_standard));
		if(standard.isEmpty()){session.setAttribute("standard", "I");}else{session.setAttribute("standard", standard.get(0));}
		session.setAttribute("name", name);
		session.setAttribute("roll_no", roll_no);
		}catch(NullPointerException ne){
			System.out.println("check is empty");
		}
		return new ModelAndView("result_report");
	}
	@RequestMapping(value = "/student_history")
	public ModelAndView student_history(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		model.put("standard_id", req.getParameter("standard_id"));
		model.put("dob", req.getParameter("dob"));
		model.put("name", req.getParameter("name"));
		model.put("Rollno", req.getParameter("Rollno"));
		model.put("standard", req.getParameter("standard"));
		return new ModelAndView("history");
	}	
	
	@RequestMapping(value = "/student_edit")
	public ModelAndView student_edit(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		String username=req.getParameter("username");
		String user=req.getParameter("user");
		String st_user=req.getParameter("st_user");
		System.out.println(st_user);
		Integer user_id=schoolservice.getUser_id(st_user);
		Auth_User au=schoolservice.getAuth_User(user_id);
		School_Student ss=schoolservice.getStudentInfo(user_id);
		User_Profile up= schoolservice.getUserProfile(user_id);
		int section=0;
		String sec=null;
		section=ss.getSection_id();
		int standard=ss.getStandard_id();
		System.out.println(section+"&&&&&&&&&&&"+standard+"&&&&&&&&&&&&&");
		String section_name=null;
		String std_name=null;
		try{
		section_name=schoolservice.getSectionName(section,standard);
		}catch(IndexOutOfBoundsException e){
			System.out.println("Error");
		}
		try{
			std_name=schoolservice.getStd_Name(standard);
				
		}catch(IndexOutOfBoundsException ie){
			System.out.println("Error");
		}
		String school_name="AECS MAGNOLIA MAARUTI PUBLIC SCHOOL";
		try{
		if(up.getSchool_id()==1){
			school_name="AECS MAGNOLIA MAARUTI PUBLIC SCHOOL";
		}else{
			school_name="AECS MAARUTI PU COLLEGE";
		}
		}catch(NullPointerException e){
			e.printStackTrace();
		}

		model.put("au", au);
		model.put("ss", ss);
		model.put("up", up);
		model.put("std_sect", section_name);
		model.put("std_name", std_name);
		model.put("school_name", school_name);
				
		return new ModelAndView("student_profile");
	}
	
	@RequestMapping(value = "/student_info_view")
	public ModelAndView Student_info_view(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<StudentinfoDto1> al=schoolservice.getstudent_info_view();
		model.put("list", schoolservice.getstudent_info_view());
		return new ModelAndView("Student_Info_View");
	}	
	@RequestMapping(value = "/School_info")
	public ModelAndView School_info(Map<String, Object> model,HttpServletRequest req) {
		System.out.println(req.getParameter("user")+req.getParameter("username"));
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<School_School> al=schoolservice.getSchool_info();
		model.put("list", schoolservice.getSchool_info());
		return new ModelAndView("School_Info");
	}
	
	@RequestMapping(value = "/Standard_info")
	public ModelAndView Standard_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));		
		ArrayList<StandardinfoDto> al=schoolservice.getStandard_info();
		model.put("list", schoolservice.getStandard_info());
		return new ModelAndView("Standard_Info");
	}
	@RequestMapping(value = "/Section_info")
	public ModelAndView Section_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));		
		ArrayList<SectioninfoDto> al=schoolservice.getSection_info();
		model.put("list", schoolservice.getSection_info());
		return new ModelAndView("Section_Info");
	}
	@RequestMapping(value = "/House_info")
	public ModelAndView House_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));		
		ArrayList<HouseinfoDto> al=schoolservice.getHouse_info();
		model.put("list", schoolservice.getHouse_info());
		return new ModelAndView("House_Info");
	}
	@RequestMapping(value = "/Department_info")
	public ModelAndView Department_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<DepartmentinfoDto> al=schoolservice.getDepartment_info();
		model.put("list", schoolservice.getDepartment_info());
		return new ModelAndView("Department_Info");
	}
	@RequestMapping(value = "/Designation_info")
	public ModelAndView Designation_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));		
		ArrayList<DesignationinfoDto> al=schoolservice.getDesignation_info();
		model.put("list", schoolservice.getDesignation_info());
		return new ModelAndView("Designation_Info");
	}
	@RequestMapping(value = "/Term_info")
	public ModelAndView Term_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<TerminfoDto> al=schoolservice.getTerm_info();
		model.put("list", schoolservice.getTerm_info());
		return new ModelAndView("Term_Info");
	}
	@RequestMapping(value = "/Tag_info")
	public ModelAndView Tag_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<TaginfoDto> al=schoolservice.getTag_info();
		model.put("list", schoolservice.getTag_info());
		return new ModelAndView("Tag_Info");
	}
	@RequestMapping(value = "/Grade_info")
	public ModelAndView Grade_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<GradeinfoDto> al=schoolservice.getGrade_info();
		model.put("list", schoolservice.getGrade_info());
		return new ModelAndView("Grade_Info");
	}
	@RequestMapping(value = "/Main_category_info")
	public ModelAndView Main_category_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<MaincatinfoDto> al=schoolservice.getMain_category_info();
		model.put("list", schoolservice.getMain_category_info());
		return new ModelAndView("Main_category_Info");
	}
	@RequestMapping(value = "/Sub_category_info")
	public ModelAndView Sub_category_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<SubcatinfoDto> al=schoolservice.getSub_category_info();
		model.put("list", schoolservice.getSub_category_info());
		return new ModelAndView("Sub_category_Info");
	}
	@RequestMapping(value = "/category_info")
	public ModelAndView category_info(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		String standard=req.getParameter("standrd");
		ArrayList<SubcatinfoDto> al=schoolservice.getcategory_info(standard);
		model.put("list", schoolservice.getSub_category_info());
		return new ModelAndView("Sub_category_Info");
	}
	
	@RequestMapping(value = "/admission_view")
	public ModelAndView Admission_view(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<Student_Admission> al=schoolservice.getadmission_info_view();
		model.put("list", schoolservice.getadmission_info_view());
		return new ModelAndView("Admission_Info_View");
	}
	@RequestMapping(value = "/tag_update")
	public ModelAndView tag(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		String tag=req.getParameter("tag");
		ArrayList<School_Tag> al=schoolservice.tag_update(tag);
		model.put("list", schoolservice.getTag_info());
		return new ModelAndView("Tag_Info");
	}
	@RequestMapping(value = "/staff_view")
	public ModelAndView Staff_view(Map<String, Object> model,HttpServletRequest req) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		ArrayList<StaffinfoDto> al=schoolservice.getstaff_info_view();
		model.put("list", schoolservice.getstaff_info_view());
		return new ModelAndView("Staff_Info");
	}


	}
