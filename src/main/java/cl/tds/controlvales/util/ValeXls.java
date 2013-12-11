package cl.tds.controlvales.util;

import java.io.Serializable;

public class ValeXls implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6644749276061198802L;
	
	public String folio;
	public String fecha;
	public String monto;

	public ValeXls(String folio, String fecha, String monto) {
		this.folio = folio;
		this.fecha = fecha;
		this.monto = monto;
	}
}
