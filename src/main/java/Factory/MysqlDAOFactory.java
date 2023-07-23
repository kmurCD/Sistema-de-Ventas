package Factory;

import Interface.EmpleadoInterface;
import Servicio.EmpleadoServicio;


public class MysqlDAOFactory  extends DAOFactory{

	@Override
	public EmpleadoInterface getEmpleado() {
		// TODO Auto-generated method stub
		return new EmpleadoServicio();
	}

	
}
