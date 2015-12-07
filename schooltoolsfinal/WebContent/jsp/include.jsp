
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Student Info</title>
<title>Applying JQuery DataTables plugin in the Java Server
application</title>

<link rel="stylesheet" href="../css/datatable.css" type="text/css">
<link rel="stylesheet" href="../css/jquery.ui.google.css" type="text/css">
<link rel="stylesheet" href="../css/screen.css" type="text/css" media="screen, projection"></link>
<link rel="stylesheet" href="../css/tabmenu.css" type="text/css" media="screen"></link>
<link rel="stylesheet" href="../css/skin1.css" type="text/css" media="screen"></link>
<script type="text/javascript" src="../js/savetheenvironment.js"></script>
<link rel="stylesheet" href="../css/savetheenvironment.css" type="text/css">
<link href="../media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="../media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/jquery.js" type="text/javascript"></script>
<script src="../js/menu1.js" type="text/javascript"></script><script type="text/javascript">
        $(document).ready(function () {
            $("#companies").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
</script>

</head>

<body>
<%

	//String username=(String) session.getAttribute("username");
	//String first_name=(String) session.getAttribute("first_name");
	
%>
	<!-- container -->
	<div id="wrapper">
		
		<!-- h -->
		<div id="header">
		 <div class="container">
    <div class="span-11"><a href="#"><img src="../images/app_logo.gif"></a></div>
	
		<div style="float:right;color:#fff;border:0px solid #ccc;text-align:right">
		
		Welcome, <strong style="font-size:small;">${user} </strong> &nbsp;[${username}]<br>
			<input type="hidden" value="${username}" name="username" id="username"/>
			<input type="hidden" value="${user}" name="user" id="user"/>
			<a class="nodecoration" style="color:#fff;" href="home.html">Home</a> | 
			<a class="nodecoration" style="color:#fff;" href="home.html">Change Password</a> | 
			<a class="nodecoration" style="color:#fff;" href="logout.html">Logout</a> 
		</div>
	
</div>


		</div>
		<!-- h -->
		
			<!-- c -->
			<div id="content">
				
					<!-- <div class="menu">
					  <span class="left"></span>
					</div> -->
					<div style="background:#3b5998;width:100%;border:0px solid #ff0000;height:22px;z-index: 30;margin-top: -27px;">
					<ul id="sddm">
					    <li><a class="menuactive" id="home" href="home.html?user=${user}&username=${username}">Home</a></li>
					    
					    
					    <li><a class="menuactive" id="student" href="student_info_view.html?user=${user}&username=${username}">Student</a></li>
						<li><a class="menuactive" id="staff" href="staff_view.html?user=${user}&username=${username}">Staff</a></li>
						<li><a class="menuactive" id="staff" href="result.html?user=${user}&username=${username}">Results</a></li>
						<li>
							<a class="menuactive" id="marksheet" href="markssheet.html?user=${user}&username=${username}" onmouseover="mopen(&#39;m1&#39;)" onmouseout="mclosetime()">Marksheet</a>
					        <div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" style="visibility: hidden;">
								<a id="marksheet" href="markssheet.html?user=${user}&username=${username}" class="">Studentwise Marks Entry</a>
								<a id="marksheet" href="markssheetreport.html?user=${user}&username=${username}" class="">Studentwise Marksheet View</a>
					        </div>						
						</li>
					    <li>
					    	<a class="menuactive" id="school" href="School_info.html?user=${user}&username=${username}" onmouseover="mopen(&#39;m2&#39;)" onmouseout="mclosetime()">School</a>
					        <div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
								<a id="school" href="Standard_info.html?user=${user}&username=${username}">Standard Info</a>
								<a id="school" href="Section_info.html?user=${user}&username=${username}">Section Info</a>
								<a id="school" href="House_info.html?user=${user}&username=${username}">House Info</a>
								<a id="school" href="Department_info.html?user=${user}&username=${username}">Department Info</a>
								<a id="school" href="Designation_info.html?user=${user}&username=${username}">Designation Info</a>
								<a id="school" href="Term_info.html?user=${user}&username=${username}">Term Info</a>
								<a id="school" href="Tag_info.html?user=${user}&username=${username}">Tag Info</a>
								<a id="school" href="Grade_info.html?user=${user}&username=${username}">Grade Info</a>
								<a id="school" href="Main_category_info.html?user=${user}&username=${username}">Main Category Info</a>
								<a id="school" href="Sub_category_info.html?user=${user}&username=${username}">Sub Category Info</a>
					        </div>
					    </li>
					    <li>
					    	<a class="menuactive" id="master" href="#" onmouseover="mopen(&#39;m3&#39;)" onmouseout="mclosetime()">Master</a>
					        <div id="m3" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" style="visibility: hidden;">
								<a id="master" href="#" class="">Country Info</a>
								<a id="master" href="#" class="">Nationality Info</a>
								<a id="master" href="#" class="">State Info</a>
								<a id="master" href="#" class="">Religion Info</a>
								<a id="master" href="#" class="">Affiliation Info</a>
								<a id="master" href="#" class="">Main Caste Info</a>
								<a id="master" href="#" class="">Sub Caste Info</a>
								<a id="master" href="#" class="">Extra Curricular Info</a>
					        </div>
					    </li>
					    <li>
					    	<a class="menuactive" id="admission" href="admission_view.html?user=${user}&username=${username}" onmouseover="mopen(&#39;m4&#39;)" onmouseout="mclosetime()">Admission</a>
					        <div id="m4" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
								<a id="admission" href="admission_view.html?user=${user}&username=${username}">Student Admission</a>
								<a id="admission" href="#">Office Use Form</a>
					        </div>						
					    </li>
					    
				
					</ul>
					<div style="clear:both"></div>
					</div></div>
			
	

</body>
</html>