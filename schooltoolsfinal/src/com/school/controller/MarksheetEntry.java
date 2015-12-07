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
import org.springframework.web.servlet.ModelAndView;

import com.school.domain.*;
import com.school.service.SchoolService;

@Controller
@RequestMapping("/school123")
public class MarksheetEntry {	
	@Autowired(required = true)
	public SchoolService schoolservice;	
	
	@RequestMapping(value = "/entrymarksheet1")
	public ModelAndView entrymarksheet1(Map<String, Object> model,HttpServletRequest req,HttpSession session) {
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		int standard_Id=(Integer)session.getAttribute("standard_Id");
		//String name=(String) session.getAttribute("name");
		String rno=req.getParameter("student_id");
		List<String> standard=schoolservice.getsid(standard_Id);
		String sname=req.getParameter("sname");
		System.out.println(sname+">>>>>>>>>>>>>>*********************");
		//String rno=(String) session.getAttribute("rollNumber");
		List<Integer> sid=schoolservice.getsid(standard_Id,rno,sname);
		//System.out.println(standard_Id+" "+rno+" "+sname+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		int rollno=sid.get(0);
		List<String> date_of_birth=schoolservice.getdob(rollno);
		model.put("date_of_birth", date_of_birth.get(0));
		model.put("standard_id", standard_Id);
		model.put("standard_name", standard.get(0));
		model.put("name", sname);
		model.put("roll_no", rno);
		////System.out.println("name::"+sname+"::standard_id::"+standard_Id+"::rollno::"+rno);
		////System.out.println("1st::"+rollno);
		
			Date date = new Date();int c=1;
			
			int term1=Integer.parseInt(req.getParameter("term1"));
			int term2=Integer.parseInt(req.getParameter("term2"));
			if(standard_Id==13 || standard_Id==14 || standard_Id==12 || standard_Id==16){
				List<Marksheets_Evaluation> ma1=schoolservice.getmarksheets_evaluationgrade(standard_Id,rollno,term1);				
				if(ma1.isEmpty()){c=2;}
				String grade1[]=req.getParameterValues("grade_1");
				String grade2[]=req.getParameterValues("grade_2");
				String remark1[]=req.getParameterValues("remark_1");
				String remark2[]=req.getParameterValues("remark_2");
				String skill[]=req.getParameterValues("skill_id");
				String sub[]=req.getParameterValues("subject_id");
				Marksheets_Evaluation me=new Marksheets_Evaluation();		
				me.setStudent_id(rollno);
				me.setStandard_id(standard_Id);
				me.setAditional_skill(0);
				me.setTerm_id(term1);
				me.setEvaluation_created_by_id(17);
				me.setCreated_on(date);
				me.setEvaluation_updated_by_id(17);
				me.setLast_modified_on(date);
				me.setDatamode("A");
				int k=0;
				for(int i=0;i<remark1.length;i++)
				{
				int subject_id=Integer.parseInt(sub[i]);
				int skills_id=Integer.parseInt(skill[i]);				
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				me.setTerm_id(term1);
				me.setGrade(grade1[i]);
				me.setDescription(remark1[i]);
				schoolservice.insertmarksheets_evolution(me,c);
				me.setTerm_id(term2);
				me.setGrade(grade2[i]);
				me.setDescription(remark2[i]);
				schoolservice.insertmarksheets_evolution(me,c);
				k++;}
				for(int i=k;i<grade1.length;i++)
				{
					me.setTerm_id(term1);
					me.setGrade(grade1[i]);
					me.setDescription(" ");
					schoolservice.insertmarksheets_evolution(me,c);
					me.setTerm_id(term2);
					me.setGrade(grade2[i]);
					me.setDescription(" ");
					schoolservice.insertmarksheets_evolution(me,c);
				}
				for(int i=k;i<remark1.length;i++)
				{
					me.setTerm_id(term1);
					me.setGrade(" ");
					me.setDescription(remark1[i]);
					schoolservice.insertmarksheets_evolution(me,c);
					me.setTerm_id(term2);
					me.setGrade(" ");
					me.setDescription(remark2[i]);
					schoolservice.insertmarksheets_evolution(me,c);
				}	
			}else{			
			int term3=Integer.parseInt(req.getParameter("term3"));
			int term4=Integer.parseInt(req.getParameter("term4"));
			int term5=Integer.parseInt(req.getParameter("term5"));
			int term6=Integer.parseInt(req.getParameter("term6"));
			String s[]=req.getParameterValues("subject_id");
			List<String> ma1=schoolservice.getmarksheets_assessmentsgrade(standard_Id,rollno,term1);
			
			if(ma1.isEmpty()){c=2;}
			String a1[]=req.getParameterValues("assessment_1_1");
			String a2[]=req.getParameterValues("assessment_1_2");
			String a3[]=req.getParameterValues("assessment_1_3");
			String a4[]=req.getParameterValues("assessment_1_4");
			String a5[]=req.getParameterValues("assessment_1_5");
			String a6[]=req.getParameterValues("assessment_1_6");
			String a7[]=req.getParameterValues("assessment_1_7");
			String a8[]=req.getParameterValues("assessment_1_8");
			String a9[]=req.getParameterValues("assessment_1_9");
			String a10[]=req.getParameterValues("assessment_1_10");
			String a11[]=req.getParameterValues("assessment_1_11");
			Marksheets_Assessments ma=new Marksheets_Assessments();
			List<School_Tag> tag=schoolservice.getschool_tag(standard_Id);
			for(int i=0;i<a1.length;i++){				
				int subject_id=Integer.parseInt(s[i]);			
				ma.setStudent_id(rollno);
				ma.setStandard_id(standard_Id);
				ma.setSubject_id(subject_id);
				ma.setAssessments_created_by_id(17);
				ma.setCreated_on(date);
				ma.setAssessments_updated_by_id(17);
				ma.setLast_modified_on(date);
				ma.setDatamode("A");
				ma.setTerm_id(term1);
				ma.setTag_id(tag.get(0).getId());
				ma.setNotes(a1[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(1).getId());
				ma.setTerm_id(term2);
				ma.setNotes(a2[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(2).getId());
				ma.setTerm_id(term3);
				ma.setNotes(a3[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(3).getId());
				ma.setNotes(a4[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(4).getId());
				ma.setNotes(a5[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(5).getId());
				ma.setTerm_id(term4);
				ma.setNotes(a6[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(6).getId());
				ma.setTerm_id(term5);
				ma.setNotes(a7[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTerm_id(term6);
				ma.setTag_id(tag.get(7).getId());
				ma.setNotes(a8[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(8).getId());
				ma.setNotes(a9[i]);
				schoolservice.insertmarksheets_assessment(ma,c);
				ma.setTag_id(tag.get(9).getId());
				ma.setNotes(a10[i]);
				schoolservice.insertmarksheets_assessment(ma,c);				
			}
			for(int i=0;i<a11.length;i++){
				int subject_id=Integer.parseInt(s[6]);
				if(i==0){ma.setTerm_id(term1);}else if(i==1){ma.setTerm_id(term2);}else if(i<5 && i>1){ma.setTerm_id(term3);}
				else if(i==5){ma.setTerm_id(term4);}else if(i==6){ma.setTerm_id(term5);}else{ma.setTerm_id(term6);}				
				ma.setSubject_id(subject_id);
				ma.setTag_id(tag.get(i).getId());
				ma.setNotes(" ");
				int grade_id11=Integer.parseInt(a11[i]);
				ma.setGrade_id(grade_id11);
				schoolservice.insertmarksheets_assessment(ma,c);
			}
			//storing into marksheets_evolution term1
			Marksheets_Evaluation me=new Marksheets_Evaluation();		
			me.setStudent_id(rollno);
			me.setStandard_id(standard_Id);
			me.setAditional_skill(0);
			me.setTerm_id(term1);
			me.setEvaluation_created_by_id(17);
			me.setCreated_on(date);
			me.setEvaluation_updated_by_id(17);
			me.setLast_modified_on(date);
			me.setDatamode("A");
			String skill[]=req.getParameterValues("skill_id");
			String sub[]=req.getParameterValues("sub_id");
			String grade1[]=req.getParameterValues("grade_1");
			String grade2[]=req.getParameterValues("grade_2");
			String att1[]=req.getParameterValues("attendance_1");
			String att2[]=req.getParameterValues("attendance_2");
			int j=0;
			for(int i=0;i<grade1.length;i++){
				int subject_id=Integer.parseInt(sub[i]);
				int skills_id=Integer.parseInt(skill[i]);
				me.setSubject_id(subject_id);
				me.setTerm_id(term1);
				me.setSkills_id(skills_id);
				me.setGrade(grade1[i]);
				schoolservice.insertmarksheets_evolution(me,c);
				me.setTerm_id(term2);
				me.setGrade(grade2[i]);
				schoolservice.insertmarksheets_evolution(me,c);
				j++;
			}
			for(int i=0;i<att1.length;i++){
				int subject_id=Integer.parseInt(sub[j]);
				int skills_id=Integer.parseInt(skill[j]);
				me.setSubject_id(subject_id);
				me.setTerm_id(term1);
				me.setSkills_id(skills_id);
				me.setGrade(att1[i]);
				me.setDescription(" ");
				schoolservice.insertmarksheets_evolution(me,c);
				
				j++;
			}
			int k=j-2;
			for(int i=0;i<att2.length;i++){
				int subject_id=Integer.parseInt(sub[k]);
				int skills_id=Integer.parseInt(skill[k]);
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				me.setTerm_id(term2);
				me.setDescription(" ");
				me.setGrade(att2[i]);
				schoolservice.insertmarksheets_evolution(me,c);			
				k++;
			}}		
			Marksheets_Studentresults ms=new Marksheets_Studentresults();
			ms.setStudent_id(rollno);
			ms.setStandard_id(standard_Id);
			ms.setResult(req.getParameter("result"));
			ms.setStudent_results_created_by_id(17);
			ms.setCreated_on(date);
			ms.setStudent_results_updated_by_id(17);
			ms.setLast_modified_on(date);
			ms.setDatamode("A");
			schoolservice.insertmarksheets_studentresults(ms,c);			
			Marksheets_Studentremarks mr=new Marksheets_Studentremarks();
			mr.setStudent_id(rollno);
			mr.setStandard_id(standard_Id);
			System.out.println(standard_Id+"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+rollno);
			mr.setTerm_id(term1);
			if(standard_Id==13 || standard_Id==14 || standard_Id==12 || standard_Id==16){
				mr.setRemark(req.getParameter("remark_3"));
			}else{
			mr.setRemark(req.getParameter("remark_1"));
			}
			mr.setBy_class_teacher(req.getParameter("classteacher_1"));
			mr.setBy_coordinator(req.getParameter("coordinator_1"));
			mr.setBy_principal(req.getParameter("principal_1"));
			mr.setStudent_remarks_created_by_id(17);
			mr.setCreated_on(date);
			mr.setStudent_remarks_updated_by_id(17);
			mr.setLast_modified_on(date);
			mr.setDatamode("A");
			schoolservice.insertmarksheets_studentremarks(mr,c);
			mr.setTerm_id(term2);
			if(standard_Id==13 || standard_Id==14 || standard_Id==12 || standard_Id==16){
				//System.out.println("**************"+req.getParameter("remark_4"));
				mr.setRemark(req.getParameter("remark_4"));
			}else{
				mr.setRemark(req.getParameter("remark_2"));
			}
			mr.setBy_class_teacher(req.getParameter("classteacher_2"));
			mr.setBy_coordinator(req.getParameter("coordinator_2"));
			mr.setBy_principal(req.getParameter("principal_2"));
			schoolservice.insertmarksheets_studentremarks(mr,c);
		model.put("list", schoolservice.getStudent());
		return new ModelAndView("redirect");
	}
	
	
	@RequestMapping(value = "/entrymarksheet")
	public ModelAndView entrymarksheet(Map<String, Object> model,HttpServletRequest req,HttpSession session) {
		
		model.put("user", req.getParameter("user"));
		model.put("username", req.getParameter("username"));
		int standard_Id=(Integer)session.getAttribute("standard_Id");
		//System.out.println(standard_Id+">>>>>>>>>>>>>>>>>>>>>>");
		String name=(String) session.getAttribute("name");
		String rolno=req.getParameter("student_id");
		List<String> standard=schoolservice.getsid(standard_Id);
		//String rno=(String) session.getAttribute("rollNumber");
		List<Integer> sid=schoolservice.getsid(standard_Id,rolno,name);
		int rollno=0;
		try{
			rollno=sid.get(0);
		}catch(IndexOutOfBoundsException e){
			System.out.println("Error");
		}
		List<String> date_of_birth=schoolservice.getdob(rollno);
		model.put("date_of_birth", date_of_birth.get(0));
		model.put("standard_id", standard_Id);
		model.put("standard_name", standard.get(0));
		model.put("name", name);
		model.put("roll_no", rolno);
		////System.out.println("dob is::"+date_of_birth.get(0)+"::standard_id::"+standard_Id+"::student_id::"+req.getParameter("student_id")+"::rollno::"+rolno);
		//System.out.println("1st::"+rollno);
		
		if(standard_Id>5){
			
			Date date = new Date();
			int term1=Integer.parseInt(req.getParameter("term1"));
			int term2=Integer.parseInt(req.getParameter("term2"));
			int term3=Integer.parseInt(req.getParameter("term3"));
			String s[]=req.getParameterValues("subject_id");
			List<String> ma1=schoolservice.getmarksheets_assessmentsgrade(standard_Id,rollno,term1);
			int c=1;
			if(ma1.isEmpty()){c=2;}
			String a1[]=req.getParameterValues("assessment_1_1");
			String a2[]=req.getParameterValues("assessment_1_2");
			String a3[]=req.getParameterValues("assessment_1_3");
			String a4[]=req.getParameterValues("assessment_1_4");
			String a5[]=req.getParameterValues("assessment_1_5");
			String a6[]=req.getParameterValues("assessment_1_6");
			String a7[]=req.getParameterValues("assessment_1_7");
			String a8[]=req.getParameterValues("assessment_1_8");
			String a9[]=req.getParameterValues("assessment_1_9");
			String a10[]=req.getParameterValues("assessment_1_10");
			String a11[]=req.getParameterValues("assessment_1_11");
			for(int i=0;i<a1.length;i++){
				Marksheets_Assessments ma=new Marksheets_Assessments();
				int subject_id=Integer.parseInt(s[i]);
				int grade_id1=0;
				int grade_id2=0;
				int grade_id3=0;
				int grade_id4=0;
				int grade_id5=0;
				int grade_id6=0;
				int grade_id7=0;
				int grade_id8=0;
				int grade_id9=0;
				int grade_id10=0;
				int grade_id11=0;
				
				if(a1[i]!=""){grade_id1=Integer.parseInt(a1[i]);}
				if(a2[i]!=""){grade_id2=Integer.parseInt(a2[i]);}
				if(a3[i]!=""){grade_id3=Integer.parseInt(a3[i]);}
				if(a4[i]!=""){grade_id4=Integer.parseInt(a4[i]);}
				if(a5[i]!=""){grade_id5=Integer.parseInt(a5[i]);}
				if(a6[i]!=""){grade_id6=Integer.parseInt(a6[i]);}
				if(a7[i]!=""){grade_id7=Integer.parseInt(a7[i]);}
				if(a8[i]!=""){grade_id8=Integer.parseInt(a8[i]);}
				if(a9[i]!=""){grade_id9=Integer.parseInt(a9[i]);}
				if(a10[i]!=""){grade_id10=Integer.parseInt(a10[i]);}
				if(a11[i]!=""){grade_id11=Integer.parseInt(a11[i]);}
				List<School_Tag> tag=schoolservice.getschool_tag(standard_Id);
				ma.setStudent_id(rollno);
				ma.setStandard_id(standard_Id);
				ma.setSubject_id(subject_id);
				ma.setAssessments_created_by_id(17);
				ma.setNotes(" ");
				ma.setCreated_on(date);
				ma.setAssessments_updated_by_id(17);
				ma.setLast_modified_on(date);
				ma.setDatamode("A");
				ma.setTerm_id(term1);
				ma.setTag_id(tag.get(0).getId());
				ma.setGrade_id(grade_id1);
				if(a1[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(1).getId());
				ma.setGrade_id(grade_id2);
				if(a2[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(2).getId());
				ma.setGrade_id(grade_id3);
				if(a3[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTerm_id(term2);
				ma.setTag_id(tag.get(3).getId());
				ma.setGrade_id(grade_id4);
				if(a4[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(4).getId());
				ma.setGrade_id(grade_id5);
				if(a4[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(5).getId());
				ma.setGrade_id(grade_id6);
				if(a6[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(6).getId());
				ma.setGrade_id(grade_id7);
				if(a7[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTerm_id(term3);
				ma.setTag_id(tag.get(7).getId());
				ma.setGrade_id(grade_id8);
				if(a8[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(8).getId());
				ma.setGrade_id(grade_id9);
				if(a9[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(9).getId());
				ma.setGrade_id(grade_id10);
				if(a10[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
				ma.setTag_id(tag.get(10).getId());
				ma.setGrade_id(grade_id11);
				if(a11[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
			}
			
			//storing into marksheets_evolution term1
			Marksheets_Evaluation me=new Marksheets_Evaluation();		
			me.setStudent_id(rollno);
			me.setStandard_id(standard_Id);
			me.setAditional_skill(0);
			me.setTerm_id(term1);
			me.setEvaluation_created_by_id(17);
			me.setCreated_on(date);
			me.setEvaluation_updated_by_id(17);
			me.setLast_modified_on(date);
			me.setDatamode("A");
			String skill[]=req.getParameterValues("skill_id");
			String sub[]=req.getParameterValues("sub_id");
			String dec[]=req.getParameterValues("Descriptive");
			String grade[]=req.getParameterValues("grade");
			String att1[]=req.getParameterValues("attendance_1");
			String att2[]=req.getParameterValues("attendance_2");
			String h[]=req.getParameterValues("health");
			int j=0;
			for(int i=0;i<dec.length;i++){
				int subject_id=Integer.parseInt(sub[i]);
				int skills_id=Integer.parseInt(skill[i]);
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				if(i<dec.length-4){
				me.setGrade(grade[i]);
				}else{
					me.setGrade(" ");
				}
				me.setDescription(dec[i]);
				schoolservice.insertmarksheets_evolution(me,c);
				j++;
			}
			for(int i=0;i<att1.length;i++){
				int subject_id=Integer.parseInt(sub[j]);
				int skills_id=Integer.parseInt(skill[j]);
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				me.setGrade(att1[i]);
				me.setDescription(" ");
				schoolservice.insertmarksheets_evolution(me,c);
				
				j++;
			}
			int k=j-2;
			for(int i=0;i<att2.length;i++){
				int subject_id=Integer.parseInt(sub[k]);
				int skills_id=Integer.parseInt(skill[k]);
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				me.setDescription(" ");
				me.setGrade(att2[i]);
				schoolservice.insertmarksheets_evolution(me,c);			
				k++;
			}
			
			for(int i=0;i<h.length;i++){
				int subject_id=Integer.parseInt(sub[j]);
				int skills_id=Integer.parseInt(skill[j]);
				me.setSubject_id(subject_id);
				me.setSkills_id(skills_id);
				me.setGrade(h[i]);
				me.setDescription(" ");
				schoolservice.insertmarksheets_evolution(me,c);
				j++;
			}
				int overall_id=Integer.parseInt(req.getParameter("overall_id"));
				me.setSubject_id(overall_id);
				me.setSkills_id(0);
				me.setGrade(req.getParameter("overall"));
				me.setDescription(" ");
				schoolservice.insertmarksheets_evolution(me,c);
			
			Marksheets_Studentresults ms=new Marksheets_Studentresults();
			ms.setStudent_id(rollno);
			ms.setStandard_id(standard_Id);
			ms.setResult(req.getParameter("result"));
			ms.setStudent_results_created_by_id(17);
			ms.setCreated_on(date);
			ms.setStudent_results_updated_by_id(17);
			ms.setLast_modified_on(date);
			ms.setDatamode("A");
			schoolservice.insertmarksheets_studentresults(ms,c);
			Marksheets_Studentremarks mr=new Marksheets_Studentremarks();
			mr.setStudent_id(rollno);
			mr.setStandard_id(standard_Id);
			mr.setBy_class_teacher(req.getParameter("classteacher"));
			mr.setBy_coordinator(req.getParameter("coordinator"));
			mr.setBy_principal(req.getParameter("principal"));
			mr.setStudent_remarks_created_by_id(17);
			mr.setCreated_on(date);
			mr.setStudent_remarks_updated_by_id(17);
			mr.setLast_modified_on(date);
			mr.setDatamode("A");
			schoolservice.insertmarksheets_studentremarks(mr,c);
		}else{
			
			Date date = new Date();
			int term1=Integer.parseInt(req.getParameter("term1"));
			String s[]=req.getParameterValues("subject_id");
			List<String> ma1=schoolservice.getmarksheets_assessmentsgrade(standard_Id,rollno,term1);
			List<School_Tag> tag=schoolservice.getschool_tag(standard_Id);			
			int c=1;
			if(ma1.isEmpty()){c=2;}
			String a[]=req.getParameterValues("assessment_1_1");
			String a1[]=req.getParameterValues("assessment_1_2");
			String a2[]=req.getParameterValues("assessment_1_3");
		for(int i=0;i<a.length;i++){
			Marksheets_Assessments ma=new Marksheets_Assessments();
			int subject_id=Integer.parseInt(s[i]);
			int grade_id=0;int grade_id1=0;int grade_id2=0;
			if(a[i]!=""){grade_id=Integer.parseInt(a[i]);}			
			ma.setStudent_id(rollno);
			ma.setStandard_id(standard_Id);
			ma.setSubject_id(subject_id);
			ma.setTerm_id(term1);
			ma.setTag_id(tag.get(0).getId());
			ma.setGrade_id(grade_id);
			ma.setAssessments_created_by_id(17);
			ma.setCreated_on(date);
			ma.setAssessments_updated_by_id(17);
			ma.setLast_modified_on(date);
			ma.setDatamode("A");
			if(a[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
			if(a1[i]!=""){grade_id1=Integer.parseInt(a1[i]);}
			ma.setGrade_id(grade_id1);
			ma.setTag_id(tag.get(1).getId());
			if(a1[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
			if(a2[i]!=""){grade_id2=Integer.parseInt(a2[i]);}
			ma.setGrade_id(grade_id2);
			ma.setTag_id(tag.get(2).getId());
			if(a2[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}			
		}
		
		//storing into marksheets_evolution term1
		Marksheets_Evaluation me=new Marksheets_Evaluation();		
		me.setStudent_id(rollno);
		me.setStandard_id(standard_Id);
		me.setAditional_skill(0);
		me.setTerm_id(term1);
		me.setEvaluation_created_by_id(17);
		me.setCreated_on(date);
		me.setEvaluation_updated_by_id(17);
		me.setLast_modified_on(date);
		me.setDatamode("A");
		String skill[]=req.getParameterValues("skill_id");
		String sub[]=req.getParameterValues("sub_id");
		String dec[]=req.getParameterValues("description_1_1");
		String grade[]=req.getParameterValues("grade_1_1");
		String grade1[]=req.getParameterValues("grade_1_6_1");
		String att1[]=req.getParameterValues("attendance_1");
		String h[]=req.getParameterValues("health_1");
		int j=0;
		for(int i=0;i<dec.length;i++){
			int subject_id=Integer.parseInt(sub[i]);
			int skills_id=Integer.parseInt(skill[i]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(grade[i]);
			me.setDescription(dec[i]);
			//System.out.println(dec[i]+"Line 563"+" "+dec.length);
			schoolservice.insertmarksheets_evolution(me,c);
			j++;
		}
		for(int i=0;i<grade1.length;i++){
			int subject_id=Integer.parseInt(sub[j]);
			int skills_id=Integer.parseInt(skill[j]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(grade1[i]);
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
			j++;
		}
		
		for(int i=0;i<att1.length;i++){
			int subject_id=Integer.parseInt(sub[j]);
			int skills_id=Integer.parseInt(skill[j]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(att1[i]);
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
			j++;
		}
		
		for(int i=0;i<h.length;i++){
			int subject_id=Integer.parseInt(sub[j]);
			int skills_id=Integer.parseInt(skill[j]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(h[i]);
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
			j++;
		}		

		String a3[]=req.getParameterValues("assessment_1_4");
		String a4[]=req.getParameterValues("assessment_1_5");
		String a5[]=req.getParameterValues("assessment_1_6");
		String a6[]=req.getParameterValues("assessment_1_7");
		for(int i=0;i<a3.length;i++){
			////System.out.println("values"+a3[i]+a4[i]+a5[i]+a6[i]);
			Marksheets_Assessments ma=new Marksheets_Assessments();
			int subject_id=Integer.parseInt(s[i]);
			int grade_id=0;int grade_id1=0;int grade_id2=0;
			if(a3[i]!=""){grade_id=Integer.parseInt(a3[i]);}
			ma.setStudent_id(rollno);
			ma.setStandard_id(standard_Id);
			ma.setSubject_id(subject_id);
			ma.setTerm_id(Integer.parseInt(req.getParameter("term2")));			
			ma.setTag_id(tag.get(3).getId());
			ma.setGrade_id(grade_id);
			ma.setAssessments_created_by_id(17);
			ma.setCreated_on(date);
			ma.setAssessments_updated_by_id(17);
			ma.setLast_modified_on(date);
			ma.setNotes(" ");
			ma.setDatamode("A");
			if(a3[i]!=""){schoolservice.insertmarksheets_assessment(ma,c);}
			if(a4[i]!=""){grade_id1=Integer.parseInt(a4[i]);
			ma.setGrade_id(grade_id1);
			ma.setTag_id(tag.get(4).getId());
			schoolservice.insertmarksheets_assessment(ma,c);}
			if(a6[i]!=""){grade_id2=Integer.parseInt(a6[i]);
			ma.setGrade_id(grade_id2);
			ma.setTag_id(tag.get(6).getId());
			schoolservice.insertmarksheets_assessment(ma,c);}
			if(a5[i]!=""){
				ma.setTag_id(tag.get(5).getId());
			if(standard_Id==1 || standard_Id==2){
				ma.setGrade_id(0);
				if(a5[i].equalsIgnoreCase("null")){
					ma.setNotes(" ");
				}else{
					System.out.println("review::"+a5[i]);
					ma.setNotes(a5[i]);
				}
			}else{
				ma.setGrade_id(Integer.parseInt(a5[i]));
			}
			
			schoolservice.insertmarksheets_assessment(ma,c);}

			
		}
		//Marksheets_Evaluation me=new Marksheets_Evaluation();		
		me.setStudent_id(rollno);
		me.setStandard_id(standard_Id);
		//System.out.println(standard_Id+">>>>>>>>>>> Line: 650");
		me.setAditional_skill(0);
		me.setTerm_id(Integer.parseInt(req.getParameter("term2")));
		me.setEvaluation_created_by_id(17);
		me.setCreated_on(date);
		me.setEvaluation_updated_by_id(17);
		me.setLast_modified_on(date);
		me.setDatamode("A");
		String skill1[]=req.getParameterValues("skill_id");
		String sub1[]=req.getParameterValues("sub_id");
		String dec2[]=req.getParameterValues("description_1_2");
		String grade2[]=req.getParameterValues("grade_1_2");
		String grade3[]=req.getParameterValues("grade_1_6_2");
		String att2[]=req.getParameterValues("attendance_2");
		int k=0;
		for(int i=0;i<dec2.length;i++){
			int subject_id=Integer.parseInt(sub1[i]);
			int skills_id=Integer.parseInt(skill1[i]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(grade2[i]);
			me.setDescription(dec2[i]);
			schoolservice.insertmarksheets_evolution(me,c);
			k++;
		}
		
		for(int i=0;i<grade3.length;i++){
			int subject_id=Integer.parseInt(sub1[k]);
			int skills_id=Integer.parseInt(skill1[k]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(grade3[i]);
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
			k++;
		}
		for(int i=0;i<att2.length;i++){
			int subject_id=Integer.parseInt(sub1[k]);
			int skills_id=Integer.parseInt(skill1[k]);
			me.setSubject_id(subject_id);
			me.setSkills_id(skills_id);
			me.setGrade(att2[i]);
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
			k++;
		}
		if(standard_Id==3){
			me.setSubject_id(24);
			me.setSkills_id(0);
			me.setGrade(req.getParameter("overall"));
			me.setDescription(" ");
			schoolservice.insertmarksheets_evolution(me,c);
		}
		Marksheets_Studentresults ms=new Marksheets_Studentresults();
		ms.setStudent_id(rollno);
		ms.setStandard_id(standard_Id);
		ms.setResult(req.getParameter("result"));
		ms.setStudent_results_created_by_id(17);
		ms.setCreated_on(date);
		ms.setStudent_results_updated_by_id(17);
		ms.setLast_modified_on(date);
		ms.setDatamode("A");
		schoolservice.insertmarksheets_studentresults(ms,c);
		Marksheets_Studentremarks mr=new Marksheets_Studentremarks();
		mr.setStudent_id(rollno);
		mr.setStandard_id(standard_Id);
		mr.setBy_class_teacher(req.getParameter("classteacher"));
		mr.setBy_coordinator(req.getParameter("coordinator"));
		mr.setBy_principal(req.getParameter("principal"));
		mr.setStudent_remarks_created_by_id(17);
		mr.setCreated_on(date);
		mr.setStudent_remarks_updated_by_id(17);
		mr.setLast_modified_on(date);
		mr.setDatamode("A");
		schoolservice.insertmarksheets_studentremarks(mr,c);
		}
		model.put("list", schoolservice.getStudent());
		return new ModelAndView("redirect");
	}

}
