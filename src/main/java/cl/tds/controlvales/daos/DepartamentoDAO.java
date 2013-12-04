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

import cl.tds.controlvales.beans.Departamento;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 *
 */
public class DepartamentoDAO implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5209836384258429410L;
	private Session sesion = null;
	private Transaction tx = null;

	public Long guardaDepartamento(Departamento departamento) throws HibernateException {
		Long id = (long) 0;

		try {
			iniciaOperacion();
			id = (Long) sesion.save(departamento);
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

	public void actualizaDepartamento(Departamento departamento) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.update(departamento);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}

	public void eliminaDepartamento(Departamento departamento) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.delete(departamento);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}
	
	public Departamento obtenDepartamento(long id_departamento) throws HibernateException {
		Departamento departamento = null;
		try {
			iniciaOperacion();
			departamento = (Departamento) sesion.get(Departamento.class, id_departamento);
			Hibernate.initialize(departamento.getCentrosDeCostos());
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return departamento;
	}

	public Departamento obtenDepartamento(String nombre) throws HibernateException {
		Departamento departamento = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Departamento where :nombre=nombre order by nombre DESC LIMIT 1");
			q.setParameter("nombre", nombre);
			departamento = (Departamento) q.list().get(0);
			Hibernate.initialize(departamento.getCentrosDeCostos());
		} catch (IndexOutOfBoundsException e) {
			// TODO
		} finally {
			if (sesion != null)
				sesion.close();
		}
		return departamento;
	}
	
	@SuppressWarnings("unchecked")
	public List<Departamento> obtenListaDepartamentos() throws HibernateException {
		List<Departamento> listaDepartamentos = null;

		try {
			iniciaOperacion();
			listaDepartamentos = sesion.createQuery("from Departamento").list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaDepartamentos;
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
