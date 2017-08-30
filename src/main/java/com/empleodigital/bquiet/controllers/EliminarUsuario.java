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
public class EliminarUsuario {
	
	@Autowired
	HttpSession session;

	@RequestMapping(value="/eliminar/{usuario}")
	public ModelAndView on(@PathVariable("usuario") String usuario) {

		ModelAndView mav = new ModelAndView("login");

		Usuario user = DataBaseBquiet.getUsuario(usuario);

		Usuario loged = (Usuario)session.getAttribute("usuario");
		
		//System.out.println("Usuario: " + user);
		//System.out.println("Logeado: " + loged);

		if(loged != null && user != null) {

			if((loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR) ||
					(loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO &&
					loged.getId() == DataBaseBquiet.getSuperUsuario(DataBaseBquiet.getCentroByUsuario(user).getId()).getId())) {

				Centro centro = DataBaseBquiet.getCentroByUsuario(user);
				
				DataBaseBquiet.eliminarUsuario(user);
				
				mav.setViewName("homeSuperUsuario");
				
				mav.addObject("centro", centro);
				
				mav.addObject("superusuario", DataBaseBquiet.getSuperUsuario(centro.getId()));
				
				mav.addObject("usuarios", DataBaseBquiet.getUsuariosByCentroId(centro.getId()));
				
			}


		}
		
		return mav;
	}
}