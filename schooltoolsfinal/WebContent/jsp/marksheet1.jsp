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
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	

	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
	<table style="width:100%;margin:0 auto">
		<tbody><tr>
			<th width="25%" colspan="2" rowspan="1" align="center">ASSESSMENT / SUBJECTS</th>			
				<th colspan="1">${termname0}</th>
				<input type="hidden" value="${termid0}" name="term1" id="term1"/>							
				<input type="hidden" value="<%= request.getParameter("Rollno") %>" name="student_id" id="student_id"/>							
				<input type="hidden" value="<%= request.getParameter("name") %>" name="sname" id="sname"/>							
				<th colspan="1">${termname1}</th>
				<input type="hidden" value="${termid1}" name="term2" id="term2"/>				
				<th colspan="3">${termname2}</th>
				<input type="hidden" value="${termid2}" name="term3" id="term3"/>
				<th colspan="1">${termname3}</th>
				<input type="hidden" value="${termid3}" name="term4" id="term1"/>							
				<th colspan="1">${termname4}</th>
				<input type="hidden" value="${termid4}" name="term5" id="term2"/>				
				<th colspan="3">${termname5}</th>
				<input type="hidden" value="${termid5}" name="term6" id="term3"/>
				
		</tr>
		<tr>
			<th width="25%" colspan="2" rowspan="1" align="center">Max Marks</th>			
				<th colspan="1">50</th>						
				<th colspan="1">50</th>			
				<th colspan="3">100</th>
				<th colspan="1">50</th>						
				<th colspan="1">50</th>				
				<th colspan="3">100</th>
				
		</tr>
		<tr>
		<th width="25%" colspan="2" rowspan="1" align="center">Subjects</th>
			<c:forEach items="${tag}" var="subject">	
				<th align="center"><c:out value="${subject.name}"></c:out></th>				
				</c:forEach>
		</tr>
	
		<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="5">		
			<tr><td colspan="2" width="25%"><c:out value="${subject.name}"></c:out></td>				
						<td align="center">
							<input type="hidden" value="${subject.id}" name="subject_id" id="subject_id"/>
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_1" id="ass_1_1" size="6" maxlength="3" value="${mnotes[counter.count-1]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_1" id="ass_1_1" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>															
						</td><td align="center">						
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_2" id="ass_1_2" size="6" maxlength="3" value="${mnotes[counter.count+5]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_2" id="ass_1_2" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose> 							
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_3" id="ass_1_3" size="6" maxlength="3" value="${mnotes[counter.count+11]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_3" id="ass_1_3" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>							
						</td><td align="center">						
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_4" id="ass_1_4" size="6" maxlength="3" value="${mnotes[counter.count+17]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_4" id="ass_1_4" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>				
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_5" id="ass_1_5" size="6" maxlength="3" value="${mnotes[counter.count+23]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_5" id="ass_1_5" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>						
						</td><td align="center">
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_6" id="ass_1_6" size="6" maxlength="3" value="${mnotes[counter.count+29]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_6" id="ass_1_6" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>						
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_7" id="ass_1_7" size="6" maxlength="3" value="${mnotes[counter.count+35]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_7" id="ass_1_7" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>						
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_8" id="ass_1_8" size="6" maxlength="3" value="${mnotes[counter.count+41]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_8" id="ass_1_8" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_9" id="ass_1_9" size="6" maxlength="3" value="${mnotes[counter.count+47]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_9" id="ass_1_9" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>							
						</td><td align="center">							
							<c:choose>
    						<c:when test="${not empty mnotes}">
								<input type="text" name="assessment_1_10" id="ass_1_10" size="6" maxlength="3" value="${mnotes[counter.count+53]}"/>          
    						</c:when>
    						<c:otherwise>
    							<input type="text" name="assessment_1_10" id="ass_1_10" size="6" maxlength="3"/>
    						</c:otherwise>
							</c:choose>						
						</td></tr>
		</c:forEach>
		<c:forEach items="${list}" var="subject" varStatus="counter" begin="6" end="6">
		<tr><td colspan="2" width="25%"><c:out value="${subject.name}"></c:out><input type="hidden" value="${subject.id}" name="subject_id" id="subject_id"/></td>				
						<c:forEach begin="0" end="9" varStatus="c">
						<td align="center">														
								<select name="assessment_1_11" id="assessment_1_11">
							<c:choose>
    						<c:when test="${not empty mgrade}">
								<option value="0">${mgrade[c.count-1]}</option>          
    						</c:when>
    						<c:otherwise>
    							<option value="0">----------</option>
    						</c:otherwise>
							</c:choose>
							<option value="0">----------</option>								 
								<option value="96">A1</option>								
								<option value="97">A2</option>								
								<option value="98">B1</option>								
								<option value="99">B2</option>								
								<option value="100">C1</option>								
								<option value="101">C2</option>								
								<option value="102">D1</option>								
								<option value="103">D2</option>								
								<option value="104">E</option>
							</select>											
						</td>
						</c:forEach>
		</c:forEach>			   
	</tbody></table>
	</div>
	<div style="text-align:center">
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:14px;">
			<div style="background-color:#3B5998;color:#fff;margin-bottom: 10px;height:23px;"><b>
				Grading Points:</b>
			</div>
			<div style="text-align: center;margin-bottom: 13px;border:1px;color:#006600"><b>				
					<span><b>A1:</b>
							90-100 &nbsp;&nbsp;	
					</span>				
					<span><b>A2:</b>
							80-89 &nbsp;&nbsp;	
					</span>				
					<span><b>B1:</b>
							70-79&nbsp;&nbsp;	
					</span>				
					<span><b>B2:</b>
							60-69&nbsp;&nbsp;	
					</span>				
					<span><b>C1:</b>
							50-59&nbsp;&nbsp;	
					</span>				
					<span><b>C2:</b>
							40-49&nbsp;&nbsp;	
					</span>				
					<span><b>D1:</b>
							30-39&nbsp;&nbsp;	
					</span>				
					<span><b>D2:</b>
							20-29&nbsp;&nbsp;	
					</span>				
					<span><b>E:</b>
							0-19&nbsp;&nbsp;	
					</span>				
			</b></div><b>
		</b></div><b>
	</b></div><b>
	<br/>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name7}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">I</th>
				<th width="15%" align="center">II</th>

			</tr>
								<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id7}" name="sub_id" id="sub_id"/>
								<select name="grade_1">
										<c:choose>
    									<c:when test="${not empty met1}">
											<option value="${met1[counter.count-1]}">${met1[counter.count-1]}</option>          
    									</c:when>
    									<c:otherwise>
    										<option value="----------">----------</option>
    									</c:otherwise>
										</c:choose>	
										<option value="----------">----------</option>										
										<option value="A1">A1</option>										
										<option value="A2">A2</option>										
										<option value="B1">B1</option>										
										<option value="B2">B2</option>										
										<option value="C">C</option>
										
									</select>
							</td>					
							<td width="30%" align="center">
								<select name="grade_2">
										<c:choose>
    									<c:when test="${not empty met2}">
											<option value="${met2[counter.count-1]}">${met2[counter.count-1]}</option>          
    									</c:when>
    									<c:otherwise>
    										<option value="----------">----------</option>
    									</c:otherwise>
										</c:choose>	
										<option value="----------">----------</option>											
										<option value="A1">A1</option>										
										<option value="A2">A2</option>										
										<option value="B1">B1</option>										
										<option value="B2">B2</option>										
										<option value="C">C</option>
										
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
				<th width="15%" align="center">I</th>
				<th width="15%" align="center">II</th>

			</tr>
								<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id8}" name="sub_id" id="sub_id"/>
							<select name="grade_1">
										<c:choose>
    									<c:when test="${not empty met1}">
											<option value="${met1[counter.count+2]}">${met1[counter.count+2]}</option>          
    									</c:when>
    									<c:otherwise>
    										<option value="----------">----------</option>
    									</c:otherwise>
										</c:choose>
										<option value="----------">----------</option>													
										<option value="A1">A1</option>										
										<option value="A2">A2</option>										
										<option value="B1">B1</option>										
										<option value="B2">B2</option>										
										<option value="C">C</option>
										
									</select>
							</td>					
							<td width="30%" align="center">
								<select name="grade_2">
										<c:choose>
    									<c:when test="${not empty met2}">
											<option value="${met2[counter.count+2]}">${met2[counter.count+2]}</option>          
    									</c:when>
    									<c:otherwise>
    										<option value="----------">----------</option>
    									</c:otherwise>
										</c:choose>
										<option value="----------">----------</option>													
										<option value="A1">A1</option>										
										<option value="A2">A2</option>										
										<option value="B1">B1</option>										
										<option value="B2">B2</option>										
										<option value="C">C</option>
										
									</select>
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
			<div style="text-align:center">
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:14px;">
			<div style="background-color:#3B5998;color:#fff;margin-bottom: 10px;height:23px;"><b>
				Grading Points:</b>
			</div>
			<div style="text-align: center;margin-bottom: 13px;border:1px;color:#006600"><b>
				
					<b>A1:</b>
					Excellent  &nbsp;&nbsp;
				
					<b>A2:</b>
					Very Good  &nbsp;&nbsp;
				
					<b>B1:</b>
					Good  &nbsp;&nbsp;
				
					<b>B2:</b>
					Average &nbsp;&nbsp;
				
					<b>C:</b>
					Below Average &nbsp;&nbsp;
				
			</b></div><b>
		</b></div><b>
	</b></div><b>
	
	<br>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th rowspan="2" width="40%" align="center">${name9}</th>				
								
			</tr>
			<tr>
				<th width="15%" align="center">I</th>
				<th width="15%" align="center">II</th>

			</tr>
								<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
								<td width="30%" align="center">
								<input type="hidden" value="${subcat.id}" name="skill_id" id="skill_id"/>
								<input type="hidden" value="${sub_id9}" name="sub_id" id="sub_id"/>
										<c:choose>
    									<c:when test="${not empty met1}">
											<input type="text" maxlength="3" name="attendance_1" value="${met1[counter.count+8]}"/>            
    									</c:when>
    									<c:otherwise>
    										<input type="text" maxlength="3" name="attendance_1"/>  
    									</c:otherwise>
										</c:choose>   						
							</td>					
							<td width="30%" align="center">
								<c:choose>
    									<c:when test="${not empty met2}">
											<input type="text" maxlength="3" name="attendance_2" value="${met2[counter.count+8]}"/>            
    									</c:when>
    									<c:otherwise>
    										<input type="text" maxlength="3" name="attendance_2"/>  
    									</c:otherwise>
										</c:choose>  
							</td>					
				</tr>
				</c:forEach>		
				</tbody></table>
		</div>
		
		
		
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;">
			<table style="width:100%;margin:0 auto">
				<tbody><tr><td align="left" colspan="3">I Term</td></tr>
				<tr><td colspan="3">
					<c:choose>
					<c:when test="${not empty listmsr}">
					<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
					<textarea style="width:100%;height:50px;padding:0px;" name="remark_1" resize="false">${msr.remark}</textarea>	  
    				</c:forEach>
    				</c:when>
    				<c:otherwise>
    				<textarea style="width:100%;height:50px;padding:0px;" name="remark_1" resize="false"></textarea>
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
			<textarea style="width:320px;height:50px;padding:0px;" name="principal_1" resize="false">${msr.by_principal}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="principal_1" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">			
			<textarea style="width:320px;height:50px;padding:0px;" name="coordinator_1" resize="false">${msr.by_coordinator}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="coordinator_1" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
			<textarea style="width:320px;height:50px;padding:0px;" name="classteacher_1" resize="false">${msr.by_class_teacher}</textarea>   
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="classteacher_1" resize="false"></textarea>
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
					<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
					<textarea style="width:100%;height:50px;padding:0px;" name="remark_2" resize="false">${msr.remark}</textarea>	  
    				</c:forEach>
    				</c:when>
    				<c:otherwise>
    				<textarea style="width:100%;height:50px;padding:0px;" name="remark_2" resize="false"></textarea>
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
			<textarea style="width:320px;height:50px;padding:0px;" name="principal_2" resize="false">${msr.by_principal}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="principal_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">			
			<textarea style="width:320px;height:50px;padding:0px;" name="coordinator_2" resize="false">${msr.by_coordinator}</textarea>  
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="coordinator_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
			<td width="30%">
			<c:choose>
			<c:when test="${not empty listmsr}">
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
			<textarea style="width:320px;height:50px;padding:0px;" name="classteacher_2" resize="false">${msr.by_class_teacher}</textarea>   
    		</c:forEach>
    		</c:when>
    		<c:otherwise>
    		<textarea style="width:320px;height:50px;padding:0px;" name="classteacher_2" resize="false"></textarea>
    		</c:otherwise>
    		</c:choose>
    		</td>
		</tr>				
			</tbody></table>
			</div>
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