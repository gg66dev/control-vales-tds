/**
 * 
 */
package cl.tds.controlvales.daos;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 * 
 */
public class UsuarioDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Session sesion = null;
	private Transaction tx = null;

	public Long guardaUsuario(Usuario usuario) throws HibernateException {
		Long id = (long) 0;

		try {
			iniciaOperacion();
			id = (Long) sesion.save(usuario);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return id;
	}

	public boolean actualizaUsuario(Usuario usuario) throws HibernateException {
		boolean actualizado = false;
		try {
			iniciaOperacion();
			sesion.update(usuario);
			tx.commit();
			actualizado = true;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return actualizado;
	}

	public boolean eliminaUsuario(Usuario usuario) throws HibernateException {
		boolean eliminado = false;
		try {
			iniciaOperacion();
			sesion.delete(usuario);
			tx.commit();
			eliminado = true;
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return eliminado;
	}
	
	@SuppressWarnings("unchecked")
	public Usuario obtenUsuarioUsername(String username) throws HibernateException {
		Usuario u = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Usuario where :username=usuario order by usuario DESC LIMIT 1");
			q.setParameter("username", username);
			List<Usuario> usuarios = q.list();
			if ( usuarios != null && usuarios.size() > 0 ){
				u = (Usuario) q.list().get(0);
				Hibernate.initialize(u.getVales());
			}
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return u;
	}
	
	@SuppressWarnings("unchecked")
	public Usuario obtenUsuarioRut(String rut) throws HibernateException {
		Usuario u = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Usuario where :rut=rut order by usuario DESC LIMIT 1");
			q.setParameter("rut", rut);
			List<Usuario> usuarios = (List<Usuario>) q.list();
			if( usuarios.size() > 0 ){
				u = usuarios.get(0);
				Hibernate.initialize(u.getVales());
			}
		} finally {
			if (sesion != null)
				sesion.close();
		}
		
		return u;
	}

	public Usuario obtenUsuario(long id_usuario) throws HibernateException {
		Usuario usuario = null;
		try {
			iniciaOperacion();
			usuario = (Usuario) sesion.get(Usuario.class, id_usuario);
			Hibernate.initialize(usuario.getVales());
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return usuario;
	}

	@SuppressWarnings("unchecked")
	public Usuario obtenUsuario(String nombre) throws HibernateException {
		Usuario u = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Usuario where :nombre=nombre order by usuario DESC LIMIT 1");
			q.setParameter("nombre", nombre);
			List<Usuario> usuarios = q.list();
			if( usuarios.size() > 0){
				u = usuarios.get(0);
				Hibernate.initialize(u.getVales());
			}
		} catch (IndexOutOfBoundsException e) {
			// TODO
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return u;
	}

	@SuppressWarnings("unchecked")
	public boolean existeUsuario(Usuario usuario) throws HibernateException {
		List<Usuario> listaUsuarios = null;
		boolean existe = false;
		try {
			iniciaOperacion();
			Query q = sesion.createQuery("from Usuario where :id LIMIT 1");
			q.setParameter("id", usuario.getIdusuario());
			listaUsuarios = q.list();
			if (listaUsuarios != null && listaUsuarios.size() == 1)
				existe = true;
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return existe;
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> obtenListaUsuarios() throws HibernateException {
		List<Usuario> listaUsuarios = null;

		try {
			iniciaOperacion();
			listaUsuarios = sesion.createQuery("from Usuario").list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaUsuarios;
	}

	private void iniciaOperacion() throws HibernateException {
		sesion = HibernateUtil.getSessionFactory().openSession();
		tx = sesion.beginTransaction();
	}

	private void manejaExcepcion(HibernateException he)
			throws HibernateException {
		if (tx != null)
			tx.rollback();
		throw new HibernateException(
				"Ocurrió un error en la capa de acceso a datos", he);
	}
}
