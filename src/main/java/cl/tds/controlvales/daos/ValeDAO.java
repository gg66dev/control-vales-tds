/**
 * 
 */
package cl.tds.controlvales.daos;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 * 
 */
public class ValeDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Session sesion = null;
	private Transaction tx = null;

	public Long guardaVale(Vale vale) throws HibernateException {
		Long id = (long) 0;

		try {
			iniciaOperacion();
			id = (Long) sesion.save(vale);
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

	public boolean actualizaVale(Vale vale) throws HibernateException {
		boolean actualizado = false;
		try {
			iniciaOperacion();
			sesion.update(vale);
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

	public void eliminaVale(Vale vale) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.delete(vale);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}

	public Vale obtenVale(long id_vale) throws HibernateException {
		Vale vale = null;
		try {
			iniciaOperacion();
			vale = (Vale) sesion.get(Vale.class, id_vale);
			Hibernate.initialize(vale.getUsuario());
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return vale;
	}

	@SuppressWarnings("unchecked")
	public Vale obtenUltimoVale() throws HibernateException {
		List<Vale> listaVales = null;

		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale order by folio DESC LIMIT 1");
			listaVales = q.list();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}

		Vale resp = null;
		if (listaVales != null && !listaVales.isEmpty()
				&& listaVales.get(0) != null)
			resp = listaVales.get(0);
		return resp;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales() throws HibernateException {
		List<Vale> listaVales = null;
		try {
			iniciaOperacion();
			listaVales = sesion.createQuery("from Vale").list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(String rut) throws HibernateException {
		List<Vale> listaVales = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale where :rut=rut order by rut DESC");
			q.setParameter("rut", rut);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(Usuario usuario)
			throws HibernateException {
		List<Vale> listaVales = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale where :usuario=usuario order by usuario DESC");
			q.setParameter("usuario", usuario);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(Date desde, Date hasta)
			throws HibernateException {
		List<Vale> listaVales = null;
		try {
			iniciaOperacion();
			Query q = sesion.createQuery("from Vale where fecha_uso between "
					+ ":desde and :hasta order by fecha_uso DESC");
			q.setParameter("desde", desde);
			q.setParameter("hasta", hasta);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(Estado estado) throws HibernateException {
		List<Vale> listaVales = null;

		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale where :estado=estado");
			q.setParameter("estado", estado);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(Estado estado, long idUsuario) throws HibernateException {
		List<Vale> listaVales = null;

		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale where :estado=estado and :idUsuario=usuario_idusuario");
			q.setParameter("estado", estado);
			q.setParameter("idUsuario", idUsuario);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	
	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(Date desde, Date hasta, long idUsuario) throws HibernateException {
		List<Vale> listaVales = null;

		try {
			iniciaOperacion();
			Query q = sesion.createQuery("from Vale where :idUsuario=usuario_idusuario and " 
					+ "fecha_uso between :desde and :hasta "  
					+ "order by fecha_uso DESC");
			q.setParameter("desde", desde);
			q.setParameter("hasta", hasta);
			q.setParameter("idUsuario", idUsuario);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
	}

	
	
	@SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales(long folio,long idUsuario) throws HibernateException {
		List<Vale> listaVales = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Vale where :folio=folio and :idUsuario=usuario_idusuario");
			q.setParameter("folio", folio);
			q.setParameter("idUsuario", idUsuario);
			listaVales = q.list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaVales;
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
