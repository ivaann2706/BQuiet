window.onload = cargar

function iniciar(){
	//recuperamos el boton y le asignamos una funcion al evento onclick(cuando se pulsa el boton con el raton)
	var btCargar = document.getElementById("btCargar");
	btCargar.onclick = cargar; //cargar es la definicion, no es una llamada

	
}

function cargar(){
	// Data retrieved from http://vikjavev.no/ver/index.php?spenn=2d&sluttid=16.06.2015.
	var datos = document.getElementById("datos").innerHTML;
	var lmax = document.getElementById("lmax").innerHTML;
	var lmin = document.getElementById("lmin").innerHTML;
	var year = document.getElementById("year").innerHTML;
	var mes = document.getElementById("mes").innerHTML;
	var dia = document.getElementById("dia").innerHTML;
	var hora = document.getElementById("hora").innerHTML;
	var minuto = document.getElementById("minuto").innerHTML;
	
	
	var array = new Array();
	
	array = datos.split(",");
	
	for(var i=0; i<array.length; i++){
		array[i] = parseInt(array[i]);
	}
	
	alert(datos);
	
	Highcharts.chart('container', {
		chart: {
			type: 'spline',
			zoomType: 'x'
				
        },
	    title: {
	        text: 'Registro acústico diario'
	    },
	    
	    xAxis: {
	        type: 'datetime',
	        labels: {
	            overflow: 'justify'
	        }
	    },
	    yAxis: {
	        title: {
	            text: 'sonido (db)'
	        },
	        minorGridLineWidth: 0,
	        gridLineWidth: 0,
	        alternateGridColor: null,
	        plotBands: [{ // Nivel bajo de sonido
	            from: 0.0,
	            to: lmin-1,
	            color: 'rgb(175, 255, 178)',
	            label: {
	                text: 'Nivel bajo de sonido',
	                style: {
	                    color: 'green'
	                }
	            }
	        },
	        { // Nivel normal de sonido
	            from: lmin,
	            to: lmax-1,
	            color: 'rgb(255, 255, 165)',
	            label: {
	                text: 'Nivel normal de sonido',
	                style: {
	                    color: 'rgb(214, 214, 0)'
	                }
	            }
	        },
	        { // Nivel alto de sonido
	            from: lmax,
	            to: 120.0,
	            color: 'rgb(255, 195, 188)',
	            label: {
	                text: 'Nivel alto de sonido',
	                style: {
	                    color: 'red'
	                }
	            }
	        }
	        
	        
	        
	        ]
	    },
	    tooltip: {
	        valueSuffix: ' db'
	    },
	    plotOptions: {
	        spline: {
	            lineWidth: 4,
	            states: {
	                hover: {
	                    lineWidth: 2
	                }
	            },
	            marker: {
	                enabled: false
	            },
	            pointInterval: 60000, // one minute
	            pointStart: Date.UTC(year, mes, dia, 0,0,0)
	        }
	    },
	    series: [{
	        name: 'db',
	        color: 'rgb(135, 135, 97)',
	        data: array

	    }],
	    navigation: {
	        menuItemStyle: {
	            fontSize: '10px'
	        }
	    }
	});
}