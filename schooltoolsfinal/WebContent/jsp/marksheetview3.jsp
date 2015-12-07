<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@page import="java.util.List"%>
 <%@page import="com.school.domain.*"%>
 <%@page import="com.school.dao.*"%>
 <%@include file="include.jsp"%>
<!-- saved from url=(0053)http://192.168.0.6:82/marksheets/marks/entry/510/1/2/ -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">
<head>

<title> SchoolTools | Student Marks Report for - <%= request.getParameter("name") %> </title>
<style>
	#studentinfotop td{
		border:0px;
	}
	
</style>
<style>
	table th {
		border:1px solid #aaa;
		background-color:#3B5998;
		color:#fff;
		text-align:center;
	}
	table td {
		border:1px solid #ccc;
	}
</style>
<script src="../js/ModalPopupWindow.js" type="text/javascript"></script>
<script>
 var modalWin = new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("../images/loading.gif");
 modalWin.SetCloseButtonImagePath("../images/remove.gif");
function ShowNewPage(){
 modalWin.ShowURL('popup.html?standard_id=${standard_id}&dob=${dob}&student_name=${student_name}&rollno=${rollno}&standard=${standard}',320,470,'Email');
 }
 </script>
</head>


<body onload="" onunload="">
<%
	String studentName=request.getParameter("name");
	String rno=request.getParameter("Rollno");
	String standardId=request.getParameter("standard");
	int standard_Id=Integer.parseInt(request.getParameter("standard_id"));
	if(rno.equalsIgnoreCase("**")){
	rno="0";
	}
	int rollno=Integer.parseInt(rno);
	session.setAttribute("rollNumber", rollno);
	session.setAttribute("standardId", standardId);
	session.setAttribute("standard_Id", standard_Id);
%>
		
<c:url var="checkLoginURL" value="/school123/entrymarksheet.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">
<div class="container">

	<div style="border:0px solid #999;background-color:#fff;width:80%;margin:0 auto;margin-bottom:0.5em">
	
		<div style="float:left;">
			<img height="150px" width="200px" src="../images/logo_aecs.jpg" alt="School Emblem">
			
		</div>
		
		<div style="float:right;">
			<strong>
				AECS MAGNOLIA MAARUTI PUBLIC SCHOOL<br>
			</strong>
			
				#36/909,
			
			
				Arekere, <br>
			
			
				Bannerghatta Road,
			
			
			Bangalore - 500076,<br>
			Karnataka (KA), India,<br>
			<strong>Phone:</strong> 91-80-26485622/,
			
				<strong>Fax:</strong> + 91.80.26536324, <br>
			
			<strong>Email:</strong> magnoliamaaruti@aecsgroup.in, <br>
			<strong>Website:</strong> http://www.aecsgroup.in/.
		</div>
	</div>
	<div class="clear"></div>
		
<div class="framelayout" style="width:80%">
	
	<div style="border:0px solid #999;width:90%;margin:0 auto">
	<center>
			<h2>Student Assessment View</h2>
			<h3>2014-15</h3><br>
	</center>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:0px;">
		<table style="border:0;width:50%;float:left;" id="studentinfotop">
			<tbody><tr>
				<td style="20%"><strong> Student Name: </strong></td><td>:${student_name} </td> 
				<td><strong> Date Of Birth </strong></td><td>:${dob}</td>
			</tr>
			<tr>
				<td><strong>Standard </strong></td><td>:${standard}</td> 
				<!--<td> <strong>Roll No</strong> </td><td>:08</td>-->
			</tr>
			<!--<tr>
				<td> <strong>Admission No</strong></td><td>:249 / 2011 - 12</td> 
				<td> </td><td></td>
			</tr>-->
		</tbody></table> 
		
		
	</div>	
	
	
	</div></div></form:form>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		
				
		</div>
	<!-- container -->

</body></html>