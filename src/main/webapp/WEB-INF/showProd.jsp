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

	<div class="header">
		<h1 class="d-flex justify-content-center">${oneProd.name}</h1>
	</div>
	<div class="container pt-5">
		<h3>Description: ${oneProd.description}</h3><br>
		<h3>Cost: ${oneProd.price}</h3>
		<br>
		<br>
		<div class="d-flex justify-content-between">
			<div>
				<h3>Categories</h3>
				<ul>
					<c:forEach items="${oneProd.categories}" var="cat">
						<li>${cat.name}</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<!-- action="/addCatToProd/${oneProd.id}" option to send product id through action instead of hidden input -->
				<form action="/addCatToProd" method="POST">
					<input type="hidden" name="hiddenProdId" value=${oneProd.id}>
					<label for="">Add Category: </label>
					<select name="selectedCat" >
						<c:forEach items="${allCats}" var="cat">
							<option value="${cat.id}">${cat.name}</option>
						</c:forEach>
					</select>
					<input type="submit" value="Add" class="btn btn-danger btn-sm">
				</form>
			</div>
		</div>
	</div>
</body>
</html>