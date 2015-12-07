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

<title> SchoolTools | Student Marks Entry for - <%= request.getParameter("name") %> </title>
<style>

	table tr th{
		padding-top:2px;
		background-color:#3B5998;
		color:#fff;
	}
	table tr td{
		padding-top:2px;
	}
	textarea {
    	resize: none;
	}
	textarea {width:550px;height:50px;padding:0px;}
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
</head>


<body onload="" onunload="">
<%
	String studentName=request.getParameter("name");
	String rno=request.getParameter("Rollno");
	String standardId=request.getParameter("standard");
	int standard_Id=Integer.parseInt(request.getParameter("standard_id"));
	if(rno.equalsIgnoreCase("**")||rno.equalsIgnoreCase("NA")||rno.equalsIgnoreCase("***")||rno.equalsIgnoreCase("*")){
		rno="0";
		}
	int rollno=Integer.parseInt(rno);
	session.setAttribute("rollNumber", rollno);
	session.setAttribute("standardId", standardId);
	session.setAttribute("standard_Id", standard_Id);
%>
	<!-- container -->
	
<c:url var="checkLoginURL" value="/school123/entrymarksheet1.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">

<div class="framelayout" style="width:90%">
		<center><h3 style="font-size:18px;font-weight:bold;margin-bottom:0.05em;color:#2B3E42;">Student Marks Entry for - <%= request.getParameter("name") %>[<%= request.getParameter("Rollno")%>]</h3><br>
		<table style="border:0px;width:30%;text-align: center;padding-top:2px;background-color:#3B5998;color:#fff; margin-bottom: 10px;">
		
		</table></center>




<!-- Assessment Entry part -->
	<div style="border:0px solid #999;width:100%;margin:0 auto;margin-bottom:-5px;">	
</div></div></form:form>
				<!-- c -->
		<!-- f -->
		<div id="footer">
		
				
		</div>
	<!-- container -->

</body></html>