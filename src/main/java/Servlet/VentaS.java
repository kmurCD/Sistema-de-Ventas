package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "VentaS", urlPatterns = {"/VentaS"})

public class VentaS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VentaS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("menu");		 
		switch (type){
			case "Principal":
				request.getRequestDispatcher("Principal.jsp").forward(request, response);
				break;
		 	case "Agregar":
				String codigo = request.getParameter("txtId");			
			if(codigo != null && !codigo.isEmpty()){
				updateVenta (request,response);}
			else{
				addVenta (request, response);}break;										
			case "Editar":
				getVenta(request, response); break;			
			case "Eliminar":
				deleteVenta(request, response); break;
			case "listar":
				getVentas(request, response); break;
			case "limpiar":
				limpiarVenta(request, response); break;					
			default:
				break;
			}
	}

	

	private void updateVenta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void addVenta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void deleteVenta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void getVenta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	private void getVentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("Venta.jsp").forward(request, response);  
		
	}
	private void limpiarVenta(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
