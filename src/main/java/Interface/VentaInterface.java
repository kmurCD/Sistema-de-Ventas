package Interface;

import java.util.List;

import Modelo.Venta;

public interface VentaInterface {
	public List<Venta> listVenta ();
	public int addVenta(Venta p);
	public int updateVenta (Venta p);
	public Venta getVenta(int id);
	public int deleteVenta (int id);
}
