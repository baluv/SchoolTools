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
	if(rno.equalsIgnoreCase("**")||rno.equalsIgnoreCase("NA")){
	rno="0";
	}
	int rollno=Integer.parseInt(rno);
	session.setAttribute("rollNumber", rollno);
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
	<br/>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name0}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list0}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count-1].grade}</td>
						<td align="center">${listme[counter.count-1].description}</td>
						<td align="center">${listme2[counter.count-1].grade}</td>
						<td align="center">${listme2[counter.count-1].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name1}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list1}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+1].grade}</td>
						<td align="center">${listme[counter.count+1].description}</td>
						<td align="center">${listme2[counter.count+1].grade}</td>
						<td align="center">${listme2[counter.count+1].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name2}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list2}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+2].grade}</td>
						<td align="center">${listme[counter.count+2].description}</td>
						<td align="center">${listme2[counter.count+2].grade}</td>
						<td align="center">${listme2[counter.count+2].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name3}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list3}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+5].grade}</td>
						<td align="center">${listme[counter.count+5].description}</td>
						<td align="center">${listme2[counter.count+5].grade}</td>
						<td align="center">${listme2[counter.count+5].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
	<c:choose>
	<c:when test="${standard_id==14}">
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name4}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list4}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+7].grade}</td>
						<td align="center">${listme[counter.count+7].description}</td>
						<td align="center">${listme2[counter.count+7].grade}</td>
						<td align="center">${listme2[counter.count+7].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name5}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list5}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+9].grade}</td>
						<td align="center">${listme[counter.count+9].description}</td>
						<td align="center">${listme2[counter.count+9].grade}</td>
						<td align="center">${listme2[counter.count+9].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name6}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list6}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+10].grade}</td>
						<td align="center">${listme[counter.count+10].description}</td>
						<td align="center">${listme2[counter.count+10].grade}</td>
						<td align="center">${listme2[counter.count+10].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name7}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list7}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+13].grade}</td>
						<td align="center">${listme[counter.count+13].description}</td>
						<td align="center">${listme2[counter.count+13].grade}</td>
						<td align="center">${listme2[counter.count+13].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name8}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list8}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+15].grade}</td>
						<td align="center">${listme[counter.count+15].description}</td>
						<td align="center">${listme2[counter.count+15].grade}</td>
						<td align="center">${listme2[counter.count+15].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name9}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list9}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+18].grade}</td>
						<td align="center">${listme[counter.count+18].description}</td>
						<td align="center">${listme2[counter.count+18].grade}</td>
						<td align="center">${listme2[counter.count+18].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name10}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list10}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+21].grade}</td>
						<td align="center">${listme[counter.count+21].description}</td>
						<td align="center">${listme2[counter.count+21].grade}</td>
						<td align="center">${listme2[counter.count+21].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name11}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list11}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+23].grade}</td>
						<td align="center">${listme[counter.count+23].description}</td>
						<td align="center">${listme2[counter.count+23].grade}</td>
						<td align="center">${listme2[counter.count+23].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name12}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list12}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+24].grade}</td>
						<td align="center">${listme[counter.count+24].description}</td>
						<td align="center">${listme2[counter.count+24].grade}</td>
						<td align="center">${listme2[counter.count+24].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name13}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list13}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+27].grade}</td>
						<td align="center">${listme[counter.count+27].description}</td>
						<td align="center">${listme2[counter.count+27].grade}</td>
						<td align="center">${listme2[counter.count+27].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name14}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list14}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+30].grade}</td>
						<td align="center">${listme[counter.count+30].description}</td>
						<td align="center">${listme2[counter.count+30].grade}</td>
						<td align="center">${listme2[counter.count+30].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name15}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list15}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+32].grade}</td>
						<td align="center">${listme[counter.count+32].description}</td>
						<td align="center">${listme2[counter.count+32].grade}</td>
						<td align="center">${listme2[counter.count+32].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name16}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list16}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+33].grade}</td>
						<td align="center">${listme2[counter.count+33].grade}</td>
						</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name17}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list17}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+33].description}</td>
						<td align="center">${listme2[counter.count+33].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name18}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list18}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+35].description}</td>
						<td align="center">${listme2[counter.count+35].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	</c:when>
	
	
	<c:otherwise>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name4}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list4}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+7].grade}</td>
						<td align="center">${listme[counter.count+7].description}</td>
						<td align="center">${listme2[counter.count+7].grade}</td>
						<td align="center">${listme2[counter.count+7].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name5}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th> Ramaaaa
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list5}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+10].grade}</td>
						<td align="center">${listme[counter.count+10].description}</td>
						<td align="center">${listme2[counter.count+10].grade}</td>
						<td align="center">${listme2[counter.count+10].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name6}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list6}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+13].grade}</td>
						<td align="center">${listme[counter.count+13].description}</td>
						<td align="center">${listme2[counter.count+13].grade}</td>
						<td align="center">${listme2[counter.count+13].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name7}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list7}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+16].grade}</td>
						<td align="center">${listme[counter.count+16].description}</td>
						<td align="center">${listme2[counter.count+16].grade}</td>
						<td align="center">${listme2[counter.count+16].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name8}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list8}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+18].grade}</td>
						<td align="center">${listme[counter.count+18].description}</td>
						<td align="center">${listme2[counter.count+18].grade}</td>
						<td align="center">${listme2[counter.count+18].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name9}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list9}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+20].grade}</td>
						<td align="center">${listme[counter.count+20].description}</td>
						<td align="center">${listme2[counter.count+20].grade}</td>
						<td align="center">${listme2[counter.count+20].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="2" colspan="1" align="center">${name10}</th>			
				<th colspan="2">${termname0}</th>		
				<th colspan="2">${termname1}</th>				
		</tr><tr>					
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>
				<th colspan="1">Grade</th>						
				<th colspan="1">Remarks</th>		
		</tr>	
		<c:forEach items="${list10}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+23].grade}</td>
						<td align="center">${listme[counter.count+23].description}</td>
						<td align="center">${listme2[counter.count+23].grade}</td>
						<td align="center">${listme2[counter.count+23].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name11}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list11}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+24].grade}</td>
						<td align="center">${listme2[counter.count+24].grade}</td>
						</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name12}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list12}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+24].description}</td>
						<td align="center">${listme2[counter.count+24].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;">	
	<table align="center" width="100%" cellpadding="1" cellspacing="1">
		<tbody><tr>
			<th width="25%" rowspan="1" colspan="1" align="center">${name13}</th>			
				<th colspan="1">${termname0}</th>		
				<th colspan="1">${termname1}</th>				
		</tr>
		<c:forEach items="${list13}" var="subject1" varStatus="counter">	
			<tr><td width="25%" colspan="1"><c:out value="${subject1.name}"></c:out></td>				
						<td align="center">${listme[counter.count+26].description}</td>
						<td align="center">${listme2[counter.count+26].description}</td>								
			</tr>			
		</c:forEach>
	</tbody></table>
	</div>
	</c:otherwise>
	</c:choose>
	<div style="border:1px solid #999;width:15%;margin:0 auto;margin-bottom:15px;">
		<table style="width:100%;margin:0 auto">
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