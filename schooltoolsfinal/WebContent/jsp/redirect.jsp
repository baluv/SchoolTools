
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="java.util.ArrayList,com.school.domain.*,java.util.Date"%>
<%@include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SchoolTools : Success</title>
<script type="text/javascript">
  function load()
  {
  	document.getElementById('login-form').submit();
  }
  </script>
</head>
<body onload="load();">				
<div class="container">
	<div class="span-10 append-1">
	<c:url var="checkLoginURL" value="/school123/marksheetentryview.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm" cssClass="login-form" name="login-form">
		<h4><strong>
			<input type="hidden" value="${username}" name="username" id="username"/>
			<input type="hidden" value="${user}" name="user" id="user"/>
			<input type="hidden" value="${standard_id}" name="standard_id" id="standard_id"/>
			<input type="hidden" value="${date_of_birth}" name="dob" id="dob"/>
			<input type="hidden" value="${name}" name="name" id="name"/>
			<input type="hidden" value="${roll_no}" name="Rollno" id="Rollno"/>
			<input type="hidden" value="${standard_name}" name="standard" id="standard"/>
		</form:form>
		
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