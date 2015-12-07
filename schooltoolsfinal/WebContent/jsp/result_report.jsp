
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
	<%
    String s=(String) session.getAttribute("standard");
    String name[]=(String[]) session.getAttribute("name");
    String roll_no[]=(String[]) session.getAttribute("roll_no");
    %>
		<br>
		<div class="framelayout">
		<h1><strong>Students who promoted to <%=s %> standard </strong></h1>
		<input type="hidden" value="${username}" name="username" id="username"/>
		<input type="hidden" value="${user}" name="user" id="user"/>
		<table class="dtable">
			
		<thead>	
		<tr>
			
			<th> Roll No</th>
			<th> Student Name </th>
		</tr>
		</thead>
		<%try{for(int i=0;i<name.length;i++){%>
		<tbody>
		<tr>		
			<td><%=roll_no[i]%></td>
			<td><%=name[i]%></td>
		</tr>
			</tbody>
			<%}}catch(NullPointerException ne){}%>
		</table>
		
		
		
			
				
				    
		
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