package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.empleodigital.bquiet.beans.Centro;
import com.empleodigital.bquiet.beans.TipoUsuario;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.databases.DataBaseBquiet;

@Controller
public class ActualizarCentro {

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@RequestMapping(value="actualizarCentro")
	public ModelAndView on() {

		ModelAndView mav = new ModelAndView("login");

		if(session.getAttribute("usuario") != null)  {

			Usuario loged = (Usuario) session.getAttribute("usuario");

			int id_centro = Integer.parseInt(request.getParameter("id_centro"));

			if(loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR ||
					loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO &&
					DataBaseBquiet.getSuperUsuario(id_centro).getId() == loged.getId()
					) {
				
				mav.setViewName("homeSuperUsuario");

				String nombre = request.getParameter("nombre");
				String provincia = request.getParameter("provincia");
				String direccion = request.getParameter("direccion");

				DataBaseBquiet.actualizarCentro(id_centro, nombre, provincia, direccion);
				
				Centro centro =  DataBaseBquiet.getCentroById(id_centro);
				
				mav.addObject("centro", centro);
				
				mav.addObject("superusuario", DataBaseBquiet.getSuperUsuario(centro.getId()));
				
				mav.addObject("usuarios", DataBaseBquiet.getUsuariosByCentroId(centro.getId()));

			}

		}
		return mav;
	}
	
}
