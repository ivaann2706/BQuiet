package com.empleodigital.bquiet.databases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.web.servlet.ModelAndView;

import com.empleodigital.bquiet.beans.Centro;
import com.empleodigital.bquiet.beans.ListaRegistroBean;
import com.empleodigital.bquiet.beans.RegistroBean;
import com.empleodigital.bquiet.beans.RegistroPrincipalBean;
import com.empleodigital.bquiet.beans.TipoUsuario;
import com.empleodigital.bquiet.beans.Usuario;
import com.empleodigital.bquiet.beans.UsuariosCentros;
import com.empleodigital.bquiet.util.Estadisticas;
import com.empleodigital.bquiet.util.UnixTime;

public class DataBaseBquiet extends DataBaseGenerica {

	private static JdbcTemplate jdbc = new JdbcTemplate(Conector.getDataSource());

	/**
	 * [DataBaseBquiet] Este metodo nos devuelve un ArrayList
	 *  con todos los usuarios en la DataBase sin filtro de tipo de Usuario
	 */
	public static ArrayList<Usuario> listaUsuarios(){
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		try{
			String sql = "SELECT * FROM usuarios";
			usuarios = (ArrayList<Usuario>)jdbc.query(sql, new BeanPropertyRowMapper<Usuario>(Usuario.class));
		}catch(Exception e){
			e.printStackTrace();
		}

		return usuarios;
	}

	/**
	 * [DataBaseBquiet] Este metodo nos devuelve un objeto de tipo usuario
	 *  obtenido de la DataBase, si los parametros de nombre y pass recibidos no
	 *  coinciden en la DataBase el valor del objeto sera null
	 */
	public static Usuario getUsuario(String nombre, String pass) {

		Usuario user = null;

		try {
			user = jdbc.queryForObject(
					"SELECT * FROM usuarios WHERE nombre=? AND pass=?",
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{nombre, pass}
					);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public static Usuario getUsuario(String nombre) {

		Usuario user = null;

		try {
			user = jdbc.queryForObject(
					"SELECT * FROM usuarios WHERE nombre=?",
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{nombre}
					);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * [DataBaseBquiet] Este metodo nos devuelve un ArrayList con todos
	 *  los centros en la DataBase sin filtros
	 */
	public static ArrayList<Centro> listaCentros(){

		ArrayList<Centro> listaCentros = new ArrayList<Centro>();

		try {
			listaCentros = (ArrayList<Centro>) jdbc.query(
					"SELECT * FROM centros", 
					new BeanPropertyRowMapper<Centro>(Centro.class)
					);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaCentros;
	}

	// Aqui iva un método listaUsuarios pero no sabiamos por que xd

	/**
	 * [DataBaseBquiet] Este metodo inserta un objeto en la DataBase
	 *  devuelve true si el usuario no existia,
	 *  devuelve false si el usuario existia
	 */
	public static boolean agregarUsuario (String nombreUsuario, String passUsuario, int id_centro) {

		boolean exito = false;

		try{
			String sql= "INSERT INTO usuarios (nombre,pass,id_tipousuario) VALUES (?,?,3)";
			jdbc.update(sql, new Object[] {nombreUsuario,passUsuario});

			Usuario usuario = jdbc.queryForObject("SELECT * FROM usuarios WHERE nombre=?",
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{nombreUsuario});

			jdbc.update("INSERT INTO usuarios_centros (id_usuario, id_centro) VALUES (?, ?)",
					new Object[]{usuario.getId(), id_centro});

			exito = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return exito;
	}

	/**
	 * [DataBaseBquiet] Este metodo devuelve un ArrayList de Usuario
	 * filtrado por id_centro
	 */
	public static ArrayList<Usuario> getUsuariosByCentroId(int id_centro){
		ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
		try{
			String sql = "SELECT * FROM usuarios_centros, usuarios WHERE usuarios_centros.id_centro=? AND usuarios.id_tipousuario=3 AND usuarios.id=usuarios_centros.id_usuario";
			usuarios = (ArrayList<Usuario>)jdbc.query(sql,
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{id_centro});
		}catch(Exception e){
			e.printStackTrace();
		}

		return usuarios;
	}

	/**
	 * [DataBaseBquiet] Este metodo inserta un Centro en la DataBase,
	 *  devuelve true si el centro no existia,
	 *  devuelve false si el centro si existia
	 */
	public static boolean agregarCentro(String nombreCentro, String superusuario, String pass, String provincia, String direccion) {

		boolean exito = false;

		try {
			jdbc.update("INSERT INTO centros (nombre,provincia,direccion) VALUES (?,?,?)", new Object[]{nombreCentro,provincia,direccion});

			Centro centro = jdbc.queryForObject("SELECT * FROM centros WHERE nombre=?",
					new BeanPropertyRowMapper<Centro>(Centro.class),
					new Object[]{nombreCentro});

			jdbc.update("INSERT INTO usuarios (id_tipousuario, nombre, pass) VALUES (?, ?, ?)",
					new Object[]{TipoUsuario.SUPERUSUARIO, superusuario, pass});

			Usuario user = jdbc.queryForObject("SELECT * FROM usuarios WHERE nombre=?",
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{superusuario});

			jdbc.update("INSERT INTO usuarios_centros (id_usuario, id_centro) VALUES (?, ?)",
					new Object[]{user.getId(), centro.getId()});

			exito = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return exito;
	}
	/**
	 * [DataBaseBquiet] Este metodo devuelve un objeto Centro
	 * filtado por el nombre
	 */
	public static Centro getCentro(String nombre) {

		Centro centro = null;

		try {
			centro = jdbc.queryForObject(
					"SELECT * FROM centros WHERE nombre=?",
					new BeanPropertyRowMapper<Centro>(Centro.class),
					new Object[]{nombre}
					);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return centro;
	}

	/**
	 * [DataBaseBquiet] Este metodo devuelve un Objeto Usuario (TipoUsuario.SUPERUSUARIO),
	 * filtrado por centro_id
	 */
	public static Usuario getSuperUsuario(int centro_id) {

		Usuario user = null;

		try {

			String sql = "SELECT * FROM usuarios_centros,usuarios where usuarios_centros.id_centro=? AND usuarios.id_tipousuario=2 AND usuarios.id=usuarios_centros.id_usuario";

			user = jdbc.queryForObject(
					sql,
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{centro_id}
					);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	/**
	 * [DataBaseBquiet] Este metodo devuelbe un objeto Centro
	 * filtrado por id_centro
	 */
	public static Centro getCentroById(int id_centro){
		Centro centro = null;
		try{

			centro = jdbc.queryForObject("SELECT * FROM centros WHERE id=?", new BeanPropertyRowMapper<Centro>(Centro.class),new Object[]{id_centro});

		}catch(Exception e){
			e.printStackTrace();
		}
		return centro;

	}


	public static Centro getCentroByIdSuperUsuario(int id_super){
		Centro centro = null;
		try{
			String sql = "SELECT centros.* FROM usuarios_centros,centros where usuarios_centros.id_usuario=? AND usuarios_centros.id_centro=centros.id";
			centro = jdbc.queryForObject(
					sql,
					new BeanPropertyRowMapper<Centro>(Centro.class),
					new Object[]{id_super}
					);

		}catch(Exception e){
			e.printStackTrace();
		}
		return centro;
	}

	public static void borrarCentro(String nombre) {

		String sql = "DELETE FROM centros WHERE nombre=?";
		jdbc.update(sql, new Object[]{nombre});

	}


	public static Usuario getUsuarioByToken(String token) {

		Usuario user = null;
		try {

			String sql = "SELECT usuarios.* FROM tokens, usuarios WHERE token=? AND usuarios.id=tokens.id_usuario";

			user = jdbc.queryForObject(sql,
					new BeanPropertyRowMapper<Usuario>(Usuario.class),
					new Object[]{token});

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public static void eliminarTokenByUserID(int id_usuario) {

		try {

			String sql = "DELETE FROM tokens WHERE id_usuario=?";
			jdbc.update(sql, new Object[]{id_usuario});

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void registrarToken(int id_usuario, String token) {

		try {

			String sql = "INSERT INTO tokens (id_usuario, token) VALUES (?, ?)";
			jdbc.update(sql, new Object[]{id_usuario, token});

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static Centro getCentroByUsuario(Usuario user) {
		Centro centro = null;

		try {

			UsuariosCentros uscen = null;

			String sql = "SELECT * FROM usuarios_centros WHERE id_usuario=?";
			uscen = jdbc.queryForObject(sql,
					new BeanPropertyRowMapper<UsuariosCentros>(UsuariosCentros.class),
					new Object[]{user.getId()});

			centro = getCentroById(uscen.getId_centro());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return centro;
	}

	public static void eliminarUsuario(Usuario user) {

		try {
			String sql = "DELETE FROM usuarios WHERE id=?";
			jdbc.update(sql, new Object[]{user.getId()});	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}


	public static ArrayList<Centro> getCentroFiltrado(String nombre) {
		ArrayList<Centro> centros = new ArrayList<Centro>();
		String nombreCentro= '%'+nombre+'%';
		try {
			String sql = "SELECT * FROM centros WHERE nombre LIKE ?";
			centros = (ArrayList<Centro>)jdbc.query(sql,
					new BeanPropertyRowMapper<Centro>(Centro.class),
					new Object[]{nombreCentro});
		} catch (Exception e) {
			e.printStackTrace();
		}

		return centros;
	}

	public static void actualizarUsuario(Usuario user, String username, String pass) {

		try {

			String sql = "UPDATE usuarios SET nombre=?, pass=? WHERE id=?";
			jdbc.update(sql, new Object[]{username, pass, user.getId()});

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void actualizarCentro(int id_centro, String nombre, String provincia, String direccion) {

		try {

			Centro centro = getCentroById(id_centro);

			String sql = "UPDATE centros SET nombre=?, provincia=?, direccion=? WHERE id=?";
			jdbc.update(sql, new Object[]{nombre, provincia, direccion, centro.getId()});

		} catch (Exception e) {
			e.printStackTrace();
		}


	}

	//Metodos Estatisticas / Registros
	
	public static int existeRegistro(int id_usuario, String fecha) {
		int num = 0;
		
		try {
			
			String sql = "SELECT * FROM registros WHERE id_usuario=? AND fecha=?";
			RegistroBean reg = jdbc.queryForObject(sql,
					new BeanPropertyRowMapper<RegistroBean>(RegistroBean.class),
					id_usuario, fecha);
			num = reg.getId();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}

	public static void agregarRegistro(final Usuario user, final int lmax, final int lmin, String json) {
		
		int id_registro;

		try {

			ListaRegistroBean lista = new ObjectMapper().readValue(json, ListaRegistroBean.class);

			Long date1 = Long.parseLong(lista.getRegistros()[0].getFecha());
			final String fecha = UnixTime.getFecha(date1);
			
			id_registro = existeRegistro(user.getId(), fecha);
			
			if(id_registro == 0) {
				
				KeyHolder holder = new GeneratedKeyHolder();

				jdbc.update(new PreparedStatementCreator() {           

					@Override
					public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
						PreparedStatement ps = connection.prepareStatement("INSERT INTO registros (lmax, lmin, id_usuario, fecha) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
						ps.setInt(1, lmax);
						ps.setInt(2, lmin);
						ps.setInt(3, user.getId());
						ps.setString(4, fecha);
						return ps;
					}
				}, holder);

				id_registro =  holder.getKey().intValue();
				
			}
			
			for(RegistroBean reg : lista.getRegistros()) {
				String sql = "INSERT INTO lista_registros (id_registro, fecha, valor) VALUES (?, ?, ?)";
				Long date2 = Long.parseLong(reg.getFecha());
				jdbc.update(sql, new Object[]{id_registro, UnixTime.getHora(date2), reg.getValor()});
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	//
	public static void obtenerEstadisticas(int id_usuario, String fecha, ModelAndView mav) {
		
		try {
			
			String sql1 = "SELECT * FROM registros WHERE id_usuario=? AND fecha=?";
			RegistroPrincipalBean registro = jdbc.queryForObject(sql1, 
					new BeanPropertyRowMapper<RegistroPrincipalBean>(RegistroPrincipalBean.class),
					new Object[]{id_usuario, fecha});
			
			int id_registro = registro.getId();
			int lmax = registro.getLmax();
			int lmin = registro.getLmin();
			
			String sql2 = "SELECT * FROM lista_registros WHERE id_registro=?";
			ArrayList<RegistroBean> listaRegistros = (ArrayList<RegistroBean>) jdbc.query(sql2,
					new BeanPropertyRowMapper<RegistroBean>(RegistroBean.class),
					new Object[]{id_registro});
			
			String valores = "";
			ArrayList<String> datos = new ArrayList<String>();
			for(RegistroBean rg : listaRegistros) {
				valores+=rg.getValor() + ",";
				String dateTime = fecha + " " + rg.getFecha();
				String dato = UnixTime.getUnixTime(dateTime) + ":" + rg.getValor();
				datos.add(dato);
			}
			
			String[] arrFecha = fecha.split("/");
			String year = arrFecha[0];
			String mes = arrFecha[1];
			String dia = arrFecha[2];
			
			String time = listaRegistros.get(0).getFecha();
			String[] arrHora = time.split(":");
			String hora = arrHora[0];
			String minuto = arrHora[1];
			
			String jsonMedia = Estadisticas.getEstadisticasMedia(datos, lmax, lmin);
			
			mav.addObject("datos", valores);
			mav.addObject("lmin", lmin);
			mav.addObject("lmax", lmax);
			mav.addObject("year", year);
			mav.addObject("mes", mes);
			mav.addObject("dia", dia);
			mav.addObject("hora", hora);
			mav.addObject("minuto", minuto);
			
			mav.addObject("json", jsonMedia);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
