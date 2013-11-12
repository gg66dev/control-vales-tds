/**
 * 
 */
package cl.tds.controlvales.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 *
 */
public class ValeDAO {

	private Session sesion = null; 
    private Transaction tx = null;  

    public Long guardaVale(Vale vale) throws HibernateException 
    { 
        Long id = (long) 0;  

        try 
        { 
            iniciaOperacion();
            id = (Long) sesion.save(vale); 
            tx.commit(); 
        } catch (HibernateException he) 
        { 
            manejaExcepcion(he); 
            throw he; 
        } finally 
        {
        	if( sesion != null ) sesion.close(); 
        }  

        return id; 
    }  

    public void actualizaVale(Vale vale) throws HibernateException 
    { 
        try 
        { 
            iniciaOperacion(); 
            sesion.update(vale); 
            tx.commit(); 
        } catch (HibernateException he) 
        { 
            manejaExcepcion(he); 
            throw he; 
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        } 
    }  

    public void eliminaVale(Vale vale) throws HibernateException 
    { 
        try 
        { 
            iniciaOperacion(); 
            sesion.delete(vale); 
            tx.commit(); 
        } catch (HibernateException he) 
        { 
            manejaExcepcion(he);
            throw he; 
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        } 
    }

    public Vale obtenVale(long id_vale) throws HibernateException 
    { 
    	Vale vale = null;  
        try 
        { 
            iniciaOperacion(); 
            vale = (Vale) sesion.get(Vale.class, id_vale);
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        }  

        return vale; 
    }  

    @SuppressWarnings("unchecked")
	public List<Vale> obtenListaVales() throws HibernateException 
    { 
        List<Vale> listaVales = null;  

        try 
        { 


            iniciaOperacion(); 
            listaVales = sesion.createQuery("from Vale").list(); 
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        }  

        return listaVales; 
    }  

    private void iniciaOperacion() throws HibernateException 
    {
        sesion = HibernateUtil.getSessionFactory().openSession(); 
        tx = sesion.beginTransaction(); 
    }  

    private void manejaExcepcion(HibernateException he) throws HibernateException 
    { 
    	if( tx != null ) tx.rollback(); 
        throw new HibernateException("Ocurrió un error en la capa de acceso a datos", he); 
    } 
}
