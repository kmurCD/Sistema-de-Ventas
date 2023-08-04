package Servicio;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Conexion.Conexion;
import Interface.ClienteInterface;
import Modelo.Cliente;



public class ClienteServicio implements ClienteInterface {
			
	
	@Override
	public List<Cliente> listCliente(){	
	
		List<Cliente> listecli = new ArrayList<Cliente>();
		PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
		try {

			cn =Conexion.getConnection();
				String query = "SELECT * FROM cliente";
				psmt = cn.prepareStatement(query);
				rs = psmt.executeQuery();

				while(rs.next()) {
					
				Cliente cli = new Cliente();
				
				cli.setId(rs.getInt ("IdCliente"));
				cli.setDni(rs.getString("Dni"));
				cli.setNom(rs.getString("Nombres"));
				cli.setDir(rs.getString("Direccion"));
				cli.setEstado(rs.getString("Estado"));
				cli.setCodigo(rs.getInt("Codigo"));					
				
				listecli.add(cli);
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
	    return listecli;
	}		
	@Override
	public int addCliente(Cliente c) {
		int value = 0;
	    PreparedStatement psmt = null;
	    Connection cn = null;		
	   try {
	        cn = Conexion.getConnection();
	        String query = "insert into cliente (Dni, Nombres, Direccion, Estado, Codigo) values (?,?,?,?,?)";
	        		
	        psmt = cn.prepareStatement(query);
	        psmt.setString(1, c.getDni());
	        psmt.setString(2, c.getNom());
	        psmt.setString(3, c.getDir());
	        psmt.setString(4, c.getEstado());
	        psmt.setInt(5, c.getCodigo());			       
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
	public int updateCliente(Cliente c) {
		
		int value = 0;
	    PreparedStatement psmt = null;
	    Connection cn = null;		
	   try {
		   	cn = Conexion.getConnection();
	        String query = "UPDATE cliente set Dni=?, Nombres=?, Direccion=?,Estado=?,Codigo=? WHERE IdCliente=?";
	      	        		
	        psmt = cn.prepareStatement(query);
	        psmt = cn.prepareStatement(query);
	        psmt.setString(1, c.getDni());
	        psmt.setString(2, c.getNom());
	        psmt.setString(3, c.getDir());
	        psmt.setString(4, c.getEstado());
	        psmt.setInt(5, c.getCodigo());
	        psmt.setInt(6, c.getId());
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
	public Cliente getCliente(int id) {
		
		Cliente c = null;
		PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
		try {

			cn = Conexion.getConnection();
				String query = "SELECT * FROM cliente where Codigo="+id;
				
				psmt = cn.prepareStatement(query);								
				rs = psmt.executeQuery();									
				while(rs.next()) {							
				c= new Cliente();
				c.setId(rs.getInt(1));
				c.setDni(rs.getString(2));
				c.setNom(rs.getString(3));
				c.setDir(rs.getString(4));
				c.setEstado(rs.getString(5));
				c.setCodigo(rs.getInt(6));					
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
	    return c;
	}
	@Override
	public List<Cliente> listFiltro ( String buscar) {
		
		List<Cliente> listPro = new ArrayList<Cliente>();
		PreparedStatement psmt = null;
		Connection cn = null;
		ResultSet rs = null;
		try {

			cn =Conexion.getConnection();
			
			boolean isNumeric = buscar.matches("\\d+");
				String query;
			  if (isNumeric) {
		        
		            int code = Integer.parseInt(buscar);
		            query = "SELECT * FROM cliente WHERE Codigo=?";
		            psmt = cn.prepareStatement(query);
		            psmt.setInt(1, code);
		        } else {
		          
		            query = "SELECT * FROM cliente WHERE Nombres LIKE ?";
		            psmt = cn.prepareStatement(query);
		            psmt.setString(1, "%" + buscar + "%");
		        }
			  
				rs = psmt.executeQuery();

				while(rs.next()) {
					
					Cliente c = new Cliente();	
				
				c.setId(rs.getInt ("IdCliente"));
				c.setDni(rs.getString("Dni"));
				c.setNom(rs.getString("Nombres"));
				c.setDir(rs.getString("Direccion"));
				c.setEstado(rs.getString("Estado"));
				c.setCodigo(rs.getInt("Codigo"));								
	            
				listPro.add(c);
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
	public int deleteCliente(int id) {
		
		  int value = 0;
		    PreparedStatement psmt = null;
		    Connection cn = null;		    
		    try {		        
		        cn = Conexion.getConnection();
		        String query = "DELETE FROM cliente where IdCliente=?";
		                    		
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
