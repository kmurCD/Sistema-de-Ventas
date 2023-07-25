package Factory;

import Interface.ClienteInterface;
import Interface.EmpleadoInterface;
import Interface.ProductoInterface;
import Interface.VentaInterface;
import Servicio.ClienteServicio;
import Servicio.EmpleadoServicio;
import Servicio.ProductoServicio;
import Servicio.VentaServicio;

public class MysqlDAOFactory  extends DAOFactory{

	@Override
	public EmpleadoInterface getEmpleado() {
		// TODO Auto-generated method stub
		return new EmpleadoServicio();
	}

	@Override
	public ClienteInterface getCliente() {
		// TODO Auto-generated method stub
		return new ClienteServicio();
	}

	@Override
	public ProductoInterface getProducto() {
		// TODO Auto-generated method stub
		return  new ProductoServicio();
	}

	@Override
	public VentaInterface getVenta() {
		// TODO Auto-generated method stub
		return new VentaServicio();
	}
	


	
}
