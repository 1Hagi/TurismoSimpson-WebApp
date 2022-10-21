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

	<div class="container">
		<h1>Editar una Excursion</h1>
	</div>

	<form class="container mx-center w-50" action="edit-excursion.do"
		method="post" enctype="multipart/form-data">

		<div class="mb-3">
			<label for="username" class="form-label">ID</label> <input
				class="form-control" name="id" value="${excursion.id}" readonly />
		</div>


		<div class="mb-3">
			<label for="nombre" class="form-label">Nombre</label> <input
				class="form-control" name="nombre" value="${excursion.nombre}" />
		</div>

		<div class="mb-3">
			<label for="costo" class="form-label">Costo</label> <input
				type="number" class="form-control" name="costo" min="100" max="5000"
				value="${excursion.costo}" required>
		</div>

		<div class="mb-3">
			<label for="tiempo" class="form-label">Tiempo</label> <input
				type="number" class="form-control" name="tiempo" min="10" max="400"
				value="${excursion.tiempo}" required>
		</div>

		<div class="mb-3">
			<label for="cupo" class="form-label">Cupo</label> <input
				type="number" class="form-control" name="cupo" min="1" max="100"
				value="${excursion.nombre}" required>
		</div>

		<div class="mb-3">
			<label for="tipo_oferta" class="col-form-label">Tipo de
				Excursión</label> <select class="form-control" name="tipo_oferta"
				id="tipo_oferta" required>
				<option value="1">Visita Guiada</option>
				<option value="2">Entretenimiento</option>
				<option value="3">Terror</option>
				<option value="4">Restorán</option>
				<option value="5">Fiesta</option>
				<option value="6">Tienda</option>
			</select>
		</div>

		<div class="mb-3">
			<label for="file" class="form-label">Subir una imagen</label> <input
				accept=".jpg" class="form-control" name="file" type="file" id="file">
		</div>

		<br>

		<div class="mb-3">
			<label for="descripcion" class="form-label">Descripcion</label>
			<textarea class="form-control" id="descripcion" name="descripcion"
				rows="3" required></textarea>
		</div>

		<br>

		<div>
			<button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
		</div>

	</form>

	<div class="container mx-auto mt-4">
		<a class="btn btn-primary" href="adm-usuarios.do" role="button">Volver</a>
	</div>


</body>
</html>