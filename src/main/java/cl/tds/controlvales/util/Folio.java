/**
 * 
 */
package cl.tds.controlvales.util;

import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.daos.ValeDAO;


/**
 * @author Fernando Valencia
 *
 */
public class Folio {

	private static ValeDAO valeDAO = new ValeDAO();
	private static Long FOLIO = 0l;
	
	public static long generaFolio(){
		Vale v = valeDAO.obtenUltimoVale();
		if( v != null ){
			FOLIO = v.getFolio() + 1l;
		}else{
			FOLIO = 1l;
		}
		return FOLIO++;
	}
}
