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
			<h3>${year}</h3><br/>
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
				<br/>
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
			<th width="25%" rowspan="2" align="center">ASSESSMENT / SUBJECTS</th>
			
				<th colspan="3">${termname0}</th>		
				<th colspan="4">${termname1}</th>
				<c:if test="${standard_id>5}">
				<th colspan="4">${termname2}</th>
				</c:if>
				
		</tr>
		<tr>
			
				<c:forEach items="${tag}" var="subject">	
				<th align="center"><c:out value="${subject.name}"></c:out></th>				
				</c:forEach>
				
		</tr>
		
		<c:choose>
    	<c:when test="${standard_id==5}">
    	<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="5">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
							<td align="center">${listmas0[counter.count-1]}</td>
							<td align="center">${listmas1[counter.count-1]}</td>
							<td align="center">${listmas2[counter.count-1]}</td>
							<td align="center">${listmas3[counter.count-1]}</td>
							<td align="center">${listmas4[counter.count-1]}</td>
							<td align="center">${listmas5[counter.count-1]}</td>							
							<td align="center">${listmas6[counter.count-1]}</td>		
			</tr>
		</c:forEach>
    	</c:when>
    	<c:when test="${standard_id>5}">
    	<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="5">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
							<td align="center">${listmas0[counter.count-1]}</td>
							<td align="center">${listmas1[counter.count-1]}</td>
							<td align="center">${listmas2[counter.count-1]}</td>
							<td align="center">${listmas3[counter.count-1]}</td>
							<td align="center">${listmas4[counter.count-1]}</td>
							<td align="center">${listmas5[counter.count-1]}</td>
							<td align="center">${listmas6[counter.count-1]}</td>
							<td align="center">${listmas7[counter.count-1]}</td>
							<td align="center">${listmas8[counter.count-1]}</td>
							<td align="center">${listmas9[counter.count-1]}</td>
							<td align="center">${listmas10[counter.count-1]}</td>
								
			</tr>
		</c:forEach>
    	</c:when>
    	<c:otherwise>
 		<c:forEach items="${list}" var="subject" varStatus="counter" begin="0" end="4">		
			<tr><td width="25%"><c:out value="${subject.name}"></c:out></td>				
							<td align="center">${listmas0[counter.count-1]}</td>
							<td align="center">${listmas1[counter.count-1]}</td>
							<td align="center">${listmas2[counter.count-1]}</td>
							<td align="center">${listmas3[counter.count-1]}</td>
							<td align="center">${listmas4[counter.count-1]}</td>
							<td align="center">
							<c:choose>
    						<c:when test="${standard_id>2}">
								${listmas5[counter.count-1]}          
    						</c:when>
    						<c:otherwise>
    							${listmr[counter.count-1]}
    						</c:otherwise>
							</c:choose>
							</td>							
							<td align="center">${listmas6[counter.count-1]}</td>		
			</tr>
		</c:forEach>
 		</c:otherwise>
    	</c:choose>					    
	</tbody></table>
	</div>
	<!-- Evaluation -->
	
	<br/>
	
	<c:if test="${standard_id>2}">
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<td width="25%" align="center">
					<c:choose>
    				<c:when test="${standard_id>2 && standard_id<5}">
					${name5}
					</c:when>
					<c:when test="${standard_id>8}">
					${name5}
					</c:when>
    				<c:otherwise>
    				${name6}
    				</c:otherwise>
    				</c:choose>
					</td>
					<td width="75%" align="center">${overall}</td>													
				</tr>
				</table>
				<c:if test="${standard_id>5}">
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
						<tr>
							<td>E2</td>
							<td>00-20</td>
							<td>2.0</td>
						</tr>
						<tr>
							<td colspan="3"> <b> * = Denotes Upgradation </b></td>
						</tr>
					</tbody></table>
				</td>
			</tr>
		</tbody></table>
		<div style="margin-bottom:-20px;">
			<span><big><b><center> PART-2:&nbsp; CO-SCHOLASTIC AREAS</center></b></big></span>
		</div>
				</c:if>
		</div>
		<c:if test="${standard_id<6}">
			<div style="text-align:center;color:#006600;padding-top:7px;">
					<b> FINAL = I (10%)+ II (10%)+III (10%)+ IV (10%)+H Y (30%)+ Annual (30%)</b>
				</div>	
		</c:if>		
				<br/><br/>
				</c:if>
			
			<c:choose>
			<c:when test="${standard_id>8}">
			<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name6}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list6}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval6[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval6[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name7}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list7}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name8}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list8}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name9}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list9}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval9[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval9[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name10}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list10}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==9}">
					<td width="30%" align="center">${markeval10[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval10[counter.count-1].grade}</td>				
					</c:when>
					<c:otherwise>
					<td width="30%" align="center">${markeval10[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval10[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>														
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name11}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list11}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>		
					<c:choose>
					<c:when test="${standard_id==9}">
					<td width="30%" align="center">${markeval11[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval11[counter.count-1].grade}</td>			
					</c:when>
					<c:otherwise>
					<td width="30%" align="center">${markeval11[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval11[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>													
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<div style="border:1px solid #999;width:100%;margin:0 auto;margin-bottom:14px;">
						<div style="background-color:#3B5998;color:#fff;margin-bottom: 10px;height:23px;"><b>
							Grading Points:</b>
						</div>
						<div style="text-align: center;margin-bottom: 13px;border:1px;color:#006600"><b>
								<span>	A= 4.1 - 5.0, &nbsp; B=3.1 - 4.0, &nbsp;C=2.1 - 3.0,&nbsp;D=1.1 - 2.0,&nbsp;E=0.0 - 1.0</span>
						</b></div><b>
					</b></div><b>
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name12}</th>
					<th width="60%" align="center"></th>
					
				</tr>
				<c:forEach items="${list12}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==9}">
					<td width="60%" align="center">${markeval12[counter.count-1].description}</td>				
					</c:when>
					<c:otherwise>
					<td width="60%" align="center">${markeval12[counter.count-1].description}</td>	
					</c:otherwise>
					</c:choose>		
				</tr>
				</c:forEach>  
    			</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name14}</th>
					<th width="30%" align="center">Term I</th>
					<th width="30%" align="center">Term II</th>
					
				</tr>
				<c:forEach items="${list14}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==9}">
						<td width="30%" align="center">${markeval14[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval14[counter.count-1].grade}</td>				
					</c:when>
					<c:otherwise>
						<td width="30%" align="center">${markeval214[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval214[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>		
				</tr>
				</c:forEach>    
    			</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name13}</th>
					<th width="60%" align="center"></th>
					
				</tr>
				<c:forEach items="${list13}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==9}">
					<td width="60%" align="center">${markeval13[counter.count-1].grade}</td>			
					</c:when>
					<c:otherwise>
					<td width="60%" align="center">${markeval13[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>	
				</tr>
				</c:forEach>  
    			</table>
		</div>
			</c:when>
    		<c:when test="${standard_id>5 && standard_id<9}">
			<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name7}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list7}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name8}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list8}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name9}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list9}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval9[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval9[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name10}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list10}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval10[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval10[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    		</table>
		</div>
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name11}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list11}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==6}">
					<td width="30%" align="center">${markeval11[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval11[counter.count-1].grade}</td>				
					</c:when>
					<c:otherwise>
					<td width="30%" align="center">${markeval11[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval11[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>
										
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name12}</th>
					<th width="30%" align="center">Descriptive Indicators</th>
					<th width="30%" align="center">Grade</th>
				</tr>
				<c:forEach items="${list12}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>		
					<c:choose>
					<c:when test="${standard_id==6}">
					<td width="30%" align="center">${markeval12[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval12[counter.count-1].grade}</td>				
					</c:when>
					<c:otherwise>
					<td width="30%" align="center">${markeval12[counter.count-1].description}</td>					
					<td width="30%" align="center">${markeval12[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>			
										
				</tr>
				</c:forEach>     
    		</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<div style="border:1px solid #999;width:100%;margin:0 auto;margin-bottom:14px;">
						<div style="background-color:#3B5998;color:#fff;margin-bottom: 10px;height:23px;"><b>
							Grading Points:</b>
						</div>
						<div style="text-align: center;margin-bottom: 13px;border:1px;color:#006600"><b>
								<span>	A= 4.1 - 5.0, &nbsp; B=3.1 - 4.0, &nbsp;C=2.1 - 3.0,&nbsp;D=1.1 - 2.0,&nbsp;E=0.0 - 1.0</span>
						</b></div><b>
					</b></div><b>
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name13}</th>
					<th width="60%" align="center"></th>
					
				</tr>
				<c:forEach items="${list13}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>
					<c:choose>
					<c:when test="${standard_id==6}">
					<td width="60%" align="center">${markeval13[counter.count-1].description}</td>				
					</c:when>
					<c:otherwise>
					<td width="60%" align="center">${markeval13[counter.count-1].description}</td>
					</c:otherwise>
					</c:choose>						
						
									
				</tr>
				</c:forEach>  
    			</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name15}</th>
					<th width="30%" align="center">Term I</th>
					<th width="30%" align="center">Term II</th>
					
				</tr>
				<c:forEach items="${list15}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==6}">
					<td width="30%" align="center">${markeval315[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval215[counter.count-1].grade}</td>				
					</c:when>
					<c:otherwise>
					<td width="30%" align="center">${markeval315[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval215[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>					
					
									
				</tr>
				</c:forEach>    
    			</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">${name14}</th>
					<th width="60%" align="center"></th>					
				</tr>
				<c:forEach items="${list14}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>	
					<c:choose>
					<c:when test="${standard_id==6}">
					<td width="60%" align="center">${markeval314[counter.count-1].grade}</td>			
					</c:when>
					<c:otherwise>
					<td width="60%" align="center">${markeval314[counter.count-1].grade}</td>
					</c:otherwise>
					</c:choose>									
				</tr>
				</c:forEach>  
    			</table>
		</div>
			</c:when>
			
			
			
			
			
			
			
			
			
			
			
			
			
    		<c:otherwise>
			<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name0}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list0}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval0[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval0[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval20[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval20[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name1}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list1}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval1[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval1[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval21[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval21[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name2}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list2}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval2[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval2[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval22[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval22[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name3}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list3}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval3[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval3[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval23[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval23[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name4}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list4}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval4[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval4[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval24[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval24[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		
		<c:if test="${standard_id==5}">
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tbody><tr>
					<th rowspan="2" width="16%" align="center">${name5}</th>
					
						<th colspan="2" width="42%" align="center">Term I</th>
					
						<th colspan="2" width="42%" align="center">Term II</th>
					
				</tr>
				<tr>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
					<th width="32%" align="center">Descriptive Indicator</th>
					<th width="10%" align="center">Grade</th>
				</tr>	
				<c:forEach items="${list5}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%"><c:out value="${subcat.name}"></c:out></td>					
							<td width="32%" align="center">${markeval5[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval5[counter.count-1].grade}</td>					
							<td width="32%" align="center">${markeval25[counter.count-1].description}</td>
							<td width="10%" align="center">${markeval25[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
				</tbody></table>
		</div>
		
		</c:if>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">					
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
					<th width="30%" align="center">Term I</th>
					<th width="30%" align="center">Term II</th>
				</tr>
				<c:choose>
				<c:when test="${standard_id==5}">
				<c:forEach items="${list7}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval27[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>    
    			</c:when>
    			<c:when test="${standard_id>2 && standard_id<5}">
				<c:forEach items="${list6}" var="subcat" varStatus="counter">  
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval6[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval26[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>     
    			</c:when>
    			<c:otherwise>
    			<c:forEach items="${list5}" var="subcat" varStatus="counter">
    			<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval5[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval25[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
    			</c:otherwise>
				</c:choose>				
				</table>
		</div>
		
		
		
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">
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
					<th width="30%" align="center">Term I</th>
					<th width="30%" align="center">Term II</th>
				</tr>
				<c:choose>
				<c:when test="${standard_id==5}">
				<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval28[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>    
    			</c:when>
    			<c:when test="${standard_id>2 && standard_id<5}">
				<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval7[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval27[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>    
    			</c:when>
    			<c:otherwise>
    			<c:forEach items="${list6}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval6[counter.count-1].grade}</td>					
					<td width="30%" align="center">${markeval26[counter.count-1].grade}</td>					
				</tr>
				</c:forEach>
    			</c:otherwise>
				</c:choose>					
				</table>
		</div>
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
				
				<div style="border:1px solid #999;width:100%;margin:0 auto;margin-bottom:14px;">
					<div style="background-color:#3B5998;color:#fff;margin-bottom: 10px;height:23px;"><b>
						Grading Scale:</b>
					</div>
					<div style="text-align: center;margin-bottom: 13px;border:1px;color:#006600"><b>
							<span><b>A+ </b>=Outstanding<b>(90%-100%), &nbsp; A</b>=Excellent<b>(75%-89%), &nbsp;B</b>-Very Good<b>(56%-74%),&nbsp;C</b>=Good<b>(35%-55%),&nbsp;D</b>=Scope For Improvement<b>(Below 35%)</b></span>
					</b></div><b>
				</b></div><b>
				</b>
		</div>
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">
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
					<th width="30%" align="center">Term I</th>
					<th width="30%" align="center">Term II</th>
					
				</tr>
				<c:choose>
				<c:when test="${standard_id==5}">
				<c:forEach items="${list10}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval10[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval210[counter.count-1].grade}</td>									
				</tr>
				</c:forEach>    
    			</c:when>
    			<c:when test="${standard_id>2 && standard_id<5}">
				<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval9[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval29[counter.count-1].grade}</td>
									
				</tr>
				</c:forEach> 				  
    			</c:when>
    			<c:otherwise>
    			<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="30%" align="center">${markeval8[counter.count-1].grade}</td>	
					<td width="30%" align="center">${markeval28[counter.count-1].grade}</td>
									
				</tr>
				</c:forEach>
    			</c:otherwise>
				</c:choose>					
				</table>
		</div>
		
		<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:10px;">
			
			<table align="center" width="100%" cellpadding="1" cellspacing="1">
				<tr>
					<th width="40%" align="center">
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
					<th width="60%" align="center"></th>
					
				</tr>
				<c:choose>
				<c:when test="${standard_id==5}">
				<c:forEach items="${list9}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="60%" align="center">${markeval9[counter.count-1].grade}</td>	
									
				</tr>
				</c:forEach>    
    			</c:when>
    			<c:when test="${standard_id>2}">
				<c:forEach items="${list8}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="60%" align="center">${markeval8[counter.count-1].grade}</td>	
									
				</tr>
				</c:forEach>  
    			</c:when>
    			<c:otherwise>
    			<c:forEach items="${list7}" var="subcat" varStatus="counter">
				<tr>
					<td width="40%" align="center">${subcat.name}</td>					
					<td width="60%" align="center">${markeval7[counter.count-1].grade}</td>	
									
				</tr>
				</c:forEach>
    			</c:otherwise>
				</c:choose>				
				</table>
		</div>
	    		</c:otherwise>
    		</c:choose>				
<div style="clear:both;"></div><br>
<!-- 	 -->
	<!--view student Results-->
<div style="clear:both;"></div><br>
	<div style="border:1px solid #999;width:90%;margin:0 auto;margin-bottom:15px;margin-top:-35px;">
		<table style="width:100%;margin:0 auto">
			<tbody><tr>
				<th width="10%" align="center">Result</th>
				<td width="90%" align="center"><c:out value="${listms}"></c:out></td>				
			</tr>		
		</tbody></table>
	</div>
	<!-- Remarks -->
	
	<div style="border:0px solid #999;width:90%;margin:0 auto;margin-bottom:-5px;margin-top:20px;">
		<table align="center" width="100%" cellpadding="1" cellspacing="1">
			<tbody><tr>
				<th width="40%">Director</th>
				<th width="30%">Coordinator</th>
				<th width="30%">Class Teacher</th>
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
	
			</div></form:form>
			
			<!-- c -->
		<!-- f -->
		<div id="footer">
		
				
		</div>
	<!-- container -->

</body></html>