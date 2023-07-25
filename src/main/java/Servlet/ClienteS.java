package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Factory.DAOFactory;
import Interface.ClienteInterface;
import Modelo.Cliente;



@WebServlet(name = "ClienteS", urlPatterns = {"/ClienteS"})
public class ClienteS extends HttpServlet {
	private static final long serialVersionUID = 1L;     
	DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
	ClienteInterface cdao = daoFactory.getCliente();

	Cliente cli = new Cliente();
	
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
				getClientes(request, response); break;
			case "limpiar":
				limpiarCliente(request, response); break;					
			default:
				break;
			}					
	}	
	


	private void addClienteo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dni = request.getParameter("txtDni");
		String nom = request.getParameter("txtNombres");
		String dir = request.getParameter("txtDireccion");
		String est = request.getParameter("txtEstado");
		int cod = Integer.parseInt (request.getParameter("txtCodigo"));

		cli.setDni(dni);
		cli.setNom(nom);
		cli.setDir(dir);
		cli.setEstado(est);
		cli.setCodigo(cod);    		
		   
		int value = cdao.addCliente(cli);
		
		if (value == 1) {
			System.out.println("ok addEmpleado");
			getClientes(request, response);    			
		}else {    	
			System.out.println("Error addEmpleado");
			request.getRequestDispatcher("Cliente.jsp").forward(request, response);
		}
		
	}
	private void updateCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt (request.getParameter("txtId"));		
		String dni = request.getParameter("txtDni");
		String nom = request.getParameter("txtNombres");
		String dir = request.getParameter("txtDireccion");
		String est = request.getParameter("txtEstado");
		int cod = Integer.parseInt (request.getParameter("txtCodigo"));
		
		cli.setId((code));		
		cli.setDni(dni);
		cli.setNom(nom);
		cli.setDir(dir);
		cli.setEstado(est);
		cli.setCodigo(cod); 
		
		
		int value =  cdao.updateCliente(cli);
		
		if (value == 1) {			
			getClientes(request, response);
		}else {
			request.setAttribute("mensaje", "Error al Actualizar ");
			request.getRequestDispatcher("Cliente.jsp").forward(request, response);
		}
		
	}
	
	private void getClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Cliente> c = cdao.listCliente();
	    if (c != null) {	
	        request.setAttribute("clientes", c);
	        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
	    } else {
	        request.setAttribute("mensaje", "Error al listar");
	        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
	    }
	}

	private void getCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		          
    				
    		String code = request.getParameter("code");
		    Cliente c = cdao.getCliente(Integer.parseInt(code));
		    
		    if (c != null) {
		        request.setAttribute("cliente", c);
		        getClientes(request, response);
		    } else {
		        request.setAttribute("mensaje", "Error al obtener cliente");
		        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
		    }	
		
	}
	
	private void deleteCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int code = Integer.parseInt (request.getParameter("code"));
	    int value = cdao.deleteCliente(code);		    
	    
	    if (value == 1) {
	        getClientes(request, response);		        
	    } else {
	        request.setAttribute("mensaje", "Error al eliminar el cliente");
	        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
	    }
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
