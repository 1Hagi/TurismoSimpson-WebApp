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
	
	<jsp:include page="partials/navbar.jsp"></jsp:include>

	<hr class="mx-auto" width="95%">
	
	<!-- SECCIÓN EXCURSIONES -->

	<div class="container" style="background-color:rgb(255, 216, 33)">

		<c:forEach items="${excursiones}" var="excursion">

				<div style="height:20px"></div>
				<div class="container" style="background-color:white;box-shadow:2px 2px 2px 2px #592A08;">
					<img src="<c:out value="${excursion.img}"></c:out>" style="display:inline;width:430px;float:left;margin:auto;">
					<br/>
					<h2 style="display:inline;padding-left:20px;"><c:out value="${excursion.nombre}"></c:out></h2>
					<br/><br/>
					
					<p style="display:inline;padding-left:20px;"><c:out value="${excursion.descripcion}"></c:out></p>
					<br/><br/>
					
					<hr style="width:55%;margin:auto;"/>
					
					<div style="clear:both;"></div>
	
					<div class="text-center" style="background-color:#71d0f599;padding:2px;">
					
						<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;background-color:white;">
						<p style="display:inline;margin-right:5px;"><strong>$<c:out value="${excursion.getCosto()}"></c:out>0</strong></p>
					
						<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${excursion.getTiempo()}"></c:out> min.</strong></p>
						
						<img alt="cupo" src="./img/cupo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${excursion.getCupo()}"></c:out></strong></p>
							
						<p style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#11bb66;color:white;"><strong><c:out value="${excursion.getTipo()}"></c:out></strong></p>
						
						<c:choose>
							<c:when test="${
							usuario.dineroDisponible < excursion.getCosto() || 
							usuario.tiempoDisponible < excursion.getTiempo() || 
							excursion.getCupo() <= 0
							}">
								<button type="button" 
								style="float:right;" 
								class="btn btn-primary btn-sm data-bs-toggle=" 
								data-bs-toggle="modal" 
								data-bs-target="#comprar" 
								data-id="${excursion.id}" 
								data-nombre="${excursion.nombre}" 
								disabled
								>
									Comprar
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" 
								style="float:right;" 
								class="btn btn-primary btn-sm data-bs-toggle=" 
								data-bs-toggle="modal" 
								data-bs-target="#comprar" 
								data-id="${excursion.id}" 
								data-nombre="${excursion.nombre}"
								>
									Comprar
								</button>
							</c:otherwise>
						</c:choose>
					</div>
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