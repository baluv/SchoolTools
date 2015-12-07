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
	System.out.println(standard_Id);
	if(rno.equalsIgnoreCase("**")||rno.equalsIgnoreCase("NA")||rno.equalsIgnoreCase("***")||rno.equalsIgnoreCase("*")){
	rno="0";
	}
	int rollno=Integer.parseInt(rno);
	session.setAttribute("rollNumber", rollno);
	session.setAttribute("standard_Id", standard_Id);
	session.setAttribute("name", studentName);
%>
	<!-- container -->
	
<c:url var="checkLoginURL" value="/school123/entrymarksheet1.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">

<div class="framelayout" style="width:90%">
		<center><h3 style="font-size:18px;font-weight:bold;margin-bottom:0.05em;color:#2B3E42;">Student Marks Entry for - <%= request.getParameter("name") %>[<%= request.getParameter("Rollno") %>]</h3><br>
		<table style="border:0px;width:30%;text-align: center;padding-top:2px;background-color:#3B5998;color:#fff; margin-bottom: 10px;">
		
		</table></center>




<!-- Assessment Entry part -->
	<div style="border:0px solid #999;width:100%;margin:0 auto;margin-bottom:-5px;">	

	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name0}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>
				<input type="hidden" value="<%= request.getParameter("Rollno") %>" name="student_id" id="student_id"/>							
				<input type="hidden" value="<%= request.getParameter("name") %>" name="sname" id="sname"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list0}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id0}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count-1].grade}">${listme[counter.count-1].grade}</option>
    							</c:when>
    							<c:otherwise>
									<option value="------">------</option>    							
    							</c:otherwise>
    							</c:choose>
    							<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count-1].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    							<c:when test="${not empty listme2}">    							
									<option value="${listme[counter.count-1].grade}">${listme[counter.count-1].grade}</option>
    							</c:when>
    							<c:otherwise>
									<option value="------">------</option>    							
    							</c:otherwise>
    							</c:choose>
    							<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    							<c:choose>
    							<c:when test="${not empty listme2}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count-1].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name1}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list1}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id1}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+1].grade}">${listme[counter.count+1].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+1].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+1].grade}">${listme2[counter.count+1].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+1].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name2}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list2}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id2}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+2].grade}">${listme[counter.count+2].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+2].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+2].grade}">${listme2[counter.count+2].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+2].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name3}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list3}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id3}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+5].grade}">${listme[counter.count+5].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+5].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>																						
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+5].grade}">${listme2[counter.count+5].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+5].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	
	<c:choose>
			<c:when test="${standard_id==14}">
			<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name4}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list4}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id4}" name="subject_id" id="subject_id"/>								
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+7].grade}">${listme[counter.count+7].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+7].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2counter.count+7].grade}">${listme2[counter.count+7].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+7].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name5}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list5}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id5}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+9].grade}">${listme[counter.count+9].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+9].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+9].grade}">${listme2[counter.count+9].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+9].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name6}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list6}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id6}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+10].grade}">${listme[counter.count+10].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+10].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+10].grade}">${listme2[counter.count+10].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+10].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name7}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list7}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id7}" name="subject_id" id="subject_id"/>								
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+13].grade}">${listme[counter.count+13].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+13].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+13].grade}">${listme2[counter.count+13].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+13].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name8}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list8}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id8}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+15].grade}">${listme[counter.count+15].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+15].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+15].grade}">${listme2[counter.count+15].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+15].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name9}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list9}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id9}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+18].grade}">${listme[counter.count+18].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+18].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+18].grade}">${listme2[counter.count+18].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+18].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name10}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list10}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id10}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+21].grade}">${listme[counter.count+21].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+21].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+21].grade}">${listme2[counter.count+21].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+21].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
				<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name11}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list11}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id11}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+23].grade}">${listme[counter.count+23].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+23].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+23].grade}">${listme2[counter.count+23].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+23].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name12}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list12}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id12}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+24].grade}">${listme[counter.count+24].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+24].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+24].grade}">${listme2[counter.count+24].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+24].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name13}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list13}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id13}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+27].grade}">${listme[counter.count+27].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+27].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+27].grade}">${listme2[counter.count+27].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+27].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name14}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list14}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id14}" name="subject_id" id="subject_id"/>								
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+30].grade}">${listme[counter.count+30].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+30].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	 																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+30].grade}">${listme2[counter.count+30].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+30].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name15}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list15}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id15}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+32].grade}">${listme[counter.count+32].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+32].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+32].grade}">${listme2[counter.count+32].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+32].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	
	
	
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name16}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list16}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id16}" name="subject_id" id="subject_id"/>						
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+33].grade}">${listme[counter.count+33].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>						
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+33].grade}">${listme2[counter.count+33].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>						
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name17}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list17}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id17}" name="subject_id" id="subject_id"/>							
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3" value="${listme[counter.count+33].description}"/> 	
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3"/> 	    							
    							</c:otherwise>
    							</c:choose>																					
						</td>						
						<td align="center">
							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_2" size="20" maxlength="3" value="${listme2[counter.count+33].description}"/> 	
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_2" size="20" maxlength="3"/> 	    							
    							</c:otherwise>
    							</c:choose>																						
						</td>						
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name18}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list18}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id18}" name="subject_id" id="subject_id"/>							
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3" value="${listme[counter.count+35].description}"/> 	
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3"/> 	    							
    							</c:otherwise>
    							</c:choose>	    																					
						</td>						
						<td align="center">
							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_2" size="20" maxlength="3" value="${listme2[counter.count+35].description}"/> 	
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_2" size="20" maxlength="3"/> 	    							
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
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name4}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list4}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id4}" name="subject_id" id="subject_id"/>								
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+7].grade}">${listme[counter.count+7].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+7].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>			  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+7].grade}">${listme2[counter.count+7].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+7].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name5}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list5}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id5}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+10].grade}">${listme[counter.count+10].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+10].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>			  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+10].grade}">${listme2[counter.count+10].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+10].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name6}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list6}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id6}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+13].grade}">${listme[counter.count+13].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+13].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+13].grade}">${listme2[counter.count+13].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+13].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name7}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list7}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id7}" name="subject_id" id="subject_id"/>								
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+16].grade}">${listme[counter.count+16].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+16].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+16].grade}">${listme2[counter.count+16].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+16].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name8}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list8}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id8}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+18].grade}">${listme[counter.count+18].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+18].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>		  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+18].grade}">${listme[counter.count+18].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+18].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name9}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list9}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id9}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+20].grade}">${listme[counter.count+20].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+20].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+20].grade}">${listme2[counter.count+20].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+20].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="2" align="center"><c:out value="${name10}"></c:out></th>			
				<th colspan="2">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="2">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>	
		<tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>		
			<c:forEach items="${list10}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 150px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id10}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+23].grade}">${listme[counter.count+23].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false">${listme[counter.count+23].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	  																					
						</td>
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+23].grade}">${listme2[counter.count+23].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>
						<td align="center">														
    						<c:choose>
    							<c:when test="${not empty listme}">    							
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false">${listme2[counter.count+23].description}</textarea>
    							</c:when>
    							<c:otherwise>
									<textarea style="width:350px;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>    							
    							</c:otherwise>
    							</c:choose>	
						</td>
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name11}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list11}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id11}" name="subject_id" id="subject_id"/>							
    							<select name="grade_1" id="grade_1">
									<c:choose>
    								<c:when test="${not empty listme}">    							
									<option value="${listme[counter.count+24].grade}">${listme[counter.count+24].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>						
						<td align="center">
								<select name="grade_2" id="grade_2">
									<c:choose>
    								<c:when test="${not empty listme2}">    							
									<option value="${listme2[counter.count+24].grade}">${listme2[counter.count+24].grade}</option>
    								</c:when>
    								<c:otherwise>
									<option value="------">------</option>    							
    								</c:otherwise>
    								</c:choose>
    								<option value="------">------</option> 
									<option value="A+">A+</option>									
									<option value="A">A</option>									
									<option value="B+">B+</option>									
									<option value="B">B</option>									
									<option value="C">C</option>
								</select>    																					
						</td>						
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name12}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list12}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
						<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id12}" name="subject_id" id="subject_id"/>						
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3" value=" ${listme[counter.count+24].description}"/>
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3"/>     							
    							</c:otherwise>
    							</c:choose>	 																				
						</td>						
						<td align="center">
							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_2" id="remark_2" size="20" maxlength="3" value=" ${listme2[counter.count+24].description}"/>
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_2" id="remark_2" size="20" maxlength="3"/>     							
    							</c:otherwise>
    							</c:choose>	 																					
						</td>						
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody>
		<tr>
				<th colspan="1" rowspan="1" align="center"><c:out value="${name13}"></c:out></th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>			
		</tr>			
			<c:forEach items="${list13}" var="subject1" varStatus="counter">
			<tr><td colspan="1" style="width: 425px"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject1.id}" name="skill_id" id="skill_id"/>
							<input type="hidden" value="${sub_id13}" name="subject_id" id="subject_id"/>								
    							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3" value=" ${listme[counter.count+26].description}"/>
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_1" id="remark_1" size="20" maxlength="3"/>     							
    							</c:otherwise>
    							</c:choose>	   																					
						</td>						
						<td align="center">
							<c:choose>
    							<c:when test="${not empty listme}">    							
									<input type="text" name="remark_2" id="remark_2" size="20" maxlength="3" value=" ${listme2[counter.count+26].description}"/>
    							</c:when>
    							<c:otherwise>
									<input type="text" name="remark_2" id="remark_2" size="20" maxlength="3"/>     							
    							</c:otherwise>
    							</c:choose>	    																					
						</td>						
						</tr>
						</c:forEach>
		
	
	</tbody></table>
	</div>
			
			</c:otherwise>
			
	</c:choose>

<div style="border:0px solid #999;width:15%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0;border:0;">
			<tbody><tr>
				<th>Grade</th>
				<th>Remarks</th>
			</tr>
			
			<tr>
				<td>A+</td>
				<td>Excellent</td>
			</tr>
			
			<tr>
				<td>A</td>
				<td>Very Good</td>
			</tr>
			
			<tr>
				<td>B+</td>
				<td>Good</td>
			</tr>
			
			<tr>
				<td>B</td>
				<td>Satisfied</td>
			</tr>
			
			<tr>
				<td>C</td>
				<td>Can Do Better</td>
			</tr>
			
		</tbody></table>
	</div>	
	

<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
			<table style="width:100%;margin:0 auto">
				<tbody><tr><td align="left" colspan="3">I Term</td></tr>
				<tr><td colspan="3">
					<c:choose>
					<c:when test="${not empty listmsr}">
					<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
					<textarea style="width:100%;height:50px;padding:0px;" name="remark_3" resize="false">${msr.remark}</textarea>	  
    				</c:forEach>
    				</c:when>
    				<c:otherwise>
    				<textarea style="width:100%;height:50px;padding:0px;" name="remark_3" resize="false"></textarea>
    				</c:otherwise>
    				</c:choose>
					</td>
				</tr>
					
				<tr>
					<th width="30%" align="center">Principal</th>
					<th width="30%" align="center">Coordinator</th>
					<th width="30%" align="center">Class Teacher</th>
				</tr>	
				
				<tr>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
			<textarea style="width:355px;height:50px;padding:0px;" name="principal_1" resize="false">${msr.by_principal}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="principal_1" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">			
			<textarea style="width:355px;height:50px;padding:0px;" name="coordinator_1" resize="false">${msr.by_coordinator}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="coordinator_1" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
			<textarea style="width:355px;height:50px;padding:0px;" name="classteacher_1" resize="false">${msr.by_class_teacher}</textarea>   
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="classteacher_1" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
		</tr>
				
			</tbody></table>
			</div>
		
	
		
			<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
			<table style="width:100%;margin:0 auto">
				<tbody><tr><td align="left" colspan="3">II Term</td></tr>
				<tr>
					<td colspan="3">
					<c:choose>
					<c:when test="${not empty listmsr}">
					<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
					<textarea style="width:100%;height:50px;padding:0px;" name="remark_4" resize="false">${msr.remark}</textarea>	  
    				</c:forEach>
    				</c:when>
    				<c:otherwise>
    				<textarea style="width:100%;height:50px;padding:0px;" name="remark_4" resize="false"></textarea>
    				</c:otherwise>
    				</c:choose></td>
				</tr>
					
				<tr>
					<th width="30%" align="center">Principal</th>
					<th width="30%" align="center">Coordinator</th>
					<th width="30%" align="center">Class Teacher</th>
				</tr>	
				
				<tr>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
			<textarea style="width:355px;height:50px;padding:0px;" name="principal_2" resize="false">${msr.by_principal}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="principal_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">			
			<textarea style="width:355px;height:50px;padding:0px;" name="coordinator_2" resize="false">${msr.by_coordinator}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="coordinator_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
			<textarea style="width:355px;height:50px;padding:0px;" name="classteacher_2" resize="false">${msr.by_class_teacher}</textarea>   
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:355px;height:50px;padding:0px;" name="classteacher_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
		</tr>				
			</tbody></table>
			</div>
<br/>


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