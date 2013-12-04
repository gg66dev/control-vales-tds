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
		if( departamento.getNombre() != null ){
			return this.deptoDao.guardaDepartamento(departamento);
		}
		return -1l;
	}
	
	public Departamento obtenDepartamento(long id_departamento){
		if( id_departamento > 0 ){
			return this.deptoDao.obtenDepartamento(id_departamento);
		}
		return null;
	}
	
	public List<Departamento> listarDepartamentos(){
		return this.deptoDao.obtenListaDepartamentos();
	}
}
