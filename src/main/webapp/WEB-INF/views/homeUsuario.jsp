<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Usuario</title>

<!-- graficainternet -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

<!--grafica-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Font Awesome -->
<script type="text/javascript" src="<c:url value='/resources/js/codigoLinealInternet.js' />"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!--  pingendon -->
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<!-- paginacion -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
<!--  librerias Bootstrap-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Local CSS-->
<link rel="stylesheet"
	href="<c:url value='/resources/css/cssusuario.css'/> " />

</head>
<body>

	<!--  heading -->
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href='<c:url value="/home"/>'> <span><img
						alt="ROBONAUTAS" src='<c:url value="/resources/img/P1d.png"/>' height="30"
						width="auto" title="Robonautas" /> BQuiet </span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/logout'/>">Cerrar Sesión</a></li>
					<li><a href="#foot">Contacto</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- logo -->


	<img src="<c:url value='/resources/img/P1d.png' />" class="imagen"
		alt="Logo Robonautas" title="bQuiet" />
	<br>

	<!--  información 	usuario-->
		<div class="container">
			<div class="row">
				<h2>Información Usuario</h2>
				<div class="col-md-12">
					<div class="caja">
						<p>Nombre usuario:  ${usuario.nombre}</p>
						<p>Centro: ${centro.nombre }</p>
						<br />
						<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#myModalActualizar">Modificar datos</button>
					</div>
				</div>
			</div>
	</div>

	<!-- FORMULARIO ESTADISTICAS -->


	<div class="section">
     <div class="container">
       <div class="row">
         <!-- <div class="col-md-6 graph"> -->
         <br>

         <form action='<c:url value="/ver/${usuario.nombre}"/>'>
			<h4 >Selecciona un día</h4>
			<div class="fecha">
				<input type="date" name="fecha" /> 
				<input type="submit"value="Enviar..">
			</div>
		</form>
         <br>
         <br>
         <div class="col-md-6 graph">
        	<c:if test="${not empty json}">
        		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        	</c:if>
         </div>
         <div class="col-md-6 graph" >
	         <!-- JSON OCULTO -->
			<input type="text" hidden="hidden" id="json" value='${json}'   >
		
			<div id="piechart" style="width: 900px; height: 500px; "></div> 
         </div>
       </div>
     </div>
   </div>
   
   <!-- FORMULARIO ACTUALIZAR -->

	
<!-- Modal modificar datos usuarios -->
<div class="container">
		
		<div class="fade modal text-center" id="myModalActualizar">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title">Modificar datos</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- Registro formulario -->
						<div class="row">
							<div class="col-md-12 text-center">
								<form method="post">
								
									<input type="text" hidden="hidden" value="${usuario.nombre}" name="usuario"/>
									Nuevo nombre<br><input class="form-control text-center" type="text" placeholder="Introduce tu nuevo usuario" name="username" required="required" /><br><br>
									Nueva contraseña<br> <input class="form-control text-center" type="password" placeholder="Introduce tu nueva contraseña" name="pass" required="required" /><br><br>
									<button class="btn btn-success" formaction='<c:url value='/actualizar'/>'>ACTUALIZAR</button>
									
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cancelar</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div hidden="hidden">
		<p id="datos">${datos}</p>
		<p id="lmin">${lmin}</p>
		<p id="lmax">${lmax}</p>
		<p id="year">${year}</p>
		<p id="mes">${mes}</p>
		<p id="dia">${dia}</p>
		<p id="hora">${hora}</p>
		<p id="minuto">${minuto}</p>
	</div>


	

	<!--  footer -->

	<footer class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h2>R O B O N A U T A S</h2>
					<p>TECNOLOGÍA Y ROBÓTICA EDUCATIVA</p>
					<p>951 082 332 | 633 100 130 | info@robonautas.com
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right"></p>
					<div class="row">
						<div class="col-md-12 hidden-xs text-right">
							<a href="https://twitter.com/LosRobonautas"><i class="fa fa-3x fa-fw fa-twitter text-info"></i></a>
							<a href="https://www.facebook.com/losrobonautas/"><i
								class="fa fa-3x fa-facebook fa-fw text-primary"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>