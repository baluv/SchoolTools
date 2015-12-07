
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Home</title>
</head>
<body>				
<div class="container">
	<div class="span-10 append-1">
			
		<div class="span-2" style="text-align:right;"><img src="../images/master_setup.JPG"></div>
		<div class="span-7">
			<h4><strong>Master Setup</strong></h4>
			<ul>
				<li><a href="#">Country Info</a></li>	
				<li><a href="#">Nationality Info</a></li>
				<li><a href="#">State Info</a></li>
				<li><a href="#">Religion Info</a></li>
				<li><a href="#">Affiliation Info</a></li>
				<li><a href="#">Main Caste Info</a></li>
				<li><a href="#">Sub Caste Info</a></li>
				<li><a href="#">Extra Curricular Info</a></li>
			<ul>
		</ul></ul></div>
		<!--<div class="span-2" style="text-align:right;"><img src="/site_media/img/school_admission.jpg"/></div>
		<div class="span-7">
			<h4><strong>School Settings Dummy</strong></h4>
			<ul>
				<li><a href="">School Info</a></li>
			<ul>
		</div> -->
		
		<div class="span-2" style="text-align:right;"><img src="../images/school_admission.jpg"></div>
		<div class="span-7">
			<h4><strong>School Setup</strong></h4>
			<ul>
				<li><a href="School_info.html?user=${user}&username=${username}">School Info</a></li>
				<li><a href="Standard_info.html?user=${user}&username=${username}">Standard Info</a></li>
				<li><a href="Section_info.html?user=${user}&username=${username}">Section Info</a></li>
				<li><a href="House_info.html?user=${user}&username=${username}">House Info</a></li>
				<li><a href="Department_info.html?user=${user}&username=${username}">Department Info</a></li>
				<li><a href="Designation_info.html?user=${user}&username=${username}">Designation Info</a></li>
				<li><a href="Term_info.html?user=${user}&username=${username}">Term Info</a></li>
				<li><a href="Tag_info.html?user=${user}&username=${username}">Tag Info</a></li>
				<li><a href="Grade_info.html?user=${user}&username=${username}">Grade Info</a></li>
				<li><a href="Main_category_info.html?user=${user}&username=${username}">Main Category Info</a></li>
				<li><a href="Sub_category_info.html?user=${user}&username=${username}">Sub Category Info</a></li>
			<ul>
		</ul></ul></div>
		
	</div>		

	<div class="span-12 last">
		
		<div class="span-10" style="margin-bottom:10px;">
			<div class="span-2" style="text-align:right;"><img src="../images/staff_icon.jpg"></div>
			<div class="span-7">
			<h4><strong>Staff Info</strong></h4>
			<ul>
				<li><a href="staff_view.html?user=${user}&username=${username}">Staff</a><br></li>
			</ul>				 
			</div>
		</div>
		
		<div class="span-10" style="margin-bottom:10px;">
			<div class="span-2" style="text-align:right;"><img src="../images/student.jpg"></div>
			<div class="span-7">
			<h4><strong>Student Info</strong></h4>
			<ul>
				<li><a href="student_info_view.html?user=${user}&username=${username}">Student</a></li>
			</ul>				 
			</div>
		</div>
		
		<div class="span-10" style="margin-bottom:10px;">
			<div class="span-2" style="text-align:right;"><img src="../images/school_icon.jpg"></div>
			<div class="span-7">
				<h4><strong>Student Marksheets</strong></h4>
				<ul>
					<li><a href="markssheet.html?user=${user}&username=${username}">Studentwise Marks Entry</a></li>
					<li><a href="markssheetreport.html?user=${user}&username=${username}">Studentwise Marksheet View</a></li>
				<ul>
			</ul></ul></div>
		</div>	
		
		<div class="span-10" style="margin-bottom:10px;">
			<div class="span-2" style="text-align:right;"><img src="../images/admission.jpg"></div>
			<div class="span-7">
				<h4><strong>Admission</strong></h4>
				<ul>
					<li><a href="admission_view.html?user=${user}&username=${username}">Student Admission List</a></li>
					<li><a href="viewadmission.html?user=${user}&username=${username}">View Admission List</a></li>
				<ul>
			</ul></ul></div>
		</div>	
		<div class="span-10" style="margin-bottom:10px;">
			<div class="span-2" style="text-align:right;"><img src="../images/health.jpg"/></div>
			<div class="span-7">
				<h4><strong>Health Status</strong></h4>
				<ul>
					<li><a href="health.html?user=${user}&username=${username}">Student Health List</a></li>
					<li><a href="#">View Health List</a></li>
					
				</ul>
			</div>
		</div>	
	</div>
</div>

			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		 <br>
				
		</div>
	<!-- container -->

</body>
</html>