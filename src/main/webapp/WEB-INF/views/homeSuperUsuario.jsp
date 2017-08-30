<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Director/a</title>

<!-- Font Awesome -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"/>

<!--  pingendon -->
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


<!--  librerías Bootstrap-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<!-- paginacion -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
<!-- Local CSS-->
<link rel="stylesheet" href="<c:url value='/resources/css/cssSuperUsuario.css'/> " />


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
						width="auto" title="Robonautas" /> BQuiet</span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href='<c:url value="/logout"/>'>Cerrar Sesión</a></li>
					<li><a href="#foot">Contacto</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- logo -->
	<img src="<c:url value='/resources/img/P1d.png' />" class="imagen"
		alt="Logo Robonautas" title="bQuiet">


	<!-- Lista usuarios -->



	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
						<h2>Panel del Centro Educativo</h2>
				</div>
				
			</div>
		</div>
	</div>



	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2>Información del Centro</h2>
					<table class="rwd-table">
						<thbody>
							<tr>
								<td> <label> Nombre: </label> </td>
								<td> ${centro.nombre} </td>
							<tr>
								<td> <label>Director: </label> </td>
								<td> ${superusuario.nombre}
							</tr>
							<tr>
								<td> <label> Provincia: </label> </td>
								<td> ${centro.provincia} <td>
							</tr>
							<tr>
								<td> <label>Dirección:  </label> </td>
								<td> ${centro.direccion} </td>
							</tr>
						</thbody>
				</table>
				
				<br/>
				<button type="button" class="btn btn-default" data-toggle="modal"
			data-target="#myModal2"> Modificar Centro Educativo</button>
				
				
				<!-- MODAL MODIFICAR TABLA -->
	<div class="container">
		
		<div class="fade modal text-left" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Modificar Centro Educativo</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
					
					
							<!-- FORMULARIO ACTUALIZAR -->
					<div class="row">
						<div class="col-md-12 text-center">
							<h2>Modificar Centro Educativo</h2>
						<form   method="post" class="form-group text-center">
							<input type="number" name="id_centro" hidden="hidden" readonly="readonly" value="${centro.id}" />
							<br/>
							<input class="form-control text-center" type="text" name="nombre" placeholder="Introduce el nuevo nombre para el Centro" />
							<br/>
							<input class="form-control text-center" type="text" name="provincia" placeholder="Inroduce la provincia del Centro" />
							<br/>
							<input class="form-control text-center" type="text" name="direccion" placeholder="Introduce la direccion del Centro" />
							<br/>
							<button class="btn btn-success" formaction='<c:url value='/actualizarCentro'/>'>ACTUALIZAR</button>
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
				
				
				

			</div>
			<div class="col-md-5">
				<table id="table_id" class="display table table-hover">
				    <thead>
				        <tr>
				            <th>Lista de Usuarios</th>
				            <th data-orderable="false"></th>
				        </tr>
				    </thead>
				    <tbody class="letraNegra">
				      
				      	<c:forEach items="${usuarios}" var="user">
							
							<tr>
				            	<td>
				            		${user.nombre}  
				            	</td>
				            	<td>
					            	<a href="<c:url value='/ver/${user.nombre}'/>"><span class="glyphicon glyphicon-pencil"></span></a> &nbsp
									<a href='<c:url value="/eliminar/${user.nombre}"/>'><span class="glyphicon glyphicon-trash"></span></a>
				            	</td>
				        	</tr>	
						</c:forEach>
				    </tbody>
				</table>
				
				<br>
				<br>
				
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target="#myModal">Nuevo Usuario</button>
			
				</div>
	
				
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		
	
	<script class="color">
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
		$('#table_id_length').hide();

	} );
	</script>

	
	<!-- MODAL nuevo usuario-->
	<div class="container">
		
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
								<form action="/bquiet/nuevoUsuario" method="get"
									class="form-group text-center">
									<p>
										Nombre usuario <input required="required" type="text"
											name="nombreUsuario"
											placeholder=" Introduce tu nombre de usuario"
											class="form-control text-center" />
									</p>
									<p>
										Contraseña <input required="required" type="password"
											name="passUsuario" placeholder="Introduce tu contraseña"
											class="form-control text-center" />
									</p>
									<p>
										Repetir contraseña <input required="required" type="password"
											name="password2" placeholder="Repite tu contraseña"
											class="form-control text-center" />
									</p>
									<p>
										Cantidad de Usuarios <input required="required" type="number"
											name="cantidad" placeholder="Introduce el numero de usuarios"
											class="form-control text-center" value=1 />
									</p>
									<input type="number" name="id_centro" readonly="readonly"
										value="${centro.id}" hidden="hidden" /> <input type="submit"
										value="Registrar" class="active btn btn-danger"/>
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
	<footer class="section">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<br/>
					<h2>R O B O N A U T A S</h2>
					<p>TECNOLOGÍA Y ROBÓTICA EDUCATIVA</p>
					<p>
						951 082 332 | 633 100 130 | info@robonautas.com <br>
					</p>
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