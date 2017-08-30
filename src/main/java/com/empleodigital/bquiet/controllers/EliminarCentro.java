package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.empleodigital.bquiet.beans.TipoUsuario;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class EliminarCentro {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="eliminarcentro/{centro}")
	public ModelAndView on(@PathVariable("centro") String centro) {
		
		ModelAndView mav = new ModelAndView("login");
		
		if(session.getAttribute("usuario") != null && 
				((Usuario)session.getAttribute("usuario")).getId_tipousuario() == TipoUsuario.ADMINISTRADOR) {
			
			DataBaseBquiet.borrarCentro(centro);
			
			mav.setViewName("homeAdministrador");
			
			mav.addObject("centros", DataBaseBquiet.listaCentros());
			
		}
		
		
		return mav;
	}

}
