<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Página de Inicio</title>
</head>
<body background="img/simpson_background.jpg">

	<!-- BARRA DE NAVEGACION -->

	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img width="200"
				src="https://fontmeme.com/permalink/220714/30ddf82c2275e6e6549ac8e17a01f583.png"
				alt="fuente-simpsonfont" border="0">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="logged.do">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="excursiones.do">Excursiones</a></li>
					<li class="nav-item"><a class="nav-link" href="promociones.do">Promociones</a></li>
					<li class="nav-item"><a class="nav-link" href="perfil.do">Perfil</a></li>
					<c:choose>
						<c:when test="${usuario.admin}">
							<li class="nav-item"><a class="nav-link" href="adm-usuarios.do">Administrar</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link disabled">Administrar</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				
					
				<img class="rounded-circle nav-item" alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">
				<p class="aling-middle">$ <c:out value="${usuario.dineroDisponible}"></c:out>0</p>
				
				<img class="rounded-circle" alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
				<p class="aling-middle"><c:out value="${usuario.tiempoDisponible}"></c:out>'</p>
				
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img class="rounded-circle" style="padding-left: 8px" alt="perfil"
						src="img/profile/02.png">
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Perfil</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="inicio.jsp">Disconnect</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- Mensajes -->
	
	<c:if test="${success != null}">
		<div class="alert alert-success">
			<p>
				<c:out value="${success}"/>
			</p>
		</div>
	</c:if>
	
	<c:if test="${errors != null}">
		<div class="alert alert-danger">
			<p>
				<c:out value="${errors}"/>
			</p>
		</div>
	</c:if>	
	
	<c:if test="${flash != null}">
		<div class="alert alert-primary">
			<p>
				<c:out value="${flash}"/>
			</p>
		</div>
	</c:if>

</body>
</html>