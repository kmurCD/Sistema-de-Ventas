package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Factory.DAOFactory;
import Interface.EmpleadoInterface;
import Modelo.Empleado;


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
            String pass = request.getParameter("txtpass");
            em = edao.Validacion(user, pass);
            
            if (em.getUser() != null) { 
            	request.setAttribute("usuario",em);
                request.getRequestDispatcher("EmpleadoS?menu=Principal").forward(request, response);
                System.out.println("Conexión de validacion OK");
            } else {
                request.getRequestDispatcher("Index.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("Index.jsp").forward(request, response);
        }				
	}

}
