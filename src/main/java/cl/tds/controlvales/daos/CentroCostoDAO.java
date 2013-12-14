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

import cl.tds.controlvales.beans.CentroCosto;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 *
 */
public class CentroCostoDAO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -800305910219370199L;
	private Session sesion = null;
	private Transaction tx = null;

	public long guardaCentroCosto(CentroCosto centroCosto) throws HibernateException {
		long id = 0l;

		try {
			iniciaOperacion();
			id = (Long) sesion.save(centroCosto);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return id;
	}

	public void actualizaCentroCosto(CentroCosto centroCosto) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.update(centroCosto);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}

	public void eliminaCentroCosto(CentroCosto centroCosto) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.delete(centroCosto);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}
	
	public CentroCosto obtenCentroCosto(long id_centroCosto) throws HibernateException {
		CentroCosto centroCosto = null;
		try {
			iniciaOperacion();
			centroCosto = (CentroCosto) sesion.get(CentroCosto.class, id_centroCosto);
			Hibernate.initialize(centroCosto.getUsuarios());
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return centroCosto;
	}

	@SuppressWarnings("unchecked")
	public CentroCosto obtenCentroCosto(String nombre) throws HibernateException {
		CentroCosto centroCosto = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from CentroCosto where :nombre=nombre order by centroCosto DESC LIMIT 1");
			q.setParameter("nombre", nombre);
			List<CentroCosto> centroCostos = q.list();
			if( centroCostos != null ){
				centroCosto = centroCostos.get(0);
				Hibernate.initialize(centroCosto.getUsuarios());
			}
		} catch (IndexOutOfBoundsException e) {
			// TODO
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return centroCosto;
	}
	
	@SuppressWarnings("unchecked")
	public List<CentroCosto> obtenListaCentroCostos() throws HibernateException {
		List<CentroCosto> listaCentroCostos = null;

		try {
			iniciaOperacion();
			listaCentroCostos = sesion.createQuery("from CentroCosto").list();
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return listaCentroCostos;
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
