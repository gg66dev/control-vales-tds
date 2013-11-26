/**
 * 
 */
package cl.tds.controlvales.controllers;

import java.util.List;

import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.daos.UsuarioDAO;
import cl.tds.controlvales.util.ValidacionUtil;

/**
 * @author "Fernando Valencia"
 * 
 */
public class UsuarioController {

	private UsuarioDAO usuarioDao = new UsuarioDAO();

	/**
	 * Verifica que el usuario con nombre de usuario username existe, y su
	 * password calza con el de la bd
	 * 
	 * @param username
	 * @param password
	 * @return si el usuario existe, retorna {@code true}, sino retorna
	 *         {@code false}
	 */
	public boolean login(String username, String password) {
		boolean autenticado = false;
		Usuario usuario = usuarioDao.obtenUsuario(username);
		if (usuario != null && usuario.getPassword().equals(password)) {
			autenticado = true;
		}
		return autenticado;
	}

	/** Permite el registro de un usuario al sistema
	 * 
	 * @param user El usuario a registrar
	 * @param password2 El password de comprobaci&oacute;n
	 * @return {@code true} si es exitoso el registro, {@code false} en caso contrario
	 */
	public boolean register(Usuario user, String password2) {
		boolean registrado = false;

		if (this.obtenUsuario(user.getUsuario()) == null
				&& user.getPassword().equals(password2)
				&& user.getPassword().length() >= 6
				&& ValidacionUtil.validarRut(user.getRut())
				&& ValidacionUtil.validaEmail(user.getEmail())) {
			this.usuarioDao.guardaUsuario(user);
			registrado = true;
		}
		return registrado;
	}

	/**
	 * Retorna el usuario que tiene por nombre de usuario username, si no lo
	 * encuentra retorna null
	 * 
	 * @param nombre El nombre
	 * @return El usuario, si no lo encuentra retorna null
	 */
	public Usuario obtenUsuario(String nombre) {
		return usuarioDao.obtenUsuario(nombre);
	}
	
	/**
	 * Retorna lista de usuarios , si no hat
	 * encuentra retorna null
	 * 
	 * @param 
	 *           
	 * @return lista de usuario o null
	 */
	 public List<Usuario> obtenerListaUsuario(){
		 return usuarioDao.obtenListaUsuarios();
	}

	public Usuario obtenUsuarioRut(String rut) {
		if( ValidacionUtil.validarRut(rut) ){
			return usuarioDao.obtenUsuarioRut(rut);
		}
		return null;
	}
	

}
