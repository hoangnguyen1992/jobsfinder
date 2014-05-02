<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>

<div class="container">
 <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown">Choose Language <b class="caret"></b></a>
           <ul class="dropdown-menu">
             <li><a href="?lang=en">English</a></li>
             <li><a href="?lang=bg">Bulgarian</a></li>
           </ul>
         </li>
</div>
    <form action="j_spring_security_check" method="POST" style="width: 220px; margin: 0 auto; margin-top: 20%;">
        <c:if test='${not empty param["error"]}'>
        <div class="form-group">
            <div class="bs-example">
                <div class="alert alert-danger alert-error">
                    <strong><spring:message code="label.badcredentials"></spring:message></strong>
                </div>
            </div>
        </div>
        </c:if>
        <div class="form-group">
            <input class="form-control" id="focusedInput" type="text" placeholder='<spring:message code="label.username"></spring:message>' name="j_username">
        </div>
        <div class="form-group">
            <input class="form-control" id="focusedInput" type="password" placeholder="<spring:message code="label.password"></spring:message>" name="j_password">
        </div>
        <input type="submit" class="btn btn-primary" style="width: 220px;" value="<spring:message code="label.signin"></spring:message>"/>
    </form>
    <br/>
    <p class="text-center sign-up">
        <strong> <a href="register"><spring:message code="label.signup"></spring:message></a> </strong> <spring:message code="label.signup2"></spring:message>
    </p>
   <!-- 
    <form action="j_spring_security_check" method="POST">
        <table>
            <tr>
               <td>UserName: </td>
               <td>
                  <input type="text" name="j_username"/>
               </td> 
            </tr>
            <tr>
               <td>Password: </td>
               <td>
                 <input type="password" name="j_password"/>
               </td> 
            </tr>
            <tr>
            <td colspan="1" align="left">
                 <a href="/register" value="Register"></a>
               </td>
               <td colspan="2" align="right">
                 <input type="submit" value="Login"/>
               </td>
            </tr>
        </table>
    </form>
    <font color="red">
        <span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"]}</span>
    </font>
     -->
         <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</body>
</html>