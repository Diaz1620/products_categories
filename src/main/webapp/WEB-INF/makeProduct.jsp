<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<a href="/">Home</a>

	<div class="container">
		<h1>New Product!</h1>

		<form:form action="/products/make" method="post" modelAttribute="product">
		<div class="form-group">
			<form:label path="name" >Name: </form:label>
			<form:errors path="name" class="text-danger" />
			<form:input path="name" class="form-control col-4"/><br>
		</div>
		<div class="form-group">
			<form:label path="description">Description: </form:label>
			<form:errors path="description" class="text-danger" />
			<form:textarea path="description" class="form-control col-4"/><br>
		</div>
		<div class="form-group">
			<form:label path="price">Price: </form:label>
			<form:errors path="price" class="text-danger" />
			<form:input type="number" step=".01" path="price" class="form-control col-4"/><br>
		</div>

			<input class="btn btn-primary" type="submit" value="Create"/>
		</form:form>
	</div>

	
</body>
</html>