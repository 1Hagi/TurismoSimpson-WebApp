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
				
				<!-- Itinerario -->
				
				<div class="nav-item dropdown" style="margin-right:10px">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img class="rounded-circle" 
						style="width:40px;" alt="perfil"
						src="img/itinerario.png">
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li>
							
							<c:set var="dineroTotal" value="${0}"></c:set>
							<c:set var="tiempoTotal" value="${0}"></c:set>
							
							<c:forEach items="${usuario.getItinerario()}" var="itinerario">
								<c:set var="dineroTotal" value="${dineroTotal + itinerario.getCosto()}"></c:set>
								<c:set var="tiempoTotal" value="${tiempoTotal + itinerario.getTiempo()}"></c:set>
								<div class="dropdown-item" href="#">
									<img
									style="display:inline;width:80px;height:40px;"
									alt="imagen" 
									src="<c:out value="${itinerario.img}"></c:out>">
									<p style="display:inline;"><c:out value="${itinerario.nombre}"></c:out></p>
								</div>
							</c:forEach>
							
							<hr class="dropdown-divider">
							
							<div class="text-center">
								<img class="rounded-circle nav-item" alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;widht:20px;">
								<p style="display:inline;"><c:out value="${dineroTotal}"></c:out></p>
								<img class="rounded-circle nav-item" alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;widht:20px;">
								<p style="display:inline;"><c:out value="${tiempoTotal}"></c:out></p>
							</div>
							
						</li>
					</ul>
				</div>
				
				<!-- Usuario -->			
					
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
	
	<!-- SECCIÓN EXCURSIONES -->

	<div class="container" style="background-color:rgb(255, 216, 33)">

		<c:forEach items="${excursiones}" var="excursion">
		
			<div style="height:20px"></div>
			<div class="container">
				<img src="<c:out value="${excursion.img}"></c:out>" style="display:inline;width:430px;float:left">
				<br/>
				<h2 style="display:inline"><c:out value="${excursion.nombre}"></c:out></h2>
				<br/>
				<p style="display:inline">
					<c:out value="${excursion.descripcion}"></c:out>
				</p>
				
				<div style="clear:both;"></div>
				
				<p class="text-center w-3" style="background-color:rgb(0, 250, 244);padding:2px;">
				
					<img alt="dinero" src="./img/dinero.png" width="35px" style="display-block:inline;">$
					<c:out value="${excursion.getCosto()}"></c:out>0
					
					<img alt="tiempo" src="./img/tiempo.jpg" width="35px" style="display-block:inline;">
					<c:out value="${excursion.getTiempo()}"></c:out> min.
					
					<img alt="cupo" src="./img/cupo.jpg" width="35px" style="display-block:inline;">
					<c:out value="${excursion.getCupo()}"></c:out>
					
					<img alt="categoria" src="./img/categoria.jpg" width="35px" style="display-block:inline;">
					<c:out value="${excursion.getTipo()}"></c:out>
					
					<button type="button"
					style="float:right;" 
					class="btn btn-primary btn-sm data-bs-toggle=" 
					data-bs-toggle="modal" 
					data-bs-target="#comprar"
					data-id="${excursion.id}"
					data-nombre="${excursion.nombre}">
						Comprar
					</button>
				
				</p>
				

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
			modal.find('.modal-link').attr('href', 'compra-exc.do?id=' + id)
		})
	</script>

</body>
</html>