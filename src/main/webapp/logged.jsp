<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Página de Inicio</title>
</head>
<body style="background-color: rgb(255, 247, 149);">
	
	<!-- BARRA DE NAVEGACION -->
	
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	
	<!-- EL CARRUSEL -->

	<div id="carouselExampleControls" class="carousel slide w-50 mx-auto"
		data-bs-ride="carousel" style="margin-top: 1rem">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./img/offers/742_Evergreen_Terrace.jpg" class="d-block w-100"
					alt="imagen1">
			</div>
			<div class="carousel-item">
				<img src="./img/simpson_ejemplo.jpg" class="d-block w-100"
					alt="imagen2">
			</div>
			<div class="carousel-item">
				<img src="./img/offers/744_Evergreen_Terrace.jpg" class="d-block w-100"
					alt="imagen3">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	
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
	
	<!-- OFERTAS INDIVIDUALES -->
	
	<div class="container" style="background-color:rgb(255, 216, 33)">
		<div class="row" style="padding-top: 1em;">
			
			<c:forEach items="${ofertas}" var="oferta">
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;margin-bottom:20px;">
					
						<c:if test = "${oferta.getClass() == 'class model.Excursion'}">
							<p style="margin-bottom:0;background-color:blue;color:white;text-align: center">Excursion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoAbsoluta'}">
							<p style="margin-bottom:0;background-color:purple;color:white;text-align: center">Promocion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoPorcentual'}">
							<p style="margin-bottom:0;background-color:purple;color:white;text-align: center">Promocion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoAxB'}">
							<p style="margin-bottom:0;background-color:purple;color:white;text-align: center">Promocion</p>
						</c:if>
						
						<img src="<c:out value="${oferta.img}"></c:out>" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small><c:out value="${oferta.nombre}"></c:out></small></h6>

							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								<c:out value="${oferta.getCosto()}"></c:out>0
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								<c:out value="${oferta.getTiempo()}"></c:out> min.
							</p>
							
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>	
			</c:forEach>
			
		</div>
	</div>

</body>
</html>