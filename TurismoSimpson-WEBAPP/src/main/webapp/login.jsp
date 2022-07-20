<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Página de Inicio</title>
</head>
<body style="background-color: rgb(255, 247, 149);">

	<p class="container text-center">Bienvenido a Turismo Simpson, para
		utilizar todas las funcionalidades de la App debes iniciar sesion o
		registrarte, si eres nuevo.</p>

	<br>

	<c:if test="${flash != null}">
		<div class="alert alert-danger">
			<p>
				<c:out value="${flash}"/>
			</p>
		</div>
	</c:if>
	
	<form class="container mx-center w-50" action="login" method="post">
		<div class="mb-3">
			<label for="username" class="form-label">Usuario</label>
			<input class="form-control" name="username">
		</div>
		
		<div class="mb-3">
			<label for="password" class="form-label">Contraseña</label>
			<input type="password" class="form-control" name="password">
		</div>
		
		<div>
			<button type="submit" class="btn btn-lg btn-primary">Ingresar</button>
		</div>
	</form>
	
	<div class="container mx-auto mt-4">
		<a class="btn btn-primary" href="inicio.jsp" role="button">Volver</a>
	</div>
	

</body>
</html>