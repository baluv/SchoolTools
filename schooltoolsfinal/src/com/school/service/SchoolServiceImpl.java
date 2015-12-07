package com.school.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.school.dao.SchoolDao;
import com.school.dto.*;
import com.school.domain.*;
@Service("SchoolService")
@Transactional
public class SchoolServiceImpl implements SchoolService {
	
	@Autowired(required = true)
	public SchoolDao schooldao;

	
	public int checklogin(String username, String password) {
		return schooldao.checklogin(username,password);
	}


	@Override
	public ArrayList<ListAllStudentsDto> getStudent() {
		
		return schooldao.getStudent();
	}


	@Override
	public List<School_Maincategory> getSubject(Integer standard_id) {
		
		return schooldao.getSubject(standard_id);
	}


	@Override
	public List<School_Maincategory> getSubject5(Integer standard_id) {
		
		return schooldao.getSubject5(standard_id);
	}


	@Override
	public List<School_Subcategory> getSubcategory(int id) {
		
		return schooldao.getSubcategory(id);
	}



	@Override
	public void insertmarksheets_assessment(Marksheets_Assessments ma, int c) {
		
		schooldao.insertmarksheets_assessment(ma,c);
	}


	@Override
	public void insertmarksheets_evolution(Marksheets_Evaluation me, int c) {
		
		 schooldao.insertmarksheets_evolution(me,c);
	}


	@Override
	public List<School_Term> getterm(Integer standard_id) {
	
		return schooldao.getterm(standard_id);
	}


	@Override
	public List<Marksheets_Assessments> getmarksheets_assessments(Integer standard_id, Integer rollno, int term1) {
		
		return schooldao.getmarksheets_assessments(standard_id,rollno,term1);
	}


	@Override
	public List<String> getmarksheets_assessmentsgrade(Integer standard_id,Integer rollno, int term1) {

		return schooldao.getmarksheets_assessmentsgrade(standard_id,rollno,term1);
	}


	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade(Integer standard_id, Integer rollno, int term1) {

		return schooldao.getmarksheets_evaluationgrade(standard_id,rollno,term1);
	}


	@Override
	public List<String> getmarksheets_assessmentsreview(Integer standard_id,Integer rollno, int term2) {
		// TODO Auto-generated method stub
		return schooldao.getmarksheets_assessmentsreview(standard_id,rollno,term2);
	}


	@Override
	public void insertmarksheets_studentremarks(Marksheets_Studentremarks mr, int c) {

		schooldao.insertmarksheets_studentremarks(mr,c);
	}


	@Override
	public void insertmarksheets_studentresults(Marksheets_Studentresults ms, int c) {

		schooldao.insertmarksheets_studentresults(ms,c);
	}


	@Override
	public List<Marksheets_Studentremarks> getmarksheets_studentremarks(Integer standard_id, Integer rollno) {
		return schooldao.getmarksheets_studentremarks(standard_id,rollno);
	}


	@Override
	public List<String> getmarksheets_studentresults(Integer standard_id,Integer rollno) {

		return schooldao.getmarksheets_studentresults(standard_id,rollno);
	}


	@Override
	public List<School_Tag> getschool_tag(Integer standard_id) {

		return schooldao.getschool_tag(standard_id);
	}


	@Override
	public List<String> getoverall(Integer standard_id, Integer rollno, int sid) {

		return schooldao.getoverall(standard_id,rollno,sid);
	}


	@Override
	public List<School_Student> getreport_to_email(int rollno) {

		return schooldao.getreport_to_email(rollno);
	}


	@Override
	public int addstudent_admission(Student_Admission student_admission) {
		
		return schooldao.addstudent_admission(student_admission);
	}


	@Override
	public List<String> getname(String username,String password) {

		return schooldao.getname(username,password);
	}


	@Override
	public ArrayList<DepartmentinfoDto> getDepartment_info() {

		return schooldao.getDepartment_info();
	}


	@Override
	public ArrayList<DesignationinfoDto> getDesignation_info() {

		return schooldao.getDesignation_info();
	}


	@Override
	public ArrayList<GradeinfoDto> getGrade_info() {

		return schooldao.getGrade_info();
	}


	@Override
	public ArrayList<HouseinfoDto> getHouse_info() {

		return schooldao.getHouse_info();
	}


	@Override
	public ArrayList<MaincatinfoDto> getMain_category_info() {

		return schooldao.getMain_category_info();
	}


	@Override
	public ArrayList<School_School> getSchool_info() {

		return schooldao.getSchool_info();
	}


	@Override
	public ArrayList<SectioninfoDto> getSection_info() {
		
		return schooldao.getSection_info();
	}


	@Override
	public ArrayList<StandardinfoDto> getStandard_info() {

		return schooldao.getStandard_info();
	}


	@Override
	public ArrayList<SubcatinfoDto> getSub_category_info() {

		return schooldao.getSub_category_info();
	}


	@Override
	public ArrayList<TaginfoDto> getTag_info() {

		return schooldao.getTag_info();
	}


	@Override
	public ArrayList<TerminfoDto> getTerm_info() {

		return schooldao.getTerm_info();
	}

	@Override
	public void saveUser(Auth_User ua) {
		
	schooldao.saveUser(ua);
	}


	@Override
	public void save_student(School_Student ss) {
		
		schooldao.save_student(ss);
	}


	

	@Override
	public int getStandard_id(String string) {
		
		return schooldao.getStandard_id(string);
	}
	
	@Override
	public int getSection_id(String string, int standard_id) {
		
		return schooldao.getSection_id(string, standard_id);
	}


	@Override
	public int getSchool_house_id(String parameter) {
		// TODO Auto-generated method stub
		return schooldao.getSchool_house_id(parameter);
	}


	@Override
	public ArrayList<StudentinfoDto1> getstudent_info_view() {

		return schooldao.getstudent_info_view();
	}


	@Override
	public ArrayList<Student_Admission> getadmission_info_view() {

		return schooldao.getadmission_info_view();
	}


	@Override
	public ArrayList<SubcatinfoDto> getcategory_info(String standard) {
		
		return schooldao.getcategory_info(standard);
	}


	@Override
	public ArrayList<StaffinfoDto> getstaff_info_view() {
		// TODO Auto-generated method stub
		return schooldao.getstaff_info_view();
	}


	@Override
	public List<Integer> getmarksheets_assessmentsgradeno(Integer standard_id,int rollno, int term1) {
		return schooldao.getmarksheets_assessmentsgradeno(standard_id,rollno,term1);
	}


	@Override
	public ArrayList<School_Tag> tag_update(String tag) {
		return schooldao.tag_update(tag);
	}


	@Override
	public List<String> getmarksheets_studentgrade(Integer standard_id,int rollno) {
		return schooldao.getmarksheets_studentgrade(standard_id,rollno);
	}


	@Override
	public List<String> getmarksheets_studentnotes(Integer standard_id,int rollno) {
		return schooldao.getmarksheets_studentnotes(standard_id,rollno);
	}


	@Override
	public List<String> getmarksheets_studentterm1grade(Integer standard_id,int rollno,int term_id) {
		return schooldao.getmarksheets_studentterm1grade(standard_id,rollno,term_id);
	}


	@Override
	public List<String> getmarksheets_studentterm2grade(Integer standard_id,int rollno,int term_id) {
		return schooldao.getmarksheets_studentterm2grade(standard_id,rollno,term_id);
	}


	@Override
	public List<Integer> getsid(Integer standard_id, String rno, String name) {
		return schooldao.getsid(standard_id,rno,name);
	}


	@Override
	public List<String> getmarksheets_assessmentsnew(Integer standard_id, int rollno, int term_id, int tag_id, int sub_id) {
		return schooldao.getmarksheets_assessmentsnew(standard_id,rollno,term_id, tag_id, sub_id);
	}


	@Override
	public List<Marksheets_Assessments> getmarksheets_assessmentsnewtag_id(
			Integer standard_id, int rollno, int id, int id2, int id3) {
		return schooldao.getmarksheets_assessmentsnewtag_id(standard_id,rollno,id,id2,id3);
	}


	@Override
	public String getmarksheets_assessmentsnewover(Integer standard_id,int rollno) {
		return schooldao.getmarksheets_assessmentsnewover(standard_id,rollno);
	}


	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet1(	Integer standard_id, int rollno, int id, int id2) {
		return schooldao.getmarksheets_evaluationgradet1(standard_id,rollno,id,id2);
	}


	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet(Integer standard_id, int rollno, int id, int id2) {
		return schooldao.getmarksheets_evaluationgradet(standard_id,rollno,id,id2);
	}


	@Override
	public List<Integer> getmarksheets_assessmentsgradeid(Integer standard_id,
			int rollno, int id, int id2, int id3) {
		return schooldao.getmarksheets_assessmentsgradeid(standard_id,rollno,id,id2,id3);
	}


	@Override
	public List<String> getmarksheets_assessmentsnewpdf(Integer standard_id,Integer rollno, int term_id, int tag_id, int sub_id) {

		return schooldao.getmarksheets_assessmentsnewpdf(standard_id,rollno,term_id, tag_id, sub_id);
	}


	@Override
	public List<Integer> getsid(String standard) {
		// TODO Auto-generated method stub
		return schooldao.getsid(standard);
	}


	@Override
	public List<String> getsid(Integer standard_id) {
		// TODO Auto-generated method stub
		return schooldao.getsid(standard_id);
	}


	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade9(
			Integer standard_id, int sub_id, int skill_id) {
		return schooldao.getmarksheets_evaluationgrade9(standard_id,sub_id,skill_id);
	}

	@Override
	public List<promotioninfoDto> getpromotionlist(int standard) {
		return schooldao.getpromotionlist(standard);
	}


	@Override
	public int updatepromotionlist(String student_id, String to_standard,String academic_year) {
		return schooldao.updatepromotionlist(student_id,to_standard,academic_year);
	}


	@Override
	public List<promotioninfoDto> getpromotedlist(int student_id) {
		return schooldao.getpromotedlist(student_id);
	}


	@Override
	public void saveUser_profile(User_Profile up) {
		
		schooldao.saveUser_profile(up);
	}


	@Override
	public List<String> getyear(int rollno) {
		return schooldao.getyear(rollno);
	}


	@Override
	public Auth_User getAuth_User(Integer user_id) {
		
		return schooldao.getAuth_User(user_id);
		
	}


	@Override
	public Integer getUser_id(String username) {
		
		return schooldao.getUser_id(username);
	}


	@Override
	public School_Student getStudentInfo(Integer user_id) {
		// TODO Auto-generated method stub
		return schooldao.getStudentInfo(user_id);
	}


	@Override
	public User_Profile getUserProfile(Integer user_id) {
		// TODO Auto-generated method stub
		return schooldao.getUserProfile(user_id);
	}


	@Override
	public List<String> getdob(int rollno) {
		return schooldao.getdob(rollno);
	}


	@Override
	public void deleteAuth_User(Integer user_id) {
		// TODO Auto-generated method stub
		schooldao.deleteAuth_User(user_id);
	}


	@Override
	public void deleteStudent(Integer deleteStudent) {
		// TODO Auto-generated method stub
		schooldao.deleteStudent(deleteStudent);
	}


	@Override
	public void deleteUser_Profile(Integer user_id) {
		// TODO Auto-generated method stub
		schooldao.deleteUser_Profile(user_id);
	}


	@Override
	public String getSectionName(int section, int standard) {
		
		return schooldao.getSectionName(section,standard);
	}


	@Override
	public String getStd_Name(int standard) {
		
		return schooldao.getStd_name(standard);
	}

}
