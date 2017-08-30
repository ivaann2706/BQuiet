<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro Usuario</title>

<!-- Font Awesome -->
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


<!--  librerias Bootstrap-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->

<!-- Local CSS-->
<link rel="stylesheet" href="<c:url value='/resources/css/css2.css'/> " />


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
				 <a class="navbar-brand" href="#"> <span><img
				alt="ROBONAUTAS" src="resources/img/P1d.png" height="35"
				width="auto" title="Robonautas" /> INICIO</span></a>
			</div> 
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					
					<li><a href="#">INICIO</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- logo -->
	<img src="resources/img/P1d.png" class="imagen" alt="Logo Robonautas" title="Robonautas"/>

	<!-- Lista usuarios -->
	<h1>Informacion del Centro ${centro.nombre}</h1>

	<p>${centro.nombre}</p>

	<h2>Informacion Super Usuario ${superusuario.nombre}</h2>

	<p>${superusuario.nombre}</p>

	<h2>Lista de Usuarios</h2>

	<ul>
		<c:forEach items="${usuarios}" var="user">

			<li>
				<p>
					${user.nombre} <a href='<c:url value='/ver/${user.nombre}'/>'>
						GESTIONAR</a> <a href="#"> ELIMINAR</a>
				</p>
			</li>

		</c:forEach>
	</ul>

	<!-- ejemplo form -->
	<form action="https://www.google.es/" method="get" >
									<p>
										Nombre usuario <input required="required" type="text"
											name="usuario" placeholder=" Introduce tu nombre de usuario"
											class="form-control text-center">
									</p>
									<p>
										Contraseña <input required="required" type="password"
											name="password" placeholder="Introduce tu contraseña"
											class="form-control text-center">
									</p>
									<p>
										Repetir contraseña <input required="required" type="password"
											name="password2" placeholder="Repite tu contraseña"
											class="form-control text-center">
									</p>
									<input type="submit" value="Registrar"
										class="active btn btn-danger">
								</form>

	<!-- MODAL -->
	<div class="container">
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Open Modal</button>
		<div class="fade modal text-center" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Registro Usuarios</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- Registro formulario -->
						<div class="row">
							<div class="col-md-12 text-center">
								<h2>Registro de Usuario</h2>
								<form action="https://www.google.es/" method="" class="form-group text-center">
									<p>
										Nombre usuario <input required="required" type="text"
											name="usuario" placeholder=" Introduce tu nombre de usuario"
											class="form-control text-center">
									</p>
									<p>
										Contraseña <input required="required" type="password"
											name="password" placeholder="Introduce tu contraseña"
											class="form-control text-center">
									</p>
									<p>
										Repetir contraseña <input required="required" type="password"
											name="password2" placeholder="Repite tu contraseña"
											class="form-control text-center">
									</p>
									<input type="submit" value="Registrar"
										class="active btn btn-danger" data-toggle="button">
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

	<!--  footer -->
	<footer class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					 <h2>R O B O N A U T A S</h2>
           			 <p>TECNOLOGÍA  Y ROBÓTICA EDUCATIVA</p>
            		 <p> 951 082 332 | 633 100 130 | info@robonautas.com
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right">
						<br> <br>
					</p>
					<div class="row">
						<div class="col-md-12 hidden-xs text-right">
							<a href="#"><i class="fa fa-3x fa-fw fa-twitter text-info"></i></a>
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