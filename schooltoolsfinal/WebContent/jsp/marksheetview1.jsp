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

<title> SchoolTools | Student Marks Report for - <%= request.getParameter("name") %> </title>
<style>
	#studentinfotop td{
		border:0px;
	}
	
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
<script src="../js/ModalPopupWindow.js" type="text/javascript"></script>
<script>
 var modalWin = new CreateModalPopUpObject();
 modalWin.SetLoadingImagePath("../images/loading.gif");
 modalWin.SetCloseButtonImagePath("../images/remove.gif");
function ShowNewPage(){
 modalWin.ShowURL('popup.html?standard_id=${standard_id}&dob=${dob}&student_name=${student_name}&rollno=${rollno}&standard=${standard}&year=${year}',320,470,'Email');
 }
 </script>
</head>


<body onload="" onunload="">
<%
	String studentName=request.getParameter("name");
	String rno=request.getParameter("Rollno");
	String standardId=request.getParameter("standard");
	int standard_Id=Integer.parseInt(request.getParameter("standard_id"));
	System.out.println("Evaluating date now Using S.O.P Method");
	session.setAttribute("rollNumber", rno);
	session.setAttribute("standardId", standardId);
	session.setAttribute("standard_Id", standard_Id);
%>
		
<c:url var="checkLoginURL" value="/school123/entrymarksheet.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">
<div class="container">

	<div style="border:0px solid #999;background-color:#fff;width:80%;margin:0 auto;margin-bottom:0.5em">
	
		<div style="float:left;">
			<img height="150px" width="200px" src="../images/logo_aecs.jpg" alt="School Emblem">
			
		</div>
		
		<div style="float:right;">
			<strong>
				AECS MAGNOLIA MAARUTI PUBLIC SCHOOL<br>
			</strong>
			
				#36/909,
			
			
				Arekere, <br>
			
			
				Bannerghatta Road,
			
			
			Bangalore - 500076,<br>
			Karnataka (KA), India,<br>
			<strong>Phone:</strong> 91-80-26485622/,
			
				<strong>Fax:</strong> + 91.80.26536324, <br>
			
			<strong>Email:</strong> magnoliamaaruti@aecsgroup.in, <br>
			<strong>Website:</strong> http://www.aecsgroup.in/.
		</div>
	</div>
	<div class="clear"></div>
		
<div class="framelayout" style="width:80%">
	
	<div style="border:0px solid #999;width:90%;margin:0 auto">
	<center>
			<h2>Student Assessment View</h2>
			<h3>${year}</h3><br>
	</center>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:0px;">
		<table style="border:0;width:50%;float:left;" id="studentinfotop">
			<tbody><tr>
				<td style="20%"><strong> Student Name: </strong></td><td>:${student_name} </td> 
				<td><strong> Date Of Birth </strong></td><td>:${dob}</td>
			</tr>
			<tr>
				<td><strong>Standard </strong></td><td>:${standard}</td> 
				<!--<td> <strong>Roll No</strong> </td><td>:08</td>-->
			</tr>
			<!--<tr>
				<td> <strong>Admission No</strong></td><td>:249 / 2011 - 12</td> 
				<td> </td><td></td>
			</tr>-->
		</tbody></table> 
		<div style="float:right;">
			<strong>
				<br>
				<a href="getPdf.html?standard_id=${standard_id}&dob=${dob}&student_name=${student_name}&rollno=${rollno}&standard=${standard}&year=${year}" target="_blank"><img width="20px" height="20px" title="Make PDF" alt="pdf" src="../images/pdf.jpg"></a> &nbsp;         
    			<a href="#" onclick="ShowNewPage()"><img width="20px" height="20px" title="Send Mail" alt="mail" src="../images/mail.jpg"></a><br/>	
			</strong>
				
		</div>
		<div class="clear"></div>
	</div>	
	<!-- Assessment -->
	<div class="clear"></div>
	<br>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">
	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="2" align="center">ASSESSMENT / SUBJECTS</th>
			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>
				<th colspan="3">${termname2}</th>
				<th colspan="1">${termname3}</th>		
				<th colspan="1">${termname4}</th>
				<th colspan="3">${termname5}</th>
				
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
			<tr><td width="25%" colspan="2"><c:out value="${subject.name}"></c:out></td>				
						<td align="center">${mnotes[counter.count-1]}</td>
						<td align="center">${mnotes[counter.count+5]}</td>
							<td align="center">${mnotes[counter.count+11]}</td>
							<td align="center">${mnotes[counter.count+17]}</td>
							<td align="center">${mnotes[counter.count+23]}</td>
							<td align="center">${mnotes[counter.count+29]}</td>							
							<td align="center">${mnotes[counter.count+35]}</td>
							<td align="center">${mnotes[counter.count+41]}</td>
							<td align="center">${mnotes[counter.count+47]}</td>
							<td align="center">${mnotes[counter.count+53]}</td>	
			</tr>			
		</c:forEach>
			<c:forEach items="${list}" var="subject" varStatus="counter" begin="6" end="6">
			<tr><td width="25%" colspan="2"><c:out value="${subject.name}"></c:out></td>
			<c:forEach items="${list}" var="subject" varStatus="c" begin="0" end="9">
						<td align="center">${mgrade[c.count-1]}</td>
			</c:forEach>		
			</tr>
			</c:forEach>	    
	</tbody></table>
	</div>
	<!-- Evaluation -->
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
	
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name7}</th>
					<th width="30%" align="center">I</th>
					<th width="30%" align="center">II</th>
				</tr>
				<c:forEach items="${list7}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${met1[counter.count-1]}</td>					
					<td width="30%" align="center">${met2[counter.count-1]}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name8}</th>
					<th width="30%" align="center">I</th>
					<th width="30%" align="center">II</th>
				</tr>
				<c:forEach items="${list8}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${met1[counter.count+2]}</td>					
					<td width="30%" align="center">${met2[counter.count+2]}</td>					
				</tr>
				</c:forEach>     
    		</table>
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
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name9}</th>
					<th width="30%" align="center">I</th>
					<th width="30%" align="center">II</th>
				</tr>
				<c:forEach items="${list9}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${met1[counter.count+8]}</td>					
					<td width="30%" align="center">${met2[counter.count+8]}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;margin-top:20px;">
			<table style="width:100%;margin:0 auto">
				<tbody><tr><td align="left" colspan="3">I Term</td></tr>
				<tr>
					<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
					<td align="left" colspan="3"><c:out value="${msr.remark}"></c:out></td>
					</c:forEach>
				</tr>
				<tr>
					<th width="30%" align="center">Director</th>
					<th width="35%" align="center">Coordinator</th>
					<th width="35%" align="center">Class Teacher</th>
				</tr>		
				
				<tr>
			<c:forEach items="${listmsr}" var="msr" begin="0" end="0">
				<td><c:out value="${msr.by_principal}"></c:out></td>
				<td><c:out value="${msr.by_coordinator}"></c:out></td>
				<td><c:out value="${msr.by_class_teacher}"></c:out></td>
				</c:forEach>	
			</tr>
				
			</tbody></table>
			</div>
		
	
		
			<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;margin-top:20px;">
			<table style="width:100%;margin:0 auto">
				<tbody><tr><td align="left" colspan="3">II Term</td></tr>
				<tr>
					<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
					<td align="left" colspan="3"><c:out value="${msr.remark}"></c:out></td>
					</c:forEach>
				</tr>
				<tr>
					<th width="30%" align="center">Director</th>
					<th width="35%" align="center">Coordinator</th>
					<th width="35%" align="center">Class Teacher</th>
				</tr>		
				
				<tr>
			<c:forEach items="${listmsr}" var="msr" begin="1" end="1">
				<td><c:out value="${msr.by_principal}"></c:out></td>
				<td><c:out value="${msr.by_coordinator}"></c:out></td>
				<td><c:out value="${msr.by_class_teacher}"></c:out></td>
				</c:forEach>	
			</tr>
				
			</tbody></table>
			</div>
	
	
	
			</div></form:form>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		
				
		</div>
	<!-- container -->

</body></html>