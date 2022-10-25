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
	
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	
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