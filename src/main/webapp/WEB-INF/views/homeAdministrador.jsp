<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<title>Home Administrador</title>
<meta charset="UTF-8">

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
<!-- Latest compiled and minified JavaScript -->

<!-- Local CSS-->
<link rel="stylesheet" href="<c:url value='/resources/css/cssadministrador.css'/> " />
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
	<img src='<c:url value="/resources/img/P1d.png"/>' class="imagen"
		alt="Logo Robonautas" title="bQuiet" />
	

	<div class="sectionn">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<h1>
							PANEL DEL ADMINISTRADOR
						</h1>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 ">
				<!-- paginacion -->
					<table id="table_id" class="display table table-bordered table-condensed table-hover table-striped">
				    <thead>
				        <tr>
				            <th>Centros educativos registrados</th>
				            <th>Provincia</th>
				            <th data-orderable="false"></th>
				        </tr>
				    </thead>
				    <tbody class="letraNegra">
				      	<c:forEach items="${centros}" var="centro">
							
							<tr>
				            	<td>
				            		${centro.nombre}  
				            	</td>
				            	<td>
				            		(${centro.provincia}) 
				            	</td>
				            	<td>
					            	<a href="<c:url value='/gestionar/${centro.nombre}'/>"><span class="glyphicon glyphicon-pencil"></span></a> &nbsp
									<a href='<c:url value="/eliminarcentro/${centro.nombre}"/>'><span class="glyphicon glyphicon-trash"></span></a>
				            	</td>
				        	</tr>
							
						</c:forEach>
				      
				    </tbody>
				    
				</table>
					</div>
				
				</div>
			</div>
		</div>
	
	
	
	<script>
	$(document).ready( function () {
		$('#table_id').DataTable( {
    		"language": {
        "lengthMenu": "Mostrar _MENU_ centros por página",
        "zeroRecords": "No se ha encontrado nada - lo sentimos!",
        "info": "Mostrando página _PAGE_ de _PAGES_",
        "infoEmpty": "No se ha encontrado nada - lo sentimos!",
        "infoFiltered": "(filtrado por  _MAX_ registros totales)",
        "search":         "Buscar:",
        "paginate": {
            "first":      "Primero",
            "last":       "Último",
            "next":       "Siguiente",
            "previous":   "Anterior"
        },
        }
    });
	} );
	</script>
	
	
	

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<hr>
				</div>
			</div>
		</div>
	</div>



	<!-- MODAL -->
	<div class="container">
		<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#myModal">Nuevo Centro Educativo</button>
		<div class="fade modal text-center" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Nuevo Centro Educativo</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">



						<!-- Registro formulario -->
						<div class="row">
							<div class="col-md-12 text-center">
								<h2>Registro de Centro Educativo</h2>
								<form action="<c:url value='/nuevocentro'/>" method="get"
									class="form-group text-center">
									<p>
										Nombre Centro educativo <input required="required" type="text"
											name="nuevoCentro"
											placeholder=" Introduce el nombre del centro educativo"
											class="form-control text-center" />
									</p>
									<p>
										Provincia <input required="required" type="text"
											name="provinciaCentro"
											placeholder=" Introduce provincia del centro educativo"
											class="form-control text-center" />
									</p>
									<p>
										Dirección <input required="required" type="text"
											name="direccionCentro"
											placeholder=" Introduce direccion del centro educativo"
											class="form-control text-center" />
									</p>
									<p>
										Nombre Director/a (SuperUsuario) <input required="required"
											type="text" name="nuevoSuperUsuario"
											placeholder="Introduce el nombre del Director/a"
											class="form-control text-center" />
									</p>
									<p>
										Contraseña <input required="required" type="password"
											name="passSuperUsuario" placeholder="Introduce tu contraseña"
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
	<br>
	<br>



	<!--  footer -->

	<footer class="section" id="foot">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h2>R O B O N A U T A S</h2>
					<p>TECNOLOGÍA Y ROBÓTICA EDUCATIVA</p>
					<p>951 082 332 | 633 100 130 | info@robonautas.com
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right">
						<br> <br>
					</p>
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