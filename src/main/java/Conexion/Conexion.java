package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/bd_ventas?useSSL=false";
	private static final String USUARIO = "root";
	//private static final String CLAVE = "96582313";
	private static final String CLAVE = "10203040";

	static {
		try {
			Class.forName(CONTROLADOR);
		} catch (ClassNotFoundException e) {
			System.out.println("Error al cargar el controlador");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Connection conexion = null;
		
		try {
			conexion = DriverManager.getConnection(URL, USUARIO, CLAVE);
			System.out.println("Conexión OK");

		} catch (SQLException e) {
			System.out.println("Error en la conexión");
			e.printStackTrace();
		}
		
		return conexion;
	}
}