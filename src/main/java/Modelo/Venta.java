package Modelo;

public class Venta {
	
	private Integer id;
	private	Integer item;
	private	Integer idcliente;
	private	Integer idempleado;
	private	Integer idproducto;
	private	String 	Numserie;
	private	String	DescripcionP;		
	private	String 	fecha;
	private	Double 	precio;		
	private	Integer caNeidad;
	private	Double 	subtotal;	
	private	Double 	monto;
	private	String 	estado;
		

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

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Integer getCaNeidad() {
		return caNeidad;
	}

	public void setCaNeidad(Integer caNeidad) {
		this.caNeidad = caNeidad;
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
 
	
}
