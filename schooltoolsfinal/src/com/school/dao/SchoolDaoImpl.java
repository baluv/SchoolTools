package com.school.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.sql.*; 



import com.school.dto.*;
import com.school.domain.*;

import java.util.ArrayList;
import java.util.List;



@Repository("SchoolDao")
@Transactional
public class SchoolDaoImpl implements SchoolDao{
	
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public int checklogin(String username, String password) {
		String hql = "from Auth_User l where username='"+username+"' and password='" + password + "'";
		List<Auth_User> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		if (!list.isEmpty()) {
			return 1;
			} else {
			return 2;
		  }
		}
	
	@Override
	public void insertmarksheets_assessment(Marksheets_Assessments ma, int c) {
		if(c==2){sessionFactory.getCurrentSession().saveOrUpdate(ma);}
		else{
			System.out.println(ma.getNotes()+"::"+ma.getStudent_id()+"::"+ma.getStandard_id()+"::"+ma.getSubject_id()+"::"+ma.getTerm_id()+"::"+ma.getTag_id());
			String hql = "update Marksheets_Assessments set grade_id='"+ma.getGrade_id()+"',notes='"+ma.getNotes()+"' where student_id='"+ma.getStudent_id()+"' and standard_id='"+ma.getStandard_id()+"' and subject_id='"+ma.getSubject_id()+"' and term_id='"+ma.getTerm_id()+"' and tag_id='"+ma.getTag_id()+"'";
			sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
		}
		
	}
	@Override
	public void insertmarksheets_evolution(Marksheets_Evaluation me, int c) {
		if(c==2){sessionFactory.getCurrentSession().saveOrUpdate(me);
		}
		else{
			////System.out.println("in update");
			String hql = "update Marksheets_Evaluation set grade='"+me.getGrade()+"',description='"+me.getDescription()+"' where student_id='"+me.getStudent_id()+"' and standard_id='"+me.getStandard_id()+"' and subject_id='"+me.getSubject_id()+"' and skills_id='"+me.getSkills_id()+"' and term_id='"+me.getTerm_id()+"'";
			sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();						
		}
		
	}
	@Override
	public void insertmarksheets_studentremarks(Marksheets_Studentremarks mr, int c) {
		//System.out.println("c=2::"+c);
		if(c==2){sessionFactory.getCurrentSession().saveOrUpdate(mr);}
		else{
			String hql = "update Marksheets_Studentremarks set remark='"+mr.getRemark()+"', by_principal='"+mr.getBy_principal()+"',by_coordinator='"+mr.getBy_coordinator()+"',by_class_teacher='"+mr.getBy_class_teacher()+"' where student_id='"+mr.getStudent_id()+"' and standard_id='"+mr.getStandard_id()+"'";
			sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
			System.out.println("Hai");
		}
		
	}
	@Override
	public void insertmarksheets_studentresults(Marksheets_Studentresults ms, int c) {
		if(c==2){sessionFactory.getCurrentSession().saveOrUpdate(ms);
		}
		else{
			String hql = "update Marksheets_Studentresults set result='"+ms.getResult()+"' where student_id='"+ms.getStudent_id()+"' and standard_id='"+ms.getStandard_id()+"'";
			sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
		}
		
	}
	
	
	
	
	@Override
	public ArrayList<ListAllStudentsDto> getStudent() {
		String hql="SELECT NEW com.school.dto.ListAllStudentsDto(au.first_name as first_name,au.last_name as last_name,stu.roll_no as roll_no,stu.academic_year as academic_year,st.name as standard_name,sec.name as section_name,stu.report_to_email as report_to_email,stu.date_of_birth as date_of_birth,stu.admission_no as admission_no,st.id as standard_id) from School_Student stu, Auth_User au,School_Standard st,School_Section sec where au.id=stu.user_id and stu.standard_id=st.id and stu.section_id = sec.id";
		ArrayList<ListAllStudentsDto> list= (ArrayList<ListAllStudentsDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
		}
	@Override
	public List<School_Maincategory> getSubject(Integer standard_id) {
		String hql = "from School_Maincategory where standard_id='"+standard_id+"'";
		List<School_Maincategory> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<School_Maincategory> getSubject5(Integer standard_id) {
		String hql = "from School_Maincategory where standard_id='"+standard_id+"'";
		List<School_Maincategory> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<School_Subcategory> getSubcategory(int id) {
		String hql = "from School_Subcategory where subject_id='"+id+"'";
		List<School_Subcategory> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<School_Term> getterm(Integer standard_id) {
		//System.out.println("In dao getterm  "+standard_id);
		String hql = "from School_Term where standard_id='"+standard_id+"'";
		List<School_Term> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		
		return list;
	}
	@Override
	public List<Marksheets_Assessments> getmarksheets_assessments(Integer standard_id, Integer rollno, int term1) {
		String hql = "from Marksheets_Assessments where standard_id='"+standard_id+"' and student_id='"+rollno+"' and term_id='"+term1+"' order by tag_id,subject_id";
		List<Marksheets_Assessments> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<String> getmarksheets_assessmentsgrade(Integer standard_id,Integer rollno, int term1) {
		String hql = "select g.name as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.term_id='"+term1+"' and ma.grade_id=g.id order by ma.tag_id,ma.subject_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade(Integer standard_id, Integer rollno, int term1) {
		String hql = "from Marksheets_Evaluation where standard_id='"+standard_id+"' and student_id='"+rollno+"' and term_id='"+term1+"' order by subject_id";
		List<Marksheets_Evaluation> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		
		return list;
	}
	@Override
	public List<String> getmarksheets_assessmentsreview(Integer standard_id,Integer rollno, int term2) {
		String hql = "select notes from Marksheets_Assessments where standard_id='"+standard_id+"' and student_id='"+rollno+"' and term_id='"+term2+"' and  notes!='' order by tag_id desc";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<Marksheets_Studentremarks> getmarksheets_studentremarks(Integer standard_id, Integer rollno) {
		//System.out.println(standard_id+">>>>>>>>>"+rollno);
		String hql = "from Marksheets_Studentremarks where standard_id='"+standard_id+"' and student_id='"+rollno+"'";
		List<Marksheets_Studentremarks> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		//System.out.println(list);
		return list;
	}
	@Override
	public List<String> getmarksheets_studentresults(Integer standard_id,Integer rollno) {
		String hql = "select result from Marksheets_Studentresults where standard_id='"+standard_id+"' and student_id='"+rollno+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<School_Tag> getschool_tag(Integer standard_id) {
		String hql = "from School_Tag where standard_id='"+standard_id+"' order by id,term_id";
		List<School_Tag> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<String> getoverall(Integer standard_id, Integer rollno, int sid) {
		String hql = "select grade from Marksheets_Evaluation where standard_id='"+standard_id+"' and student_id='"+rollno+"' and subject_id='"+sid+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<School_Student> getreport_to_email(int rollno) {
		String hql = "from School_Student where id='"+rollno+"'";
		List<School_Student> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public int addstudent_admission(Student_Admission student_admission) {
		return (Integer)sessionFactory.getCurrentSession().save(student_admission);
	}
	@Override
	public List<String> getname(String username,String password) {
		String hql = "select first_name from Auth_User l where username='"+username+"' and password='"+password+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<DepartmentinfoDto> getDepartment_info() {
		String hql = "SELECT NEW com.school.dto.DepartmentinfoDto(d.name as Department,s.name as School) from School_Department d,School_School s where d.school_id=s.id";
		ArrayList<DepartmentinfoDto> list = (ArrayList<DepartmentinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<DesignationinfoDto> getDesignation_info() {
		String hql = "SELECT NEW com.school.dto.DesignationinfoDto(d.name as Designation,s.name as School) from School_Designation d,School_School s where d.school_id=s.id";
		ArrayList<DesignationinfoDto> list = (ArrayList<DesignationinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<GradeinfoDto> getGrade_info() {
		String hql = "SELECT NEW com.school.dto.GradeinfoDto(g.name as Grade,sd.name as Standard,g.mark_range as mark_range,g.grade_point as grade_point,s.name as School,g.description as description) from School_Grade g,School_School s,School_Standard sd where g.standard_id=sd.id and g.school_id=s.id";
		ArrayList<GradeinfoDto> list = (ArrayList<GradeinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<HouseinfoDto> getHouse_info() {
		String hql = "SELECT NEW com.school.dto.HouseinfoDto(s.name as School,h.name as House,h.colour as colour) from School_Schoolhouse h,School_School s where h.school_id=s.id";
		ArrayList<HouseinfoDto> list = (ArrayList<HouseinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<MaincatinfoDto> getMain_category_info() {
		String hql = "SELECT NEW com.school.dto.MaincatinfoDto(sm.name as maincat,s.name as School,sd.name as Standard,sm.type as type) from School_Maincategory sm,School_Standard sd,School_School s where sm.standard_id=sd.id and sm.school_id=s.id";
		ArrayList<MaincatinfoDto> list = (ArrayList<MaincatinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<School_School> getSchool_info() {
		String hql = "from School_School";
		ArrayList<School_School> list = (ArrayList<School_School>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<SectioninfoDto> getSection_info() {
		String hql = "SELECT NEW com.school.dto.SectioninfoDto(s.name as School,sd.name as Standard,sm.name as Section) from School_Section sm,School_Standard sd,School_School s where sm.standard_id=sd.id and sm.school_id=s.id";
		ArrayList<SectioninfoDto> list = (ArrayList<SectioninfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<StandardinfoDto> getStandard_info() {
		String hql = "SELECT NEW com.school.dto.StandardinfoDto(s.name as School,sd.name as Standard) from School_Standard sd,School_School s where sd.school_id=s.id";
		ArrayList<StandardinfoDto> list = (ArrayList<StandardinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<SubcatinfoDto> getSub_category_info() {
		String hql = "SELECT NEW com.school.dto.SubcatinfoDto(s.name as subcat,m.name as maincat) from School_Subcategory s,School_Maincategory m where s.subject_id=m.id";
		ArrayList<SubcatinfoDto> list = (ArrayList<SubcatinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<TaginfoDto> getTag_info() {
		String hql = "SELECT NEW com.school.dto.TaginfoDto(tg.name as tag,s.name as School,sd.name as Standard,t.name as Term) from School_Tag tg,School_Standard sd,School_School s,School_Term t where tg.standard_id=sd.id and tg.school_id=s.id and tg.term_id=t.id";
		ArrayList<TaginfoDto> list = (ArrayList<TaginfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<SubcatinfoDto> getcategory_info(String standard) {
		sessionFactory.getCurrentSession().createQuery(standard).executeUpdate();		
		String hql = "SELECT NEW com.school.dto.SubcatinfoDto(s.name as subcat,m.name as maincat) from School_Subcategory s,School_Maincategory m where s.subject_id=m.id";
		ArrayList<SubcatinfoDto> list = (ArrayList<SubcatinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<TerminfoDto> getTerm_info() {
		String hql = "SELECT NEW com.school.dto.TerminfoDto(t.name as Term,s.name as School,sd.name as Standard) from School_Term t,School_Standard sd,School_School s where t.school_id=s.id and t.standard_id=sd.id";
		ArrayList<TerminfoDto> list = (ArrayList<TerminfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}	
	@Override
	public void saveUser(Auth_User ua) {		
		sessionFactory.getCurrentSession().saveOrUpdate(ua);
	}
	@Override
	public void save_student(School_Student ss) {		
		sessionFactory.getCurrentSession().saveOrUpdate(ss);
	}
	
	@Override
	public void saveUser_profile(User_Profile up) {		
		sessionFactory.getCurrentSession().saveOrUpdate(up);
	}
	@Override
	public int getStandard_id(String string) {
		String hql = "Select id from School_Standard where name='" + string + "'";		
		Integer sid=(Integer)sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
		return sid;
	}	
	@Override
	public int getSection_id(String string, int standard_id) {
		String hql = "Select id from School_Section where name='" + string + "'and standard_id='"+standard_id+"'";
		Integer sid=(Integer)sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
		 return sid;
	}
	@Override
	public int getSchool_house_id(String parameter) {
		
		String hql = "Select id from School_Schoolhouse where name='" + parameter + "'";		
		Integer sid=(Integer)sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
		return sid;
	}
	@Override
	public ArrayList<StudentinfoDto1> getstudent_info_view() {
		String hql = "SELECT NEW com.school.dto.StudentinfoDto1(a.username,a.first_name as student_name,a.last_name as student_lastname, s.roll_no as roll_no,s.academic_year as academic_year,ss.name as standard,sec.name as section,s.report_to_email as mail,s.standard_id as standard_id,s.date_of_birth as dob) from School_Student s,Auth_User a,School_Standard ss,School_Section sec where s.user_id=a.id and s.standard_id=ss.id and s.section_id=sec.id";
		ArrayList<StudentinfoDto1> list = (ArrayList<StudentinfoDto1>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<Student_Admission> getadmission_info_view() {
		String hql = "from Student_Admission ";
		ArrayList<Student_Admission> list = (ArrayList<Student_Admission>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public ArrayList<StaffinfoDto> getstaff_info_view() {
		String hql = "SELECT NEW com.school.dto.StaffinfoDto(a.first_name as staff_name,s.employee_code as emp_no,s.date_of_joining as date_of_join,dept.name as department,desg.name as designation) from School_Staff s,Auth_User a,School_Designation desg,School_Department dept where s.user_id=a.id and s.department_id=dept.id and s.designation_id=desg.id";
		ArrayList<StaffinfoDto> list = (ArrayList<StaffinfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Integer> getmarksheets_assessmentsgradeno(Integer standard_id,int rollno, int term1) {
		String hql = "select ma.grade_id as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.term_id='"+term1+"' and ma.grade_id=g.id order by ma.tag_id,ma.subject_id";
		List<Integer> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public ArrayList<School_Tag> tag_update(String tag) {
		try {
		Class.forName("com.mysql.jdbc.Driver");		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","tiger");
		Statement stmt=con.createStatement(); 		  
		stmt.executeUpdate(tag);
		} catch (ClassNotFoundException e) {		
		} catch (SQLException e) {			
		}
		return null;
	}

	@Override
	public List<String> getmarksheets_studentgrade(Integer standard_id,int rollno) {
		String hql = "select g.name as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and grade_id!=0 and ma.grade_id=g.id order by ma.term_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<String> getmarksheets_studentnotes(Integer standard_id,int rollno) {
		String hql = "select notes from Marksheets_Assessments where standard_id='"+standard_id+"' and student_id='"+rollno+"' and notes!=' 'order by tag_id,subject_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<String> getmarksheets_studentterm1grade(Integer standard_id,int rollno,int term_id) {
		String hql = "select grade from Marksheets_Evaluation where standard_id='"+standard_id+"' and student_id='"+rollno+"' and term_id='"+term_id+"' order by id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<String> getmarksheets_studentterm2grade(Integer standard_id,int rollno,int term_id) {
		String hql = "select grade from Marksheets_Evaluation where standard_id='"+standard_id+"' and student_id='"+rollno+"' and term_id='"+term_id+"' order by id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Integer> getsid(Integer standard_id, String rno, String name) {
		System.out.println(standard_id+"***"+rno+"***"+name);
		String hql = "select ss.id from School_Student ss,Auth_User au where ss.standard_id='"+standard_id+"' and ss.roll_no='"+rno+"' and au.first_name='"+name+"' and ss.user_id=au.id order by ss.id";
		List<Integer> list = sessionFactory.getCurrentSession().createQuery(hql).list();

		return list;
	}

	@Override
	public List<String> getmarksheets_assessmentsnew(Integer standard_id, int rollno,int term_id, int tag_id, int sub_id) {
		//System.out.println("standard::"+standard_id+"::rno::"+rollno+"::tag::"+tag_id);
		String hql = "select g.name as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.tag_id='"+tag_id+"' and grade_id!=0 and ma.grade_id=g.id group by ma.subject_id order by ma.subject_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<Marksheets_Assessments> getmarksheets_assessmentsnewtag_id(Integer standard_id, int rollno, int id, int id2,int i) {
		String hql = " from Marksheets_Assessments ma where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.tag_id='"+id2+"' and grade_id!=0 group by ma.subject_id order by ma.subject_id";
		List<Marksheets_Assessments> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public String getmarksheets_assessmentsnewover(Integer standard_id,int rollno) {
		String hql = "select g.name as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.grade_id!=0 and ma.grade_id=g.id order by ma.tag_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		if(list.isEmpty()){
			return " ";
		}else{return list.get(0);}
	}

	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet1(
			Integer standard_id, int rollno, int id, int id2) {
		String hql = "from Marksheets_Evaluation where standard_id='"+standard_id+"' and subject_id='"+id2+"' and student_id='"+rollno+"' and term_id='"+id+"' order by skills_id";
		List<Marksheets_Evaluation> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgradet(
			Integer standard_id, int rollno, int id, int id2) {
		////System.out.println(standard_id+"::"+id2+"::"+rollno);
		String hql = "from Marksheets_Evaluation where standard_id='"+standard_id+"' and subject_id='"+id2+"' and student_id='"+rollno+"' order by skills_id";
		List<Marksheets_Evaluation> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Integer> getmarksheets_assessmentsgradeid(Integer standard_id,
			int rollno, int id, int id2, int id3) {
		String hql = "select grade_id from Marksheets_Assessments where standard_id='"+standard_id+"' and student_id='"+rollno+"' and tag_id='"+id2+"' and grade_id!=0 group by subject_id order by subject_id";
		List<Integer> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<String> getmarksheets_assessmentsnewpdf(Integer standard_id,Integer rollno, int term_id, int tag_id, int sub_id) {
		String hql = "select g.name as name from Marksheets_Assessments ma,School_Grade g where ma.standard_id='"+standard_id+"' and ma.student_id='"+rollno+"' and ma.tag_id='"+tag_id+"' and ma.subject_id='"+sub_id+"' and grade_id!=0 and ma.grade_id=g.id group by ma.subject_id order by ma.subject_id";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Integer> getsid(String standard) {
		String hql = "select id from School_Standard where name='"+standard+"'";
		List<Integer> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<String> getsid(Integer standard_id) {
		String hql = "select name from School_Standard where id='"+standard_id+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public List<Marksheets_Evaluation> getmarksheets_evaluationgrade9(
			Integer standard_id, int sub_id, int rollno) {
		String hql = "from Marksheets_Evaluation where standard_id='"+standard_id+"' and subject_id='"+sub_id+"' and student_id='"+rollno+"' order by skills_id";
		List<Marksheets_Evaluation> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<promotioninfoDto> getpromotionlist(int standard) {
		String hql = "SELECT NEW com.school.dto.promotioninfoDto(a.first_name as student_name,s.roll_no as roll_no,s.id as student_id) from School_Student s,Auth_User a where s.user_id=a.id  and s.standard_id='"+standard+"'";
		ArrayList<promotioninfoDto> list = (ArrayList<promotioninfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public List<promotioninfoDto> getpromotedlist(int student_id) {
		String hql = "SELECT NEW com.school.dto.promotioninfoDto(a.first_name as student_name,s.roll_no as roll_no,s.id as student_id) from School_Student s,Auth_User a where s.user_id=a.id  and s.id='"+student_id+"'";
		ArrayList<promotioninfoDto> list = (ArrayList<promotioninfoDto>) sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}
	@Override
	public int updatepromotionlist(String student_id, String to_standard,String academic_year) {
		String hql = "update School_Student set standard_id='"+to_standard+"',academic_year='"+academic_year+"' where id='"+student_id+"'";
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
		return 0;
	}

	@Override
	public List<String> getyear(int rollno) {
		String hql = "select academic_year from School_Student where id='"+rollno+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public Integer getUser_id(String username) {
		Integer user_id = null;
		/*try{
		 user_id=(Integer) sessionFactory.getCurrentSession().get(Auth_User.class, username);
		 //System.out.println("USer id is");
		}
		catch(NullPointerException ne){
			//System.out.println("Id not returned");
			ne.printStackTrace();
			
		}*/
		try{
		String hql="Select id from Auth_User au where au.username='"+username+"'";
		user_id=(Integer)sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
		//System.out.println("User id in dao>>>>>>>>>>>>"+user_id);
		}
		catch(NullPointerException ne){
			//System.out.println("Id not returned");
			ne.printStackTrace();
			
		}
		
		return user_id;
	}

	@Override
	public Auth_User getAuth_User(Integer user_id) {
		
		Auth_User au=(Auth_User) sessionFactory.getCurrentSession().get(Auth_User.class, user_id);
		/////System.out.println(au);
		return au;
	}

	@Override
	public School_Student getStudentInfo(Integer user_id) {
		
		String query="select id from School_Student ss Where ss.user_id='"+user_id+"'";
		Integer ssid= (Integer) sessionFactory.getCurrentSession().createQuery(query).list().get(0);
		//System.out.println("ssis id>>>>>"+ssid);
		School_Student ss=(School_Student)sessionFactory.getCurrentSession().get(School_Student.class, ssid);
		return ss;
	}

	@Override
	public User_Profile getUserProfile(Integer user_id) {
		//System.out.println(user_id);
		User_Profile up = null;
		Integer upid = null;
		String query="select id from User_Profile ss Where ss.user_id='"+user_id+"'";
		try{
		upid= (Integer) sessionFactory.getCurrentSession().createQuery(query).list().get(0);
		//System.out.println("ssis id>>>>>"+upid);
	
		up=(User_Profile)sessionFactory.getCurrentSession().get(User_Profile.class, upid);
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		
		return up;
	}
	@Override
	public List<String> getdob(int rollno) {
		String hql = "select date_of_birth from School_Student where id='"+rollno+"'";
		List<String> list = sessionFactory.getCurrentSession().createQuery(hql).list();
		return list;
	}

	@Override
	public void deleteStudent(Integer user_id) {
		// TODO Auto-generated method stub
		
		
				org.hibernate.classic.Session session = sessionFactory
						.getCurrentSession();
						String hql="delete School_Student i where i.user_id='"+user_id+"'";
						session.createQuery(hql).executeUpdate();
			}

	

	@Override
	public void deleteAuth_User(Integer user_id) {
		// TODO Auto-generated method stub
		org.hibernate.classic.Session session = sessionFactory
				.getCurrentSession();
				String hql="delete Auth_User i where i.id='"+user_id+"'";
				session.createQuery(hql).executeUpdate();
	}

	@Override
	public void deleteUser_Profile(Integer user_id) {
		// TODO Auto-generated method stub
		org.hibernate.classic.Session session = sessionFactory
				.getCurrentSession();
				String hql="delete User_Profile i where i.user_id='"+user_id+"'";
				session.createQuery(hql).executeUpdate();
	}

	@Override
	public String getSectionName(int section, int standard) {
		
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="Select name From School_Section where id= '"+section+"' and standard_id='"+standard+"'";
		String section_name=(String) sessionFactory.getCurrentSession().createQuery(hql).list().get(0);
		//System.out.println(section_name+"*****");
		
		return section_name;
	}

	@Override
	public String getStd_name(int standard) {
		
		org.hibernate.classic.Session session = sessionFactory
		.getCurrentSession();
		String hql="Select name From School_Standard where id= '"+standard+"'";
		String std_name=(String)session.createQuery(hql).list().get(0);
		
		
		return std_name;
	}

	
}
	
	


