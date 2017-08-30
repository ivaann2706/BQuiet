window.onload = cargar

function iniciar(){
	//recuperamos el boton y le asignamos una funcion al evento onclick(cuando se pulsa el boton con el raton)
	var btCargar = document.getElementById("btCargar");
	btCargar.onclick = cargar; //cargar es la definicion, no es una llamada

	
}

function cargar(){
	
	var textarea = document.getElementById("json").value;
	//alert(textarea);

	var json = ""+textarea;
	//var json ='{"registros" : [{ "rango":"alto" , "value":70 },{ "rango":"medio" , "value":20 },{ "rango":"bajo" , "value":20 } ]}';
	
	//alert(json);
	var obj = JSON.parse(json);
	
	var array = new Array();
	array[0] = new Array("hora","db");
	

	
	for (var i=0; i<obj.registros.length; i++){
		array[i+1] = new Array(obj.registros[i].rango,obj.registros[i].value);
	}
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = google.visualization.arrayToDataTable(array);

		var options = {
				title: 'Registro acústico diario',
				slices: {
		            0: { color: 'red' },
		            1: { color: 'yellow' },
		            2: { color: 'green' }
		          }, 
				backgroundColor: 'transparent'
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart'));

		chart.draw(data, options);
	}
}