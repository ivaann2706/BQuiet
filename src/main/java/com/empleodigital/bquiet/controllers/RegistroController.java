package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class RegistroController {
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value="gg")
	public String gg() {
		return "registroTEST";
	}
	
	@RequestMapping(value="/registro", method=RequestMethod.POST)
	public @ResponseBody String on() {
		
		try {
			
			String token = request.getParameter("token");
			
			Usuario user = DataBaseBquiet.getUsuarioByToken(token);
			
			if(user!=null) {
				
				int lmax = Integer.parseInt(request.getParameter("lmax"));
				int lmin = Integer.parseInt(request.getParameter("lmin"));
				
				String json = request.getParameter("json");
				
				DataBaseBquiet.agregarRegistro(user, lmax, lmin, json);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

}
