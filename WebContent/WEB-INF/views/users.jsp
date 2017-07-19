<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!--<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.0.0/angular-material.min.css">-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.structure.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.theme.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-resource/1.4.0/angular-resource.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/app.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-ui.js"></script>
<script>
	
	$(function() {
		$("#dob").datepicker();
	});
</script>

<style type="text/css">
.bs-example {
	margin: 20px;
}
</style>



</head>
<body style="background-color:#E6E6FA" ng-controller="UserListCtrl">
	<div class="bs-example" id="headerWrapper">
		<caption>UserZone</caption>
	</div>

	<c:forEach var="row" items="${users}">
    First Name ${row.firstName}<br />
    Last Name ${row.lastName}<br />
    DOB ${row.dob}<br />
	</c:forEach>

	<div class="bs-example">
		<form id="formArea">
			<div class="form-group">
				<label for="firstName">First Name</label> <input type="type"
					class="form-control" id="firstName" placeholder="First Name"
					ng-model="user.firstName" required>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name</label> <input type="text"
					class="form-control" id="lastName" placeholder="Last Name"
					ng-model="user.lastName" required>
			</div>
			<div>
				<label>Date Of Birth :</label> <input type="text" placeholder="mm/DD/YYYY" class="form-control"
					name="selected_date" id="dob"  required ng-model="user.dob"/>
			</div>
			<p>
			<button class="btn btn-primary" ng-click="addUser(user)">Add
				User</button></p>
		</form>

		<form id="userArea">
			<div class="isa_success">
        		<span><i> {{ message }} </i></span>
    		</div>
    		<div class="isa_error">
        		<span><i> {{ emessage }} </i></span>
    		</div>
		
			<div>
				<label>Search User</label> <input type="Search Text"
					class="form-control" id="searchTxt" placeholder="Search"
					ng-model="searchStr" autocomplete="off">
			</div>

			<h3>List of Users</h3>

			<table style="width: 100%">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>DOB</th>
				</tr>
				<tr ng-repeat="user in users | filter:searchStr">
					<td ng-if="$odd" style="background-color: #f1f1f1"
						style="border=10px">{{ user.firstName }}</td>
					<td ng-if="$even">{{ user.firstName }}</td>

					<td ng-if="$odd" style="background-color: #f1f1f1">{{
						user.lastName }}</td>
					<td ng-if="$even">{{ user.lastName }}</td>

					<td ng-if="$odd" style="background-color: #f1f1f1">{{ user.dob}}</td>
					<td ng-if="$even">{{ user.dob }}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>