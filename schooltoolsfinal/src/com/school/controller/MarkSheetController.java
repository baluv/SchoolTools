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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.school.domain.Marksheets_Assessments;
import com.school.domain.Marksheets_Evaluation;
import com.school.domain.Marksheets_Studentremarks;
import com.school.domain.Marksheets_Studentresults;
import com.school.domain.School_Maincategory;
import com.school.domain.School_Student;
import com.school.domain.School_Subcategory;
import com.school.domain.School_Tag;
import com.school.domain.School_Term;
import com.school.service.SchoolService;

@Controller
@RequestMapping("/school123")
public class MarkSheetController {
	@Autowired(required = true)
	public SchoolService schoolservice;	
	
	
	@RequestMapping(value = "/marksheetentryview")
	public ModelAndView marksheetentryview(Map<String, Object> model,@RequestParam("standard_id")Integer standard_id,@RequestParam("name")String name,@RequestParam("Rollno")String rno,HttpSession session,HttpServletRequest req) throws ParseException {
	model.put("user", req.getParameter("user"));
	model.put("username", req.getParameter("username"));
	//System.out.println(standard_id+" "+rno+" "+name);
	List<Integer> sid=schoolservice.getsid(standard_id,rno,name);
	if(standard_id==16){standard_id=13;}
	if(standard_id==17){return new ModelAndView("marksheetview3");}
	int rollno=0;
	if(!sid.isEmpty())
	{
		rollno=sid.get(0);
		List<String> year=schoolservice.getyear(rollno);
		model.put("year", year.get(0));
	}
	try{
		standard_id=Integer.parseInt(req.getParameter("standards"));
	System.out.println("standard_id::"+standard_id);
	}catch(NumberFormatException ne){
		standard_id=Integer.parseInt(req.getParameter("standard_id"));
	}
	if(standard_id==16){standard_id=13;}
	List<School_Term> term=schoolservice.getterm(standard_id);
	School_Term t1=term.get(0);
	School_Term t2=term.get(1);
	List<School_Maincategory> s=schoolservice.getSubject(standard_id);
	int length=-1;
	int a=0;	
	for(int i=0;i<s.size();i++){
		School_Maincategory sm=s.get(i);
		model.put("list"+i, schoolservice.getSubcategory(sm.getId()));
		model.put("name"+i, sm.getName());
		model.put("sub_id"+i, sm.getId());
		List<School_Subcategory> sub=schoolservice.getSubcategory(sm.getId());
		int size=length+sub.size();
		length=size;
		model.put("length"+i,size);

	if(standard_id<6){
		List<Marksheets_Evaluation> meg1=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());			
		if(!meg1.isEmpty()){
		for(int l=0;l<sub.size();l++)
		{
			School_Subcategory subc=sub.get(l);
			try{
			Marksheets_Evaluation m=meg1.get(l);
			if(subc.getId()!=m.getSkills_id())
			{
				Marksheets_Evaluation mm=new Marksheets_Evaluation();
				mm.setDescription(" ");mm.setGrade(" ");
				meg1.add(l, mm);//System.out.println("l value::"+l);
			}
			}catch(IndexOutOfBoundsException ie){}
		}
		model.put("markeval"+i, meg1);
		}		
		List<Marksheets_Evaluation> meg2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
		if(!meg1.isEmpty()){
		if(i!=s.size()-2){
		for(int l=0;l<sub.size();l++)
		{
			School_Subcategory subc=sub.get(l);
			try{
			Marksheets_Evaluation m=meg2.get(l);
			if(subc.getId()!=m.getSkills_id())
			{
				Marksheets_Evaluation mm=new Marksheets_Evaluation();
				mm.setDescription(" ");mm.setGrade(" ");
				meg2.add(l, mm);
			}	
			}catch(IndexOutOfBoundsException ie){}
		}
		model.put("markeval2"+i, meg2);
		}}
		
	}
		if(standard_id>5 && standard_id<11){
			List<Marksheets_Evaluation> meg1=schoolservice.getmarksheets_evaluationgradet(standard_id,rollno,t1.getId(),sm.getId());			
			if(!meg1.isEmpty()){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
				try{
				Marksheets_Evaluation m=meg1.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg1.add(l, mm);
				}	
				}catch(IndexOutOfBoundsException ie){}
			}
			model.put("markeval"+i, meg1);
			}	
			
			List<Marksheets_Evaluation> meg3=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());			
			if(!meg3.isEmpty()){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
				try{
				Marksheets_Evaluation m=meg3.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg3.add(l, mm);
				}
				}catch(IndexOutOfBoundsException ie){}
			}
			model.put("markeval3"+i, meg3);
			}		
			List<Marksheets_Evaluation> meg2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
			if(!meg2.isEmpty()){
			if(i!=s.size()-2){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
				Marksheets_Evaluation m=meg2.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg2.add(l, mm);
				}					
			}
			model.put("markeval2"+i, meg2);
			}}
			
		}	
	
	
	
	}
	
	
	
	
	
	if(standard_id<11){
	String over=schoolservice.getmarksheets_assessmentsnewover(standard_id,rollno);
	model.put("overall", over);	
	}
	model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));
	if(standard_id<12 || standard_id==15)
	{
			
		List<School_Tag> tag=schoolservice.getschool_tag(standard_id);
		
		for(int i=0;i<tag.size();i++)
		{
			School_Tag t=tag.get(i);
			School_Maincategory sm=s.get(0);
			List<String> asses= schoolservice.getmarksheets_assessmentsnew(standard_id,rollno,t1.getId(),t.getId(),sm.getId());
			List<Marksheets_Assessments> s_id= schoolservice.getmarksheets_assessmentsnewtag_id(standard_id,rollno,t1.getId(),t.getId(),sm.getId());
			if(asses.size()==5){
				model.put("listmas"+i, schoolservice.getmarksheets_assessmentsnew(standard_id,rollno,t1.getId(),t.getId(),sm.getId()));
				}else{
			int k=0;
			for(int j=0;j<s_id.size();j++)
			{
				School_Maincategory sm1=s.get(k);
				try{
				Marksheets_Assessments s_id1=s_id.get(j);
				if(sm1.getId()!=s_id1.getSubject_id())
				{
					asses.add(j, " ");
					j--;					
				}
				}catch(IndexOutOfBoundsException ie){}
				k++;}			
			model.put("listmas"+i,asses);
			}
		}
	}
	model.put("listme", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId()));
	model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));	
	String dob1=req.getParameter("dob");
	//System.out.println("dob is::"+dob1);
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat formatter1 = new SimpleDateFormat("MMM dd, yyyy");
	Date date = formatter.parse(dob1);
	//System.out.println("dob is::"+date);
	model.put("dob", formatter1.format(date));
	try{
		standard_id=Integer.parseInt(req.getParameter("standards"));
		List<String> sname=schoolservice.getsid(standard_id);
		//System.out.println("standard_id::"+sname.get(0));
		model.put("standard", sname.get(0));
	}catch(NumberFormatException ne){
		standard_id=Integer.parseInt(req.getParameter("standard_id"));
		model.put("standard", req.getParameter("standard"));
	}	
	model.put("student_name", req.getParameter("name"));
	model.put("standard_id", req.getParameter("standard_id"));
	model.put("rollno", rollno);
	for(int j=0;j<term.size();j++){
		School_Term sss=term.get(j);
		model.put("termname"+j, sss.getName());
		model.put("termid"+j, sss.getId());		
	}
	if(standard_id==12 || standard_id==13 || standard_id==14){
		System.out.println(standard_id+" "+rollno);
		model.put("standard_id", standard_id);
		model.put("list", schoolservice.getSubject5(standard_id));
		model.put("listme", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId()));
		model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));
		model.put("listmsr", schoolservice.getmarksheets_studentremarks(standard_id,rollno));
		return new ModelAndView("marksheetview2");
	}else{	
	List<String> ms=schoolservice.getmarksheets_studentresults(standard_id,rollno);
	model.put("listmn", schoolservice.getmarksheets_assessmentsgradeno(standard_id,rollno,t1.getId()));
	model.put("listmr", schoolservice.getmarksheets_assessmentsreview(standard_id,rollno,t2.getId()));
	model.put("list", schoolservice.getSubject5(standard_id));
	model.put("listmsr", schoolservice.getmarksheets_studentremarks(standard_id,rollno));
	model.put("tag", schoolservice.getschool_tag(standard_id));
	model.put("standard_id", standard_id);
	if(ms.isEmpty()){model.put("listms"," ");}else{model.put("listms", ms.get(0));}
	if(standard_id==11 || standard_id==15){
		model.put("mnotes", schoolservice.getmarksheets_studentnotes(standard_id,rollno));
		model.put("mgrade", schoolservice.getmarksheets_studentgrade(standard_id,rollno));
		model.put("met1", schoolservice.getmarksheets_studentterm1grade(standard_id,rollno,t1.getId()));
		model.put("met2", schoolservice.getmarksheets_studentterm2grade(standard_id,rollno,t2.getId()));
	}
	//if(standard_id<5){return new ModelAndView("marksheetview");}else if(standard_id==5){return new ModelAndView("marksheetview2");}else{return new ModelAndView("marksheetview3");}
	//return new ModelAndView("marksheetview");
	if(standard_id==11 || standard_id==15){return new ModelAndView("marksheetview1");}else{return new ModelAndView("marksheetview");}
}}
	
	
	
	@RequestMapping(value="/popup")
	public ModelAndView getpopup(Map<String, Object> model,HttpServletRequest req){
	model.put("user", req.getParameter("user"));
	model.put("username", req.getParameter("username"));
	
	String dob=req.getParameter("dob");
	int rollno= Integer.parseInt(req.getParameter("rollno"));			
	model.put("dob", dob);
	model.put("standard", req.getParameter("standard"));
	model.put("student_name", req.getParameter("student_name"));
	model.put("standard_id", req.getParameter("standard_id"));
	model.put("rollno", rollno);
	List<School_Student> mail=schoolservice.getreport_to_email(rollno);
	if(mail.isEmpty()){
		model.put("mail", "Hai");
	}else{
	School_Student ss=mail.get(0);
	model.put("mail",ss.getReport_to_email());
	}
	return new ModelAndView("email");}
	@RequestMapping(value = "/markssheet")
	public ModelAndView markssheet(Map<String, Object> model,HttpServletRequest req) {
	model.put("list", schoolservice.getStudent());
	model.put("user", req.getParameter("user"));
	model.put("username", req.getParameter("username"));
	return new ModelAndView("student_wise_marks_sheet");}
	
	@RequestMapping(value = "/markssheetreport")
	public ModelAndView markssheetreport(Map<String, Object> model,HttpServletRequest req) {
	model.put("list", schoolservice.getStudent());
	model.put("user", req.getParameter("user"));
	model.put("username", req.getParameter("username"));
	return new ModelAndView("student_wise_marks_sheet_view");}
	
	@RequestMapping(value = "/marksheetentry")
	public ModelAndView marksheetentry(Map<String, Object> model,HttpServletRequest req,@RequestParam("standard_id")Integer standard_id,@RequestParam("name")String name,@RequestParam("Rollno")String rno,HttpSession session) {
		//System.out.println(standard_id+" "+rno+" "+name);
		List<Integer> sid=schoolservice.getsid(standard_id,rno,name);
	if(standard_id==16){
		standard_id=13;
	}
	model.put("user", req.getParameter("user"));
	model.put("username", req.getParameter("username"));
	if(standard_id==17){
		return new ModelAndView("marksheet3");
		}
	int rollno=sid.get(0);
	model.put("rno", rno);
	model.put("student_id", rollno);
	//System.out.println("rollnum"+rollno);
	List<School_Term> term=schoolservice.getterm(standard_id);
	School_Term t1=term.get(0);
	School_Term t2=term.get(1);
	List<School_Maincategory> s=schoolservice.getSubject(standard_id);
	int length=-1;
	int a=0;
	//System.out.println(rollno);
	for(int i=0;i<s.size();i++){
		School_Maincategory sm=s.get(i);
		model.put("list"+i, schoolservice.getSubcategory(sm.getId()));
		model.put("name"+i, sm.getName());
		model.put("sub_id"+i, sm.getId());
		List<School_Subcategory> sub=schoolservice.getSubcategory(sm.getId());
		int size=length+sub.size();
		length=size;
		model.put("length"+i,size);
			
	if(standard_id<6){
		List<Marksheets_Evaluation> meg1=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());			
		if(!meg1.isEmpty()){
		for(int l=0;l<sub.size();l++)
		{
			School_Subcategory subc=sub.get(l);
			try{
			Marksheets_Evaluation m=meg1.get(l);
			if(subc.getId()!=m.getSkills_id())
			{
				Marksheets_Evaluation mm=new Marksheets_Evaluation();
				mm.setDescription(" ");mm.setGrade(" ");
				meg1.add(l, mm);
			}
			}catch(IndexOutOfBoundsException ie){}
		}
		model.put("markeval"+i, meg1);
		}		
		List<Marksheets_Evaluation> meg2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
		if(!meg1.isEmpty()){
		if(i!=s.size()-2){
		for(int l=0;l<sub.size();l++)
		{
			School_Subcategory subc=sub.get(l);
			try{
				Marksheets_Evaluation m=meg2.get(l);
				if(subc.getId()!=m.getSkills_id())
			{
				Marksheets_Evaluation mm=new Marksheets_Evaluation();
				mm.setDescription(" ");mm.setGrade(" ");
				meg2.add(l, mm);
			}					
			}catch(IndexOutOfBoundsException ie){}
			}
		model.put("markeval2"+i, meg2);
		}}
		
	}
		if(standard_id>5 && standard_id<11){
			List<Marksheets_Evaluation> meg1=schoolservice.getmarksheets_evaluationgradet(standard_id,rollno,t1.getId(),sm.getId());			
			if(!meg1.isEmpty()){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
				//System.out.println(l+"::"+standard_id+"::"+sm.getId()+"::"+rollno);
			try{
				Marksheets_Evaluation m=meg1.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg1.add(l, mm);
				}
			}catch(IndexOutOfBoundsException ie){}
			}
			model.put("markeval"+i, meg1);
			}	
			
			List<Marksheets_Evaluation> meg3=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t1.getId(),sm.getId());			
			if(!meg3.isEmpty()){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
			try{
				Marksheets_Evaluation m=meg3.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg3.add(l, mm);
				}
			}catch(IndexOutOfBoundsException ie){}
			}
			model.put("markeval3"+i, meg3);
			}		
			List<Marksheets_Evaluation> meg2=schoolservice.getmarksheets_evaluationgradet1(standard_id,rollno,t2.getId(),sm.getId());
			if(!meg2.isEmpty()){
			if(i!=s.size()-2){
			for(int l=0;l<sub.size();l++)
			{
				School_Subcategory subc=sub.get(l);
			try{
				Marksheets_Evaluation m=meg2.get(l);
				if(subc.getId()!=m.getSkills_id())
				{
					Marksheets_Evaluation mm=new Marksheets_Evaluation();
					mm.setDescription(" ");mm.setGrade(" ");
					meg2.add(l, mm);
				}					
			}catch(IndexOutOfBoundsException ie){}
			}
			model.put("markeval2"+i, meg2);
			}}
			
		}	
	}	
	if(standard_id<11){
		String over=schoolservice.getmarksheets_assessmentsnewover(standard_id,rollno);
		model.put("overall", over);	
		}
		model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));
		if(standard_id<12 || standard_id==15)
		{
				
			List<School_Tag> tag=schoolservice.getschool_tag(standard_id);
			for(int i=0;i<tag.size();i++)
			{
				School_Tag t=tag.get(i);
				School_Maincategory sm=s.get(0);
				List<String> asses= schoolservice.getmarksheets_assessmentsnew(standard_id,rollno,t1.getId(),t.getId(),sm.getId());
				List<Integer> grade_id= schoolservice.getmarksheets_assessmentsgradeid(standard_id,rollno,t1.getId(),t.getId(),sm.getId());				
				List<Marksheets_Assessments> s_id= schoolservice.getmarksheets_assessmentsnewtag_id(standard_id,rollno,t1.getId(),t.getId(),sm.getId());
				if(asses.size()==5){
					model.put("listmas"+i, schoolservice.getmarksheets_assessmentsnew(standard_id,rollno,t1.getId(),t.getId(),sm.getId()));
					model.put("listmasg"+i,schoolservice.getmarksheets_assessmentsgradeid(standard_id,rollno,t1.getId(),t.getId(),sm.getId()));
					}else{
				int k=0;
				for(int j=0;j<s_id.size();j++)
				{
					School_Maincategory sm1=s.get(k);
				try{
					Marksheets_Assessments s_id1=s_id.get(j);
					if(sm1.getId()!=s_id1.getSubject_id())
					{
						asses.add(j, " ");
						grade_id.add(j, 0);
						j--;					
					}
				}catch(IndexOutOfBoundsException ie){}
					k++;}
				
				model.put("listmas"+i,asses);
				model.put("listmasg"+i,grade_id);
				}
			}
		}
	int term1=1;
	for(int j=0;j<term.size();j++){
		School_Term sss=term.get(j);
		model.put("termname"+j, sss.getName());
		model.put("termid"+j, sss.getId());			
	}
	if(standard_id==12 || standard_id==13 || standard_id==14){
		model.put("standard_id", standard_id);
		model.put("list", schoolservice.getSubject5(standard_id));
		model.put("listme", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId()));
		model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));
		model.put("listmsr", schoolservice.getmarksheets_studentremarks(standard_id,rollno));
		return new ModelAndView("marksheet2");
	}else{
	List<String> ms=schoolservice.getmarksheets_studentresults(standard_id,rollno);
	List<Integer> m=schoolservice.getmarksheets_assessmentsgradeno(standard_id,rollno,t1.getId());
	model.put("listme", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t1.getId()));
	model.put("listmn", schoolservice.getmarksheets_assessmentsgradeno(standard_id,rollno,t1.getId()));
	model.put("listm", schoolservice.getmarksheets_assessmentsgrade(standard_id,rollno,t1.getId()));
	model.put("listme2", schoolservice.getmarksheets_evaluationgrade(standard_id,rollno,t2.getId()));
	model.put("listm2", schoolservice.getmarksheets_assessmentsgrade(standard_id,rollno,t2.getId()));
	model.put("listmn2", schoolservice.getmarksheets_assessmentsgradeno(standard_id,rollno,t2.getId()));
	if(standard_id>5){
	School_Term t3=term.get(2);
	model.put("listm3", schoolservice.getmarksheets_assessmentsgrade(standard_id,rollno,t3.getId()));
	model.put("listmn3", schoolservice.getmarksheets_assessmentsgradeno(standard_id,rollno,t3.getId()));
	}
	model.put("listmr", schoolservice.getmarksheets_assessmentsreview(standard_id,rollno,t2.getId()));
	model.put("list", schoolservice.getSubject5(standard_id));
	model.put("listmsr", schoolservice.getmarksheets_studentremarks(standard_id,rollno));
	model.put("tag", schoolservice.getschool_tag(standard_id));
	model.put("standard_id", standard_id);
	if(ms.isEmpty()){model.put("listms"," ");}else{model.put("listms", ms.get(0));}
	if(standard_id==11 || standard_id==15){
		model.put("mnotes", schoolservice.getmarksheets_studentnotes(standard_id,rollno));
		model.put("mgrade", schoolservice.getmarksheets_studentgrade(standard_id,rollno));
		model.put("met1", schoolservice.getmarksheets_studentterm1grade(standard_id,rollno,t1.getId()));
		model.put("met2", schoolservice.getmarksheets_studentterm2grade(standard_id,rollno,t2.getId()));
	}
	
	//if(standard_id<5 || standard_id==12){return new ModelAndView("marksheet");}else if(standard_id==5){return new ModelAndView("marksheet");} else{return new ModelAndView("marksheet3");}
	if(standard_id==11 || standard_id==15){
		return new ModelAndView("marksheet1");
		}else{
			return new ModelAndView("marksheet");
			}
	}}
}
