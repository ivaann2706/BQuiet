package com.empleodigital.bquiet.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class UnixTime {
	
	public static String getFecha(long unixtime) {
		Date date = new Date(unixtime*1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		String formattedDate = sdf.format(date);
		return formattedDate;
	}
	
	public static String getFechaCompleta(long unixtime) {
		Date date = new Date(unixtime*1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		String formattedDate = sdf.format(date);
		return formattedDate;
	}
	
	public static String getHora(long unixtime) {
		Date date = new Date(unixtime*1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		String formattedDate = sdf.format(date);
		return formattedDate;
	}
	
	public static long getUnixTime(String fecha) throws ParseException {
		
	    //Formato: "2017/03/10 09:47:00"
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	    Date date = sdf.parse(fecha);
	    long unixTime = (date.getTime()/1000) + 3600; //GMT +1
		
		return unixTime;
	}
	
	public static int unixToSeconds(long unix) {

		Date date = new Date(unix*1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+1"));
		String time = sdf.format(date);

		String[] ar = time.split(":");

		int h = Integer.parseInt(ar[0]);
		int m = Integer.parseInt(ar[1]);
		int s = Integer.parseInt(ar[2]);

		return (h*3600) + (m*60) + s;
		
	}

}
