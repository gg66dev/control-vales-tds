/**
 * 
 */
package cl.tds.controlvales.controller;

import java.util.List;

import cl.tds.controlvales.beans.Departamento;
import cl.tds.controlvales.daos.DepartamentoDAO;

/**
 * @author "Fernando Valencia"
 *
 */
public class DepartamentoController {
	
	private DepartamentoDAO deptoDao = new DepartamentoDAO();

	public long registrar(Departamento departamento){
		long resp = 0l;
		if( departamento.getNombre() != null ){
			resp = this.deptoDao.guardaDepartamento(departamento);
		}
		return resp;
	}
	
	public Departamento obtenDepartamento(long id_departamento){
		if( id_departamento > 0 ){
			return this.deptoDao.obtenDepartamento(id_departamento);
		}
		return null;
	}
	
	public boolean actualiza(Departamento departamento){
		boolean actualizado = false;
		if( this.deptoDao.obtenDepartamento(departamento.getIddepartamento() ) != null ){
			if( departamento.getNombre() != null 
					&& departamento.getNombre() != null ){
				this.deptoDao.actualizaDepartamento(departamento);
				actualizado = true;
			}
		}
		return actualizado;
	}
	
	public boolean eliminar(Departamento departamento){
		return this.deptoDao.eliminaDepartamento(departamento);
	}
	
	public List<Departamento> obtenerListaDepartamentos(){
		return this.deptoDao.obtenListaDepartamentos();
	}
}
