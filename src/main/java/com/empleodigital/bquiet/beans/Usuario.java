package com.empleodigital.bquiet.beans;

public class Usuario {
	private int id;
	private String nombre;
	private String pass;
	private int id_tipousuario;
	
	public Usuario(){}

	public Usuario(int id, String nombre, String pass, int id_tipousuario) {
		this.id = id;
		this.nombre = nombre;
		this.pass = pass;
		this.id_tipousuario = id_tipousuario;
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

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getId_tipousuario() {
		return id_tipousuario;
	}

	public void setId_tipousuario(int id_tipousuario) {
		this.id_tipousuario = id_tipousuario;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nombre=" + nombre + ", pass=" + pass + ", id_tipousuario=" + id_tipousuario
				+ "]";
	}





	
}
