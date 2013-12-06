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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author "Fernando Valencia"
 *
 */
@Entity
@Table(name = "centro_costo")
public class CentroCosto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3487583664735665607L;
	@Id
	@Column(name = "idcentro_costo")
	@GeneratedValue
	private Long idcentro_costo;
	private String nombre;
	private String descripcion;
	
	@ManyToOne
    @JoinColumn(name="departamento_iddepartamento", nullable=false)
	private Departamento departamento;
	
	@OneToMany(mappedBy="centroCosto", cascade=CascadeType.ALL)
    private List<Usuario> usuarios = new ArrayList<Usuario>();
	
	/**
	 * Constructor por defecto
	 */
	public CentroCosto(){}
	
	/**
	 * Constructor con todos los campos de la clase
	 * @param nombre
	 * @param descripcion
	 * @param departamento
	 */
	public CentroCosto(String nombre, String descripcion, Departamento departamento){
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.departamento = departamento;
	}
	
	/**
	 * @return the idcentro_costo
	 */
	public Long getIdcentro_costo() {
		return idcentro_costo;
	}
	/**
	 * @param idcentro_costo the idcentro_costo to set
	 */
	public void setIdcentro_costo(Long idcentro_costo) {
		this.idcentro_costo = idcentro_costo;
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
	 * @return the departamento
	 */
	public Departamento getDepartamento() {
		return departamento;
	}
	/**
	 * @param departamento the departamento to set
	 */
	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
		departamento.addCentroCosto(this);
	}
	/**
	 * @return the usuarios
	 */
	public List<Usuario> getUsuarios() {
		return usuarios;
	}
	/**
	 * @param usuarios the usuarios to set
	 */
	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}
	/**
	 * @param usuario to add to usuarios list
	 */
	public void addUsuario(Usuario usuario){
		this.usuarios.add(usuario);
	}
	
	/**
	 * @param usuario to remove from the list
	 */
	public void removeUsuario(Usuario usuario){
		this.usuarios.remove(usuario);
	}
}
