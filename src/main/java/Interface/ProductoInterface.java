package Interface;

import java.util.List;

import Modelo.Producto;
import jakarta.servlet.ServletContext;

public interface ProductoInterface {

	public List<Producto> listProducto (ServletContext context);
	public int addProducto(Producto p);
	public int updateProducto (Producto p);
	public Producto getProducto(int id , int cod);
	public List<Producto>  listFiltro (ServletContext context, String buscar);
	public int deleteProducto (int id);
	public int updateStock(Producto p);
	
}
