package com.empleodigital.bquiet.beans;

public class Centro {
	private int id;
	private String nombre;
	private String provincia;
	private String direccion;
	
	public Centro(){}

	public Centro(int id, String nombre, String provincia, String direccion) {
		this.id = id;
		this.nombre = nombre;
		this.provincia = provincia;
		this.direccion = direccion;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Override
	public String toString() {
		return "Centro [id=" + id + ", nombre=" + nombre + ", provincia=" + provincia + ", direccion=" + direccion
				+ "]";
	}

	
}
