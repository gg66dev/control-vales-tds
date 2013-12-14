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
		long resp = 0l;
		if( centroCosto.getNombre() != null && centroCosto.getDepartamento() != null ){
			resp = centroCostoDao.guardaCentroCosto(centroCosto);
		}
		return resp;
	}
	
	public CentroCosto obtenCentroCosto(long id_centroCosto ){
		if( id_centroCosto > 0 ){
			return this.centroCostoDao.obtenCentroCosto(id_centroCosto);
		}
		return null;
	}
	
	public boolean actualiza(CentroCosto centroCosto){
		boolean actualizado = false;
		if( this.centroCostoDao.obtenCentroCosto(centroCosto.getIdcentro_costo()) != null ){
			if( centroCosto.getNombre() != null 
					&& centroCosto.getNombre() != null
					&& centroCosto.getDepartamento() != null  ){
				this.centroCostoDao.actualizaCentroCosto(centroCosto);
				actualizado = true;
			}
		}
		return actualizado;
	}
	
	public boolean eliminar(CentroCosto centroCosto){
		return this.centroCostoDao.eliminaCentroCosto(centroCosto);
	}
	
	public List<CentroCosto> obtenerListaCentroCostos(){
		return this.centroCostoDao.obtenListaCentroCostos();
	}
}
