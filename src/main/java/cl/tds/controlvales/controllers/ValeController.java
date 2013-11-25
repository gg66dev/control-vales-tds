/**
 * 
 */
package cl.tds.controlvales.controllers;

import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.daos.ValeDAO;

/**
 * @author "Fernando Valencia"
 *
 */
public class ValeController {

	ValeDAO valeDao = new ValeDAO();
	
	/** Verifica que un vale tenga los campos necesarios y lo almacena en la base de datos
	 * 
	 * @param vale el vale
	 * @return {@code true} si la solicitud es positiva, {@code false} en caso contrario
	 */
	public boolean solicitaVale( Vale vale ){
		boolean resp = false;
		if( vale.getFecha_uso() != null 
				&& vale.getOrigen() != null
				&& vale.getDestino() != null
				&& vale.getMonto_estipulado() != 0
				&& vale.getMotivo_viaje() != null ){
			valeDao.guardaVale(vale);
			resp = true;
		}
		return resp;
	}
}
