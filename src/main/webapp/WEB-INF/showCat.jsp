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
		<h1>${oneCat.name}</h1>
		<div class="d-flex justify-content-between">
			<div>
				<h3>Products</h3>
				<ul class="list-group w-auto">
					<c:forEach items="${oneCat.products}" var="prod">
						<li class="list-group-item list-group-item-info list-group-item-action">${prod.name}</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<form action="/addProdToCat/${oneCat.id}" method="POST">
					<label for="">Add Product: </label>
					<select name="selectedProd" >
						<c:forEach items="${allProd}" var="prod">
							<option value="${prod.id}">${prod.name}</option>
						</c:forEach>
					</select>
					<input type="submit" value="Add" class="btn btn-danger btn-sm">
				</form>
			</div>
		</div>
	</div>
</body>
</html>