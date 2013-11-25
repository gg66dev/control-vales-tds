/**
 * 
 */
package cl.tds.controlvales.controllers;

import java.util.List;

import cl.tds.controlvales.beans.Empresa;
import cl.tds.controlvales.daos.EmpresaDAO;
import cl.tds.controlvales.util.ValidacionUtil;

/**
 * @author "Fernando Valencia"
 *
 */
public class EmpresaController {

	EmpresaDAO empresaDAO = new EmpresaDAO();
	
	public boolean registrarEmpresa(Empresa empresa){
		boolean registrada = false;
		if( empresa.getNombre() != null ){
			if( !ValidacionUtil.validarRut(empresa.getRut()) )
				empresa.setRut("");
			empresaDAO.guardaEmpresa(empresa);
			registrada = true;
		}
		return registrada;
	}
	
	public List<Empresa> listarEmpresas(){
		return empresaDAO.obtenListaEmpresas();
	}
	
	public Empresa obtenEmpresa(long id){
		return empresaDAO.obtenEmpresa(id);
	}
	
	public Empresa obtenEmpresa(String nombre){
		return empresaDAO.obtenEmpresa(nombre);
	}
}
