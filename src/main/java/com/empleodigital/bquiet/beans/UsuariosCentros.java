package com.empleodigital.bquiet.beans;

public class UsuariosCentros {
	
	private int id;
	private int id_usuario;
	private int id_centro;
	
	public UsuariosCentros() {}
	
	public UsuariosCentros(int id, int id_usuario, int id_centro) {
		this.id = id;
		this.id_usuario = id_usuario;
		this.id_centro = id_centro;
	}

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

	public int getId_centro() {
		return id_centro;
	}

	public void setId_centro(int id_centro) {
		this.id_centro = id_centro;
	}

	@Override
	public String toString() {
		return "UsuariosCentros [id=" + id + ", id_usuario=" + id_usuario + ", id_centro=" + id_centro + "]";
	}
	
}
