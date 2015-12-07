
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Home</title>
</head>
<body>				
<div class="container">
<c:url var="checkLoginURL" value="/school123/marksheetentryview.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">

		<br>
		<div class="framelayout">
		<h1><strong>Student History of ${name}</strong></h1>
		<hr>
		<table style="border:0px solid #999999;">
			<tbody><tr>
				<td style="width:25%;">Student Name:</td>
				<td style="width:25%;">${name}</td>
				<td style="width:50%;">
				<input type="hidden" value="${name}" name="name" id="name"/>
				<input type="hidden" value="${standard}" name="standard" id="standard"/>
				<input type="hidden" value="${user}" name="user" id="user"/>
				<input type="hidden" value="${username}" name="username" id="username"/>
				<input type="hidden" value="${standard_id}" name="standard_id" id="standard_id"/>
				<input type="hidden" value="${dob}" name="dob" id="dob"/>
				<input type="hidden" value="${Rollno}" name="Rollno" id="Rollno"/>
				</td>
				
			</tr>
			
			<tr>
				<td style="width:25%;">Student Standard:</td>
				<td style="width:25%;">${standard}</td>
				<td style="width:50%;"></td>
			</tr>
			<tr>
				<td style="width:25%;">Select Standard to view history:</td>
				<td style="width:25%;">
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
				<td style="width:50%;"></td>
			</tr>
				 
			<tr>
				<td style="width:25%;"></td>	
				<td style="width:25%;"><input type="submit" value="View History"></td>
				<td style="width:50%;"></td>
				
			</tr>
		</tbody></table>
		
		<hr>
	</div></form:form>
</div>

			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		 <br>
				
		</div>

</body>
</html>