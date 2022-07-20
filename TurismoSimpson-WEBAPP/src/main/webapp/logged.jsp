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
					<li class="nav-item"><a class="nav-link" href="#">Excursiones</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Promociones</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Perfil</a></li>
					<c:choose>
						<c:when test="${usuario.admin}">
							<li class="nav-item"><a class="nav-link" href="#">Administrar</a></li>
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
	
	<!-- EL CARRUSEL -->

	<div id="carouselExampleControls" class="carousel slide w-50 mx-auto"
		data-bs-ride="carousel" style="margin-top: 1rem">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/742_Evergreen_Terrace.jpg" class="d-block w-100"
					alt="imagen1">
			</div>
			<div class="carousel-item">
				<img src="img/simpson_ejemplo.jpg" class="d-block w-100"
					alt="imagen2">
			</div>
			<div class="carousel-item">
				<img src="img/simpson_ejemplo.jpg" class="d-block w-100"
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

	<p><c:out value="${ofertas.size()}"></c:out></p>
	
	<div class="container" style="background-color:rgb(255, 216, 33)">
		<div class="row" style="padding-top: 1em;">
			
			<c:forEach items="${ofertas}" var="oferta">
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;">
						<img src="<c:out value="${oferta.img}"></c:out>" height="140px" class="card-img-top"
							alt="tarjeta">
						<div class="card-body">
							<h6 class="card-title text-center"><c:out value="${oferta.nombre}"></c:out></h6>
							<p class="card-text">Una linda descripcion para ver, mas o
								menos como ocupa espacio el texto.
							</p>
							<p><c:out value="${oferta.img}"></c:out> </p>
							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								<c:out value="${oferta.costo}"></c:out>0
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								<c:out value="${oferta.tiempo}"></c:out> min.
							</p>
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary">Comprar</a>
						</div>
					</div>
				</div>	
			</c:forEach>
			
		</div>
	</div>

</body>
</html>