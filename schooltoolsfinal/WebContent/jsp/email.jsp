<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- saved from url=(0053)http://192.168.0.6:82/marksheets/marks/entry/510/1/2/ -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">
<head>
   
</head>
<body>
<c:url var="checkLoginURL" value="/school123/email.html"/> 
<form:form action="${checkLoginURL}" method="get">

<input type="hidden" name="dob" value="${dob}"/>
<input type="hidden" name="standard" value="${standard }"/>
<input type="hidden" name="student_name" value="${student_name}"/>
<input type="hidden" name="standard_id" value="${standard_id}"/>
<input type="hidden" name="rollno" value="${rollno}"/>

    <table cellpadding="2" cellspacing="10">
        <tr>
            <td>
               To:
            </td>
            <td>
                <input type="text" name="tomail" id="tomail"  style="width: 300px" value="${mail}">
            </td>
        </tr>
        <tr>
            <td>
               Add Cc:	
            </td>
            <td>
                <input type="text" name="ccmail" id="ccmail" style="width: 300px">
            </td>
        </tr>
       
        <tr>
            <td>
            </td>
            <td align="center">
                <input type="submit" value="Send" >
            </td>
        </tr>
    </table></form:form>
 
</body>
</html>
