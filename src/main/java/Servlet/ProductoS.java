package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ProductoS
 */
public class ProductoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ProductoS() {
        super();
        // TODO Auto-generated constructor stub
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
				updateProducto (request,response);}
			else{
				addProducto (request, response);}break;										
			case "Editar":
				getProducto(request, response); break;			
			case "Eliminar":
				deleteProducto(request, response); break;
			case "listar":
				getProductos(request, response); break;
			case "limpiar":
				limpiarProducto(request, response); break;					
			default:
				break;
			}
	
	}
	private void updateProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}



	private void addProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}



	private void getProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}



	private void deleteProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}



	private void getProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Producto.jsp").forward(request, response);
		
	}



	private void limpiarProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
