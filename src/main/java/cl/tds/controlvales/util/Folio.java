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
			if( valeDAO.obtenListaVales() != null ){
				FOLIO = v.getFolio() + 1;
			}else{
				FOLIO = 1l;
			}
		}
		return FOLIO++;
	}
}
