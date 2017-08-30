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
public class ActualizarUsuario {
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@RequestMapping(value="/actualizar")
	public ModelAndView on() {

		ModelAndView mav = new ModelAndView("login");
		
		String usuario = request.getParameter("usuario");

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
				
				String username = request.getParameter("username");
				String pass = request.getParameter("pass");
				
				//System.out.println("Usuario a actulizar: " + user);
				//System.out.println("Nuevos datos: " + username +  " " + pass);
				
				DataBaseBquiet.actualizarUsuario(user, username, pass);
				
				Usuario nuevo = DataBaseBquiet.getUsuario(username);
				
				mav.addObject("usuario", nuevo);
				
				mav.addObject("centro", DataBaseBquiet.getCentroByUsuario(nuevo));
				
			}
		}

		return mav;
	}

}
