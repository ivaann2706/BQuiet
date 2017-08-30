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
public class ControladorHome {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/")
	public String inicio(){
		
		return "login";
	}
	
	
	@RequestMapping("login")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView("login");
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		if(user!=null && pass!=null) {
			
			Usuario usuario = DataBaseBquiet.getUsuario(user, pass);
			
			if(usuario!=null){
				session.setAttribute("usuario", usuario);
				//System.out.println("Usuario logueado: " + usuario);
				if(usuario.getId_tipousuario()==TipoUsuario.ADMINISTRADOR){
					mav.setViewName("homeAdministrador");
					mav.addObject("centros", DataBaseBquiet.listaCentros());
				} else if(usuario.getId_tipousuario()==TipoUsuario.SUPERUSUARIO){
					mav.setViewName("homeSuperUsuario");
					mav.addObject("superusuario", usuario);
					mav.addObject("centro",DataBaseBquiet.getCentroByIdSuperUsuario(usuario.getId()));
					mav.addObject("usuarios",DataBaseBquiet.getUsuariosByCentroId(DataBaseBquiet.getCentroByIdSuperUsuario(usuario.getId()).getId()));
				} else if(usuario.getId_tipousuario()==TipoUsuario.USUARIO){
					mav.addObject("centro", DataBaseBquiet.getCentroByUsuario(usuario));
					mav.setViewName("homeUsuario");
				}
			} else{
				mav.addObject("mensajeError","Usuario o contraseña incorrecto");
				
			}
		} else {
			mav.addObject("mensajeError","Usuario o contraseña incorrecto");
			
		}
				
		return mav;
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView("login");
		
		Usuario loged = (Usuario) session.getAttribute("usuario");
		
		if(loged!=null) {
			
			if(loged.getId_tipousuario() == TipoUsuario.ADMINISTRADOR) {
				mav.setViewName("homeAdministrador");
				mav.addObject("centros", DataBaseBquiet.listaCentros());
				
			} else if(loged.getId_tipousuario() == TipoUsuario.SUPERUSUARIO) {
				mav.setViewName("homeSuperUsuario");
				mav.addObject("superusuario", loged);
				mav.addObject("centro",DataBaseBquiet.getCentroByIdSuperUsuario(loged.getId()));
				mav.addObject("usuarios",DataBaseBquiet.getUsuariosByCentroId(DataBaseBquiet.getCentroByIdSuperUsuario(loged.getId()).getId()));
				
				
			} else if(loged.getId_tipousuario() == TipoUsuario.USUARIO) {
				mav.addObject("centro", DataBaseBquiet.getCentroByUsuario(loged));
				mav.setViewName("homeUsuario");
				mav.addObject("superusuario", loged);
			}
			
		}
		
		
		return mav;
	}
	
}
	

