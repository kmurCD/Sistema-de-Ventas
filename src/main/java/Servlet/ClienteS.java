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
		 	case "Enviar Datos":
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
	    String codStr = request.getParameter("txtCodigo");

	    if (codStr.isEmpty() || dni.isEmpty() || nom.isEmpty() || dir.isEmpty() || est.isEmpty()) {
	        request.setAttribute("error", "Debe llenar todos los campos.");
	    } else {
	        try {
	            cli.setDni(dni);
	            cli.setNom(nom);
	            cli.setDir(dir);
	            cli.setEstado(est);
	            cli.setCodigo(Integer.parseInt(codStr));

	            cdao.addCliente(cli);
	            request.setAttribute("mensaje", "Cliente agregado con éxito.");
	        } catch (Exception e) {
	            request.setAttribute("error", "Error al agregar.");
	        }
	    }
	    getClientes(request, response);
	}

	private void updateCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		int code = Integer.parseInt(request.getParameter("txtId"));
	    String dni = request.getParameter("txtDni");
	    String nom = request.getParameter("txtNombres");
	    String dir = request.getParameter("txtDireccion");
	    String est = request.getParameter("txtEstado");
	    String codStr = request.getParameter("txtCodigo");

	    if (dni.isEmpty() || nom.isEmpty() || dir.isEmpty() || est.isEmpty() || codStr.isEmpty()) {
	        request.setAttribute("error", "Debe llenar todos los campos.");
	        getClientes(request, response);
	        return; 
	    }

	    if (!codStr.matches("\\d+")) {
	        request.setAttribute("error", "El campo Código solo debe contener números");
	        getClientes(request, response);
	        return; 
	    }

	    int cod = Integer.parseInt(codStr);

	    cli.setId(code);
	    cli.setDni(dni);
	    cli.setNom(nom);
	    cli.setDir(dir);
	    cli.setEstado(est);
	    cli.setCodigo(cod);

	    int value = cdao.updateCliente(cli);

	    if (value == 1) {
	        request.setAttribute("mensaje", "Cliente actualizado con éxito");
	        getClientes(request, response);
	    } else {
	        request.setAttribute("error", "Error al actualizar el cliente");
	        getClientes(request, response);
	    }
	}

	
	private void getClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Cliente> lista = cdao.listCliente();
	    if (lista != null) {	
	        request.setAttribute("clientes", lista);
	        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
	    } else {	  
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
	    	request.setAttribute("mensaje", "Cliente eliminado con éxito");
	        getClientes(request, response);		        
	    } else {
	        request.setAttribute("error", "Error al eliminar el cliente");
	        request.getRequestDispatcher("Cliente.jsp").forward(request, response);
	    }
	}

	private void limpiarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cliente c = new Cliente () ;
		request.setAttribute("cliente", c);
		getClientes(request, response);	
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
