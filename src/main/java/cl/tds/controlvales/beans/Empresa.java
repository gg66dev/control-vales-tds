/**
 * 
 */
package cl.tds.controlvales.beans;

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
 * @author Fernando Valencia F.
 *
 */
@Entity
@Table(name = "empresa")
public class Empresa {

	@Id
	@Column(name = "idempresa")
	@GeneratedValue
	private Long idempresa;
	private String nombre;
	private String rut;
	
	@OneToMany(mappedBy="empresa", cascade=CascadeType.ALL)
    private List<Vale> vales = new ArrayList<Vale>();

	/**
	 * @return the idempresa
	 */
	public Long getIdempresa() {
		return idempresa;
	}

	/**
	 * @param idempresa the idempresa to set
	 */
	public void setIdempresa(Long idempresa) {
		this.idempresa = idempresa;
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
	 * @return the rut
	 */
	public String getRut() {
		return rut;
	}

	/**
	 * @param rut the rut to set
	 */
	public void setRut(String rut) {
		this.rut = rut;
	}

	/**
	 * @return the vales
	 */
	public List<Vale> getVales() {
		return vales;
	}

	/**
	 * @param vales the vales to set
	 */
	public void setVales(List<Vale> vales) {
		this.vales = vales;
	}
	
	/**
	 * @param vale to add to vales list
	 */
	public void addVale(Vale vale){
		this.vales.add(vale);
	}
	
	/**
	 * @param vale to remove from the list
	 */
	public void removeVale(Vale vale){
		this.vales.remove(vale);
	}
}
