package com.empleodigital.bquiet.beans;

public class RegistroPrincipalBean {
	
	private int id;
	private int id_usuario;
	private int lmax;
	private int lmin;
	private String fecha;
	
	public RegistroPrincipalBean() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}

	public int getLmax() {
		return lmax;
	}

	public void setLmax(int lmax) {
		this.lmax = lmax;
	}

	public int getLmin() {
		return lmin;
	}

	public void setLmin(int lmin) {
		this.lmin = lmin;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	@Override
	public String toString() {
		return "RegistroPrincipalBean [id=" + id + ", id_usuario=" + id_usuario + ", lmax=" + lmax + ", lmin=" + lmin
				+ ", fecha=" + fecha + "]";
	}

}
