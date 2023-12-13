package Modelo;

import java.sql.Date;

import javax.xml.crypto.Data;

public class Venta {
	
	private Integer id;
	private	Integer item;
	private	Integer idcliente;
	private	Integer idVenta;
	private	Integer idempleado;
	private	Integer idproducto;
	private	String 	Numserie;
	private	String 	CodigoP;
	private	String	DescripcionP;		
	private	Date 	fecha;
	private	Double 	precio;		
	private	Integer Cantidad;
	private	Double 	subtotal;	
	private	Double 	monto;
	private	String 	estado;
		


	public String getCodigoP() {
		return CodigoP;
	}

	public void setCodigoP(String codigoP) {
		CodigoP = codigoP;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getItem() {
		return item;
	}

	public void setItem(Integer item) {
		this.item = item;
	}

	public Integer getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(Integer idcliente) {
		this.idcliente = idcliente;
	}

	public Integer getIdempleado() {
		return idempleado;
	}

	public void setIdempleado(Integer idempleado) {
		this.idempleado = idempleado;
	}

	public Integer getIdproducto() {
		return idproducto;
	}

	public void setIdproducto(Integer idproducto) {
		this.idproducto = idproducto;
	}

	public String getNumserie() {
		return Numserie;
	}

	public void setNumserie(String numserie) {
		Numserie = numserie;
	}

	public String getDescripcionP() {
		return DescripcionP;
	}

	public void setDescripcionP(String descripcionP) {
		DescripcionP = descripcionP;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Integer getCantidad() {
		return Cantidad;
	}

	public void setCantidad(Integer Cantidad) {
		this.Cantidad = Cantidad;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Integer getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(Integer idVenta) {
		this.idVenta = idVenta;
	}

	
	}
 
	
	

