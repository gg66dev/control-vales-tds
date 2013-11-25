/**
 * 
 */
package cl.tds.controlvales.daos;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cl.tds.controlvales.beans.Empresa;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 * 
 */
public class EmpresaDAO {

	private Session sesion = null;
	private Transaction tx = null;

	public Long guardaEmpresa(Empresa empresa) throws HibernateException {
		Long id = (long) 0;

		try {
			iniciaOperacion();
			id = (Long) sesion.save(empresa);
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

	public void actualizaEmpresa(Empresa empresa) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.update(empresa);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}

	public void eliminaEmpresa(Empresa empresa) throws HibernateException {
		try {
			iniciaOperacion();
			sesion.delete(empresa);
			tx.commit();
		} catch (HibernateException he) {
			manejaExcepcion(he);
			throw he;
		} finally {
			if (sesion != null)
				sesion.close();
		}
	}

	public Empresa obtenEmpresa(long id_empresa) throws HibernateException {
		Empresa empresa = null;
		try {
			iniciaOperacion();
			empresa = (Empresa) sesion.get(Empresa.class, id_empresa);
			Hibernate.initialize(empresa.getVales());
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return empresa;
	}
	
	public Empresa obtenEmpresa(String nombre) throws HibernateException {
		Empresa empresa = null;
		try {
			iniciaOperacion();
			Query q = sesion
					.createQuery("from Empresa where :nombre=nombre order by nombre DESC LIMIT 1");
			q.setParameter("nombre", nombre);
			empresa = (Empresa) q.list().get(0);
			if (empresa != null) {
				Hibernate.initialize(empresa.getVales());
			}
		} finally {
			if (sesion != null)
				sesion.close();
		}
		
		return empresa;
	}

	@SuppressWarnings("unchecked")
	public List<Empresa> obtenListaEmpresas() throws HibernateException {
		List<Empresa> listaEmpresas = null;

		try {

			iniciaOperacion();
			listaEmpresas = sesion.createQuery("from Empresa").list();
		} finally {
			if (sesion != null)
				sesion.close();
		}

		return listaEmpresas;
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
