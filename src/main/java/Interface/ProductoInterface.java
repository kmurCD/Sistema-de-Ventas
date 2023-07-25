package Interface;

import java.util.List;

import Modelo.Producto;
import jakarta.servlet.ServletContext;

public interface ProductoInterface {

	public List<Producto> listProducto (ServletContext context);
	public int addProducto(Producto p);
	public int updateProducto (Producto p);
	public Producto getProducto(int id);
	public int deleteProducto (int id);
}
