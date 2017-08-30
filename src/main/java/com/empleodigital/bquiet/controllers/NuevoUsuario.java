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
public class NuevoUsuario {

	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value="nuevoUsuario")
	public ModelAndView on() {

		ModelAndView mav = new ModelAndView("login");

		if(session.getAttribute("usuario") != null)  {

			Usuario loged = (Usuario) session.getAttribute("usuario");

			int id_centro = Integer.parseInt(request.getParameter("id_centro"));

			if(loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR ||
					loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO &&
					DataBaseBquiet.getSuperUsuario(id_centro).getId() == loged.getId()
					) {

				Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));

				Centro centro = DataBaseBquiet.getCentroById(id_centro);

				String username = request.getParameter("nombreUsuario");
				String pass = request.getParameter("passUsuario");

				if(cantidad>1) {

					for(int i=1; i<=cantidad; i++) {

						String uname = username + "(" + i + ")"; 
						DataBaseBquiet.agregarUsuario(uname, pass, id_centro);

					}

				} else {

					DataBaseBquiet.agregarUsuario(username, pass, id_centro);
				}

				mav.addObject("centro", centro);

				mav.addObject("superusuario", DataBaseBquiet.getSuperUsuario(id_centro));

				mav.addObject("usuarios", DataBaseBquiet.getUsuariosByCentroId(id_centro));

				mav.setViewName("homeSuperUsuario");

			}


		}
		return mav;
	}
}
