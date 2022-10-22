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
	<title>Administrador Promocion</title>
	
</head>
<body>

	<!-- Texto Bienvenida -->
	
	<div class="container text-center">
		<h1>Información obtenida desde la Base de datos</h1>
	</div>
	
	<!-- Otras Secciones -->
	
	<br><div class="container text-center">
		<a class="btn btn-outline-primary" href="adm-usuarios.do" role="button">USUARIOS</a>
		<a class="btn btn-outline-primary" href="adm-excursiones.do" role="button">EXCURSIONES</a>
		<a class="btn btn-primary" href="adm-promociones.do" role="button">PROMOCIONES</a>
	</div><br>
	
	<!-- la tabla de usuarios -->
	
	<div class="container">
	
		<table id="admin_tabla" class="display">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Costo</th>
					<th>Tiempo</th>
					<th>Tipo</th>
					<th>Cupo</th>
					<th>Eliminado</th>
					<th>Opciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${promociones}" var="promocion">
					<tr>
						<td><c:out value="${promocion.id}"></c:out></td>
						<td><c:out value="${promocion.nombre}"></c:out></td>
						<td><c:out value="${promocion.costo}"></c:out></td>
						<td><c:out value="${promocion.tiempo}"></c:out></td>
						<td><c:out value="${promocion.getTipo()}"></c:out></td>
						<td><c:out value="${promocion.cupo}"></c:out></td>
						<td><c:out value="${promocion.soft_delete ? 'Si' : 'No'}"></c:out></td>
						<td>
							<button type="button" 
							class="btn btn-primary btn-sm data-bs-toggle=" 
							data-bs-toggle="modal" 
							data-bs-target="#editar_promocion"
							data-id="${promocion.id}"
							data-nombre="${promocion.nombre}">
								Editar
							</button>
							<button type="button" 
							class="btn btn-danger btn-sm"
							data-bs-toggle="modal" 
							data-bs-target="#eliminar_promocion"
							data-id="${promocion.id}"
							data-nombre="${promocion.nombre}">
								Eliminar
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="container text-center">
			<a class="btn btn-primary" href="promocion-crear.jsp" role="button">Crear nueva Excursión</a>
		</div>
		
		<br>
		
	</div>
	
	<!-- Modal Modificar Usuario -->
	
	<div class="modal fade" id="editar_promocion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	
	<div class="modal fade" id="eliminar_promocion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
		// Boton de Editar
		$('#editar_promocion').on('show.bs.modal', function(event) {
			var boton = $(event.relatedTarget)
			var id = boton.data('id')
			var nombre = boton.data('nombre')
			var modal = $(this)
			modal.find('.modal-title').text('Editar una Promoción')
			modal.find('.modal-body').text('¿Desea modificar datos de la promoción ' + nombre + '?')
			modal.find('.modal-link').attr('href', 'promocion-editar.do?id=' + id)
		})
		// Boton de Borrar
		$('#eliminar_promocion').on('show.bs.modal', function(event) {
			var boton = $(event.relatedTarget)
			var id = boton.data('id')
			var nombre = boton.data('nombre')
			var modal = $(this)
			modal.find('.modal-title').text('Eliminar una Promocion')
			modal.find('.modal-body').text('¿Desea eliminar datos la promocion ' + nombre + '?')
			modal.find('.modal-link').attr('href', 'promocion-eliminar.do?id=' + id)
		})
	</script>
	
</body>
</html>