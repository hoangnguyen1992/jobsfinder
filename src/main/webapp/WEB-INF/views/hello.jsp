<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
.
<html ng-app>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">
</head>

<body ng-controller="myCtrl">
      
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><spring:message code="label.welcome"></spring:message> <c:out value="${user.displayName}" /></a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="logout"><spring:message code="label.logout"></spring:message></a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.sort"></spring:message><b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#" ng-click="orderCities = 'name'"><spring:message code="label.sort.asc"></spring:message></a></li>
                <li><a href="#" ng-click="orderCities = '-name'"><spring:message code="label.sort.desc"></spring:message></a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="<spring:message code="label.search"></spring:message>" ng-model="name">
            </div>
          </form>
          <ul class="nav navbar-nav navbar-right">
              <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="label.language"></spring:message><b class="caret"></b></a>
                   <ul class="dropdown-menu">
                     <li><a href="?lang=en">English</a></li>
                     <li><a href="?lang=bg">Bulgarian</a></li>
                   </ul>
            </li>
            </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    
  <table class="table table-striped table-hover ">
      <thead>
        <tr>
          <th>#</th>
          <th><spring:message code="label.country"></spring:message></th>
          <th><spring:message code="label.city"></spring:message></th>
          <th><spring:message code="label.region"></spring:message></th>
        </tr>
      </thead>
      <tbody>
        <tr class="success" ng-repeat="city in cities | filter:name | orderBy:orderCities">
          <td>{{city.id}}</td>
          <td>{{city.country}}</td>
          <td>{{city.name}}</td>
          <td>{{city.regionId}}</td>
        </tr>
      </tbody>
    </table> 
    
    <div style="width: 25%; margin: 0 auto;">
        <form>
    <p class="lead"><spring:message code="label.addCity"></spring:message></p>  
    <div class="form-group">
        <label class="control-label" for="inputSmall"><spring:message code="label.country"></spring:message></label>
        <input class="form-control input-sm" type="text" id="inputSmall" ng-model="countryName" placeholder="<spring:message code="label.country"></spring:message>">
    </div>
    <div class="form-group">
        <label class="control-label" for="inputSmall"><spring:message code="label.city"></spring:message></label>
        <input class="form-control input-sm" type="text" id="inputSmall" ng-model="cityName" placeholder="<spring:message code="label.city"></spring:message>">
    </div>
    <div class="form-group">
        <label class="control-label" for="inputSmall"><spring:message code="label.region"></spring:message></label>
        <input class="form-control input-sm" type="text" id="inputSmall" ng-model="regionNumber" placeholder="<spring:message code="label.region"></spring:message>">
    </div>
    <button type="button" class="btn btn-primary" ng-model="hasChanges" ng-click="addCity();"><spring:message code="label.add"></spring:message></button>
    </form>
    </div>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    
    <script type="text/javascript">
    
    function myCtrl($scope, $http){
        $http.get('getData').success(function(data){
            $scope.cities = data;
        });
        $scope.hasChanges=false;
        $scope.orderCities = "name";

         $scope.addCity = function() {

            var jsonData = {"country": $scope.countryName, "name": $scope.cityName, "regionId": $scope.regionNumber};
            
            $http({
                url : "addNewCity",
                method : "POST",
                headers: {"Content-Type" : "application/json"},
                data : jsonData
            }).success(function(data){
                $scope.cities.push(data);
            }).error(function(data, status) {
                alert(data);
            });
         }
    }
    </script>
</body>
</html>