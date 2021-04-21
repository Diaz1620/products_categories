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
	<a href="/products/new">Make A New Product</a> |
	<a href="/categories/new">Make A New Category</a>

	<div class="container">
		<h1>Hello Let's Make Some Product and Category Relationships!</h1>
		<div>
			<h3>All Products So Far</h3>
			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Description</th>
						<th scope="col">Price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allProducts}" var="prod">
						<tr>
							<td><a href="/products/${prod.id}">${prod.name}</a></td>
							<td>${prod.description}</td>
							<td>${prod.price}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>All Categories So Far</h3>
		<ul class="list-group w-50">
			<c:forEach items="${allCats}" var="cats">
				<a href="/categories/${cats.id}" class="list-group-item list-group-item-info list-group-item-action">${cats.name}</a>
			</c:forEach>
		</ul>
	</div>

</body>
</html>