package Interface;


import Modelo.Venta;

public interface VentaInterface {

	public int guardarVenta(Venta ve);
	public int guardarDetalleVenta(Venta venta);
	public String GenerarSerie();
	public String IdVentas();
	public Venta ValidarProductoEnUso(int id);
	public Venta ValidarEmpleado(int id);
	public Venta ValidarCliente(int id);
}
