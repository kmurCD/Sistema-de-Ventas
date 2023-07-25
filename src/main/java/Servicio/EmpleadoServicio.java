package Servicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Conexion.Conexion;
import Interface.EmpleadoInterface;
import Modelo.Empleado;

public class EmpleadoServicio implements EmpleadoInterface {

		@Override
		public List<Empleado> listEmpleado() {
			
			List<Empleado> listempl = new ArrayList<Empleado>();
			PreparedStatement psmt = null;
			Connection cn = null;
			ResultSet rs = null;
			try {

				cn =Conexion.getConnection();
					String query = "SELECT * FROM empleado";
					psmt = cn.prepareStatement(query);
					rs = psmt.executeQuery();

					while(rs.next()) {
						
					Empleado em = new Empleado();
					em.setId(rs.getInt ("IdEmpleado"));
					em.setRol(rs.getString("rol"));
					em.setDni(rs.getString("Dni"));
					em.setNom(rs.getString("Nombres"));
					em.setTel(rs.getString("Telefono"));
					em.setEstado(rs.getString("Estado"));
					em.setUser (rs.getString("User"));
					em.setRol(rs.getString("Rol"));
					listempl.add(em);
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
		    return listempl;
		}		
		@Override
		public int addEmpleado(Empleado em) {			
		
			int value = 0;
		    PreparedStatement psmt = null;
		    Connection cn = null;		
		   try {
		        cn = Conexion.getConnection();
<<<<<<< HEAD
		        String query = "insert into empleado(Dni, Nombres, Telefono, Estado, User,Rol) values (?,?,?,?,?,?)";
		        		
		        psmt = cn.prepareStatement(query);
		        psmt.setString(1, em.getDni());
		        psmt.setString(2, em.getNom());
		        psmt.setString(3, em.getTel());
		        psmt.setString(4, em.getEstado());
		        psmt.setString(5, em.getUser());
		        psmt.setString(6, em.getRol());
=======
		        String query = "insert into empleado(rol, Dni, Nombres, Telefono, Estado, User) values (?,?,?,?,?)";
		        		
		        psmt = cn.prepareStatement(query);
		        psmt.setString(1, em.getRol());
		        psmt.setString(2, em.getDni());
		        psmt.setString(3, em.getNom());
		        psmt.setString(4, em.getTel());
		        psmt.setString(5, em.getEstado());
		        psmt.setString(6, em.getUser());			       
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
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
		public int updateEmpleado(Empleado em) {

			int value = 0;
		    PreparedStatement psmt = null;
		    Connection cn = null;		
		   try {
			   	cn = Conexion.getConnection();
<<<<<<< HEAD
			   	String query;
		        
		        if (em.getRol() == null) {
		        	query = "UPDATE empleado set Dni=?, Nombres=?, Telefono=?,Estado=?,User=?  WHERE IdEmpleado=?";
		        } else {
		        	query = "UPDATE empleado set Dni=?, Nombres=?, Telefono=?,Estado=?,User=?,Rol=?  WHERE IdEmpleado=?";
		        } 
		        
		        psmt = cn.prepareStatement(query);
		        psmt.setString(1, em.getDni());
		        psmt.setString(2, em.getNom());
		        psmt.setString(3, em.getTel());
		        psmt.setString(4, em.getEstado());
		        psmt.setString(5, em.getUser());
		        
		        
		        
		        if (em.getRol() != null) {
		            psmt.setString(6, em.getRol());
		            psmt.setInt(7, em.getId());
		        } else {
		        	psmt.setInt(6, em.getId());;
		        }
		        
=======
		        String query = "UPDATE empleado set rol=?, Dni=?, Nombres=?, Telefono=?,Estado=?,User=? WHERE IdEmpleado=?";
		      	        		
		        psmt = cn.prepareStatement(query);
		        psmt.setString(1, em.getRol());
		        psmt.setString(2, em.getDni());
		        psmt.setString(3, em.getNom());
		        psmt.setString(4, em.getTel());
		        psmt.setString(5, em.getEstado());
		        psmt.setString(6, em.getUser());
		        psmt.setInt(7, em.getId());
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
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
		public Empleado getEmpleado(int id) {
			
			Empleado em = null;
			PreparedStatement psmt = null;
			Connection cn = null;
			ResultSet rs = null;
			try {

				cn = Conexion.getConnection();
					String query = "SELECT * FROM empleado where IdEmpleado="+id;
					
					psmt = cn.prepareStatement(query);								
					rs = psmt.executeQuery();									
					while(rs.next()) {							
					em= new Empleado();
					em.setId(rs.getInt(1));
<<<<<<< HEAD
					em.setDni(rs.getString(2));
					em.setNom(rs.getString(3));
					em.setTel(rs.getString(4));
					em.setEstado(rs.getString(5));
					em.setUser(rs.getString(6));
					em.setRol(rs.getString(7));
=======
					em.setRol(rs.getString(2));
					em.setDni(rs.getString(3));
					em.setNom(rs.getString(4));
					em.setTel(rs.getString(5));
					em.setEstado(rs.getString(6));
					em.setUser(rs.getString(7));					
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
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
		    return em;
		}

		@Override
		public int deleteEmpleado(int id) {					
		    int value = 0;
		    PreparedStatement psmt = null;
		    Connection cn = null;		    
		    try {		        
		        cn = Conexion.getConnection();
		        String query = "DELETE FROM empleado where IdEmpleado=?";
		                    		
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

		@Override
		public Empleado Validacion(String user, String dni, String rol) {
			
			Connection cn = null;	
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			Empleado em=new Empleado();
			String query="select * from empleado where User=? and Dni=? and Rol=?";
			try {
				cn = Conexion.getConnection();
				psmt = cn.prepareStatement(query);
				psmt.setString(1, user);
				psmt.setString(2, dni);
				psmt.setString(3, rol);
				rs=psmt.executeQuery();
				
				while (rs.next()){
				em.setUser (rs.getString("IdEmpleado"));
				em. setUser (rs.getString("User"));
				em. setDni (rs.getString("Dni"));
				em. setNom(rs.getString("Nombres"));
				em. setRol(rs.getString("Rol"));
				
				}
				
				} catch (Exception e) {
							}
			return em;
			
			}
					
}		
			
		
			
		
			
		
			
		
			   			
	