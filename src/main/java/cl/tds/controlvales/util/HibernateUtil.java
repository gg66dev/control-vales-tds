/**
 * 
 */
package cl.tds.controlvales.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


/**
 * @author Fernando Valencia F.
 *
 */
public class HibernateUtil {

	private static final SessionFactory sessionFactory = buildSessionFactory();
	 
    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new Configuration()
//            		.configure("resources/hibernate.cfg.xml")
            		.configure()
                    .buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Fallo la creacion de SessionFactory." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
 
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
