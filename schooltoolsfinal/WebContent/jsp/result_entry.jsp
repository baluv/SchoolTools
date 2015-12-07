
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Home</title>
</head>
<body>				
<div class="container">
<br>
		<div class="framelayout">
	<c:url var="checkLoginURL" value="/school123/result_entry.html"/> 
	<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">
		
		<h1><strong>Student Results Entry</strong></h1>
		
		<table style="border:0px solid #999999;">
			<tbody><tr style="border:0">
				<td style="width:25%;border:0">Select Standard to promote</td>
				<td style="width:10%;border:0">
				<input type="hidden" value="${username}" name="username" id="username"/>
				<input type="hidden" value="${user}" name="user" id="user"/>
			
					<select name="standards">
						
							<option value="1">I</option>
						
							<option value="2">II</option>
						
							<option value="3">III</option>
						
							<option value="4">IV</option>
						
							<option value="5">V</option>
						
							<option value="6">VI</option>
						
							<option value="7">VII</option>
						
							<option value="8">VIII</option>
						
							<option value="9">IX</option>
						
							<option value="10">X</option>
						
							<option value="11">XI</option>
						
							<option value="12">PRE-KG</option>
						
							<option value="13">LKG</option>
						
							<option value="14">UKG</option>
						
							<option value="15">XII</option>
						
							<option value="16">LKG</option>
						
							<option value="17">Clg</option>
						
							<option value="18">PUC2</option>
						
							<option value="19">PUC1</option>
						
					</select>
				</td>
				<td style="width:10%;border:0"><input type="submit" value="Go"></td>
				<td style="width:55%;border:0"></td>
			</tr>
		</tbody></table>
		</form:form>
		<hr>
		<h3>Students list of  standard </h3>
		<hr>
	<c:url var="checkLoginURL" value="/school123/result_promote.html"/> 
	<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">
	 
				<table style="border:5px;">
		<tbody><tr style="background:#99B3FF">
			<th> Check</th>
			<th> Roll No</th>
			<th> Student Name </th>
		</tr>
		
		
		<c:forEach items="${list}" var="student">
			<tr>
				<td><input type="checkbox" name="check" value="${student.student_id}" class="promote_check"> </td>
				<td><c:out value="${student.roll_no}"></c:out>
					<input type="hidden" value="${student.student_name}" name="name" id="name"/>
					<input type="hidden" value="${student.roll_no}" name="roll_no" id="roll_no"/>
				</td>
				<td><label name="username"><c:out value="${student.student_name}"></c:out></label></td>
				
			</tr>
			</c:forEach>
		
			<tr>
				<td><input type="checkbox" name="check" value="2095" class="promote_check"> </td>
				<td> **</td>
				<td><label name="username">ritwikpateriya</label></td>
				
			</tr>
			
		
		</tbody></table>
		<table style="background:#99B3FF;float:left;">
			<tbody><tr>
				<th style="width:20%">
				</th><th style="width:15%"> Promoted to :</th>
				<th style="width:10%"><select name="standards1">
						<option value="1">I</option>
						
						<option value="2">II</option>
						
						<option value="3">III</option>
						
						<option value="4">IV</option>
						
						<option value="5">V</option>
						
						<option value="6">VI</option>
						
						<option value="7">VII</option>
						
						<option value="8">VIII</option>
						
						<option value="9">IX</option>
						
						<option value="10">X</option>
						
						<option value="11">XI</option>
						
						<option value="12">PRE-KG</option>
						
						<option value="13">LKG</option>
						
						<option value="14">UKG</option>
						
						<option value="15">XII</option>
						
						<option value="16">LKG</option>
						
						<option value="17">Clg</option>
						
						<option value="18">PUC2</option>
						
						<option value="19">PUC1</option>
						
					</select>
				 </th>
				 <th style="width:10%"><input type="submit" value="submit"></th>
				 <th style="width:45%"></th>
			</tr>
		</tbody></table>
		</form:form>
	</div></div>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		 <br>
				
		</div>
	<!-- container -->

</body>
</html>