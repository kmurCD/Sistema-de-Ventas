package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Factory.DAOFactory;
import Interface.EmpleadoInterface;
import Modelo.Empleado;

/**
 * Servlet implementation class EmpleadoS
 */
public class EmpleadoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		EmpleadoInterface edao = daoFactory.getEmpleado();
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
		 	case "Agregar":
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
			case "limpiar":
				limpiarEmpleado(request, response); break;					
			default:
				break;
			}
}  	
    	private void addEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		   		
    		String dni = request.getParameter("txtDni");
    		String nom = request.getParameter("txtNombres");
    		String tef = request.getParameter("txtTelefono");
    		String est = request.getParameter("txtEstado");
    		String user = request.getParameter("txtUsuario");

    		em.setDni(dni);
    		em.setNom(nom);
    		em.setTel(tef);
    		em.setEstado(est);
    		em.setUser(user);    		
    		   
    		int value = edao.addEmpleado(em);
    		
    		if (value == 1) {
    			System.out.println("ok addEmpleado");
    			getEmpleados(request,response);    			
    		}else {    	
    			System.out.println("Error addEmpleado");
    			request.getRequestDispatcher("Empleado.jsp").forward(request, response);
    		}   		
  		
    	}
    	private void updateEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    		int code = Integer.parseInt (request.getParameter("txtId"));		
    		String dni = request.getParameter("txtDni");
    		String nom = request.getParameter("txtNombres");
    		String tef = request.getParameter("txtTelefono");
    		String est = request.getParameter("txtEstado");
    		String user = request.getParameter("txtUsuario");
    		
    		em.setId((code));		
    		em.setDni(dni);
    		em.setNom(nom);
    		em.setTel(tef);
    		em.setEstado(est);
    		em.setUser(user);
    		
   		
    		int value = edao.updateEmpleado(em);;
    		
    		if (value == 1) {
    			getEmpleados(request,response);
    		}else {
    			request.setAttribute("mensaje", "Error al Actualizar ");
    			request.getRequestDispatcher("Customer.jsp").forward(request, response);
    		}
    	}
		private void getEmpleados(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
			List<Empleado> lista = edao.listEmpleado();              
            if (lista != null) {
                request.setAttribute("empleados", lista);
        		request.getRequestDispatcher("Empleado.jsp").forward(request, response);  		
            } else {
                request.setAttribute("mensaje", "Error al listar");
                request.getRequestDispatcher("Empleado.jsp").forward(request, response);
            }
		}
		private void getEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String code = request.getParameter("code");
		    Empleado e = edao.getEmpleado(Integer.parseInt(code));
		    
		    if (e != null) {
		        request.setAttribute("empleado", e);
		        getEmpleados(request, response);
		    } else {
		        request.setAttribute("mensaje", "Error al obtener empleado");
		        request.getRequestDispatcher("Principal.jsp").forward(request, response);
		    }						
		}
		private void deleteEmpleado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
			int code = Integer.parseInt (request.getParameter("code"));
		    int value = edao.deleteEmpleado(code);		    
		    
		    if (value == 1) {
		        getEmpleados(request, response);		        
		    } else {
		        request.setAttribute("mensaje", "Error al eliminar el empleado");
		        request.getRequestDispatcher("Principal.jsp").forward(request, response);
		    }
		}
		private void limpiarEmpleado(HttpServletRequest request, HttpServletResponse response){
			// TODO Auto-generated method stub
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
