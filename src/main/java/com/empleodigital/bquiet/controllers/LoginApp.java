package com.empleodigital.bquiet.controllers;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empleodigital.bquiet.beans.TokenBean;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class LoginApp {
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value="/applogin")
	public @ResponseBody TokenBean on() {
		
		String token = null;
		String nombre = request.getParameter("nombre");
		String pass = request.getParameter("pass");
		
		if(nombre!=null && pass!=null) {
			
			Usuario user = DataBaseBquiet.getUsuario(nombre, pass);
			
			if(user!=null) {
				
				token = UUID.randomUUID().toString();
				
				DataBaseBquiet.eliminarTokenByUserID(user.getId());
				
				DataBaseBquiet.registrarToken(user.getId(), token);
				
				return new TokenBean(token);
				
			}
			
		}
		
		return null;
	}

}
