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
	//int rollno=Integer.parseInt(rno);
	session.setAttribute("rollNumber", rno);
	session.setAttribute("name", studentName);
	session.setAttribute("standardId", standardId);
	session.setAttribute("standard_Id", standard_Id);
%>
	<!-- container -->
	
<c:url var="checkLoginURL" value="/school123/entrymarksheet.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">

<div class="framelayout" style="width:90%">
		<center><h3 style="font-size:18px;font-weight:bold;margin-bottom:0.05em;color:#2B3E42;">Student Marks Entry for - <%= request.getParameter("name") %>[<%= request.getParameter("Rollno")%>]</h3><br>
		<table style="border:0px;width:30%;text-align: center;padding-top:2px;background-color:#3B5998;color:#fff; margin-bottom: 10px;">
		
		</table></center>




<!-- Assessment Entry part -->
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">
	
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody><tr>
			<th width="25%" rowspan="2" align="center">ASSESSMENT / SUBJECTS</th>
			
				<th colspan="3">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<input type="hidden" value="<%= request.getParameter("Rollno") %>" name="student_id" id="student_id"/>							
				<input type="hidden" value="<%= request.getParameter("name") %>" name="sname" id="sname"/>							
				<th colspan="4">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>
				
				<c:if test="${standard_id>5}">
				<th colspan="4">${termname2}</th>
				<input type="hidden" value="${termid2}" name="term3" id="term3"/>
				</c:if>
		</tr>
		<tr>
			<c:forEach items="${tag}" var="subject">	
				<th align="center"><c:out value="${subject.name}"></c:out></th>				
				</c:forEach>
		</tr>
	
		<c:choose>
    	<c:when test="${standard_id>5}">
    	<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="5">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject.id}" name="subject_id" id="subject_id"/>							
							<select name="assessment_1_1" id="ass_1_1">							
							<c:choose>
    						<c:when test="${not empty listmas0}">
								<option value="0">${listmas0[counter.count-1]}</option>          
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_2" id="ass_1_2">
							<c:choose>
    						<c:when test="${not empty listmas1}">
								<option value="0">${listmas1[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">							
							<select name="assessment_1_3" id="ass_1_3">
								<c:choose>
    						<c:when test="${not empty listmas2}">
								<option value="0">${listmas2[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_4" id="ass_1_4">
							<c:choose>
    						<c:when test="${not empty listmas3}">
								<option value="0">${listmas3[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">							
							<select name="assessment_1_5" id="ass_1_5">
							<c:choose>
    						<c:when test="${not empty listmas4}">
								<option value="${listmasg4[counter.count-1]}">${listmas4[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">
								<select name="assessment_1_6" id="ass_1_6">
							<c:choose>
    						<c:when test="${not empty listmas5}">
								<option value="0">${listmas5[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
																<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select>      																			
						</td><td align="center">							
							<select name="assessment_1_7" id="ass_1_7">
							<c:choose>
    						<c:when test="${not empty listmas6}">
								<option value="0">${listmas6[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>	
						<td align="center">							
							<select name="assessment_1_8" id="ass_1_8">
							<c:choose>
    						<c:when test="${not empty listmas7}">
								<option value="0">${listmas7[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>
						<td align="center">							
							<select name="assessment_1_9" id="ass_1_9">
							<c:choose>
    						<c:when test="${not empty listmas8}">
								<option value="0">${listmas8[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>
						<td align="center">							
							<select name="assessment_1_10" id="ass_1_10">
							<c:choose>
    						<c:when test="${not empty listmas9}">
								<option value="0">${listmas9[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>
						<td align="center">							
							<select name="assessment_1_11" id="ass_1_11">
							<c:choose>
    						<c:when test="${not empty listmas10}">
								<option value="0">${listmas10[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="26">A1</option>								
								<option value="27">A2</option>								
								<option value="28">B1</option>								
								<option value="29">B2</option>								
								<option value="30">C1</option>								
								<option value="31">C2</option>								
								<option value="32">D</option>								
								<option value="33">E1</option>								
								<option value="34">E2</option>								
								<option value="127">A1*</option>							
								<option value="128">A2*</option>							
								<option value="129">B1*</option>								
								<option value="130">B2*</option>
								<option value="131">C1*</option>								
								<option value="132">C2*</option>								
								<option value="133">D*</option>								
								<option value="135">E1*</option>								
								<option value="136">E2*</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>	
			</tr>
		</c:forEach>
    	</c:when>
    	<c:when test="${standard_id==5}">
		     <c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="5">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject.id}" name="subject_id" id="subject_id"/>							
							<select name="assessment_1_1" id="ass_1_1">
							
							<c:choose>
    						<c:when test="${not empty listmas0}">
								<option value="0">${listmas0[counter.count-1]}</option>          
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_2" id="ass_1_2">
							<c:choose>
    						<c:when test="${not empty listmas1}">
								<option value="${listmasg1[counter.count-1]}">${listmas1[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">							
							<select name="assessment_1_3" id="ass_1_3">
								<c:choose>
    						<c:when test="${not empty listmas2}">
								<option value="${listmasg2[counter.count-1]}">${listmas2[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_4" id="ass_1_4">
							<c:choose>
    						<c:when test="${not empty listmas3}">
								<option value="${listmasg3[counter.count-1]}">${listmas3[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">							
							<select name="assessment_1_5" id="ass_1_5">
							<c:choose>
    						<c:when test="${not empty listmas4}">
								<option value="0">${listmas4[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">
								<select name="assessment_1_6" id="ass_1_6">
							<c:choose>
    						<c:when test="${not empty listmas5}">
								<option value="0">${listmas5[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select>      																			
						</td><td align="center">							
							<select name="assessment_1_7" id="ass_1_7">
							<c:choose>
    						<c:when test="${not empty listmas6}">
								<option value="0">${listmas6[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>		
			</tr>
		</c:forEach>    
    	</c:when>
   	 	<c:otherwise>
    		<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="4">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject.id}" name="subject_id" id="subject_id"/>							
							<select name="assessment_1_1" id="ass_1_1">							
							<c:choose>
    						<c:when test="${not empty listmas0}">
								<option value="0">${listmas0[counter.count-1]}</option>          
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_2" id="ass_1_2">
							<c:choose>
    						<c:when test="${not empty listmas1}">
								<option value="${listmasg1[counter.count-1]}">${listmas1[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">							
							<select name="assessment_1_3" id="ass_1_3">
								<c:choose>
    						<c:when test="${not empty listmas2}">
								<option value="${listmasg2[counter.count-1]}">${listmas2[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->	
								<option value="0">----------</option>								
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td><td align="center">						
							<select name="assessment_1_4" id="ass_1_4">
							<c:choose>
    						<c:when test="${not empty listmas3}">
								<option value="${listmasg3[counter.count-1]}">${listmas3[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">							
							<select name="assessment_1_5" id="ass_1_5">
							<c:choose>
    						<c:when test="${not empty listmas4}">
								<option value="${listmasg4[counter.count-1]}">${listmas4[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 						
						</td><td align="center">
						
							<c:choose>
    						<c:when test="${standard_id>2}">
								<select name="assessment_1_6" id="ass_1_6">
							<c:choose>
    						<c:when test="${not empty listmas5}">
								<option value="${listmasg5[counter.count-1]}">${listmas5[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select>           
    						</c:when>
    						<c:otherwise>
    							<c:choose>
    						<c:when test="${not empty listm2}">
								<input type="text" name="assessment_1_6" id="ass_1_6" value="${listmr[counter.count-1]}"/>	         
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_6" id="ass_1_6" value=" "/>	
    						</c:otherwise>
							</c:choose>	
    						</c:otherwise>
							</c:choose>																
						</td><td align="center">							
							<select name="assessment_1_7" id="ass_1_7">
							<c:choose>
    						<c:when test="${not empty listmas6}">
								<option value="${listmasg6[counter.count-1]}">${listmas6[counter.count-1]}</option>           
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
								<!-- Edit Field -->
								<option value="0">----------</option>									
								<option value="1">A+</option>								
								<option value="2">A</option>								
								<option value="3">B</option>								
								<option value="4">C</option>								
								<option value="5">D</option>								
								<!-- End Edit Field -->
							</select> 							
						</td>		
			</tr>
		</c:forEach>
    	</c:otherwise>
		</c:choose>					    
	</tbody></table>
	</div>
	
	<c:if test="${standard_id>5}">
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
			<c:choose>
			<c:when test="${standard_id>8}">
				<td rowspan="2" width="20%" align="center">${name5}</td>
			</c:when>
			<c:otherwise>
				<td rowspan="2" width="20%" align="center">${name6}</td>
			</c:otherwise>
			</c:choose>					
			</tr>
			<tr><td rowspan="2" width="60%" align="center">
			<input type="hidden" value="${sub_id6}" name="overall_id" id="overall_id"/>
				<select name="overall">
							<c:choose>
    							<c:when test="${not empty overall}">    							
								<option value="${overall}">${overall}</option>								
    							</c:when>
    							<c:otherwise>
    							<option value="----------">----------</option>
    							</c:otherwise>
							</c:choose>
									<!-- Edit Field -->	
									<option value="0">----------</option>							
								<option value="A1">A1</option>								
								<option value="A2">A2</option>								
								<option value="B1">B1</option>								
								<option value="B2">B2</option>								
								<option value="C1">C1</option>								
								<option value="C2">C2</option>								
								<option value="D">D</option>								
								<option value="E1">E1</option>								
								<option value="E2">E2</option>								
								<option value="A1*">A1*</option>							
								<option value="A2*">A2*</option>							
								<option value="B1*">B1*</option>								
								<option value="B2*">B2*</option>
								<option value="C1*">C1*</option>								
								<option value="C2*">C2*</option>								
								<option value="D*">D*</option>								
								<option value="E1*">E1*</option>								
								<option value="E2*">E2*</option>									
									<!-- End Edit Field -->
								</select>	
				</td>
			</tr>		
				
				</tbody></table>
				<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<td align="left">
					<table style="width:100%;margin:0 auto;border:0;">
						<tbody><tr>
							<td width="25%">First Term</td>
							<td>FA1(10%)+FA2(10%)+SA1(30%) = 50%</td>
						</tr>
						<tr>
							<td width="25%">Second Term</td>
							<td>FA3(10%)+FA4(10%)+SA2(30%) = 50%</td>
						</tr>
						<tr>
							<td width="25%">Formative Assessment</td>
							<td>FA1(10%)+FA2(10%)+FA3(10%)+FA4(10%) = 40%</td>
						</tr>
						<tr>
							<td width="25%">Summative Assessment</td>
							<td>SA1(30%)+SA2(30%) = 60%</td>
						</tr>
					</tbody></table>
				</td>
				<td>
					<table style="width:100%;margin:0 auto;border:0;">
						<tbody><tr>
							<th>Grade</th>
							<th>Marks Range</th>
							<th>Grade Point</th>
						</tr>
						<tr>
							<td>A1</td>
							<td>91-100</td>
							<td>10.0</td>
						</tr>
						<tr>
							<td>A2</td>
							<td>81-90</td>
							<td>9.0</td>
						</tr>
						<tr>
							<td>B1</td>
							<td>71-80</td>
							<td>8.0</td>
						</tr>
						<tr>
							<td>B2</td>
							<td>61-70</td>
							<td>7.0</td>
						</tr>
						<tr>
							<td>C1</td>
							<td>51-60</td>
							<td>6.0</td>
						</tr>
						<tr>
							<td>C2</td>
							<td>41-50</td>
							<td>5.0</td>
						</tr>
						<tr>
							<td>D</td>
							<td>33-40</td>
							<td>4.0</td>
						</tr>						
						<tr>
							<td>E1</td>
							<td>21-32</td>
							<td>3.0</td>
						</tr>
						<tr><td>E2</td>
							<td>00-20</td>
							<td>2.0</td>
						</tr>						
					</tbody></table>
				</td>
			</tr>
		</tbody></table>
		<div style="margin-bottom:-20px;margin-top:10px;">
			<span><big><b><center> (PART-2 CO-SCHOLASTIC AREAS)</center></b></big></span>
		</div>	
		</div>
	<br/>
	</c:if>
	<c:if test="${standard_id>2 && standard_id<6}">	
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<td rowspan="2" width="20%" align="center">
				<c:choose>
    						<c:when test="${standard_id>2 && standard_id<5}">
								${name5}
								<input type="hidden" value="${sub_id5}" name="overall_id" id="overall_id"/>         
    						</c:when>
    						<c:otherwise>
    							${name6}
    							<input type="hidden" value="${sub_id6}" name="overall_id" id="overall_id"/>
    						</c:otherwise>
							</c:choose>
				</td>				
						
			</tr>
			<tr><td rowspan="2" width="60%" align="center">
    		<select name="overall">
							<c:choose>							
    							<c:when test="${not empty overall}">
								<option value="${overall}">${overall}</option>        
    							</c:when>
    							<c:otherwise>
    							<option value="----------">----------</option>
    							</c:otherwise>
							</c:choose>
									<!-- Edit Field -->	
									<option value="0">----------</option>							
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>										
									<!-- End Edit Field -->
								</select>
				</td>
			</tr>		
				
				</tbody></table>
		</div>
	<br/>
	</c:if>	
	
	
	
	
	<c:choose>
	<c:when test="${standard_id>8}">
    		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name6}</th>							
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>
			</tr>
								<c:forEach items="${list6}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id6}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval6}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval96[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval6}">
									<option value="${markeval6[counter.count-1].grade}">${markeval96[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name7}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
							<c:choose>
    						<c:when test="${not empty markeval7}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval7[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval7}">
									<option value="${markeval7[counter.count-1].grade}">${markeval7[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name8}</th>								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval8}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval8[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval8}">
									<option value="${markeval8[counter.count-1].grade}">${markeval8[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name9}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id9}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval9}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval9[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval9}">
									<option value="${markeval9[counter.count-1].grade}">${markeval9[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name10}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list10}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id10}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval10}">    						
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval10[counter.count-1].description}</textarea>
    					 	</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval10}">								
    							<option value="${markeval10[counter.count-1].grade}">${markeval10[counter.count-1].grade}</option>    												        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name11}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list11}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id11}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval11}">
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval11[counter.count-1].description}</textarea>
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval11}">								
    						<option value="${markeval11[counter.count-1].grade}">${markeval11[counter.count-1].grade}</option>  
    													      
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<div style="text-align: center;padding-top:2px;background-color:#3B5998;color:#fff; margin-bottom: 10px;"><b>
					<span>	A= 4.1 - 5.0, &nbsp; B=3.1 - 4.0, &nbsp;C=2.1 - 3.0,&nbsp;D=1.1 - 2.0,&nbsp;E=0.0 - 1.0</span>
				</b></div>
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="30%" align="center">${name12}</th>
			</tr>
			<tr>
				<th width="60%" align="center"></th>
			

			</tr>	
								<c:forEach items="${list12}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id12}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval12}">							
    						
    						<textarea style="width:500px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval12[counter.count-1].description}</textarea>  
    														  
    							</c:when>
    							<c:otherwise>
    								<textarea style="width:500px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>   						
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name14}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">${termname0}</th>
				<th width="15%" align="center">${termname1}</th>

			</tr>
								<c:forEach items="${list14}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id14}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval14}">
								
    						
    						<input type="text" name="attendance_1" value="${markeval14[counter.count-1].grade}"/> 
    													     
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
							<td width="30%" align="center">
								<c:choose>
								<c:when test="${not empty markeval14}">
								
    						<input type="text" name="attendance_2" value="${markeval214[counter.count-1].grade}"/> 
    													     
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_2"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
				</tr>
				</c:forEach>  		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="30%" align="center">${name13}</th>
			</tr>
			<tr>
				<th width="60%" align="center"></th>
			

			</tr>	
								<c:forEach items="${list13}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id13}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty listme}">
								
    						<input type="text" name="health" value="${markeval13[counter.count-1].grade}"/> 
    														     
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="health"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>   						
				</tbody></table>
		</div>
    </c:when>
    <c:when test="${standard_id>5 && standard_id<9}">
    		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name7}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval7}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval7[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval7}">
									<option value="${markeval7[counter.count-1].grade}">${markeval7[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name8}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
							<c:choose>
    						<c:when test="${not empty markeval8}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval8[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval8}">
									<option value="${markeval8[counter.count-1].grade}">${markeval8[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name9}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id9}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval9}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval9[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval9}">
									<option value="${markeval9[counter.count-1].grade}">${markeval9[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name10}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list10}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id10}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval10}">
								<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval10[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval10}">
									<option value="${markeval10[counter.count-1].grade}">${markeval10[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name11}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list11}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id11}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval11}">
    						<c:choose>
    						<c:when test="${standard_id==6}">
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval11[counter.count-1].description}</textarea>
    						</c:when>
    						<c:otherwise>
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval11[counter.count-1].description}</textarea>
    						</c:otherwise>
    						</c:choose>								           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval11}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						<option value="${markeval11[counter.count-1].grade}">${markeval11[counter.count-1].grade}</option>     
    						</c:when>
    						<c:otherwise>
    						<option value="${markeval11[counter.count-1].grade}">${markeval11[counter.count-1].grade}</option>     
    						</c:otherwise>
    						</c:choose>										   
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name12}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicators</th>
				<th width="15%" align="center">Grade</th>

			</tr>
								<c:forEach items="${list12}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id12}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval12}">
    						<c:choose>
    						<c:when test="${standard_id==6}">
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval12[counter.count-1].description}</textarea> 
    						</c:when>
    						<c:otherwise>
    						<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval12[counter.count-1].description}</textarea> 
    						</c:otherwise>
    						</c:choose>									          
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>					
							<td width="30%" align="center">
								<select name="grade">
								<c:choose>
								<c:when test="${not empty markeval12}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						
    						</c:when>
    						<c:otherwise>
    						</c:otherwise>
    						</c:choose>	
									<option value="${markeval12[counter.count-1].grade}">${markeval12[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<div style="text-align: center;padding-top:2px;background-color:#3B5998;color:#fff; margin-bottom: 10px;"><b>
					<span>	A= 4.1 - 5.0, &nbsp; B=3.1 - 4.0, &nbsp;C=2.1 - 3.0,&nbsp;D=1.1 - 2.0,&nbsp;E=0.0 - 1.0</span>
				</b></div>
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="30%" align="center">${name13}</th>
			</tr>
			<tr>
				<th width="60%" align="center"></th>
			

			</tr>	
								<c:forEach items="${list13}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id13}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval13}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						<textarea style="width:500px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval13[counter.count-1].description}</textarea>
    						</c:when>
    						<c:otherwise>
    						<textarea style="width:500px;height:50px;padding:0px;" name="Descriptive" resize="false">${markeval13[counter.count-1].description}</textarea>
    						</c:otherwise>
    						</c:choose>										    
    							</c:when>
    							<c:otherwise>
    								<textarea style="width:500px;height:50px;padding:0px;" name="Descriptive" resize="false"></textarea>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>   						
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name15}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">${termname0}</th>
				<th width="15%" align="center">${termname1}</th>

			</tr>
								<c:forEach items="${list15}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id15}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval15}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						<input type="text" name="attendance_1" value="${markeval315[counter.count-1].grade}"/> 
    						</c:when>
    						<c:otherwise>
    						<input type="text" name="attendance_1" value="${markeval315[counter.count-1].grade}"/> 
    						</c:otherwise>
    						</c:choose>	
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
							<td width="30%" align="center">
								<c:choose>
								<c:when test="${not empty markeval15}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						<input type="text" name="attendance_2" value="${markeval215[counter.count-1].grade}"/>
    						</c:when>
    						<c:otherwise>
    						<input type="text" name="attendance_2" value="${markeval215[counter.count-1].grade}"/>
    						</c:otherwise>
    						</c:choose>	
									      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_2"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
				</tr>
				</c:forEach>  		
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="30%" align="center">${name14}</th>
			</tr>
			<tr>
				<th width="60%" align="center"></th>
			

			</tr>	
								<c:forEach items="${list14}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id14}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval14}">
								<c:choose>
    						<c:when test="${standard_id==6}">
    						<input type="text" name="health" value="${markeval14[counter.count-1].grade}"/> 
    						</c:when>
    						<c:otherwise>
    						<input type="text" name="health" value="${markeval14[counter.count-1].grade}"/> 
    						</c:otherwise>
    						</c:choose>									     
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="health"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>   						
				</tbody></table>
		</div>
    </c:when>
    
    
    
    <c:otherwise>
    <div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name0}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list0}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">	
							<input type="hidden" value="${termname0}" name="term_id1" id="term_id1"/>
							<input type="hidden" value="${termname1}" name="term_id2" id="term_id2"/>
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id0}" name="sub_id" id="sub_id"/>
														
							<c:choose>
    						<c:when test="${not empty markeval0}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">${markeval0[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							
							</td>
							<td width="15%" align="center">
								<select name="grade_1_1">
							<c:choose>
    						<c:when test="${not empty markeval0}">
								<option value="${markeval0[counter.count-1].grade}">${markeval0[counter.count-1].grade}</option>        
    						</c:when>
    						<c:otherwise>
    							<option value="----------">----------</option>
    						</c:otherwise>
							</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
								<c:choose>
    						<c:when test="${not empty markeval20}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">${markeval20[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
							<c:choose>
    						<c:when test="${not empty markeval20}">
								<option value="${markeval20[counter.count-1].grade}">${markeval20[counter.count-1].grade}</option>        
    						</c:when>
    						<c:otherwise>
    							<option value="----------">----------</option>
    						</c:otherwise>
							</c:choose>
									<!-- Edit Field -->
									<option value="0">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name1}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list1}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">	
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id1}" name="sub_id" id="sub_id"/>
							<c:choose>
    						<c:when test="${not empty markeval1}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">${markeval1[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_1">
								<c:choose>
								<c:when test="${not empty markeval1}">
									<option value="${markeval1[counter.count-1].grade}">${markeval1[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
							<c:choose>
    						<c:when test="${not empty markeval21}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">${markeval21[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
								<c:choose>
								<c:when test="${not empty markeval21}">
									<option value="${markeval21[counter.count-1].grade}">${markeval21[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name2}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list2}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">	
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id2}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval2}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">${markeval2[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_1">
								<c:choose>
								<c:when test="${not empty markeval2}">
									<option value="${markeval2[counter.count-1].grade}">${markeval2[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
								<c:choose>
    						<c:when test="${not empty markeval22}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">${markeval22[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
								<c:choose>
								<c:when test="${not empty markeval22}">
									<option value="${markeval22[counter.count-1].grade}">${markeval22[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name3}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list3}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id3}" name="sub_id" id="sub_id"/>	
								<c:choose>
    							<c:when test="${not empty markeval3}">
									<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">
									<c:choose>							
									<c:when test="${standard_id==5}">
									${markeval3[counter.count-1].description}         
    								</c:when>
    								<c:otherwise>
    								${markeval3[counter.count-1].description}
    								</c:otherwise>
									</c:choose>
									</textarea>           
    							</c:when>
    							<c:otherwise>
    								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    							</c:otherwise>
								</c:choose>
								</td>
								<td width="15%" align="center">
								<select name="grade_1_1">
								<c:choose>
								<c:when test="${not empty markeval3}">
									<c:choose>							
									<c:when test="${standard_id==5}">
									<option value="${markeval3[counter.count-1].grade}">${markeval3[counter.count-1].grade}</option>        
    								</c:when>
    								<c:otherwise>
    								<option value="${markeval3[counter.count-1].grade}">${markeval3[counter.count-1].grade}</option> 
    								</c:otherwise>
									</c:choose>									       
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
								<c:choose>
    							<c:when test="${not empty markeval23}">
									<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">									
									<c:choose>							
									<c:when test="${standard_id==5}">
									${markeval23[counter.count-1].description}         
    								</c:when>
    								<c:otherwise>
    								${markeval23[counter.count-1].description}
    								</c:otherwise>
									</c:choose>           
									</textarea>           
    							</c:when>
    							<c:otherwise>
    								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    							</c:otherwise>
								</c:choose>
								</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
								<c:choose>
								<c:when test="${not empty markeval23}">
								<c:choose>							
									<c:when test="${standard_id==5}">
									<option value="${markeval23[counter.count-1].grade}">${markeval23[counter.count-1].grade}</option>       
    								</c:when>
    								<c:otherwise>
    								<option value="${markeval23[counter.count-1].grade}">${markeval23[counter.count-1].grade}</option> 
    								</c:otherwise>
									</c:choose>										        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name4}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list4}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">	
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id4}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval4}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">${markeval4[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_1">
								<c:choose>
								<c:when test="${not empty markeval4}">
									<option value="${markeval4[counter.count-1].grade}">${markeval4[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
								<c:choose>
    						<c:when test="${not empty markeval24}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">${markeval24[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
								<c:choose>
								<c:when test="${not empty markeval24}">
									<option value="${markeval24[counter.count-1].grade}">${markeval24[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		<c:if test="${standard_id==5}">
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name5}</th>				
					<th colspan="2" width="30%" align="center">${termname0}</th>				
					<th colspan="2" width="30%" align="center">${termname1}</th>				
			</tr>
			<tr>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
				<th width="15%" align="center">Descriptive Indicator</th>
				<th width="15%" align="center">Grade</th>
			</tr>		
				<c:forEach items="${list5}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="15%" align="center">	
							<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id5}" name="sub_id" id="sub_id"/>
								<c:choose>
    						<c:when test="${not empty markeval5}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false">${markeval5[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_1" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_1">
								<c:choose>
								<c:when test="${not empty markeval25}">
									<option value="${markeval5[counter.count-1].grade}">${markeval5[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="15%" align="center">	
								<c:choose>
    						<c:when test="${not empty markeval25}">
								<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false">${markeval25[counter.count-1].description}</textarea>           
    						</c:when>
    						<c:otherwise>
    							<textarea style="width:350px;height:50px;padding:0px;" name="description_1_2" resize="false"></textarea>
    						</c:otherwise>
							</c:choose>
							</td>
							<td width="15%" align="center">
								<select name="grade_1_2">
								<c:choose>
								<c:when test="${not empty markeval25}">
									<option value="${markeval25[counter.count-1].grade}">${markeval25[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		</c:if>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">
							<c:choose>							
							<c:when test="${standard_id>2 && standard_id<5}">
								${name6}         
    						</c:when>
    						<c:when test="${standard_id==5}">
								${name7}         
    						</c:when>
    						<c:otherwise>
    							${name5}
    						</c:otherwise>
							</c:choose>
				</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">${termname0}</th>
				<th width="15%" align="center">${termname1}</th>

			</tr>	
			
							<c:choose>
							<c:when test="${standard_id==5}">
								<c:forEach items="${list7}" var="subcat" varStatus="counter">
								<tr>
								<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval7}">
									<option value="${markeval7[counter.count-1].grade}">${markeval7[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval27}">
									<option value="${markeval27[counter.count-1].grade}">${markeval27[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							</tr>
							</c:forEach>     
    						</c:when>
    						<c:when test="${standard_id>2 && standard_id<5}">
								<c:forEach items="${list6}" var="subcat" varStatus="counter">
								<tr>
								<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id6}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval6}">
									<option value="${markeval6[counter.count-1].grade}">${markeval6[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval26}">
									<option value="${markeval26[counter.count-1].grade}">${markeval26[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>         
    						</c:when>
    						<c:otherwise>
    							<c:forEach items="${list5}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id5}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval5}">
									<option value="${markeval5[counter.count-1].grade}">${markeval5[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval25}">
									<option value="${markeval25[counter.count-1].grade}">${markeval25[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
    						</c:otherwise>
							</c:choose>				
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">			
							<c:choose>
    						<c:when test="${standard_id>2 && standard_id<5}">
								${name7}         
    						</c:when>
    						<c:when test="${standard_id==5}">
								${name8}         
    						</c:when>
    						<c:otherwise>
    							${name6}
    						</c:otherwise>
							</c:choose>
				</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">${termname0}</th>
				<th width="15%" align="center">${termname1}</th>

			</tr>		
			
							<c:choose>
							<c:when test="${standard_id==5}">
								<c:forEach items="${list8}" var="subcat" varStatus="counter">
								<tr>
								<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval8}">
									<option value="${markeval8[counter.count-1].grade}">${markeval8[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
								</td>					
								<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval28}">
									<option value="${markeval28[counter.count-1].grade}">${markeval28[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
								</td>					
								</tr>
							</c:forEach>							
							</c:when>
    						<c:when test="${standard_id>2 && standard_id<5}">
								<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval7}">
									<option value="${markeval7[counter.count-1].grade}">${markeval7[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval27}">
									<option value="${markeval27[counter.count-1].grade}">${markeval27[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>      
    						</c:when>
    						<c:otherwise>
    						<c:forEach items="${list6}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id6}" name="sub_id" id="sub_id"/>
								<select name="grade_1_6_1">
								<c:choose>
								<c:when test="${not empty markeval6}">
									<option value="${markeval6[counter.count-1].grade}">${markeval6[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->
									<option value="----------">----------</option>										
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>									
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
							<td width="30%" align="center">
								<select name="grade_1_6_2">
								<c:choose>
								<c:when test="${not empty markeval26}">
									<option value="${markeval26[counter.count-1].grade}">${markeval26[counter.count-1].grade}</option>        
    							</c:when>
    							<c:otherwise>
    								<option value="----------">----------</option>
    							</c:otherwise>
								</c:choose>
									<!-- Edit Field -->	
									<option value="----------">----------</option>									
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B">B</option>								
									<option value="C">C</option>									
									<option value="D">D</option>									
									<!-- End Edit Field -->
								</select>	
							</td>					
				</tr>
				</c:forEach>
    						</c:otherwise>
							</c:choose>			
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">							
							<c:choose>
    						<c:when test="${standard_id>2 && standard_id<5}">
								${name9}         
    						</c:when>
    						<c:when test="${standard_id==5}">
								${name10}         
    						</c:when>
    						<c:otherwise>
    							${name8}
    						</c:otherwise>
							</c:choose>
				</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">${termname0}</th>
				<th width="15%" align="center">${termname1}</th>

			</tr>
						
							<c:choose>
							<c:when test="${standard_id==5}">
								<c:forEach items="${list10}" var="subcat" varStatus="counter">
								<tr>
								<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id10}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval10}">
									<input type="text" name="attendance_1" value="${markeval10[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_1"/>
    							</c:otherwise>
    							</c:choose>
								</td>					
								<td width="30%" align="center">
								<c:choose>
								<c:when test="${not empty markeval210}">
									<input type="text" name="attendance_2" value="${markeval210[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_2"/>
    							</c:otherwise>
    							</c:choose>
								</td>					
								</tr>
								</c:forEach>        
    						</c:when>
    						<c:when test="${standard_id>2}">
								<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id9}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval9}">
									<input type="text" name="attendance_1" value="${markeval9[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
							<td width="30%" align="center">
								<c:choose>
								<c:when test="${not empty markeval29}">
									<input type="text" name="attendance_2" value="${markeval29[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_2"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
				</tr>
				</c:forEach>         
    						</c:when>
    						<c:otherwise>
    							<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval8}">
									<input type="text" name="attendance_1" value="${markeval8[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
							<td width="30%" align="center">
								<c:choose>
								<c:when test="${not empty markeval28}">
									<input type="text" name="attendance_2" value="${markeval28[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="attendance_2"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
				</tr>
				</c:forEach>
    						</c:otherwise>
							</c:choose>						
				</tbody></table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="30%" align="center">
							<c:choose>
    						<c:when test="${standard_id>2 && standard_id<5}">
								${name8}         
    						</c:when>
    						<c:when test="${standard_id==5}">
								${name9}         
    						</c:when>
    						<c:otherwise>
    							${name7}
    						</c:otherwise>
							</c:choose>
							</th>				
								
			</tr>
			<tr>
				<th width="60%" align="center"></th>
			

			</tr>	
			<c:choose>
			<c:when test="${standard_id==5}">
								<c:forEach items="${list9}" var="subcat" varStatus="counter">
								<tr>
								<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id9}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval9}">
									<input type="text" name="health_1" value="${markeval9[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="health_1"/>
    							</c:otherwise>
    							</c:choose>
								</td>	
								</tr>
								</c:forEach>   		
			</c:when>
    						<c:when test="${standard_id>2}">
								<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval8}">
									<input type="text" name="health_1" value="${markeval8[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="health_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>         
    						</c:when>
    						<c:otherwise>
    							<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
								<c:choose>
								<c:when test="${not empty markeval7}">
									<input type="text" name="health_1" value="${markeval7[counter.count-1].grade}"/>      
    							</c:when>
    							<c:otherwise>
    								<input type="text" name="health_1"/>
    							</c:otherwise>
    							</c:choose>
							</td>					
										
				</tr>
				</c:forEach>
    						</c:otherwise>
							</c:choose>					
				</tbody></table>
		</div>  
    </c:otherwise>
    </c:choose>		
	<!-- Result table-->
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody><tr>
			<th width="10%" align="center">Result</th>
			<td width="80%" align="center">
			<c:choose>
			<c:when test="${not empty listms}">
			<textarea name="result" rows="10" style="padding-top: 25px;width:900px;margin:15px;" resize="false">${listms} </textarea>    
    		</c:when>
    		<c:otherwise>
    		<textarea name="result" rows="10" style="padding-top: 25px;width:900px;margin:15px;" resize="false"> </textarea>
    		</c:otherwise>
    		</c:choose>
			</td>
			
		</tr>		
		
		
		
	</tbody></table>
</div>

<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody><tr>
			<th width="30%" align="center">Principal</th>
			<th width="30%" align="center">Coordinator</th>
			<th width="30%" align="center">Class Teacher</th>
		</tr>		
		
		<tr>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
			<textarea style="width:320px;height:50px;padding:0px;" name="principal" resize="false">${msr.by_principal}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="principal" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">			
			<textarea style="width:320px;height:50px;padding:0px;" name="coordinator" resize="false">${msr.by_coordinator}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="coordinator" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
			<textarea style="width:320px;height:50px;padding:0px;" name="classteacher" resize="false">${msr.by_class_teacher}</textarea>   
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="classteacher" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
		</tr>
		
	</tbody></table>
</div>	
<!-- Evaluation Entry part -->
<br/>
<!-- Education type -->
<div style="width:90%;margin:0 auto;">
	<input type="submit" value="Submit"/>
</div>

</div>




			</div></form:form>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		
				
		</div>
	<!-- container -->

</body></html>