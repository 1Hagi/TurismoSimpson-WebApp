<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
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
	<title>Excursiones</title>
	
</head>
<body style="background-color: rgb(255, 247, 149);">
	
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
					<li class="nav-item"><a class="nav-link" href="perfil.jsp">Perfil</a></li>
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
	
	<!-- SELECCIÓN RAPIDA -->
	
	<hr class="mx-auto" width="95%">

		<div class="mx-auto text-center">
			<a class="btn btn-primary" href="#" role="button">Visita Guiada</a> 
			<a class="btn btn-primary" href="#" role="button">Entretenimiento</a> 
			<a class="btn btn-primary" href="#" role="button">Terror</a> 
			<a class="btn btn-primary" href="#" role="button">Restorán</a> 
			<a class="btn btn-primary" href="#" role="button">Fiesta</a> 
			<a class="btn btn-primary" href="#" role="button">Tienda</a>
		</div>

	<hr class="mx-auto" width="95%">
	
	<!-- SECCIÓN PROMOCIONES -->

	<div class="container" style="background-color:rgb(255, 216, 33)">

		<c:forEach items="${promociones}" var="promocion">
		
			<div style="height:20px"></div>
			<div class="container">
				<img src="<c:out value="${promocion.img}"></c:out>" style="display:inline;width:430px;float:left">
				<br/>
				<h2 style="display:inline"><c:out value="${promocion.nombre}"></c:out></h2>
				<br/>
				<p style="display:inline">
					<c:out value="${promocion.descripcion}"></c:out>
				</p>

				<p class="text-center;" style="background-color:rgb(0, 250, 244);padding:2px;">
					<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
					<c:out value="${promocion.getCosto()}"></c:out>0
					<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
					<c:out value="${promocion.getTiempo()}"></c:out> min.
				</p>
				
				<button type="button"
				style="float:right;" 
				class="btn btn-primary btn-sm data-bs-toggle=" 
				data-bs-toggle="modal" 
				data-bs-target="#comprar"
				data-id="${promocion.id}"
				data-nombre="${promocion.nombre}">
					Comprar
				</button>
				<div style="clear:both;"></div>
			</div>

		</c:forEach>
		
	</div>
	
	<!-- MODAL COMPRA -->
	
	<div class="modal fade" id="comprar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body"></div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
	        <a class="modal-link btn btn-primary" href="#" role="button">COMPRAR</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- JQuery de Modal -->

	<script>	
		// Boton de Compra
		$('#comprar').on('show.bs.modal', function(event) {
			var boton = $(event.relatedTarget)
			var id = boton.data('id')
			var nombre = boton.data('nombre')
			var modal = $(this)
			modal.find('.modal-title').text('Comprar Excursión')
			modal.find('.modal-body').text('¿Desea comprar la excursión ' + nombre + '?')
			modal.find('.modal-link').attr('href', 'compra-prom.do?id=' + id)
		})
	</script>

</body>
</html>