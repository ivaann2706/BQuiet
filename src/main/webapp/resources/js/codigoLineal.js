window.onload = iniciar

function iniciar(){
	//recuperamos el boton y le asignamos una funcion al evento onclick(cuando se pulsa el boton con el raton)
	var btCargar = document.getElementById("btCargar");
	btCargar.onclick = cargar; //cargar es la definicion, no es una llamada

	
}

function cargar(){
	
	var p = document.getElementById("json").innerHTML;
	alert(p);
	var json = ""+ p ;
	
	var obj = JSON.parse(json);
	
	var array = new Array();
	array[0] = new Array("hora","valor");
	

	
	for (var i=0; i<obj.registros.length; i++){
		array[i+1] = new Array(obj.registros[i].hora,obj.registros[i].valor);
	}
	
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable(array);

      var options = {
        title: 'Company Performance',
        curveType: 'function',
        legend: { position: 'bottom' }
      };

      var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

      chart.draw(data, options);
    
	}
}