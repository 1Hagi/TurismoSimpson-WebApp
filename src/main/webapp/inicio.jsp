<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="partials/head.jsp"></jsp:include>
<title>Página de Inicio</title>
</head>
<body background="img/simpson_background.jpg">

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
					<li class="nav-item"><a class="nav-link disabled">Excursiones</a></li>
					<li class="nav-item"><a class="nav-link disabled">Promociones</a></li>
					<li class="nav-item"><a class="nav-link disabled">Perfil</a></li>
					<li class="nav-item"><a class="nav-link disabled">Administrar</a></li>
				</ul>

				<a class="btn btn-primary nav-item" href="login.jsp" role="button">Ingresar</a>
				
				<a class="btn btn-primary nav-item" href="registro.jsp" role="button">Registrarse</a>

				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img class="rounded-circle" style="padding-left: 8px" alt="perfil"
						src="img/profile/18.png">
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="login.jsp">iniciar
								Sesión</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- MENSAJE LOGIN ALERTA -->

	<div class="alert alert-warning w-50 mx-auto mt-3 text-center" role="alert">Debes iniciar sesión
		para utilizar todas las funcionalidades de la App</div>
		
	<!-- EL CARRUSEL -->

	<div id="carouselExampleControls" class="carousel slide w-50 mx-auto"
		data-bs-ride="carousel" style="margin-top: 1rem">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/offers/742_Evergreen_Terrace.jpg" class="d-block w-100"
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
		<a class="btn btn-primary" href="#" role="button">Visita Guiada</a> <a
			class="btn btn-primary" href="#" role="button">Entretenimiento</a> <a
			class="btn btn-primary" href="#" role="button">Terror</a> <a
			class="btn btn-primary" href="#" role="button">Restorán</a> <a
			class="btn btn-primary" href="#" role="button">Fiesta</a> <a
			class="btn btn-primary" href="#" role="button">Tienda</a>
	</div>
	
	<hr class="mx-auto" width="95%">
	
	<!-- SECCION OFERTAS INDIVIDUALES -->

	<div class="container" style="background-color: rgb(255, 216, 33)">
		<div class="row" style="padding-top: 1em;">
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/742_Evergreen_Terrace.jpg" height="140px"
						class="card-img-top" alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title text-center">742 Evergreen Terrace</h5>
						
						<p class="text-center;"
							style="background-color: rgb(0, 250, 244); padding: 2px;">
							<img alt="dinero" src="img/dinero.png" width="35px"
								style="display-block: inline;"> $ 250,00 <img alt="dinero"
								src="img/tiempo.jpg" width="35px" style="display-block: inline;">
							40 min.
						</p>
						<a href="#ventana1" data-toggle="modal" class="btn btn-primary">Comprar</a>
						<button type="button" class="btn btn-primary"
							data-bs-toggle="modal" data-bs-target="#ventana1">
							Launch demo modal</button>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/744_Evergreen_Terrace.jpg" height="140px"
						class="card-img-top" alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title text-center">744 Evergreen Terrace</h5>

						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/Planta_Nuclear_de_Springfield.jpg" height="140px"
						class="card-img-top" alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title">Una Oferta</h5>

						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/Estudios_Krustylu.jpg" class="card-img-top"
						alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title">Una Oferta</h5>

						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="padding-top: 1em;">
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/Springfield_Court_House.jpg" class="card-img-top"
						alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title">Una Oferta</h5>

						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 16rem;">
					<img src="img/offers/744_Evergreen_Terrace.jpg" class="card-img-top"
						alt="tarjeta">
					<div class="card-body">
						<h5 class="card-title">Una Oferta</h5>

						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="ventana1" tabindex="-1"
		aria-labelledby="ventana1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ventana1">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>