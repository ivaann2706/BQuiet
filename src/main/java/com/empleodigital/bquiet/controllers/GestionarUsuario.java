package com.empleodigital.bquiet.controllers;

import javax.servlet.http.HttpServletRequest;
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
public class GestionarUsuario {

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value="/ver/{usuario}")
	public ModelAndView on(@PathVariable("usuario") String usuario) {

		ModelAndView mav = new ModelAndView("login");

		Usuario user = DataBaseBquiet.getUsuario(usuario);

		Usuario loged = (Usuario)session.getAttribute("usuario");

		//System.out.println("Usuario: " + user);
		//System.out.println("Logeado: " + loged);

		if(loged != null && user != null) {

			if((loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR) ||
					(loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO &&
					loged.getId() == DataBaseBquiet.getSuperUsuario(DataBaseBquiet.getCentroByUsuario(user).getId()).getId()) ||
					(loged.getId() == DataBaseBquiet.getUsuario(usuario).getId())) {

				mav.setViewName("homeUsuario");

				mav.addObject("usuario", user);
				
				mav.addObject("centro", DataBaseBquiet.getCentroByUsuario(user));

				String fecha = request.getParameter("fecha");

				if(fecha!=null) {

					fecha = fecha.replace("-", "/");
					
					//Este metodo recibe por parametros el mav y le agrega los objetos
					DataBaseBquiet.obtenerEstadisticas(user.getId(), fecha, mav);
					

				}

			}

		}

		return mav;
	}

}
