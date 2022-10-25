<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="utf-8"%>
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
					<li class="nav-item"><a class="nav-link disabled">Excursiones</a></li>
					<li class="nav-item"><a class="nav-link disabled">Promociones</a></li>
					<li class="nav-item"><a class="nav-link disabled">Perfil</a></li>
					<li class="nav-item"><a class="nav-link disabled">Administrar</a></li>
				</ul>

				<a class="btn btn-primary nav-item" style="margin-right:10px;" href="login.jsp" role="button">Ingresar</a>
				
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

	<div class="container" style="background-color:rgb(255, 216, 33)">
		<div class="row" style="padding-top: 1em;">
			
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;margin-bottom:20px;">
					

						<p style="margin-bottom:0;background-color:blue;color:white;text-align: center">Excursion</p>

						
						<img src="./img/offers/742_Evergreen_Terrace.jpg" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small>742 Evergreen Terrace</small></h6>

							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								250.00
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								30 min.
							</p>
							
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;margin-bottom:20px;">

						<p style="margin-bottom:0;background-color:purple;color:white;text-align: center">Promocion</p>

						
						<img src="./img/offers/imagen_default.jpg" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small>Videojuegos</small></h6>

							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								250.00
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								120 min.
							</p>
							
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;margin-bottom:20px;">
					

						<p style="margin-bottom:0;background-color:blue;color:white;text-align: center">Excursion</p>

						
						<img src="./img/offers/Springfield_Court_House.jpg" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small>Springfield Court House</small></h6>

							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								260.00
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								50 min.
							</p>
							
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="card" style="width: 16rem;margin-bottom:20px;">

						<p style="margin-bottom:0;background-color:purple;color:white;text-align: center">Promocion</p>

						
						<img src="./img/offers/imagen_default.jpg" height="140px" class="card-img-top"
							alt="tarjeta">
							
						<div class="card-body">
							<h6 class="card-title text-center"><small>TodoCompra</small></h6>

							<p class="text-center;" style="background-color:rgb(0, 250, 244); padding:2px;">
								<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">$
								300.00
								<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
								180 min.
							</p>
							
							<a href="#ventana1" data-toggle="modal" class="btn btn-primary" style="margin-left:30%">Comprar</a>
						</div>
						
					</div>
				</div>	
			
		</div>
	</div>

</body>
</html>