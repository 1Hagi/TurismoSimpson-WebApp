<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			
			<c:if test = "${usuario.getItinerario().size() > 0}">
				
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
								
								<c:choose>
									<c:when test="${itinerario.getClass() == 'class model.Excursion'}">
										<div class="dropdown-item" style="background-color:#d3d9fd;">
											<img
											style="display:inline;width:80px;height:40px;"
											alt="imagen" 
											src="<c:out value="${itinerario.img}"></c:out>">
											<p style="display:inline;"><c:out value="${itinerario.nombre}"></c:out></p>
										</div>
									</c:when>
									<c:otherwise>
										<div class="dropdown-item" style="background-color:#d3d9fd" href="#">
											<img
											style="display:inline;width:80px;height:40px;"
											alt="imagen" 
											src="<c:out value="${itinerario.img}"></c:out>">
											<p style="display:inline;"><c:out value="${itinerario.nombre}"></c:out></p>
										</div>
									</c:otherwise>
								</c:choose>
								
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
			</c:if>
				
			<!-- Usuario -->			
					
			<img class="rounded-circle nav-item" alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;">
			<p class="aling-middle" style="margin-bottom:0px;margin-left:5px;background-color:white;border-radius:10px;padding:3px;">$ <c:out value="${usuario.dineroDisponible}"></c:out>0 </p>
				
			<img class="rounded-circle" alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;margin-left:10px;">
			<p class="aling-middle" style="margin-bottom:0px;margin-left:5px;background-color:white;border-radius:10px;padding:3px;"><c:out value="${usuario.tiempoDisponible}"></c:out>' min.</p>
		
			<p style="display:inline;margin-right:5px;margin-bottom:3px;margin-left:10px;padding:4px;border-radius:10px;background-color:#f87327;color:white;font-size:14px;box-shadow:2px 2px 2px #180b03"><strong><c:out value="${usuario.getFavorito()}"></c:out></strong></p>

			<p style="margin-bottom:0px;padding:3px;margin-left:10px;margin-right:10px;font-size:18px;color:#948317">|</p>
			<p style="display:inline;background-color:white;border-radius:10px;margin-bottom:0px;padding:3px;"><c:out value="${usuario.nombre}"></c:out></p>
			<div class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
					<img class="rounded-circle" style="padding-left: 4px" alt="perfil"
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