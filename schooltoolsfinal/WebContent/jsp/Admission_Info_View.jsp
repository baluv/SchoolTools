
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Student List Of Admissions</title>
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
<br><h1>Student List Of Admissions</h1><br>
<div style="float:right;margin-bottom:-5px">
		<a href="admission.html?user=${user}&username=${username}"><img src="../images/add.png" height="17px" width="17px" alt="add"><div style="float:right;margin-bottom:-5px">New Record</div></a>
	</div>
	<br/>
	<div id="demo_jui">
<table id="companies" class="display">
	<thead>
		<tr>
			<th>Student Name</th>
			<th>Standard</th>
			<th>Date Of Birth</th>
			<th>Blood Group</th>
			<th>Father's Name</th>
			<th>Action</th>					
		</tr>
	</thead>
	<tbody>
		
		
		<c:forEach items="${list}" var="student">		
		<tr class="odd">
			<td><c:out value="${student.name}"></c:out></td>
			<td><c:out value="${student.std_name}"></c:out></td>
			<td><c:out value="${student.dob}"></c:out></td>
			<td><c:out value="${student.bloodgroup}"></c:out></td>
			<td><c:out value="${student.father_name}"></c:out></td>
			
			<td><a href="#" style="text-decoration:none;">View</a></td>			
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