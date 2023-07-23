package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import Modelo.Empleado;

/**
 * Servlet implementation class ClienteS
 */
public class ClienteS extends HttpServlet {
	private static final long serialVersionUID = 1L;     
    
    public ClienteS() {
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
				updateCliente (request,response);}
			else{
				addClienteo (request, response);}break;										
			case "Editar":
				getCliente(request, response); break;			
			case "Eliminar":
				deleteCliente(request, response); break;
			case "listar":
				getCliente(request, response); break;
			case "limpiar":
				limpiarCliente(request, response); break;					
			default:
				break;
			}
		
		
		
		
		
				
	}
	
	


	private void updateCliente(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


	private void addClienteo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


	private void deleteCliente(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


	private void getCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		          
    		request.getRequestDispatcher("Cliente.jsp").forward(request, response);  		
        
		
	}


	private void limpiarCliente(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
