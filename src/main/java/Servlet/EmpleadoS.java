package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Factory.DAOFactory;
import Interface.EmpleadoInterface;
import Interface.VentaInterface;
import Modelo.Cliente;
import Modelo.Empleado;
import Modelo.Venta;

@WebServlet(name = "EmpleadoS", urlPatterns = {"/EmpleadoS"})
public class EmpleadoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		EmpleadoInterface edao = daoFactory.getEmpleado();
		VentaInterface vdao = daoFactory.getVenta();
		Empleado em = new Empleado();
   
    public EmpleadoS() {
        super();      
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("menu");		 
		switch (type){
			case "Principal":
				request.getRequestDispatcher("Principal.jsp").forward(request, response);
				break;
		 	case "Enviar Datos":
				String codigo = request.getParameter("txtId");			
			if(codigo != null && !codigo.isEmpty()){
				updateEmpleado (request,response);}
			else{
				addEmpleado (request, response);}break;										
			case "Editar":
				getEmpleado(request, response); break;			
			case "Eliminar":
				deleteEmpleado(request, response); break;
			case "listar":
				getEmpleados(request, response); break;
			case "Filtro":
				getFiltro(request, response); break;			
			case "limpiar":
				limpiarEmpleado(request, response); break;					
			default:
				break;
			}
}  	
    	private void getFiltro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    		String b = request.getParameter("txtBuscar");
    	    if (b != null && !b.isEmpty()) {	 	    	
    	        List<Empleado> lista = edao.listFiltro(b );

    	        if (lista != null) {
    	            request.setAttribute("empleados", lista);
    	            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
    	        } else {
    	        	getEmpleados(request, response);
    	            request.setAttribute("mensaje", "Error al listar");
    	        }
    	    } else {	    	
    	        request.setAttribute("error", "Ingrese un código o nombre para buscar.");
    	        getEmpleados(request, response);
    	    }
    	}
		



		private void addEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    		
    		String dni = request.getParameter("txtDni");
    		String nom = request.getParameter("txtNombres");
    		String tef = request.getParameter("txtTelefono");
    		String est = request.getParameter("txtEstado");
    		String user = request.getParameter("txtUsuario");
    		String rol = request.getParameter("txtRol");  
    		
    		if (dni.isEmpty() || nom.isEmpty() || tef.isEmpty() || est.isEmpty() || user.isEmpty() ) {
    	        request.setAttribute("error", "Debe llenar todos los campos.");
    		} else {
    	        try {    
	    		em.setDni(dni);
	    		em.setNom(nom);
	    		em.setTel(tef);
	    		em.setEstado(est);
	    		em.setUser(user);    		
	    		em.setRol(rol);
	    		
	    		edao.addEmpleado(em);
	    		request.setAttribute("mensaje", "Empleado agregado con éxito.");
    	        } catch (Exception e) {
    	            request.setAttribute("error", "Error al agregar.");
    	        }
    	    }
    		getEmpleados(request, response);
    	}
    	private void updateEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    		int code = Integer.parseInt (request.getParameter("txtId"));
    		
    		String dni = request.getParameter("txtDni");
    		String nom = request.getParameter("txtNombres");
    		String tef = request.getParameter("txtTelefono");
    		String est = request.getParameter("txtEstado");
    		String user = request.getParameter("txtUsuario");
    		String rol = request.getParameter("txtRol");
    		

    		if (dni.isEmpty() || nom.isEmpty() || tef.isEmpty() || user.isEmpty() ||est.isEmpty())  {
    	        request.setAttribute("error", "Debe llenar todos los campos.");
    	        getEmpleados(request, response);
    	        return; 
    	    }  
	    		em.setId((code));		
	    		em.setDni(dni);
	    		em.setNom(nom);
	    		em.setTel(tef);
	    		em.setEstado(est);
	    		em.setUser(user);
	    		em.setRol(rol);		
   		
    		int value = edao.updateEmpleado(em);;
    		
    		if (value == 1) {
    			 request.setAttribute("mensaje","Empleado actualizado con éxito");
    			getEmpleados(request,response);
    		}else {
    			request.setAttribute("error", "Error al actualizar el empleado");
    			getEmpleados(request, response);
    		}
    	}
		private void getEmpleados(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			
			List<Empleado> lista = edao.listEmpleado();              
            if (lista != null) {
                request.setAttribute("empleados", lista);
        		request.getRequestDispatcher("Empleado.jsp").forward(request, response);  		
            } else {               
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);
            }
		}
		private void getEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String code = request.getParameter("code");			
		    Empleado e = edao.getEmpleado(Integer.parseInt(code));
		    
		    List<Empleado> lista = edao.listFiltro(code);
		    if (e != null) {
		    	request.setAttribute("empleado", e);
		        request.setAttribute("empleados", lista);
		        request.getRequestDispatcher("Empleado.jsp").forward(request, response);
		    } else {
		        request.setAttribute("mensaje", "Error al obtener empleado");
		        request.getRequestDispatcher("Empleado.jsp").forward(request, response);
		    }						
		}
		private void deleteEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
			int code = Integer.parseInt (request.getParameter("code"));
			Venta ven = vdao.ValidarEmpleado(code);
									
			 if ( ven != null) {				 
		    	 int IdEmpleado = ven.getIdempleado(); 		    	
		    	 if ( code == IdEmpleado) {
		    		 request.setAttribute("error", "No se puede eliminar el Empleado. Está siendo utilizado en una boleta.");			 
			    	 getEmpleados(request, response);
			     }else {
			    	 request.setAttribute("error", "No se pudo validar el empleado.");
			    	 getEmpleados(request, response);
			     }
		     }else {
		    	 int value = edao.deleteEmpleado(code);
					if (value == 1) {
					    request.setAttribute("mensaje", "Empleado eliminado");
					    getEmpleados(request, response);
					} else {
					    request.setAttribute("error", "Error al eliminar el Empleado");
					    getEmpleados(request, response);				   
					}
		     }
		}
		private void limpiarEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			Empleado e = new Empleado () ;
			request.setAttribute("empleado", e);
			getEmpleados(request, response);	
			}	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
