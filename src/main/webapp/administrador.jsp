<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- Includes -->
	<jsp:include page="partials/head.jsp"></jsp:include>
	
	<!-- DataTables -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css"> 
	<script defer type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready( function () {
	    $('#admin_tabla').DataTable(); } );
	</script>
	
	<!-- Titulo -->
	<title>Página de Inicio</title>
	
</head>
<body>

	<!-- Texto Bienvenida -->
	
	<div class="container text-center">
		<h1>Información obtenida desde la Base de datos</h1>
	</div>
	
	<!-- Otras Secciones -->
	
	<br><div class="container text-center">
		<a class="btn btn-primary" href="#" role="button">USUARIOS</a>
		<a class="btn btn-outline-primary" href="#" role="button">EXCURSIONES</a>
		<a class="btn btn-outline-primary" href="#" role="button">PROMOCIONES</a>
	</div><br>
	
	<!-- la tabla de usuarios -->
	
	<div class="container">
	
		<table id="admin_tabla" class="display">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Contraseña</th>
					<th>Dinero</th>
					<th>Tiempo</th>
					<th>Favorito</th>
					<th>Admin</th>
					<th>Eliminado</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${usuarios}" var="usuario">
					<tr>
						<td><c:out value="${usuario.id}"></c:out></td>
						<td><c:out value="${usuario.nombre}"></c:out></td>
						<td><c:out value="${usuario.contraseña}"></c:out></td>
						<td><c:out value="${usuario.dineroDisponible}"></c:out></td>
						<td><c:out value="${usuario.tiempoDisponible}"></c:out></td>
						<td><c:out value="${usuario.getFavorito()}"></c:out></td>
						<td><c:out value="${usuario.admin ? 'Si' : 'No'}"></c:out></td>
						<td><c:out value="${usuario.soft_delete ? 'Si' : 'No'}"></c:out></td>
						<td>
							<button type="button" 
							class="btn btn-primary btn-sm data-bs-toggle=" 
							data-bs-toggle="modal" 
							data-bs-target="#editar_usuario"
							data-id="${usuario.id}"
							data-nombre="${usuario.nombre}">
								Editar
							</button>
							<button type="button" 
							class="btn btn-danger btn-sm"
							data-bs-toggle="modal" 
							data-bs-target="#eliminar_usuario"
							data-id="${usuario.id}"
							data-nombre="${usuario.nombre}">
								Eliminar
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container text-center">
			<a class="btn btn-primary" href="registro.jsp" role="button">Crear nuevo Usuario</a>
		</div>
		
		<br>
		
	</div>
	
	<!-- Modal Modificar Usuario -->
	
	<div class="modal fade" id="editar_usuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body"></div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
	        <a class="modal-link btn btn-primary" href="#" role="button">EDITAR</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal Eliminar Usuario -->
	
	<div class="modal fade" id="eliminar_usuario" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body"></div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
	        <a class="modal-link btn btn-danger" href="#" role="button">ELIMINAR</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- JQuery de Modal -->

	<script>
	
		$('#editar_usuario').on('show.bs.modal', function(event) {
			var boton = $(event.relatedTarget)
			var id = boton.data('id')
			var nombre = boton.data('nombre')
			var modal = $(this)
			modal.find('.modal-title').text('Editar usuario ' + nombre)
			modal.find('.modal-body').text('¿Desea modificar datos del usuario ' + nombre + '?')
			modal.find('.modal-link').attr('href', 'usuario-editar.do?id=' + id)
		})
		
		$('#eliminar_usuario').on('show.bs.modal', function(event) {
			var boton = $(event.relatedTarget)
			var id = boton.data('id')
			var nombre = boton.data('nombre')
			var modal = $(this)
			modal.find('.modal-title').text('Eliminar usuario ' + nombre)
			modal.find('.modal-body').text('¿Desea eliminar datos del usuario ' + nombre + '?')
			modal.find('.modal-link').attr('href', 'usuario-eliminar.do?id=' + id)
		})
	</script>
	
</body>
</html>