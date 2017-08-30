package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.empleodigital.bquiet.beans.Centro;
import com.empleodigital.bquiet.beans.TipoUsuario;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class GestionarCentro {
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/gestionar/{nombrecentro}")
	public ModelAndView on(@PathVariable("nombrecentro") String nombrecentro) {
		ModelAndView mav = new ModelAndView("login");
		
		Centro centro = DataBaseBquiet.getCentro(nombrecentro);
		
		if(centro != null && session.getAttribute("usuario") != null) {
			
			Usuario loged = (Usuario) session.getAttribute("usuario");
			
			if(loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR ||
					loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO &&
					loged.getId() == DataBaseBquiet.getSuperUsuario(centro.getId()).getId()) {
				
				mav.setViewName("homeSuperUsuario");
				
				mav.addObject("centro", centro);
				
				mav.addObject("superusuario", DataBaseBquiet.getSuperUsuario(centro.getId()));
				
				mav.addObject("usuarios", DataBaseBquiet.getUsuariosByCentroId(centro.getId()));
				
			}
			
		}
		
		return mav;
	}

}
