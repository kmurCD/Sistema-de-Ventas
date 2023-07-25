package Factory;

import Interface.ClienteInterface;
import Interface.EmpleadoInterface;
import Interface.ProductoInterface;
import Interface.VentaInterface;
public abstract class DAOFactory {
	
		  public static final int MYSQL = 1 ;
		  public static final int SQLSERVER= 2 ;
		  public static final int ORACLE = 3 ;
		  
		 
		  public abstract EmpleadoInterface getEmpleado();	
		  public abstract ClienteInterface getCliente();	
		  public abstract ProductoInterface getProducto();	
		  public abstract VentaInterface getVenta();
		  
		  public static DAOFactory getDaoFactory (int tipo) {
				switch (tipo) {
				case MYSQL:
					return new MysqlDAOFactory();			
				case SQLSERVER:
					return null;
				case ORACLE:
					return null;

				default:
					return null;
				}			
		  }



		



		


		
}

