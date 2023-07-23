package Interface;

import java.util.List;

import Modelo.Empleado;

public interface EmpleadoInterface {
	
	public List<Empleado> listEmpleado ();
	public int addEmpleado (Empleado e);
	public int updateEmpleado (Empleado e);
	public Empleado getEmpleado(int id);
	public int deleteEmpleado (int id);
	public Empleado  Validacion (String user, String dni);
	
}
