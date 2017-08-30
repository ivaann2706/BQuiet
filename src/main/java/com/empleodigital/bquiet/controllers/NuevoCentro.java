package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.empleodigital.bquiet.beans.TipoUsuario;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class NuevoCentro {

	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;

	@RequestMapping(value="nuevocentro")
	public ModelAndView on() {

		ModelAndView mav = new ModelAndView("login");
		
		if(session.getAttribute("usuario") != null && 
				((Usuario)session.getAttribute("usuario")).getId_tipousuario() == TipoUsuario.ADMINISTRADOR) {

			mav.setViewName("homeAdministrador");

			String centro = request.getParameter("nuevoCentro");
			String provincia = request.getParameter("provinciaCentro");
			String direccion = request.getParameter("direccionCentro");
			String superusuario = request.getParameter("nuevoSuperUsuario");
			String pass = request.getParameter("passSuperUsuario");

			DataBaseBquiet.agregarCentro(centro, superusuario, pass,provincia,direccion);
			mav.addObject("centros", DataBaseBquiet.listaCentros());		
		}
		return mav;
	}
}