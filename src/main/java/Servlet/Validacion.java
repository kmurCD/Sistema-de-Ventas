package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Factory.DAOFactory;
import Interface.EmpleadoInterface;
import Modelo.Empleado;


@WebServlet(name = "Validacion", urlPatterns = {"/Validacion"})
public class Validacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
			DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
			EmpleadoInterface edao = daoFactory.getEmpleado();
			Empleado em = new Empleado();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validacion() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String accion = request.getParameter("accion");
    	if (accion.equalsIgnoreCase("Ingresar")) {
	    	String user = request.getParameter("txtuser");
	    	String 	dni = request.getParameter("txtpass");
	        String rol = request.getParameter("txtRol");        
		       
	        em = edao.Validacion(user, dni, rol); 
	
	        if (em.getUser() != null) {
	            request.setAttribute("usuario", em);
	
	            if ("Administrador".equalsIgnoreCase(rol)) {
	                request.getRequestDispatcher("Principal.jsp").forward(request, response);
	            } else if ("Vendedor".equalsIgnoreCase(rol)) {
	                request.getRequestDispatcher("Principal2.jsp").forward(request, response);
	            } else {
	                request.setAttribute("error", "Usuario sin Permisos");
	                request.getRequestDispatcher("Index.jsp").forward(request, response);
	            }
        } else {
            request.setAttribute("error", "Usuario Invalido");
            request.getRequestDispatcher("Index.jsp").forward(request, response);
        }
    	}if (accion.equalsIgnoreCase("Salir")) {
    		request.setAttribute("error", "Sesion Finalizada");
            request.getRequestDispatcher("Index.jsp").forward(request, response);
    	}
   }
}

