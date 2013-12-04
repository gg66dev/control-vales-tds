/**
 * 
 */
package cl.tds.controlvales.controller;

import java.util.List;

import cl.tds.controlvales.beans.CentroCosto;
import cl.tds.controlvales.daos.CentroCostoDAO;

/**
 * @author "Fernando Valencia"
 *
 */
public class CentroCostoController {

	private CentroCostoDAO centroCostoDao = new CentroCostoDAO();

	public long registrar(CentroCosto centroCosto){
		if( centroCosto.getNombre() != null && centroCosto.getDepartamento() != null ){
			return centroCostoDao.guardaCentroCosto(centroCosto);
		}
		return -1l;
	}
	
	public CentroCosto obtenCentroCosto(long id_centroCosto ){
		if( id_centroCosto > 0 ){
			return this.centroCostoDao.obtenCentroCosto(id_centroCosto);
		}
		return null;
	}
	
	public List<CentroCosto> listarCentroCostos(){
		return this.centroCostoDao.obtenListaCentroCostos();
	}
}
