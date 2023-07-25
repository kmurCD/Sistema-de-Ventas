package Servlet;

import jakarta.servlet.ServletContext;
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
import Modelo.Producto;
import Servicio.ProductoServicio;

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
		 	case "Enviar Datos":
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
			case "listar2":
				getProductos2(request, response); break;
			case "limpiar":
				limpiarProducto(request, response); break;					
			default:
				break;
			}
	
	}
	private void addProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String nom = request.getParameter("txtNombre");
		String cdo= request.getParameter("txtCodigo");
		String pre =request.getParameter("txtPrecio");		
		String est= request.getParameter("txtEstado");
		String stk= request.getParameter("txtStock");
		Part filePart = request.getPart("txtImagen");
		
        InputStream fileContent = filePart.getInputStream();
        byte[] imgBytes = fileContent.readAllBytes();

		  
		
		if (!cdo.isEmpty()) {
		    try {
		    	p.setCodigo(Integer.parseInt(cdo));	
		    	p.setPrecio(Double.parseDouble(pre));
				p.setStock(Integer.parseInt(stk));
				p.setNombre(nom);		
				p.setEstado(est);		   	
				p.setImagen(imgBytes);
				
		        pdao.addProducto(p);
		        
		        request.setAttribute("mensaje", "Producto agregado con éxito.");
		        getProductos(request, response);    			
		    } catch (NumberFormatException e) {
		        System.out.println("Error agregar Producto");
		    }
		} else {    	
		    System.out.println("Casilla Codigo vacia");
		    getProductos(request, response); 
		}   		
		
	}
	private void updateProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt (request.getParameter("txtId"));		
		String nom = request.getParameter("txtNombre");
		Double pre = Double.parseDouble(request.getParameter("txtPrecio"));
		int stk = Integer.parseInt(request.getParameter("txtStock"));
		String est= request.getParameter("txtEstado");
		String cdo= request.getParameter("txtCodigo");		
		
		Part filePart = request.getPart("txtImagen");
        
		if (filePart.getSize() > 0) {
		    InputStream fileContent = filePart.getInputStream();
		    byte[] imgBytes = fileContent.readAllBytes();
		    p.setImagen(imgBytes);
		}
		
		p.setId((id));		
		p.setNombre(nom);
		p.setPrecio(pre);
		p.setStock(stk);
		p.setEstado(est);	   			
		p.setCodigo(Integer.parseInt(cdo));
		
		
		int value = pdao.updateProducto(p);
		
		if (value == 1) {
			request.setAttribute("mensaje", "Producto Actualizado con éxito.");
			getProductos(request,response);    			
		}else {    	
			System.out.println("Error agregar producto");
			request.getRequestDispatcher("Producto.jsp").forward(request, response);
		} 
	}
	private void getProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    ServletContext context = getServletContext();
	    ProductoServicio productoServicio = new ProductoServicio();
	    List<Producto> lista = productoServicio.listProducto(context);

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
	private void deleteProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt (request.getParameter("code"));
	    int value = pdao.deleteProducto(code);		    
	    
	    if (value == 1) {
	    	request.setAttribute("mensaje", "Producto eliminado");
	    	getProductos(request, response);		        
	    } else {
	        request.setAttribute("mensaje", "Error al eliminar el producto");
	        request.getRequestDispatcher("Principal.jsp").forward(request, response);
	    }
	}
	private void getProductos2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    ServletContext context = getServletContext();
	    ProductoServicio productoServicio = new ProductoServicio();
	    List<Producto> lista = productoServicio.listProducto(context);
	    if (lista != null) {
	        request.setAttribute("productos", lista);
	        request.getRequestDispatcher("Producto2.jsp").forward(request, response);
	    } else {
	        request.setAttribute("mensaje", "Error al listar");
	        request.getRequestDispatcher("Producto2.jsp").forward(request, response);
	    }
	}	
	private void limpiarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Producto p = new Producto () ;
		request.setAttribute("produto", p);
		getProductos(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
