<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Página de Inicio</title>
</head>
<body style="background-image: url(./img/background4.jpg);background-repeat:no-repeat;background-attachment:fixed;background-size: cover;">
	
	<!-- BARRA DE NAVEGACION -->
	
	<jsp:include page="partials/navbar.jsp"></jsp:include>
	<div class="container" style="height:100px;z-index: ;"></div>
	
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
					<div class="card" style="width: 16rem;margin-bottom:20px; box-shadow: 2px 2px 2px olive, -2px -2px 2px olive;">
					
						<c:if test = "${oferta.getClass() == 'class model.Excursion'}">
							<p class="tarjeta-header-exc">Excursion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoAbsoluta'}">
							<p class="tarjeta-header-prom">Promocion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoPorcentual'}">
							<p class="tarjeta-header-prom">Promocion</p>
						</c:if>
						<c:if test = "${oferta.getClass() == 'class model.PromoAxB'}">
							<p class="tarjeta-header-prom">Promocion</p>
						</c:if>
						
						<img class="tarjeta-imagen" src="<c:out value="${oferta.img}"></c:out>" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small><c:out value="${oferta.nombre}"></c:out></small></h6>
							
							<div style="display-block:inline;">
							
								<p class="text-center;" style="border:solid 1px; box-shadow: 1px 1px 2px olive, -1px -1px 2px olive;">
									<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">
									$ <c:out value="${oferta.getCosto()}"></c:out>0
									<img alt="tiempo" src="img/tiempo.jpg" width="35px" style="display-block:inline;border-radius:50%;height: 100%">
									<c:out value="${oferta.getTiempo()}"></c:out> min.
								</p>
								
								<p class="text-center;" style="display: inline; border:solid 1px; padding:2px;box-shadow: 1px 1px 2px olive, -1px -1px 2px olive;">
									<img alt="tiempo" src="img/tiempo.jpg" width="35px" style="display-block:inline;border-radius:50%;height: 100%">
									<c:out value="${oferta.getTiempo()}"></c:out> min.
								</p>
							</div>
							
							<p style="margin:;text-align:center;margin:auto;padding:3px;border-radius:10px;background-color:#11bb66;color:white;width:70%;margin-bottom:10px;font-size:14px"><strong><c:out value="${oferta.getTipo()}"></c:out></strong></p>
						
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>	
			</c:forEach>
			
		</div>
	</div>

</body>
</html>