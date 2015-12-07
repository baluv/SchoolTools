
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Student Info</title>
<link rel="stylesheet" href="../css/datatable.css" type="text/css">
<link rel="stylesheet" href="../css/jquery.ui.google.css" type="text/css">
<link rel="stylesheet" href="../css/screen.css" type="text/css" media="screen, projection"></link>
<link rel="stylesheet" href="../css/tabmenu.css" type="text/css" media="screen"></link>
<link rel="stylesheet" href="../css/skin1.css" type="text/css" media="screen"></link>
<script type="text/javascript" src="../js/savetheenvironment.js"></script>
<link rel="stylesheet" href="../css/savetheenvironment.css" type="text/css">
<link href="../media/themes/base/jquery-ui.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="../media/themes/smoothness/jquery-ui-1.7.2.custom.css"
	rel="stylesheet" type="text/css" media="all" />
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>


</head>

<body>
	<!-- container -->
	<div id="wrapper">	
			<!-- c -->
			<div id="content">
<div class="container">
<br><h1>Student Info</h1><br>
<div style="float:right;margin-bottom:-5px">
		<a href="student_profile.html?user=${user}&username=${username}"><img src="../images/add.png" height="17px" width="17px" alt="add"><div style="float:right;margin-bottom:-5px">New Record</div></a>
	</div>
	<br/>
	<div id="demo_jui">
<table id="companies" class="display">
	<thead>
		<tr>
			
			<th>First Name</th>
			<th>Last Name</th>
			<th>Roll No</th>
			<th>Academic Year</th>
			<th>Standard</th>
			<th>Section</th>
			<th>Report To</th>
			<th>Options</th>
		
			
		
			
		</tr>
	</thead>
	<tbody>
		
		
		<c:forEach items="${list}" var="student">		
		<tr class="odd">
			
			<td><c:out value="${student.student_name}"></c:out></td>
			<td><c:out value="${student.student_lastname}"></c:out></td>
			<td><c:out value="${student.roll_no}"></c:out></td>
			<td><c:out value="${student.academic_year}"></c:out></td>
			<td><c:out value="${student.standard}"></c:out></td>
			<td><c:out value="${student.section}"></c:out></td>
			<td><c:out value="${student.mail}"></c:out></td>
			<td>
			<div style="border:0px solid #ccc;width:50%">
			<div style="float:right">
					<a href="student_history.html?user=${user}&username=${username}&st_user=${student.username}&standard_id=${student.standard_id}&dob=${student.dob}&name=${student.student_name}&Rollno=${student.roll_no}&standard=${student.standard}" style="text-decoration:none;"><img src="../images/history.jpg" height="22px" width="30px" alt="History"></a>
			</div>	
			<div style="float:left">
					<a href="student_edit.html?user=${user}&username=${username}&st_user=${student.username}&standard_id=${student.standard_id}&dob=${student.dob}&name=${student.student_name}&Rollno=${student.roll_no}&standard=${student.standard}" style="text-decoration:none;"><img src="../images/edit.png" height="17px" width="17px" alt="Edit"></a>
			</div>
			  <a href="deleteStudent.html?st_user=${student.username}"onclick="return confirm('Are you sure you want to delete?')">Delete</a> 
						
			</div>
		</td>
		</tr>
		</c:forEach>
		
		
	</tbody>
	
</table>
</div>			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		 <br>
				
		</div>
		<!-- f -->
	</div>
	<!-- container -->

</body>
</html>