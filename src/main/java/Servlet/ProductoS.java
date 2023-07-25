package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import Factory.DAOFactory;
import Interface.ProductoInterface;
import Modelo.Empleado;
import Modelo.Producto;

@WebServlet(name = "ProductoS", urlPatterns = {"/ProductoS"})
@MultipartConfig
public class ProductoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoInterface pdao = daoFactory.getProducto();
		Producto p = new Producto();
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
	private void addProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String nom = request.getParameter("txtNombre");
		Double pre = Double.parseDouble(request.getParameter("txtPrecio"));
		int stk = Integer.parseInt(request.getParameter("txtStock"));
		String est= request.getParameter("txtEstado");
		int cdo= Integer.parseInt(request.getParameter("txtCodigo"));
		Part filePart = request.getPart("txtImagen");
        InputStream fileContent = filePart.getInputStream();
        byte[] imgBytes = fileContent.readAllBytes();

		p.setNombre(nom);
		p.setPrecio(pre);
		p.setStock(stk);
		p.setEstado(est);
		p.setCodigo(cdo);    	
		p.setImagen(imgBytes);  
		
		int value = pdao.addProducto(p);
		
		if (value == 1) {
			System.out.println("Producto agregado");
			getProductos(request,response);    			
		}else {    	
			System.out.println("Error agregar producto");
			request.getRequestDispatcher("Producto.jsp").forward(request, response);
		}   		
		
	}
	private void updateProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt (request.getParameter("txtId"));		
		String nom = request.getParameter("txtNombre");
		Double pre = Double.parseDouble(request.getParameter("txtPrecio"));
		int stk = Integer.parseInt(request.getParameter("txtStock"));
		String est= request.getParameter("txtEstado");
		int cdo= Integer.parseInt(request.getParameter("txtCodigo"));
		Part filePart = request.getPart("txtImagen");
        InputStream fileContent = filePart.getInputStream();
        byte[] imgBytes = fileContent.readAllBytes();
		
		p.setId((id));		
		p.setNombre(nom);
		p.setPrecio(pre);
		p.setStock(stk);
		p.setEstado(est);
		p.setCodigo(cdo);    	
		p.setImagen(imgBytes);
		
		
		int value = pdao.updateProducto(p);;
		
		if (value == 1) {
			getProductos(request,response);
		}else {
			request.setAttribute("mensaje", "Error al Actualizar ");
			request.getRequestDispatcher("Producto.jsp").forward(request, response);
		}
	}
	private void getProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Producto> lista = pdao.listProducto();              
        if (lista != null) {
            request.setAttribute("productos", lista);
    		request.getRequestDispatcher("Producto.jsp").forward(request, response);  		
        } else {
            request.setAttribute("mensaje", "Error al listar");
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        }
		
	}
	private void getProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");
	    Producto p = pdao.getProducto(Integer.parseInt(code));
	    
	    if (p != null) {
	        request.setAttribute("producto", p);
	        getProductos(request, response);
	    } else {
	        request.setAttribute("mensaje", "Error al obtener producto");
	        request.getRequestDispatcher("Producto.jsp").forward(request, response);
	    }	
	}
	private void deleteProducto(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
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
