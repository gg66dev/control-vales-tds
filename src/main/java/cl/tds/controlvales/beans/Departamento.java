/**
 * 
 */
package cl.tds.controlvales.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author "Fernando Valencia"
 *
 */
@Entity
@Table(name = "departamento")
public class Departamento implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 722734777663653199L;
	@Id
	@Column(name = "iddepartamento")
	@GeneratedValue
	private Long iddepartamento;
	private String nombre;
	private String descripcion;
	
	@OneToMany(mappedBy="departamento", cascade=CascadeType.ALL)
	private List<CentroCosto> centrosDeCostos = new ArrayList<CentroCosto>(); 
	
	/**
	 * Constructor por defecto
	 */
	public Departamento(){}
	
	/**
	 *  Un constructor con todos los parametros de la clase
	 * @param nombre
	 * @param descripcion
	 */
	public Departamento(String nombre, String descripcion) {
		this.nombre = nombre;
		this.descripcion = descripcion;
	}
	/**
	 * @return the iddepartamento
	 */
	public Long getIddepartamento() {
		return iddepartamento;
	}
	/**
	 * @param iddepartamento the iddepartamento to set
	 */
	public void setIddepartamento(Long iddepartamento) {
		this.iddepartamento = iddepartamento;
	}
	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	/**
	 * @return the centrosDeCostos
	 */
	public List<CentroCosto> getCentrosDeCostos() {
		return centrosDeCostos;
	}
	/**
	 * @param centrosDeCostos the centrosDeCostos to set
	 */
	public void setCentrosDeCostos(List<CentroCosto> centrosDeCostos) {
		this.centrosDeCostos = centrosDeCostos;
	}
	
	/**
	 * @param centroCosto to add to centrosDeCostos list
	 */
	public void addCentroCosto(CentroCosto centroCosto){
		this.centrosDeCostos.add(centroCosto);
	}
	
	/**
	 * @param centroCosto to remove from the list
	 */
	public void removeCentroCosto(CentroCosto centroCosto){
		this.centrosDeCostos.remove(centroCosto);
	}
	
}
