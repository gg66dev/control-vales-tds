/**
 * 
 */
package cl.tds.controlvales.beans;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author Fernando Valencia F.
 *
 */
@Entity
@Table(name = "vale")
public class Vale {

	@Id
	@Column(name = "idvale")
	@GeneratedValue
	private Long idvale;
	private Date fecha_uso;
	private String origen;
	private String destino;
	private String motivo_viaje;
	private int monto_estipulado;
	private int monto_real;
	private Date fecha_confirmacion;
	@Column(columnDefinition = "enum('abierto','autorizado', 'rechazado', 'consolidado')")
	@Enumerated(EnumType.STRING)
	private Estado estado;
	
	@ManyToOne
    @JoinColumn(name="usuario_idusuario", nullable=false)
	private Usuario usuario;
	
	/** Constructor por defecto */
	public Vale(){}
	
	/** Constructor con algunos atributos
	 * 
	 * @param fecha_uso
	 * @param origen
	 * @param destino
	 * @param motivo
	 * @param monto_estipulado
	 */
	public Vale( Date fecha_uso, String origen, String destino, String motivo, int monto_estipulado ) {
		this.fecha_uso = fecha_uso;
		this.origen = origen;
		this.destino = destino;
		this.motivo_viaje = motivo;
		this.monto_estipulado = monto_estipulado;
	}

	/**
	 * @return the idvale
	 */
	public Long getIdvale() {
		return idvale;
	}

	/**
	 * @param idvale the idvale to set
	 */
	public void setIdvale(Long idvale) {
		this.idvale = idvale;
	}

	/**
	 * @return the fecha_uso
	 */
	public Date getFecha_uso() {
		return fecha_uso;
	}

	/**
	 * @param fecha_uso the fecha_uso to set
	 */
	public void setFecha_uso(Date fecha_uso) {
		this.fecha_uso = fecha_uso;
	}

	/**
	 * @return the origen
	 */
	public String getOrigen() {
		return origen;
	}

	/**
	 * @param origen the origen to set
	 */
	public void setOrigen(String origen) {
		this.origen = origen;
	}

	/**
	 * @return the destino
	 */
	public String getDestino() {
		return destino;
	}

	/**
	 * @param destino the destino to set
	 */
	public void setDestino(String destino) {
		this.destino = destino;
	}

	/**
	 * @return the motivo_viaje
	 */
	public String getMotivo_viaje() {
		return motivo_viaje;
	}

	/**
	 * @param motivo_viaje the motivo_viaje to set
	 */
	public void setMotivo_viaje(String motivo_viaje) {
		this.motivo_viaje = motivo_viaje;
	}

	/**
	 * @return the monto_estipulado
	 */
	public int getMonto_estipulado() {
		return monto_estipulado;
	}

	/**
	 * @param monto_estipulado the monto_estipulado to set
	 */
	public void setMonto_estipulado(int monto_estipulado) {
		this.monto_estipulado = monto_estipulado;
	}

	/**
	 * @return the monto_real
	 */
	public int getMonto_real() {
		return monto_real;
	}

	/**
	 * @param monto_real the monto_real to set
	 */
	public void setMonto_real(int monto_real) {
		this.monto_real = monto_real;
	}

	/**
	 * @return the fecha_confirmacion
	 */
	public Date getFecha_confirmacion() {
		return fecha_confirmacion;
	}

	/**
	 * @param fecha_confirmacion the fecha_confirmacion to set
	 */
	public void setFecha_confirmacion(Date fecha_confirmacion) {
		this.fecha_confirmacion = fecha_confirmacion;
	}

	/**
	 * @return the estado
	 */
	public Estado getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	/**
	 * @return the usuario
	 */
	public Usuario getUsuario() {
		return usuario;
	}

	/**
	 * @param usuario the usuario to set
	 */
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
		usuario.addVale(this);
	}
	
}
