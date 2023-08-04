package Interface;

import java.util.List;
import Modelo.Cliente;
import Modelo.Producto;
import jakarta.servlet.ServletContext;

public interface ClienteInterface {
	
	public List<Cliente> listCliente ();
	public int addCliente(Cliente c);
	public int updateCliente (Cliente c);
	public Cliente getCliente(int id);
	public int deleteCliente (int id);
	List<Cliente> listFiltro(String buscar);
	
	
}
