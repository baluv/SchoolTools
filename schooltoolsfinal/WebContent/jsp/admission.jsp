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
<title>SchoolTools : Student Admission</title>
</head>
<body>
<!-- container -->
	<div id="wrapper">		
			<!-- c -->
			<div id="content">			
<c:url var="checkLoginURL" value="/school123/student_admission.html"/> 
<form:form action="${checkLoginURL}" method="post" id="Student_Admission" commandName="Student_Admission">
<!--	--> 
	
	<fieldset style="margin:10px">
	<legend>
		Student Info
	</legend>
	<table style="border:0px solid #ccc;">
		<tbody><tr>
			 <td style="vertical-align:middle;text-align:right;"><label for="id_std_name">Class</label></td>
			<td> <select name="std_name" id="id_std_name">
<option value="">---------</option>
<option value="PRE-KG" selected="selected">PRE-KG</option>
<option value="LKG">LKG</option>
<option value="UKG">UKG</option>
<option value="I">I</option>
<option value="II">II</option>
<option value="III">III</option>
<option value="IV">IV</option>
<option value="V">V</option>
<option value="VI">VI</option>
<option value="VII">VII</option>
<option value="VIII">VIII</option>
<option value="IX">IX</option>
<option value="X">X</option>
<option value="XI">XI</option>
<option value="XII">XII</option>
</select> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_name">Student Name</label></td>
			<td> <input id="id_name" type="text" name="name" maxlength="25"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_gender">Gender</label></td>
			<td> <select name="gender" id="id_gender">
<option value="" selected="selected">---------</option>
<option value="M">Male</option>
<option value="F">Female</option>
</select> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_dob">DOB</label></td>
			<td> <input type="text" name="dob1" class="datepicker" id="id_dob"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			<div class="helptext">
				YYYY-MM-DD
			</div>
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_age">Age</label></td>
			<td> <input type="text" name="age" id="id_age"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mother_tongue">Mother Tongue</label></td>
			<td> <input id="id_mother_tongue" type="text" name="mother_tongue" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_nationality">Nationality</label></td>
			<td> <input id="id_nationality" type="text" name="nationality" maxlength="50"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_religion">Religion</label></td>
			<td> <input id="id_religion" type="text" name="religion" maxlength="50"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_caste">Caste</label></td>
			<td> <select name="caste" id="id_caste">
<option value="" selected="selected">---------</option>
<option value="FC">Forward Caste</option>
<option value="SC">SC</option>
<option value="ST">ST</option>
<option value="BC">BC</option>
</select> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_bloodgroup">Blood Group</label></td>
			<td> <select name="bloodgroup" id="id_bloodgroup">
<option value="">---------</option>
<option value="A+">A Positive</option>
<option value="A-">A Negative</option>
<option value="B+">B Positive</option>
<option value="B-">B Negative</option>
<option value="AB+">AB Positive</option>
<option value="AB-">AB Negative</option>
<option value="O+" selected="selected">O Positive</option>
<option value="O-">O Negative</option>
</select> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_address1">Address Line 1</label></td>
			<td> <input id="id_address1" type="text" name="address1" maxlength="255"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_address2">Address Line 2</label></td>
			<td> <input id="id_address2" type="text" name="address2" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_address3">Address Line 3</label></td>
			<td> <input id="id_address3" type="text" name="address3" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_phone">Phone No</label></td>
			<td> <input id="id_phone" type="text" name="phone" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mobile">Mobile No</label></td>
			<td> <input id="id_mobile" type="text" name="mobile" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_pre_school_name">Previous School Name</label></td>
			<td> <input id="id_pre_school_name" type="text" name="pre_school_name" maxlength="50"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_location">Location</label></td>
			<td> <input id="id_location" type="text" name="location" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_city">City</label></td>
			<td> <input id="id_city" type="text" name="city" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_studying_present_std">Studying Present Std</label></td>
			<td> <input id="id_studying_present_std" type="text" name="studying_present_std" maxlength="10"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_second_language">Second Language</label></td>
			<td> <input id="id_second_language" type="text" name="second_language" maxlength="10"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_third_language">Third Language</label></td>
			<td> <input id="id_third_language" type="text" name="third_language" maxlength="10"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_referred_by">Referred By</label></td>
			<td> <input id="id_referred_by" type="text" name="referred_by" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			
		</tr>
	</tbody></table>
</fieldset>

<fieldset style="margin:10px">
	<legend>
		Parent Info
	</legend>
	<table style="border:0px solid #ccc; margin-left: -60px;">
		<tbody><tr>
			 <td style="vertical-align:middle;text-align:right;"><label for="id_father_name">Father Name</label></td>
			<td> <input id="id_father_name" type="text" name="father_name" maxlength="25"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_qulaification">Father Qualification</label></td>
			<td> <input id="id_fa_qulaification" type="text" name="fa_qulaification" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_occupation">Father Occupation</label></td>
			<td> <input id="id_fa_occupation" type="text" name="fa_occupation" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_organization">Father Organization</label></td>
			<td> <input id="id_fa_organization" type="text" name="fa_organization" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_off_address1">Father Office Address Line 1</label></td>
			<td> <input id="id_fa_off_address1" type="text" name="fa_off_address1" maxlength="255"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_off_address2">Father Office Address Line 2</label></td>
			<td> <input id="id_fa_off_address2" type="text" name="fa_off_address2" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_off_address3">Father Office Address Line 3</label></td>
			<td> <input id="id_fa_off_address3" type="text" name="fa_off_address3" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_phone">Father Phone No</label></td>
			<td> <input id="id_fa_phone" type="text" name="fa_phone" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_mobile">Father Mobile No</label></td>
			<td> <input id="id_fa_mobile" type="text" name="fa_mobile" maxlength="20"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_fa_email">Email</label></td>
			<td> <input id="id_fa_email" type="text" name="fa_email" maxlength="75"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mother_name">Mother Name</label></td>
			<td> <input id="id_mother_name" type="text" name="mother_name" maxlength="25"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_qulaification">Mother Qualification</label></td>
			<td> <input id="id_mo_qulaification" type="text" name="mo_qulaification" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_occupation">Mother Occupation</label></td>
			<td> <input id="id_mo_occupation" type="text" name="mo_occupation" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_organization">Mother Organization</label></td>
			<td> <input id="id_mo_organization" type="text" name="mo_organization" maxlength="25"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_off_address1">Mother Address Line 1</label></td>
			<td> <input id="id_mo_off_address1" type="text" name="mo_off_address1" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_off_address2">Mother Address Line 2</label></td>
			<td> <input id="id_mo_off_address2" type="text" name="mo_off_address2" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_off_address3">Mother Address Line 3</label></td>
			<td> <input id="id_mo_off_address3" type="text" name="mo_off_address3" maxlength="255"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_phone">Mother Phone No</label></td>
			<td> <input id="id_mo_phone" type="text" name="mo_phone" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_mobile">Mother Mobile No</label></td>
			<td> <input id="id_mo_mobile" type="text" name="mo_mobile" maxlength="20"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mo_email">Email</label></td>
			<td> <input id="id_mo_email" type="text" name="mo_email" maxlength="75"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_father_monthly_income">Father Monthly Income</label></td>
			<td> <input id="id_father_monthly_income" type="text" name="father_monthly_income" maxlength="10"> &nbsp;<span style="color:red;">*</span>
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_mother_monthly_income">Mother Monthly Income</label></td>
			<td> <input id="id_mother_monthly_income" type="text" name="mother_monthly_income" maxlength="10"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_parent_transfer">Parent Transfer</label></td>
			<td> <select name="parent_transfer" id="id_parent_transfer">
<option value="" selected="selected">---------</option>
<option value="Yes">Y</option>
<option value="No">N</option>
</select> &nbsp;
			<br>
			
			 </td>
			
			
		</tr>
	</tbody></table>
</fieldset>


<fieldset style="margin:10px">
	<legend>
		Transport Info
	</legend>
	<table style="border:0px solid #ccc;margin-right: -60px;">
		<tbody><tr>
			 <td style="vertical-align:middle;text-align:right;"><label for="id_transport">Transport</label></td>
			<td> <select name="transport" id="id_transport">
<option value="" selected="selected">---------</option>
<option value="Yes">Y</option>
<option value="No">N</option>
</select> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_pickup">Pickup Place</label></td>
			<td> <input id="id_pickup" type="text" name="pickup" maxlength="30"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_drop">Drop Place</label></td>
			<td> <input id="id_drop" type="text" name="drop1" maxlength="30"> &nbsp;
			<br>
			
			 </td>
			
			 <td style="vertical-align:middle;text-align:right;"><label for="id_app_distance">Approximate Distance</label></td>
			<td> <input id="id_app_distance" type="text" name="app_distance" maxlength="10"> &nbsp;
			<br>
			
			 </td>
			
		</tr>
		<tr>
			
			
		</tr>
	</tbody></table>
</fieldset>



<table>
	<tbody><tr>
		<td></td>
		<td><center><input type="submit" value="Create Admission"/></center></td>
	</tr>
</tbody></table>
</form:form>




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