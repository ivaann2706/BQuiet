<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
  <head>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>


    <script type="text/javascript" src="resources/js/codigoLinealInternet.js"></script>
    
  </head>
  <body>
	<p>
		<button id="btCargar">Cargar grafica</button>
	</p>
	
	<p>0,80,60,30,50,90,0,80,60,60,30,50,55,62,90,100,25,85,80,60,30,50,60,40,50,55,62,90,100,25,85,80,50,90,0,80,60,60,30,50,55,62,90,100,25,85,80,60,30,50,60,40,50,55,62,90,100,25,85,80,50,90,0,80,60,60,30,50,55,62,90,100,25,85,80,60,30,50,60,40,50,55,62,90,100,25,85,80,50,90,0,80,60,60,30,50,55,62,90,100,25,85,80,60,30,50,60,40,50,55,62,90,100,25,85,80,50,90,0,80,60,60,30,50,55,62,90</p>
	<p id="datos">${datos}</p>
	<p id="lmin">${lmin}</p>
	<p id="lmax">${lmax}</p>
	<p id="year">${year}</p>
	<p id="mes">${mes}</p>
	<p id="dia">${dia}</p>
	<p id="hora">${hora}</p>
	<p id="minuto">${minuto}</p>
	

	
	
	
	
	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	
</html>