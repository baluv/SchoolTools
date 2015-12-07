<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SCHOOL TOOLS : Login</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/savetheenvironment.js"></script>
	<link rel="stylesheet" href="../css/savetheenvironment.css" type="text/css">
	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>  
	</head>

	<body>

	

	<!-- TOP BAR -->
	<div id="top-bar" style="background: #3b5998;">
		
		<div class="page-full-width">
		
			<a href="#"><img src="../images/app_logo.gif"></a>

		</div> <!-- end full-width -->	
	
	</div> <!-- end top-bar -->
	
	
	
	<!-- HEADER --->
	<div id="content">	
	<div id="header" >
	
		<div class="page-full-width cf">
	
			<div id="login-intro" class="fl" >
			
				
				
			</div> <!-- login-intro -->
              <h1>Login  to School tools </h1>
			  <h4>Enter your credentials below</h4>
			  <br/><br/>
			 </div>    <!-- end full-width -->	


			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 39px height. -->
	

	
	
<table>
<tr>
<img  src="../images/cool-school-tools.jpg" height="150" width="250"  alt=""  />
</tr><br><tr><h2>Who we are?</h2>
<h4>Connects school management with teachers, students and parents to one network</h4>
<h2>Who we do?</h2>
<h4>Helps school management to run the school effectively</h4>

</tr>
</table>
	

	

	<div class="login">
	
<c:url var="checkLoginURL" value="/school123/checklogin.html"/> 
<form:form action="${checkLoginURL}" method="post" id="login-form" commandName="loginForm">
		
	<!-- 	<form action="#" method="POST" id="login-form"> -->
	

		
			<fieldset>
			

			

				<p><br/>
					<label for="login-username">username</label>
					<input type="text" id="login-username1" name="username" class="round full-width-input"/>
				</p>

				<p>
					<label for="login-password">password</label>
					<input type="password" id="login-password" name="password" class="round full-width-input"/>
				</p>
				
				<p>I've <a href="#">forgotten my password</a>.</p>
			
				<!-- <a href="  " class="button round blue image-right ic-right-arrow">Sign In</a> -->
				<input type="submit" value="Sign In">

			</fieldset>

			

		</form:form>
		</div> <!-- end content -->
	
	
	
	<!-- FOOTER -->
	<div id="footer">

		<p>&copy;  2014 AECS Version 1.0 | Developed By <a href="http://www.srivasishta.com" target="_blank">www.srivasishta.com</a></p>
		
	
	</div> <!-- end footer -->

			
		

	</div>
	</div><!-- end header -->
	
	
	
	<!-- MAIN CONTENT -->
	
</body>
</html>