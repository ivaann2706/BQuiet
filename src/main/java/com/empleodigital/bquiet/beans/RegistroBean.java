package com.empleodigital.bquiet.beans;

public class RegistroBean {
	private int id;
	private int id_registro;
	private String fecha;
	private int valor;
	
	public RegistroBean() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_registro() {
		return id_registro;
	}

	public void setId_registro(int id_registro) {
		this.id_registro = id_registro;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public int getValor() {
		return valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "RegistroBean [id=" + id + ", id_registro=" + id_registro + ", fecha=" + fecha + ", valor=" + valor
				+ "]";
	}
	
}
