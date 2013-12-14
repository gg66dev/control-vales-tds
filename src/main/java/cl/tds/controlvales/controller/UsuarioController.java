/**
 * 
 */
package cl.tds.controlvales.controller;

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
		Usuario usuario = usuarioDao.obtenUsuarioUsername(username);
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
			if( this.usuarioDao.guardaUsuario(user) > 0l)
				registrado = true;
		}
		return registrado;
	}

	/**
	 * 
	 */
	public boolean actualiza(Usuario usuario){
		boolean actualizado = false;
		if( this.usuarioDao.obtenUsuario(usuario.getIdusuario()) != null ){
			if( usuario.getNombre() != null 
					&& usuario.getUsuario() != null
					&& usuario.getPerfil() != null 
					&& usuario.getCentroCosto() != null 
					&& usuario.getPassword().length() >= 6
					&& ValidacionUtil.validarRut(usuario.getRut())
					&& ValidacionUtil.validaEmail(usuario.getEmail())){
				if( this.usuarioDao.actualizaUsuario(usuario) )
					actualizado = true;
			}
		}
		return actualizado;
	}
	
	/**
	 * 
	 */
	public boolean actualiza(Usuario usuario, String password2){
		boolean actualizado = false;
		if( this.usuarioDao.obtenUsuario(usuario.getIdusuario()) != null ){
			if( usuario.getNombre() != null 
					&& usuario.getUsuario() != null
					&& usuario.getPerfil() != null 
					&& usuario.getCentroCosto() != null 
					&& usuario.getPassword().equals(password2)
					&& usuario.getPassword().length() >= 6
					&& ValidacionUtil.validarRut(usuario.getRut())
					&& ValidacionUtil.validaEmail(usuario.getEmail())){
				if( this.usuarioDao.actualizaUsuario(usuario) )
					actualizado = true;
			}
		}
		return actualizado;
	}
	
	public boolean eliminar(Usuario usuario){
		return usuarioDao.eliminaUsuario(usuario);
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
	 * Retorna lista de usuarios , si no hay retorna null
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
	
	public Usuario obtenUsuarioUsername(String username) {
		return usuarioDao.obtenUsuarioUsername(username);
	}
	
	public Usuario obtenUsuario(Long id) {
		return usuarioDao.obtenUsuario(id);
	}
}
