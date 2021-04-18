<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>




<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
body {
	background: rgb(173, 19, 149);
	background: linear-gradient(90deg, rgba(173, 19, 149, 0.8158613787311799)
		14%, rgba(19, 24, 124, 0.6646008745294993) 35%,
		rgba(5, 119, 179, 0.7122199221485469) 56%);
}
</style>

<title><c:if test="${page eq 'home'  }">
		<c:out value="View All Todos">
		</c:out>

	</c:if> <c:if test="${page eq 'add'  }">
		<c:out value="Add Todo">
		</c:out>

	</c:if></title>


</head>
<body>



	<div class="container ">

		<h1
			class="text-center m-5 fst-italic bg-dark.bg-gradient  border  border-2 rounded bg-dark text-light">Todo
			Manager Application</h1>
		<div class="row mt-4">
			<div class="col-md-2 mt-4">

				<div class="list-group mt-5 fw-bold text-center">
					<button type="button"
						class="list-group-item list-group-item-action active"
						aria-current="true"><p class="fw-bold " >Menu</p></button>
					<a href='<c:url value='/add' > </c:url>'
						class="list-group-item list-group-item-action"><p class="fw-bold">Add a Todo</p> </a> <a
						href='<c:url value='/home' > </c:url>'
						class="list-group-item list-group-item-action"><p class="fw-bold">View all Todos</p></a>
					<button type="button" onclick="alert('Only Admin Can Delete any Todo !!')" 
						class="list-group-item list-group-item-actio"> <p class="fw-bold">Delete a 
						Todo </p> </button>
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page=='home' }">
					<h3 class="text-center mt-4 ">All Todos</h3>
					<c:forEach items="${todos}" var="t">

						<div class="card ">
							<div class="card-body mt-3 ml-3">
								<h4>${t.title}</h4>
								<p>${t.content}</p>
							

							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${page=='add' }">
					<h3 class="text-center m-2">Add your Todo</h3>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-group mt-3">
							<form:input path="title" cssClass="form-control"
								placeholder="Enter Title" />
						</div>
						<div class="form-group mt-3">
							<form:textarea path="content" cssClass="form-control"
								placeholder="Enter Content" cssStyle="height:250px" />
						</div>
						<div class="container text-center mt-3  ">
							<button class="btn btn btn-warning fw-bold  ">Add Todo</button>
						</div>

					</form:form>
				</c:if>

				<c:if test="${ not empty msg }">
					<div class="alert alert-success text-center ml-3 mt-5">
						<b> Successfully added </b>
					</div>
				</c:if>
				<c:if test="${ not empty lenError }">
					<div class="alert alert-danger text-center ml-3 mt-5">
						<b> Title and Content cannot be Empty, Please Try Again !! </b>
					</div>
				</c:if>
			</div>
		</div>
	</div>



	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script>
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
</body>
</html>