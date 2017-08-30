package com.empleodigital.bquiet.beans;

public class TokenBean {
	
	private String token;
	
	public TokenBean() {}
	
	public TokenBean(String token) {
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	@Override
	public String toString() {
		return "TokenBean [token=" + token + "]";
	}
	
}
