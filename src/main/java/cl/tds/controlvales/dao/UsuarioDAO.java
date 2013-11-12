/**
 * 
 */
package cl.tds.controlvales.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.util.HibernateUtil;

/**
 * @author "Fernando Valencia"
 *
 */
public class UsuarioDAO {

	private Session sesion = null; 
    private Transaction tx = null;  

    public Long guardaUsuario(Usuario usuario) throws HibernateException 
    { 
        Long id = (long) 0;  

        try 
        { 
            iniciaOperacion();
            id = (Long) sesion.save(usuario); 
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

    public void actualizaUsuario(Usuario usuario) throws HibernateException 
    { 
        try 
        { 
            iniciaOperacion(); 
            sesion.update(usuario); 
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

    public void eliminaUsuario(Usuario usuario) throws HibernateException 
    { 
        try 
        { 
            iniciaOperacion(); 
            sesion.delete(usuario); 
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

    public Usuario obtenUsuario(long id_usuario) throws HibernateException 
    { 
    	Usuario usuario = null;  
        try 
        { 
            iniciaOperacion(); 
            usuario = (Usuario) sesion.get(Usuario.class, id_usuario);
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        }  

        return usuario; 
    }  

    @SuppressWarnings("unchecked")
	public List<Usuario> obtenListaUsuarios() throws HibernateException 
    { 
        List<Usuario> listaUsuarios = null;  

        try 
        { 


            iniciaOperacion(); 
            listaUsuarios = sesion.createQuery("from Usuario").list(); 
        } finally 
        { 
        	if( sesion != null ) sesion.close(); 
        }  

        return listaUsuarios; 
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
