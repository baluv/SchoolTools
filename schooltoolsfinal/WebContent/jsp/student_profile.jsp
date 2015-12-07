<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@include file="include.jsp"%>
<!-- saved from url=(0053)http://192.168.0.6:82/marksheets/marks/entry/510/1/2/ -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">
<head>


<script type="text/javascript"
	src="../jqueryValidations/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="../jqueryValidations/jquery.validate.js"></script>
<script src="../jqueryValidations/formValidation.js"
	type="text/javascript"></script>
<link href="../jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/format.js"></script>

<script type="text/javascript" src="../js/jquery-ui.js"></script>

<link href="../style.css" rel="stylesheet" type="text/css" />
<link href="../textbox.css" rel="stylesheet" type="text/css" />
 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Student Profile</title>
</head>
<body onload="" onunload="">
	<!-- container -->
	<div id="wrapper">
		
		<!-- c -->
			<div id="content">
<div class="container">
	
<c:url var="checkLoginURL" value="/school123/save_student_profile.html"/> 
<form:form action="${checkLoginURL}" method="post" id="School_Student" commandName="School_Student">

		
		<div class="framelayout">
		<h3><font color="red">${msg }</font></h3>
		<h1><strong>Create New Student User</strong></h1>
		<table style="border:0px solid #ccc;">
	<tbody>
	<tr>
	<td>
			<input type="hidden" name="auid" value="${au.id}"/> 
			<input type="hidden" name="ssid" value="${ss.id}"/>
			<input type="hidden" name="upid" value="${up.id}"/>
			</td></tr><tr>	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_first_name">First Name</label></td>
		<td>
			<input type="text" name="first_name" value="${au.first_name}" id="id_first_name"/> &nbsp;<span style="color:red;">*</span>
			</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_last_name">Last Name</label></td>
		<td>
			<input type="text" name="last_name" value="${au.last_name}" id="id_last_name"> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_email">Email</label></td>
		<td>
			<input type="text" name="email" value="${au.email}" id="id_email"> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_username">Username</label></td>
		<td>
			<input id="id_username" type="text" name="username" value="${au.username}" maxlength="30" /> &nbsp;<span style="color:red;">*</span>
			
			</td></tr><tr><td></td><td><div class="helptext">Required. 30 characters or fewer. Letters, digits and @/./+/-/_ only.</div></td></tr>
			
		
	
	
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_password1">Password</label></td>
		<td>
			<input type="password" name="password" value="${au.password}" id="id_password1"/> &nbsp;<span style="color:red;">*</span>
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_password2">Password confirmation</label></td>
		<td>
			<input type="password" name="password2" value="${au.password}" id="id_password2"/> &nbsp;<span style="color:red;">*</span>
			
			</td></tr><tr><td></td><td><div class="helptext">Enter the same password as above, for verification.</div></td></tr>
			
		
	
	
	<tr>
	
	
	</tr>
</tbody></table>
		</div>
		
		<br/>
		<div class="framelayout">
		<h1><strong>Create New Student Info</strong></h1>
		<table style="border:0px solid #ccc;">
	<tbody><tr>
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_application_no">Application Number</label></td>
		<td>
			<input id="id_application_no" type="text" name="application_no" value="${ss.application_no}" maxlength="255"/> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_admission_no">Admission Number</label></td>
		<td>
			<input id="id_admission_no" type="text" name="admission_no" value="${ss.admission_no}" maxlength="255"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_roll_no">Roll Number</label></td>
		<td>
			<input id="id_roll_no" type="text" name="roll_no" value="${ss.roll_no }" maxlength="255"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_academic_year">Academic Year</label></td>
		<td>
			<input id="id_academic_year" type="text" name="academic_year" value="${ss.academic_year }" maxlength="11"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_standard">Standard</label></td>
		<td>
			<select name="standard_id" id="id_standard_id" value="${ss.standard_id }">
				<option value="0">---------</option>
				<c:set var="standard_id" value="${ss.standard_id}"/>				
				<c:if test="${standard_id eq 1}">
					<option value="${standard_id}" selected="selected">I</option>
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 2}">					
					<option value="1">I</option>
					<option value="${standard_id}" selected="selected">II</option>
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 3}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="${standard_id}" selected="selected">III</option>
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 4}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="${standard_id}" selected="selected">IV</option>
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if><c:if test="${standard_id eq 5}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="${standard_id}" selected="selected">V</option>
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 6}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="5">V</option>
					<option value="${standard_id}" selected="selected">VI</option>
					<option value="7">VII</option>
					<option value="8">VIII</option>
					<option value="9">IX</option>
					<option value="10">X</option>
					<option value="11">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 7}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="5">V</option>
					<option value="6">VI</option>
					<option value="${standard_id}" selected="selected">VII</option>
					<option value="8">VIII</option>
					<option value="9">IX</option>
					<option value="10">X</option>
					<option value="11">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 8}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="5">V</option>
					<option value="6">VI</option>
					<option value="7">VII</option>
					<option value="${standard_id}" selected="selected">VIII</option>
					<option value="9">IX</option>
					<option value="10">X</option>
					<option value="11">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 9}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="5">V</option>
					<option value="6">VI</option>
					<option value="7">VII</option>
					<option value="8">VIII</option>					
					<option value="${standard_id}" selected="selected">IX</option>
					<option value="10">X</option>
					<option value="11">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 10}">
					<option value="1">I</option>
					<option value="2">II</option>
					<option value="3">III</option>
					<option value="4">IV</option>
					<option value="5">V</option>
					<option value="6">VI</option>
					<option value="7">VII</option>
					<option value="8">VIII</option>
					<option value="9">IX</option>
					<option value="${standard_id}" selected="selected">X</option>
					<option value="11">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 11}">
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
					<option value="${standard_id}" selected="selected">XI</option>
					<option value="12">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 12}">
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
					<option value="${standard_id}" selected="selected">PRE-KG</option>
					<option value="13">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 13}">
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
					<option value="${standard_id}" selected="selected">LKG</option>
					<option value="14">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 14}">
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
					<option value="${standard_id}" selected="selected">UKG</option>
					<option value="15">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 15}">
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
					<option value="${standard_id}" selected="selected">XII</option>
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 18}">
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
					<option value="${standard_id}" selected="selected">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>
				<c:if test="${standard_id eq 19}">
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
					<option value="18">PUC2</option>
					<option value="${standard_id}" selected="selected">PUC1</option>
				</c:if>
				<c:if test="${(standard_id ne 1) && (standard_id ne 2) && (standard_id ne 3) && (standard_id ne 4) && (standard_id ne 5) && (standard_id ne 6) && (standard_id ne 7) && (standard_id ne 8) && (standard_id ne 9) && (standard_id ne 10) && (standard_id ne 11) && (standard_id ne 12) && (standard_id ne 13) && (standard_id ne 14) && (standard_id ne 15) && (standard_id ne 18) && (standard_id ne 19)}">
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
					<option value="18">PUC2</option>
					<option value="19">PUC1</option>
				</c:if>				
				<!-- <option value="1">I</option>
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
				<option value="18">PUC2</option>
				<option value="19">PUC1</option> -->
		</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_section">Section</label></td>
		<td>
			<select name="section" id="id_section" value="${std_sect}">
				<option value="0">-----</option>
				    <c:set var="std_sect" value="${std_sect}"/>    
				    <c:if test="${std_sect eq 'A'}">
				     <option value="${std_sect}" selected="selected">A</option>
				     <option value="B">B</option>
				     <option value="NONE">NONE</option>
				    </c:if>
				    <c:if test="${std_sect eq 'B'}">
				     <option value="A">A</option>
				     <option value="${std_sect}" selected="selected">B</option>
				     <option value="NONE">NONE</option>
				    </c:if>
				    <c:if test="${std_sect eq 'NONE'}">
				     <option value="A">A</option>
				     <option value="B">B</option>     
				     <option value="${std_sect}" selected="selected">NONE</option>
				    </c:if>
				    <c:if test="${(std_sect ne 'A') && (std_sect ne 'B') && (std_sect ne 'NONE')}">				     
				     <option value="A">A</option>
				     <option value="B">B</option>     
				     <option value="NONE">NONE</option>
				    </c:if>
				<!--<option value="A">A</option>
				<option value="B">B</option>
				<option value="NONE">NONE</option>-->
			</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_schoolhouse">Schoolhouse</label></td>
		<td>
			<select name="schoolhouse_id" value="${ss.schoolhouse_id }" id="id_schoolhouse_id">
				<c:set var="scl_hos" value="${ss.schoolhouse_id}"/>				
				<c:if test="${scl_hos eq 1}">
					<option value="${scl_hos}" selected="selected">Yamuna</option>
					<option value="2">Ganga</option>
					<option value="3">Kaveri</option>
					<option value="4">Godavari</option>
				</c:if>
				<c:if test="${scl_hos eq 2}">
					<option value="1">Yamuna</option>
					<option value="${scl_hos}" selected="selected">Ganga</option>
					<option value="3">Kaveri</option>
					<option value="4">Godavari</option>
				</c:if>
				<c:if test="${scl_hos eq 3}">
					<option value="1">Yamuna</option>
					<option value="2">Ganga</option>
					<option value="${scl_hos}" selected="selected">Kaveri</option>
					<option value="4">Godavari</option>
				</c:if>
				<c:if test="${scl_hos eq 4}">
					<option value="1">Yamuna</option>
					<option value="2">Ganga</option>
					<option value="3">Kaveri</option>
					<option value="${scl_hos}" selected="selected">Godavari</option>
				</c:if>
				<c:if test="${(scl_hos ne 1) && (scl_hos ne 2) && (scl_hos ne 3) && (scl_hos ne 4)}">					
					<option value="1">Yamuna</option>
					<option value="2">Ganga</option>
					<option value="3">Kaveri</option>
					<option value="4">Godavari</option>
				</c:if>
				<!-- <option value="1">Yamuna</option>
				<option value="2">Ganga</option>
				<option value="3">Kaveri</option>
				<option value="4">Godavari</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_student_type">Type of Student</label></td>
		<td>
			<select name="student_type" value="${ss.student_type }" id="id_student_type">
				<c:set var="std_t" value="${ss.student_type}"/>
				<c:if test="${std_t eq 'H'}">
					<option value="${std_t}" selected="selected">Hostalite</option>
					<option value="D">Dayscholar</option>
				</c:if>
				<c:if test="${std_t eq 'D'}">
					<option value="H">Hostalite</option>
					<option value="${std_t}" selected="selected">Dayscholar</option>
				</c:if>
				<c:if test="${(std_t ne 'H') && (std_t ne 'D')}">
					<option value="D">Dayscholar</option>
					<option value="H">Hostalite</option>										
				</c:if>
		</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_mode_of_transport">Mode Of Transport</label></td>
		<td>
			<select name="mode_of_transport" value="${ss.mode_of_transport }" id="id_mode_of_transport">
				<c:set var="std_trp" value="${ss.mode_of_transport}"/>				
				<c:if test="${std_trp eq 'O'}">
					<option value="${std_trp}" selected="selected">Own Vehicle</option>
					<option value="S">School Vehicle</option>
					<option value="OST">One Side Transport</option>
				</c:if>
				<c:if test="${std_trp eq 'S'}">
					<option value="O">Own Vehicle</option>
					<option value="${std_trp}" selected="selected">School Vehicle</option>
					<option value="OST">One Side Transport</option>
				</c:if>
				<c:if test="${std_trp eq 'OST'}">					
					<option value="O">Own Vehicle</option>
					<option value="S">School Vehicle</option>
					<option value="${std_trp}" selected="selected">One Side Transport</option>
				</c:if>
				<c:if test="${(std_trp ne 'S') && (std_trp ne 'O') && (std_trp ne 'OST')}">
					<option value="S">School Vehicle</option>					
					<option value="O">Own Vehicle</option>
					<option value="OST">One Side Transport</option>
				</c:if>
				<!-- <option value="S">School Vehicle</option>
				<option value="O" selected="selected">Own Vehicle</option>
				<option value="OST">One Side Transport</option> -->
			</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_date_of_birth">Date Of Birth</label></td>
		
		<td>
			<input type="text" name="dob" value="${ss.date_of_birth }" id="id_date_of_birth" class="datepicker"/> &nbsp;<span style="color:red;">*YYYY-MM-DD</span>
			
		</td>
		
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_bloodgroup">Blood Group</label></td>
		<td>
			<select name="bloodgroup" value="${ss.bloodgroup }" id="id_bloodgroup">
					<c:set var="bld_grp" value="${ss.bloodgroup}"/>				
				<c:if test="${bld_grp eq 'A+'}">
					<option value="${bld_grp}" selected="selected">A Positive</option>					
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'A-'}">					
					<option value="A+">A Positive</option>
					<option value="${bld_grp}" selected="selected">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'B+'}">				
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="${bld_grp}" selected="selected">B Positive</option>	
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'B-'}">				
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="${bld_grp}" selected="selected">B Negative</option>	
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'AB+'}">					
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="${bld_grp}" selected="selected">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'AB-'}">					
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="${bld_grp}" selected="selected">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'O+'}">				
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="${bld_grp}" selected="selected">O Positive</option>	
					<option value="O-">O Negative</option>
				</c:if>
				<c:if test="${bld_grp eq 'O-'}">				
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="${bld_grp}" selected="selected">O Negative</option>	
				</c:if>
				<c:if test="${(bld_grp ne 'A+') && (bld_grp ne 'A-') && (bld_grp ne 'B+') && (bld_grp ne 'B-') && (bld_grp ne 'AB+') && (bld_grp ne 'AB-') && (bld_grp ne 'O+') && (bld_grp ne 'O-')}">					
					<option value="A+">A Positive</option>
					<option value="A-">A Negative</option>
					<option value="B+">B Positive</option>
					<option value="B-">B Negative</option>
					<option value="AB+">AB Positive</option>
					<option value="AB-">AB Negative</option>
					<option value="O+">O Positive</option>
					<option value="O-">O Negative</option>
				</c:if>
				<!-- <option value="A+">A Positive</option>
				<option value="A-">A Negative</option>
				<option value="B+">B Positive</option>
				<option value="B-">B Negative</option>
				<option value="AB+">AB Positive</option>
				<option value="AB-">AB Negative</option>
				<option value="O+" selected="selected">O Positive</option>
				<option value="O-">O Negative</option> -->
			</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_religion">Religion</label></td>
		<td>
			<input id="id_religion" type="text" name="religion" value="${ss.religion}"maxlength="255"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_community">Community</label></td>
		<td>
			<input id="id_community" type="text" name="community" value="${ss.community }" maxlength="255"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_living_with">Living With</label></td>
		<td>
			<select name="living_with" value="${ss.living_with}" id="id_living_with">
					<c:set var="std_live" value="${ss.living_with}"/>				
				<c:if test="${std_live eq 'P'}">
					<option value="${std_live}" selected="selected">Parents</option>
					<option value="G">Guardian</option>
				</c:if>
				<c:if test="${std_live eq 'G'}">
					<option value="P">Parents</option>
					<option value="${std_live}" selected="selected">Guardian</option>
				</c:if>
				<c:if test="${(std_live ne 'G') && (std_live ne 'P')}">
					<option value="P">Parents</option>
					<option value="G">Guardian</option>
				</c:if>
				<!-- <option value="P" selected="selected">Parents</option>
				<option value="G">Guardian</option> -->
			</select> &nbsp;<span style="color:red;">*</span>

		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_report_to_email">Report To Email</label></td>
		<td>
			<input id="id_report_to_email" type="text" name="report_to_email" value="${ss.report_to_email }" maxlength="75"/></td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_photo">Photo</label></td>
		<td>
			<input type="file" name="photo" id="id_photo"/></td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_allergic_medicine_food">Allergic Medicine</label></td>
		<td>
			<textarea id="id_allergic_medicine_food" rows="10" cols="40" name="allergic_medicine_food" value="${ss.allergic_medicine_food }" resize="false">NA</textarea> &nbsp;<span style="color:red;">*</span>

		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_extracurricular">Extracurricular</label></td>
		<td>
			<select multiple="multiple" name="extracurricular"  id="id_extracurricular">
<option value="1" selected="selected">Chess</option>
</select> &nbsp;<span style="color:red;">*</span>
			
			</td></tr><tr><td></td><td><div class="helptext"> Hold down "Control", or "Command" on a Mac, to select more than one.</div></td></tr>
			
		
	
	
	<tr>
	
	
	</tr>
</tbody></table>
		</div>
		
		<br/>
		<div class="framelayout">
		<h1><strong>Create New User Profile for Student</strong></h1>
		<table style="border:0px solid #ccc;">
	<tbody><tr>
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_school">School</label></td>
		<td>
			<select name="school" id="id_school">
					<option value="">---------</option>
				<c:set var="scl_id" value="${up.school_id}"/>				
				<c:if test="${scl_id eq 1}">
					<option value="${scl_id}" selected="selected">AECS MAGNOLIA MAARUTI PUBLIC SCHOOL</option>
					<option value="2">AECS MAARUTI PU COLLEGE</option>
				</c:if>
				<c:if test="${scl_id eq 2}">
					<option value="1">AECS MAGNOLIA MAARUTI PUBLIC SCHOOL</option>
					<option value="${scl_id}" selected="selected">AECS MAARUTI PU COLLEGE</option>
				</c:if>
				<c:if test="${(scl_id ne 2) && (scl_id ne 1)}">
					<option value="1">AECS MAGNOLIA MAARUTI PUBLIC SCHOOL</option>
					<option value="2">AECS MAARUTI PU COLLEGE</option>
				</c:if>
				<!-- <option value="1">AECS MAGNOLIA MAARUTI PUBLIC SCHOOL</option>
				<option value="2">AECS MAARUTI PU COLLEGE</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_gender">Gender</label></td>
		<td>
			<select name="gender" value="${up.gender}" id="id_gender">
				<c:set var="gender" value="${up.gender}"/>				
				<c:if test="${gender eq 'M'}">
					<option value="${gender}" selected="selected">Male</option>
					<option value="F">Female</option>
				</c:if>
				<c:if test="${gender eq 'F'}">
					<option value="M">Male</option>
					<option value="${gender}" selected="selected">Female</option>
				</c:if>
				<c:if test="${(gender ne 'F') && (gender ne 'M')}">
					<option value="M">Male</option>
					<option value="F">Female</option>
				</c:if>
				<!-- <option value="M" selected="selected">Male</option>
				<option value="F">Female</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_nationality">Nationality</label></td>
		<td>
			<select name="nationality" id="id_nationality">
				<option value="" selected="selected">---------</option>
				<c:set var="nationality" value="${up.nationality_id}"/>				
				<c:if test="${nationality eq 1}">
					<option value="${nationality}" selected="selected">Indian</option>
				</c:if>
				<c:if test="${nationality ne 1}">
					<option value="1">Indian</option>
				</c:if>
				<!-- <option value="" selected="selected">---------</option>
				<option value="1">Indian</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_address1">Address1</label></td>
		<td>
			<input id="id_address1" type="text" name="address1" value="${up.address1}" maxlength="255"/> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_address2">Address2</label></td>
		<td>
			<input id="id_address2" type="text" name="address2" value="${up.address2}" maxlength="255"/> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_address3">Address3</label></td>
		<td>
			<input id="id_address3" type="text" name="address3" value="${up.address3}" maxlength="255"/> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_address4">Address4</label></td>
		<td>
			<input id="id_address4" type="text" name="address4" value="${up.address4}" maxlength="255"/> &nbsp;
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_city">City</label></td>
		<td>
			<input id="id_city" type="text" name="city" value="${up.city}" maxlength="255"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_state">State</label></td>
		<td>
			<select name="state" id="id_state">
				<option value="">---------</option>
				<c:set var="state" value="${up.state_id}"/>				
				<c:if test="${state eq 1}">
					<option value="${state}" selected="selected">Karnataka</option>
				</c:if>
				<c:if test="${state ne 1}">
					<option value="1">Karnataka (KA)</option>
				</c:if>
				<!-- <option value="1">Karnataka (KA)</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_country">Country</label></td>
		<td>
			<select name="country" id="id_country">
				<option value="">---------</option>
				<c:set var="country" value="${up.country_id}"/>				
				<c:if test="${country eq 1}">
					<option value="${country}" selected="selected">India</option>
				</c:if>
				<c:if test="${country ne 1}">
					<option value="1">India</option>
				</c:if>
				<!-- <option value="1">India</option> -->
</select> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_zip_code">Zip Code</label></td>
		<td>
			<input id="id_zip_code" type="text" name="zip_code" value="${up.zip_code}" maxlength="10"/> &nbsp;<span style="color:red;">*</span>
			
			
			
		</td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_phone">Phone</label></td>
		<td>
			<input id="id_phone" type="text" name="phone" value="${up.phone}" maxlength="20"/></td>
	
	</tr>
	<tr>
	
	
		<td style="text-align:right;vertical-align:middle;"><label for="id_mobile">Mobile</label></td>
		<td>
			<input id="id_mobile" type="text" name="mobile" value="${up.mobile}" maxlength="20"/></td>
	
	</tr>
	<tr>
	
	
	</tr>
</tbody></table>
		<table>
			<tbody><tr>
				<td style="text-align:right;"><input type="submit" value="Submit and Next"/></td>
			</tr>		    
		</tbody></table>
		</div>
	</form:form>
</div>


			</div>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		 <br/>
				
		</div>
		<!-- f -->
	</div>
	<!-- container -->
</body>
</html>