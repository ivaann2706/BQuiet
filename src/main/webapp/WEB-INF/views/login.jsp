<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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

<!--  librerias-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<!-- CSS-->
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/> " />


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
				<a class="navbar-brand" href="#log"> <span><img
				alt="ROBONAUTAS" src='<c:url value="/resources/img/P1d.png"/>' height="30"
				width="auto" title="Robonautas" /> BQuiet</span></a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#foot">Contacto</a></li>
				</ul>
			</div>
		</div>
	</div>
	<h1>¡Bienvenido!</h1> <br/>
	
	
	<!-- logo -->
	<img src='<c:url value="/resources/img/P1d.png"/>' class="imagen" alt="Logo Robonautas" title="bQuiet" id="log"/>



	<!--  login formulario-->
	<form id="loginform" method="post" action="<c:url value='/login'/>">
		<c:if test="${not empty mensajeError}">
			<h3 style="color: #ffff99">${mensajeError}</h3>
		</c:if>
		<input type="text" class="input" placeholder="Usuario" name="user" />
		<input type="password" class="input" placeholder="Contraseña"
			name="pass" /> <input type="submit" class="loginbutton"
			value="ENTRAR" />
	</form>
	
	
		
	<!--  footer -->
	<footer class="section" id="foot">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
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