package com.empleodigital.bquiet.util;

import java.util.ArrayList;

public class Estadisticas {

	//formato unixtime:valor
	public static String getEstadisticasMedia(ArrayList<String> datos, int lmax, int lmin) {

		//Segundos en cada tipo
		int smayor = 0;
		int smedio = 0;
		int smenor = 0;

		//Ultima fecha en unix
		int ufecha = (Integer.parseInt(datos.get(0).split(":")[0]) /3600) *3600;


		for(String x : datos) {
			System.out.println("Dato: " + x);
			String[] ar = x.split(":");

			int fecha = Integer.parseInt(ar[0]);
			int num = Integer.parseInt(ar[1]);

			int s1 = UnixTime.unixToSeconds(ufecha);
			int s2 = UnixTime.unixToSeconds(fecha);
			int resto = s2-s1;

			System.out.println("Resto: " + resto);

			if(num>=lmax) smayor+=resto;
			if(num<lmax && num>lmin) smedio+=resto;
			if(num<=lmin) smenor+=resto;

			ufecha = Integer.parseInt(ar[0]);
		}

		String json = "{'registros' : [{'rango':'alto','value':<alto>}, {'rango':'medio','value':<medio>}, {'rango':'bajo','value':<bajo>}]}";
		json = json.replace("<alto>", ""+smayor);
		json = json.replace("<medio>", ""+smedio);
		json = json.replace("<bajo>", ""+smenor);
		json = json.replace("'", "\"");
		return json;
	}

}
