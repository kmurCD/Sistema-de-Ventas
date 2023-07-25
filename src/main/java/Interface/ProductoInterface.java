package Interface;

import java.util.List;

import Modelo.Producto;

public interface ProductoInterface {

	public List<Producto> listProducto ();
	public int addProducto(Producto p);
	public int updateProducto (Producto p);
	public Producto getProducto(int id);
	public int deleteProducto (int id);
}
