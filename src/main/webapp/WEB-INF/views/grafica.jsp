<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="resources/js/codigo.js"></script>
    
  </head>
  <body>
	<p>
		<button id="btCargar">Cargar grafica</button>
	</p>
	<div id="piechart" style="width: 900px; height: 500px"></div> 
	 </body>
	 <p id="jsonn"> {"registros" : [{ "rango":"alto" , "value":70 },{ "rango":"medio" , "value":20 },{ "rango":"bajo" , "value":20 } ]} </p>
	<input id="json" type="text" value='{"registros" : [{ "rango":"alto" , "value":70 },{ "rango":"medio" , "value":20 },{ "rango":"bajo" , "value":20 } ]}'/>
</html>