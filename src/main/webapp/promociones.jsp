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
	
	<!-- SECCIÓN PROMOCIONES -->

	<div class="container" style="background-color:rgb(255, 216, 33)">

		<c:forEach items="${promociones}" var="promocion">
		
			<c:if test = "${promocion.getClass() == 'class model.PromoAbsoluta'}">
				<div style="height:20px"></div>
				<div class="container" style="background-color:white;box-shadow:2px 2px 2px 2px #592A08;">
					<img src="<c:out value="${promocion.img}"></c:out>" style="display:inline;width:430px;float:left;margin:auto;">
					<br/>
					<h2 style="display:inline;padding-left:20px;"><c:out value="${promocion.nombre}"></c:out></h2>
					<br/><br/>
					
					<p style="display:inline;padding-left:20px;">Excursiones Incluidas :</p>
					<br/><br/>
					
					<p style="display:inline">
						<c:out value="${promocion.descripcion}"></c:out>
					</p>
					<hr style="width:55%;margin:auto;"/>
					
					<c:forEach items="${promocion.getExcursiones()}" var="exc">
						<p style="display:inline;padding-left:20px;">
							<img 
							style="display:inline;width:80px;height:40px;"
							alt="imagen" 
							src="<c:out value="${exc.img}"></c:out>">
							<c:out value="${exc.nombre}"></c:out>
						</p>
						<i class="fa-solid fa-tags" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;"><c:out value="${exc.getCupo()}"></c:out></p>
						<i class="fa-solid fa-money-bill-1-wave" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;text-decoration:line-through;"><c:out value="${exc.getCosto()}">0</c:out></p>
						<i class="fa-solid fa-clock" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;"><c:out value="${exc.getTiempo()}"> min.</c:out></p>
						
						<i class="fa-solid fa-check" style="float:right;color:#11bb66;"></i>
						<br/>
						<hr style="width:55%;margin:auto;"/>
					</c:forEach>
					
					<div style="clear:both;"></div>
	
					<div class="text-center" style="background-color:#71d0f599;padding:2px;">
					
						<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;background-color:white;">
						<p style="display:inline;margin-right:5px;"><strong>$<c:out value="${promocion.getCosto()}"></c:out>0</strong></p>
					
						<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getTiempo()}"></c:out> min.</strong></p>
						
						<img alt="cupo" src="./img/cupo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getCupo()}"></c:out></strong></p>
							
						<p style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#11bb66;color:white;"><strong><c:out value="${promocion.getTipo()}"></c:out></strong></p>
						
						<div style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#ff81c1;color:white;">
						<c:if test = "${promocion.getClass() == 'class model.PromoAbsoluta'}">
							Promocion Absoluta
						</c:if>
						<c:if test = "${promocion.getClass() == 'class model.PromoPorcentual'}">
							Promocion Porcentual
						</c:if>
						<c:if test = "${promocion.getClass() == 'class model.PromoAxB'}">
							Promocion AxB
						</c:if>
						</div>
						<c:choose>
							<c:when test="${
							usuario.dineroDisponible < promocion.getCosto() || 
							usuario.tiempoDisponible < promocion.getTiempo() || 
							promocion.getCupo() <= 0
							}">
								<button type="button" 
								style="float:right;" 
								class="btn btn-primary btn-sm data-bs-toggle=" 
								data-bs-toggle="modal" 
								data-bs-target="#comprar" 
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}" 
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
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}"
								>
									Comprar
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:if>
			
			<c:if test = "${promocion.getClass() == 'class model.PromoPorcentual'}">
				<div style="height:20px"></div>
				<div class="container" style="background-color:white;box-shadow:2px 2px 2px 2px #592A08;">
					<img src="<c:out value="${promocion.img}"></c:out>" style="display:inline;width:430px;float:left;margin:auto;">
					<br/>
					<h2 style="display:inline;padding-left:20px;"><c:out value="${promocion.nombre}"></c:out></h2>
					<br/><br/>
					
					<p style="display:inline;padding-left:20px;">Excursiones Incluidas :</p>
					<br/><br/>
					
					<p style="display:inline">
						<c:out value="${promocion.descripcion}"></c:out>
					</p>
					<hr style="width:55%;margin:auto;"/>
					
					<c:forEach items="${promocion.getExcursiones()}" var="exc">
						<p style="display:inline;padding-left:20px;">
							<img 
							style="display:inline;width:80px;height:40px;"
							alt="imagen" 
							src="<c:out value="${exc.img}"></c:out>">
							<c:out value="${exc.nombre}"></c:out>
						</p>
						<i class="fa-solid fa-tags" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;"><c:out value="${exc.getCupo()}"></c:out></p>
						<i class="fa-solid fa-money-bill-1-wave" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;text-decoration:line-through;"><c:out value="${exc.getCosto()}">0</c:out></p>
						<i class="fa-solid fa-clock" style="color:#ffbb22;margin-left:5px;"></i>
						<p style="display:inline;"><c:out value="${exc.getTiempo()}"> min.</c:out></p>
						
						<i class="fa-solid fa-check" style="float:right;color:#11bb66;"></i>
						<br/>
						<hr style="width:55%;margin:auto;"/>
					</c:forEach>
					
					<div style="clear:both;"></div>
	
					<div class="text-center" style="background-color:#71d0f599;padding:2px;">
					
						<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;background-color:white;">
						<p style="display:inline;margin-right:5px;"><strong>$<c:out value="${promocion.getCosto()}"></c:out>0</strong></p>
					
						<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getTiempo()}"></c:out> min.</strong></p>
						
						<img alt="cupo" src="./img/cupo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getCupo()}"></c:out></strong></p>
							
						<p style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#11bb66;color:white;"><strong><c:out value="${promocion.getTipo()}"></c:out></strong></p>
						
						<div style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#ff81c1;color:white;">
							<c:if test = "${promocion.getClass() == 'class model.PromoAbsoluta'}">
								Promocion Absoluta
							</c:if>
							<c:if test = "${promocion.getClass() == 'class model.PromoPorcentual'}">
								Promocion Porcentual
							</c:if>
							<c:if test = "${promocion.getClass() == 'class model.PromoAxB'}">
								Promocion AxB
							</c:if>
						</div>
						
						<i class="fa-solid fa-percent" style="color:black;margin-left:5px;"></i>
						<p div style="display:inline;"><strong><c:out value="${promocion.getDescuento()}"></c:out>% de descuento</strong></p>
						
						<c:choose>
							<c:when test="${
							usuario.dineroDisponible < promocion.getCosto() || 
							usuario.tiempoDisponible < promocion.getTiempo() || 
							promocion.getCupo() < 0
							}">
								<button type="button" 
								style="float:right;" 
								class="btn btn-primary btn-sm data-bs-toggle=" 
								data-bs-toggle="modal" 
								data-bs-target="#comprar" 
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}" 
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
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}"
								>
									Comprar
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:if>
			
			<c:if test = "${promocion.getClass() == 'class model.PromoAxB'}">
				<div style="height:20px"></div>
				<div class="container" style="background-color:white;box-shadow:2px 2px 2px 2px #592A08;">
					<img src="<c:out value="${promocion.img}"></c:out>" style="display:inline;width:430px;float:left;margin:auto;">
					<br/>
					<h2 style="display:inline;padding-left:20px;"><c:out value="${promocion.nombre}"></c:out></h2>
					<br/><br/>
					
					<p style="display:inline;padding-left:20px;">Excursiones Incluidas :</p>
					<br/><br/>
					
					<p style="display:inline">
						<c:out value="${promocion.descripcion}"></c:out>
					</p>
					<hr style="width:55%;margin:auto;"/>
					
					<c:set var="cantGratis" value="${promocion.getExcursiones().size() - promocion.getCantGratis()}"></c:set>
					<c:forEach items="${promocion.getExcursiones()}" var="exc">
						
						<c:if test = "${cantGratis > 0}">
							<p style="display:inline;padding-left:20px;">
								<img 
								style="display:inline;width:80px;height:40px;"
								alt="imagen" 
								src="<c:out value="${exc.img}"></c:out>">
								<c:out value="${exc.nombre}"></c:out>
							</p>
							<i class="fa-solid fa-tags" style="color:#ffbb22;margin-left:5px;"></i>
							<p style="display:inline;"><c:out value="${exc.getCupo()}"></c:out></p>
							<i class="fa-solid fa-money-bill-1-wave" style="color:#ffbb22;margin-left:5px;"></i>
							<p style="display:inline;"><c:out value="${exc.getCosto()}">0</c:out></p>
							<i class="fa-solid fa-clock" style="color:#ffbb22;margin-left:5px;"></i>
							<p style="display:inline;"><c:out value="${exc.getTiempo()}"> min.</c:out></p>
							
							<i class="fa-solid fa-check" style="float:right;color:#11bb66;"></i>
							<br/>
							<hr style="width:55%;margin:auto;"/>
						</c:if>
						<c:if test = "${cantGratis <= 0}">
							<p style="display:inline;padding-left:20px;">
								<img 
								style="display:inline;width:80px;height:40px;"
								alt="imagen" 
								src="<c:out value="${exc.img}"></c:out>">
								<c:out value="${exc.nombre}"></c:out>
							</p>
							<i class="fa-solid fa-tags" style="color:#ffbb22;margin-left:5px;"></i>
							<p style="display:inline;"><c:out value="${exc.getCupo()}"></c:out></p>
							<i class="fa-solid fa-clock" style="color:#ffbb22;margin-left:5px;"></i>
							<p style="display:inline;"><c:out value="${exc.getTiempo()}"> min.</c:out></p>
							<p style="display:inline;margin-right:5px;padding:10px;border-radius:10px;background-color:#11bb66;color:white;font-size:12px"><strong>GRATIS</strong></p>
							
							<i class="fa-solid fa-check" style="float:right;color:#11bb66;"></i>
							<br/>
							<hr style="width:55%;margin:auto;"/>
						</c:if>						
						
						<c:set var="cantGratis" value="${cantGratis - 1}"></c:set>
						
					</c:forEach>
					
					<div style="clear:both;"></div>
	
					<div class="text-center" style="background-color:#71d0f599;padding:2px;">
					
						<img alt="dinero" src="img/dinero.png" width="35px" style="display-block:inline;background-color:white;">
						<p style="display:inline;margin-right:5px;"><strong>$<c:out value="${promocion.getCosto()}"></c:out>0</strong></p>
					
						<img alt="dinero" src="img/tiempo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getTiempo()}"></c:out> min.</strong></p>
						
						<img alt="cupo" src="./img/cupo.jpg" width="35px" style="display-block:inline;">
						<p style="display:inline;margin-right:5px;"><strong><c:out value="${promocion.getCupo()}"></c:out></strong></p>
							
						<p style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#11bb66;color:white;"><strong><c:out value="${promocion.getTipo()}"></c:out></strong></p>
						
						<div style="display:inline;margin-right:5px;padding:5px;border-radius:10px;background-color:#ff81c1;color:white;">
						<c:if test = "${promocion.getClass() == 'class model.PromoAbsoluta'}">
							Promocion Absoluta
						</c:if>
						<c:if test = "${promocion.getClass() == 'class model.PromoPorcentual'}">
							Promocion Porcentual
						</c:if>
						<c:if test = "${promocion.getClass() == 'class model.PromoAxB'}">
							Promocion AxB
						</c:if>
						</div>
						<c:choose>
							<c:when test="${
							usuario.dineroDisponible < promocion.getCosto() || 
							usuario.tiempoDisponible < promocion.getTiempo() || 
							promocion.getCupo() < 0
							}">
								<button type="button" 
								style="float:right;" 
								class="btn btn-primary btn-sm data-bs-toggle=" 
								data-bs-toggle="modal" 
								data-bs-target="#comprar" 
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}" 
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
								data-id="${promocion.id}" 
								data-nombre="${promocion.nombre}"
								>
									Comprar
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:if>
			
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