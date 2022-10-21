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

	<p class="container text-center">
		Bienvenido a la página de creación de Excursiones, 
		por favor ingrese los datos necesarios, 
		si lo desea puede cancelarlo.
	</p>

	<br>

	<c:if test="${flash != null}">
		<div class="alert alert-success">
			<p>
				<c:out value="${flash}"/>
			</p>
		</div>
	</c:if>
	
	<form class="container mx-center w-50" action="create-excursion.do" method="post" enctype="multipart/form-data">
	
		<div class="mb-3">
			<label for="nombre" class="form-label">Nombre</label>
			<input class="form-control" name="nombre" placeholder="Escribe un usuario" required/>
		</div>
		
		<div class="mb-3">
			<label for="costo" class="form-label">Costo</label>
			<input type="number" class="form-control" name="costo" min="100" max="5000" required>
		</div>
		
		<div class="mb-3">
			<label for="tiempo" class="form-label">Tiempo</label>
			<input type="number" class="form-control" name="tiempo" min="10" max="400" required>
		</div>
		
		<div class="mb-3">
			<label for="cupo" class="form-label">Cupo</label>
			<input type="number" class="form-control" name="cupo" min="1" max="100" required>
		</div>
		
		<div class="mb-3">
			<label for="tipo_oferta" class="col-form-label">Tipo de Excursión</label>
			<select class="form-control" name="tipo_oferta" id="tipo_oferta" required>
				<option value="1">Visita Guiada</option>
				<option value="2">Entretenimiento</option>
				<option value="3">Terror</option>
				<option value="4">Restorán</option>
				<option value="5">Fiesta</option>
				<option value="6">Tienda</option>
			</select>
		</div>
		
		<div class="mb-3">
			<label for="file" class="form-label">Subir una imagen</label>
			<input accept=".jpg"class="form-control" name="file" type="file" id="file">
		</div>
		
		<br>
		
		<div class="mb-3">
			<label for="descripcion" class="form-label">Descripcion</label>
			<textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
		</div>
		
		<br>
		
		<div>
			<button type="submit" class="btn btn-lg btn-primary">Crear Excursión</button>
		</div>
	</form>
	
	<div class="container mx-auto mt-4">
		<a class="btn btn-primary" href="adm-excursiones.do" role="button">Volver</a>
	</div>
	
	<br>

</body>
</html>