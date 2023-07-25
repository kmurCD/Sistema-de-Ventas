package Servicio;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import Conexion.Conexion;
import Interface.ProductoInterface;
import Modelo.Producto;
import jakarta.servlet.ServletContext;


public class ProductoServicio implements ProductoInterface {	
	String rutaImg = "/img/nodisponible.png";
	@Override
	public List<Producto> listProducto(ServletContext context) {
		
		List<Producto> listPro = new ArrayList<Producto>();
		PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
		try {

			cn =Conexion.getConnection();
				String query = "SELECT * FROM producto";
				psmt = cn.prepareStatement(query);
				rs = psmt.executeQuery();

				while(rs.next()) {
					
				Producto p = new Producto();			
				p.setId(rs.getInt ("IdProducto"));
				p.setNombre(rs.getString("Nombres"));
				p.setPrecio(rs.getDouble("Precio"));
				p.setStock(rs.getInt("Stock"));
				p.setEstado(rs.getString("Estado"));
				p.setCodigo(rs.getInt("Codigo"));
				
				byte[] imgBytes = rs.getBytes("Imagen");
				if (imgBytes != null && imgBytes.length > 0) { 				
					String img64 = Base64.getEncoder().encodeToString(imgBytes);
					p.setBase64(img64);
				} else {
					String realPath = context.getRealPath(rutaImg);
					try {
	                    byte[] imagenBytes = Files.readAllBytes(Paths.get(realPath));                   
	                    String imgPre64 = Base64.getEncoder().encodeToString(imagenBytes);
	                    p.setBase64(imgPre64);
                } catch (IOException e) {
                   
                    e.printStackTrace();
                }
			}          
	            
				listPro.add(p);
				System.out.println("Listado Ok");
				}
			}catch (Exception e) {
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
	    return listPro;
	}

	@Override
	public int addProducto(Producto p) {
		System.out.println("Se agrego un dato");
		int value = 0;
	    PreparedStatement psmt = null;
	    Connection cn = null;		
	   try {
	        cn = Conexion.getConnection();
	        String query = "insert into producto(Nombres, Precio, Stock, Estado, Codigo, Imagen) values (?,?,?,?,?,?)";
	        		
	        psmt = cn.prepareStatement(query);
	        psmt.setString(1, p.getNombre());
	        psmt.setDouble(2, p.getPrecio());
	        psmt.setInt(3, p.getStock());
	        psmt.setString(4, p.getEstado());
	        psmt.setInt(5, p.getCodigo());
	        psmt.setBytes(6, p.getImagen());
	        value = psmt.executeUpdate();
	        
	        System.out.println("Se agrego un dato");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (psmt != null) psmt.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return value;
	}

	@Override
	public int updateProducto(Producto p) {
		
		int value = 0;
	    PreparedStatement psmt = null;
	    Connection cn = null;		
	   try {
		   	cn = Conexion.getConnection();
		    String query;
		    
	        if (p.getImagen() == null) {
	            query = "UPDATE producto SET Nombres=?, Precio=?, Stock=?, Estado=?, Codigo=? WHERE IdProducto=?";
	        } else {
	            query = "UPDATE producto SET Nombres=?, Precio=?, Stock=?, Estado=?, Codigo=?, Imagen=? WHERE IdProducto=?";
	        }
	        
	      	        		
	        psmt = cn.prepareStatement(query);
	        psmt.setString(1, p.getNombre());
	        psmt.setDouble(2, p.getPrecio());
	        psmt.setInt(3, p.getStock());
	        psmt.setString(4, p.getEstado());
	        psmt.setInt(5, p.getCodigo());
	        
	        if (p.getImagen() != null) {
	            psmt.setBytes(6, p.getImagen());
	            psmt.setInt(7, p.getId());
	        } else {
	            psmt.setInt(6, p.getId());
	        }
	       
	        
	        value = psmt.executeUpdate();
	        System.out.println("Se actualizo un dato");
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (psmt != null) psmt.close();
	            if (cn != null) cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return value;	
	}
	@Override
	public Producto getProducto(int id) {
		
		Producto p = null;
		PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
		try {

			cn = Conexion.getConnection();
				String query = "SELECT * FROM producto where IdProducto="+id;
				
				psmt = cn.prepareStatement(query);								
				rs = psmt.executeQuery();									
				while(rs.next()) {							
				p= new Producto();
				
				p.setId(rs.getInt ("IdProducto"));
				p.setNombre(rs.getString("Nombres"));
				p.setPrecio(rs.getDouble("Precio"));
				p.setStock(rs.getInt("Stock"));
				p.setEstado(rs.getString("Estado"));
				p.setCodigo(rs.getInt("Codigo"));
				p.setImagen (rs.getBytes("Imagen"));						
				}
				System.out.println("Se obtuvo un dato");
			}catch (Exception e) {
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
	    return p;
	}

	@Override
	public int deleteProducto(int id) {
		  
		int value = 0;
		    PreparedStatement psmt = null;
		    Connection cn = null;		    
		    try {		        
		        cn = Conexion.getConnection();
		        String query = "DELETE FROM producto where IdProducto=?";
		                    		
		        psmt = cn.prepareStatement(query);
		        psmt.setInt(1, id);
		        value = psmt.executeUpdate();
		        System.out.println("Se eliminó un dato");
		    } catch (Exception e) {
		        e.printStackTrace();		     
		    } finally {
		        try {          
		            if (psmt != null) psmt.close();
		            if (cn != null) cn.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		    return value;		    
		}
}
