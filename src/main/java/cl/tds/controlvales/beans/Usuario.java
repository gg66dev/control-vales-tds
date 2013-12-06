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
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author Fernando Valencia F.
 *
 */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5558035818310287073L;
	@Id
	@Column(name = "idusuario")
	@GeneratedValue
	private Long idusuario;
	private String nombre;
	private String usuario;
	private String password;
	private String rut;
	private String email;
	@Column(columnDefinition = "enum('usuario','gerente', 'administrador')")
	@Enumerated(EnumType.STRING)
	private Perfil perfil;
	
	@ManyToOne
    @JoinColumn(name="centro_costo_idcentro_costo", nullable=true)
	private CentroCosto centroCosto;
	
	@OneToMany(mappedBy="usuario", cascade=CascadeType.ALL)
    private List<Vale> vales = new ArrayList<Vale>();
	
	/** Constructor por defecto */
	public Usuario(){}

	/** Constructor de la clase usuario
	 * 
	 * @param nombre
	 * @param usuario
	 * @param password
	 * @param rut
	 * @param email
	 */
	public Usuario(String nombre, String usuario, String password, String rut, String email){
		this.nombre = nombre;
		this.usuario = usuario;
		this.password = password;
		this.rut = rut;
		this.email = email;
	}
	
	/**
	 * @return the idusuario
	 */
	public Long getIdusuario() {
		return idusuario;
	}

	/**
	 * @param idusuario the idusuario to set
	 */
	public void setIdusuario(Long idusuario) {
		this.idusuario = idusuario;
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
	 * @return the usuario
	 */
	public String getUsuario() {
		return usuario;
	}

	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
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
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the perfil
	 */
	public Perfil getPerfil() {
		return perfil;
	}

	/**
	 * @param perfil the perfil to set
	 */
	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	/**
	 * @return the centroCosto
	 */
	public CentroCosto getCentroCosto() {
		return centroCosto;
	}

	/**
	 * @param centroCosto the centroCosto to set
	 */
	public void setCentroCosto(CentroCosto centroCosto) {
		this.centroCosto = centroCosto;
		centroCosto.addUsuario(this);
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
