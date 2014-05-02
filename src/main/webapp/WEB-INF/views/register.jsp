<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<title>
    <spring:message code="label.register"></spring:message>
</title>
</head>
<body>
    <div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
        <form:form role="form" action="register" modelAttribute="user" method="POST">
            <h2><spring:message code="label.registration"></spring:message></h2>
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                         <spring:message code='label.firstname' var="firstname"></spring:message>
                        <form:input type="text" path="firstName" required="true" class="form-control input-lg" placeholder="${firstname}" tabindex="1" />
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <spring:message code='label.lastname' var="lastname"></spring:message>
                        <form:input type="text" path="lastName" required="true" class="form-control input-lg" placeholder="${lastname}" tabindex="2" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <spring:message code='label.displayname' var="displayname"></spring:message>
                <form:input type="text" path="displayName" required="true" class="form-control input-lg" placeholder="${displayname}" tabindex="3" />
            </div>
            <div class="form-group">
                <spring:message code='label.mail' var='mail'></spring:message>
                <form:input type="email" path="userName" required="true" class="form-control input-lg" placeholder="${mail}" tabindex="4"/>
            </div>
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                    <spring:message code="label.password" var="password"/>
                        <form:input type="password" path="password"  required="true" class="form-control input-lg" placeholder='${password }'  />
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <div class="form-group">
                        <input type="password" name="password_confirmation" required="true" id="password_confirmation" class="form-control input-lg" placeholder="<spring:message code='label.confirmpassword'></spring:message>" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <!--  <span class="button-checkbox">
                        <button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" value="1">
                    </span> -->
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9">
                     <spring:message code="label.termsofuse1"></spring:message> <strong class="label label-primary"><spring:message code="label.register"></spring:message> </strong>, <spring:message code="label.termsofuse2"></spring:message> <a href="#" data-toggle="modal" data-target="#t_and_c_m"><spring:message code="label.termsofuser3"></spring:message></a> <spring:message code="label.termsofuse4"></spring:message>
                </div>
            </div>
            
            <hr class="colorgraph">
            <div class="row">
                <div class="col-xs-6 col-md-6"><input type="submit" value='<spring:message code="label.register"></spring:message>' class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                <div class="col-xs-6 col-md-6"><a href="login" class="btn btn-success btn-block btn-lg"><spring:message code="label.signin"></spring:message> </a></div>
            </div>
        </form:form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
    <!-- 
    <form:form action="register" modelAttribute="user" method="POST">
        <table>
            <tr>
                <td>UserName : </td>
                <td><form:input type="text" path="userName"/></td>
            </tr>
            <tr>
                <td>Password : </td>
                <td><form:input type="password" path="password"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="register"/></td>
            </tr>
        </table>
    </form:form>
    -->
</body>
</html>