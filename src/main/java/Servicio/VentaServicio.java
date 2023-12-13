package Servicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Conexion.Conexion;
import Interface.VentaInterface;
import Modelo.Cliente;
import Modelo.Venta;

public class VentaServicio  implements VentaInterface{
	int r = 0;
	@Override
	public String GenerarSerie() {
	    String numeroserie = "";
	    String sql = "select max(NumeroSerie) from ventas";

	    try {
	        Connection cn = Conexion.getConnection();
	        PreparedStatement psmt = cn.prepareStatement(sql);
	        ResultSet rs = psmt.executeQuery();

	        while (rs.next()) {
	            numeroserie = rs.getString(1);
	        }
	        rs.close();
	        psmt.close();
	        cn.close();

	  
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return numeroserie;
	}

	
	public String IdVentas() {
	    String IdVentas = "";
	    String sql = "SELECT MAX(IdVentas) FROM ventas";

	    try {
	        Connection cn = Conexion.getConnection();
	        PreparedStatement psmt = cn.prepareStatement(sql);
	        ResultSet rs = psmt.executeQuery();

	        while (rs.next()) {
	            IdVentas = rs.getString(1);
	        }
	        
	        rs.close(); 
	        psmt.close(); 
	        cn.close(); 

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    
	    return IdVentas;
	}
	@Override
	public Venta ValidarCliente(int id) {
		
		Venta v = null;
	    PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
	    

	    try {
	         cn = Conexion.getConnection();
	        
	         String sql = "SELECT * FROM ventas WHERE IdCliente = ?";
	         psmt = cn.prepareStatement(sql);
	         psmt.setInt(1, id);
	         rs = psmt.executeQuery();
	         
	        while (rs.next()) {
	        	v = new Venta();
	        	v.setId(rs.getInt(1));
				v.setIdcliente(rs.getInt(2));
				v.setIdempleado(rs.getInt(3));			
				
	        }
	        System.out.println("Se obtuvo un dato de empleado");
	        rs.close(); 
	        psmt.close(); 
	        cn.close(); 

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    finally {
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        	}
			}
	    
	    return v;
	}
	@Override
	public Venta ValidarProductoEnUso(int id) {
		Venta v = null;
	    PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
	    

	    try {
	         cn = Conexion.getConnection();
	        
	         String sql = "SELECT * FROM detalle_ventas WHERE IdProducto = ?";
	         psmt = cn.prepareStatement(sql);
	         psmt.setInt(1, id);
	         rs = psmt.executeQuery();
	         
	        while (rs.next()) {
	        	v = new Venta();
	        	v.setId(rs.getInt(1));
				v.setIdVenta(rs.getInt(2));
				v.setIdproducto(rs.getInt(3));
				v.setCantidad(rs.getInt(4));
				v.setPrecio(rs.getDouble(5));
				
	        }
	        System.out.println("Se obtuvo un dato de venta");
	     
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    finally {
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        	}
			}
	    
	    return v;
	}
	@Override
	public Venta ValidarEmpleado(int id) {
		Venta v = null;
	    PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
	    

	    try {
	         cn = Conexion.getConnection();
	        
	         String sql = "SELECT * FROM ventas WHERE IdEmpleado = ?";
	         psmt = cn.prepareStatement(sql);
	         psmt.setInt(1, id);
	         rs = psmt.executeQuery();
	         
	        while (rs.next()) {
	        	v = new Venta();
	        	v.setId(rs.getInt(1));
				v.setIdcliente(rs.getInt(2));
				v.setIdempleado(rs.getInt(3));			
				
	        }
	        System.out.println("Se obtuvo un dato de empleado");
	        rs.close(); 
	        psmt.close(); 
	        cn.close(); 

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    finally {
	        try {
	            if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        	}
			}
	    
	    return v;
	}

	@Override
	public int guardarVenta(Venta ve) {
	    int r = 0; 
	    String sql = "INSERT INTO ventas (IdCliente, IdEmpleado, NumeroSerie, FechaVentas, Monto, Estado) VALUES (?, ?, ?, ?, ?, ?);";
	    try {
	    	
	        Connection cn = Conexion.getConnection();
	        PreparedStatement psmt = cn.prepareStatement(sql);
	        psmt.setInt(1, ve.getIdcliente());
	        psmt.setInt(2, ve.getIdempleado());
	        psmt.setString(3, ve.getNumserie());
	        psmt.setDate(4, ve.getFecha());
	        psmt.setDouble(5, ve.getMonto());
	        psmt.setString(6, ve.getEstado());
	        r = psmt.executeUpdate();
	        
	        psmt.close();
	        cn.close(); 
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }
	    return r;
	}

	@Override
	public int guardarDetalleVenta(Venta v) {
	    int r = 0;
	    String sql = "INSERT INTO detalle_ventas (IdVentas, IdProducto, Cantidad, PrecioVenta) VALUES (?, ?, ?, ?);";
	    
	    try {
	        Connection cn = Conexion.getConnection();
	        PreparedStatement psmt = cn.prepareStatement(sql);
	        psmt.setInt(1, v.getId());
	        psmt.setInt(2, v.getIdproducto());
	        psmt.setInt(3, v.getCantidad());
	        psmt.setDouble(4, v.getPrecio());
	        r = psmt.executeUpdate(); 
	        psmt.close(); 
	        cn.close(); 

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    return r;
	}


	


}
