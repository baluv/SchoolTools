package com.school.service;

import java.util.ArrayList;
import java.util.List;
import com.school.dto.*;
import com.school.domain.*;

public interface SchoolService {
	
	public int checklogin(String username, String password);

	public ArrayList<ListAllStudentsDto> getStudent();

	public List<School_Maincategory> getSubject(Integer standard_id);

	public List<School_Maincategory> getSubject5(Integer standard_id);

	public List<School_Subcategory> getSubcategory(int i);

	public void insertmarksheets_assessment(Marksheets_Assessments ma, int c);

	public void insertmarksheets_evolution(Marksheets_Evaluation me, int c);

	public List<School_Term> getterm(Integer standard_id);

	public List<Marksheets_Assessments> getmarksheets_assessments(Integer standard_id, Integer rollno, int term1);

	public List<String> getmarksheets_assessmentsgrade(Integer standard_id,Integer rollno, int term1);

	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade(Integer standard_id, Integer rollno, int term1);

	public List<String> getmarksheets_assessmentsreview(Integer standard_id,Integer rollno, int term2);

	public void insertmarksheets_studentresults(Marksheets_Studentresults ms, int c);

	public void insertmarksheets_studentremarks(Marksheets_Studentremarks mr, int c);

	public List<String> getmarksheets_studentresults(Integer standard_id,Integer rollno);

	public List<Marksheets_Studentremarks> getmarksheets_studentremarks(Integer standard_id, Integer rollno);

	public List<School_Tag> getschool_tag(Integer standard_id);

	public List<String> getoverall(Integer standard_id, Integer rollno, int sid);

	public List<School_Student> getreport_to_email(int rollno);

	public int addstudent_admission(Student_Admission student_admission);

	public List<String> getname(String username, String password);

	public ArrayList<School_School> getSchool_info();

	public ArrayList<StandardinfoDto> getStandard_info();

	public ArrayList<SectioninfoDto> getSection_info();

	public ArrayList<HouseinfoDto> getHouse_info();

	public ArrayList<DepartmentinfoDto> getDepartment_info();

	public ArrayList<DesignationinfoDto> getDesignation_info();

	public ArrayList<TerminfoDto> getTerm_info();

	public ArrayList<TaginfoDto> getTag_info();

	public ArrayList<GradeinfoDto> getGrade_info();

	public ArrayList<SubcatinfoDto> getSub_category_info();

	public ArrayList<MaincatinfoDto> getMain_category_info();

	public void saveUser(Auth_User ua);

	public void save_student(School_Student ss);

	

	public int getStandard_id(String string);

	public int getSection_id(String parameter, int standard_id);

	public int getSchool_house_id(String parameter);

	public ArrayList<StudentinfoDto1> getstudent_info_view();

	public ArrayList<Student_Admission> getadmission_info_view();

	public ArrayList<SubcatinfoDto> getcategory_info(String standard);

	public ArrayList<StaffinfoDto> getstaff_info_view();

	public List<Integer> getmarksheets_assessmentsgradeno(Integer standard_id,int rollno, int term1);

	public ArrayList<School_Tag> tag_update(String tag);

	public List<String> getmarksheets_studentterm1grade(Integer standard_id,int rollno, int term_id);

	public List<String> getmarksheets_studentnotes(Integer standard_id,int rollno);

	public List<String> getmarksheets_studentgrade(Integer standard_id,int rollno);

	public List<String> getmarksheets_studentterm2grade(Integer standard_id,int rollno, int term_id);

	public List<Integer> getsid(Integer standard_id, String rno, String name);

	public List<String> getmarksheets_assessmentsnew(Integer standard_id, int rollno, int id, int id2, int i);

	public List<Marksheets_Assessments> getmarksheets_assessmentsnewtag_id(Integer standard_id, int rollno, int id, int id2, int id3);

	public String getmarksheets_assessmentsnewover(Integer standard_id,int rollno);

	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet1(Integer standard_id, int rollno, int id, int id2);

	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet(Integer standard_id, int rollno, int id, int id2);

	public List<Integer> getmarksheets_assessmentsgradeid(Integer standard_id,int rollno, int term_id, int tag_id, int sub_id);

	public List<String> getmarksheets_assessmentsnewpdf(Integer standard_id,Integer rollno, int term_id, int tag_id, int sub_id);

	public List<Integer> getsid(String standard);

	public List<String> getsid(Integer standard_id);

	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade9(
			Integer standard_id, int sub_id, int skill_id);
	public List<promotioninfoDto> getpromotionlist(int standard);

	public int updatepromotionlist(String student_id, String to_standard,String academic_year);

	public List<promotioninfoDto> getpromotedlist(int student_id);

	public void saveUser_profile(User_Profile up);

	public List<String> getyear(int rollno);

	public Auth_User getAuth_User(Integer user_id);

	public Integer getUser_id(String username);

	public School_Student getStudentInfo(Integer user_id);

	public User_Profile getUserProfile(Integer user_id);

	public List<String> getdob(int rollno);

	public void deleteStudent(Integer user_id);

	public void deleteUser_Profile(Integer user_id);

	public void deleteAuth_User(Integer user_id);

	public String getSectionName(int section, int standard);

	public String getStd_Name(int standard);
}
