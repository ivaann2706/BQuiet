package com.empleodigital.bquiet.beans;

import java.util.Arrays;

public class ListaRegistroBean {
	
	private RegistroBean[] registros;
	
	public ListaRegistroBean() {}

	public ListaRegistroBean(RegistroBean[] registros) {
		this.registros = registros;
	}

	public RegistroBean[] getRegistros() {
		return registros;
	}

	public void setRegistros(RegistroBean[] registros) {
		this.registros = registros;
	}

	@Override
	public String toString() {
		return "ListaRegistroBean [registros=" + Arrays.toString(registros) + "]";
	}
	
}
