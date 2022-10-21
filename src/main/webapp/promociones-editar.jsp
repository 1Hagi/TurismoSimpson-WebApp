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
		<h1>Editar un usuario</h1>
	</div>
	
	<form class="container mx-center w-50" action="usuario-editar.do" method="post">
	
		<div class="mb-3">
			<label for="username" class="form-label">ID</label>
			<input class="form-control" name="id" value="${edituser.id}" readonly/>
		</div>
		
		
		<div class="mb-3">
			<label for="username" class="form-label">Usuario</label>
			<input class="form-control" name="username" value="${edituser.nombre}"/>
		</div>
		
		<div class="mb-3">
			<label for="password" class="form-label">Contraseña</label>
			<input type="password" class="form-control" name="password" value="${edituser.contraseña}" placeholder="Escribe una contraseña" />
		</div>
		
		<div class="mb-3">
			<label for="dinero" class="form-label">Dinero disponible</label>
			<input type="number" class="form-control" name="dinero" min="1000" max="20000" required>
		</div>
		
		<div class="mb-3">
			<label for="tiempo" class="form-label">Tiempo disponible</label>
			<input type="number" class="form-control" name="tiempo" min="100" max="1000" required>
		</div>
		
		<div class="mb-3">
			<label for="tipo_oferta" class="col-form-label">Tipo de Excursión favorita</label>
			<select class="form-control" name="tipo_oferta" id="tipo_oferta" required>
				<option value="1">Visita Guiada</option>
				<option value="2">Entretenimiento</option>
				<option value="3">Terror</option>
				<option value="4">Restorán</option>
				<option value="5">Fiesta</option>
				<option value="6">Tienda</option>
			</select>
		</div>

		<br>
		
		<div class="mb-3">
		  <input class="form-check-inp" name="bool_admin" type="checkbox" value="1" id="bool_admin">
		  <label class="form-check-label" for="bool_admin" name="bool_admin">
		  	Deseo permisos de Administrador
		  </label>
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