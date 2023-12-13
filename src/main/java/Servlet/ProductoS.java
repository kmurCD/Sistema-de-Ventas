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
import java.sql.SQLException;
import java.util.List;
import Factory.DAOFactory;
import Interface.ProductoInterface;
import Interface.VentaInterface;
import Modelo.Producto;
import Modelo.Venta;

@WebServlet(name = "ProductoS", urlPatterns = {"/ProductoS"})
@MultipartConfig
public class ProductoS extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoInterface pdao = daoFactory.getProducto();
		VentaInterface vdao = daoFactory.getVenta();
		Producto p = new Producto();
    public ProductoS() {
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
				updateProducto (request,response);}
			else{
				addProducto (request, response);}break;										
			case "Editar":
				getProducto(request, response); break;			
			case "Eliminar":
				deleteProducto(request, response); break;
			case "listarAdmin":
				getProdAdmin(request, response); break;
			case "listVendedor":
				getProdVendedor(request, response); break;
			case "Filtro":
				getFiltroVendedor(request, response); break;			
			case "FiltroAdmin":
				getFiltroAdmin(request, response); break;
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
		        getProdAdmin(request, response);    			
		    } catch (NumberFormatException e) {
		        System.out.println("Error agregar Producto");
		    }
		} else {    	
		    System.out.println("Casilla Codigo vacia");
		    getProdAdmin(request, response); 
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
		    System.out.println("Bytes de imagen desde el archivo: " + imgBytes.length);
		    
		    
		} else {
			
			Producto img= pdao.getProducto( id,Integer.parseInt(cdo));
			int cpo =img.getId();
			int cdgo =(id);
			
			if ( cpo == cdgo) {
				byte[] existingImgBytes = img.getImagen();
			    p.setImagen(existingImgBytes);			  
			}else {
				request.setAttribute("error", "No se puede actualizar el producto.");
				getProdAdmin(request,response);
			}
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
			getProdAdmin(request,response);    			
		}else {    	
			System.out.println("Error agregar producto");
			request.getRequestDispatcher("Producto.jsp").forward(request, response);
		} 
	}

	private void getProdAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    ServletContext context = getServletContext();	  
	    List<Producto> lista = pdao.listProducto(context);

	    if (lista != null) {
	        request.setAttribute("productos", lista);
	        request.getRequestDispatcher("ProductoAdmin.jsp").forward(request, response);
	    } else {
	    	System.out.println("Error al encontrar producto");
	        request.setAttribute("mensaje", "Error al listar");
	        request.getRequestDispatcher("ProductoAdmin.jsp").forward(request, response);
	    }
	}
		
	private void getProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = getServletContext();
		String code = request.getParameter("code");
	    Producto p = pdao.getProducto(0,Integer.parseInt(code));	  
	    List<Producto> lista = pdao.listFiltro(context, code );
	    
	    if (p != null) {
	        request.setAttribute("producto", p);
	        request.setAttribute("productos", lista);
	        request.getRequestDispatcher("ProductoAdmin.jsp").forward(request, response);
	    } else {
	        request.setAttribute("mensaje", "Error al obtener producto");
	        request.getRequestDispatcher("ProductoAdmin.jsp").forward(request, response);
	    }	
	}
	private void deleteProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int code = Integer.parseInt(request.getParameter("code"));	    
	     Venta ven = vdao.ValidarProductoEnUso(code);
	     
	     if ( ven != null) {				 
	    	 int IdProducto = ven.getIdproducto(); 		    	
	    	 if ( code == IdProducto) {
	    		 request.setAttribute("error", "No se puede eliminar el Producto. Está siendo utilizado en una boleta.");			 
	    		 getProdAdmin(request, response);
		     }else {
		    	 request.setAttribute("error", "No se pudo validar el Producto.");
		    	 getProdAdmin(request, response);
		     }
	     }else {
	    	 int value = pdao.deleteProducto(code);
				if (value == 1) {
				    request.setAttribute("mensaje", "Producto eliminado");
				    getProdAdmin(request, response);
				} else {
				    request.setAttribute("error", "Error al eliminar el Producto");
				    getProdAdmin(request, response);				   
				}
	     } 

	}

	private void getProdVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    ServletContext context = getServletContext();
	    List<Producto> lista = pdao.listProducto(context);
	    if (lista != null) {
	        request.setAttribute("productos", lista);	      
	        request.getRequestDispatcher("ProductoVendedor.jsp").forward(request, response);
	    } else {
	        request.setAttribute("mensaje", "Error al listar");
	        request.getRequestDispatcher("ProductoVendedor.jsp").forward(request, response);
	    }
	}	
	private void limpiarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Producto p = new Producto () ;
		request.setAttribute("produto", p);
		getProdAdmin(request, response);
		
	}
	private void getFiltroVendedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		String b = request.getParameter("txtBuscar");
	    if (b != null && !b.isEmpty()) {	 
	    	ServletContext context = getServletContext();
	        List<Producto> lista = pdao.listFiltro(context, b );

	        if (lista != null) {
	            request.setAttribute("productos", lista);
	            request.getRequestDispatcher("ProductoVendedor.jsp").forward(request, response);
	        } else {
	            request.setAttribute("mensaje", "Error al listar");
	        }
	    } else {	    	
	        request.setAttribute("error", "Ingrese un código o nombre para buscar.");
	        getProdVendedor(request, response);
	    }
	}
	
	private void getFiltroAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		String b = request.getParameter("txtBuscar");
	    if (b != null && !b.isEmpty()) {	 
	    	ServletContext context = getServletContext();
	        List<Producto> lista = pdao.listFiltro(context, b );

	        if (lista != null) {
	            request.setAttribute("productos", lista);
	            request.getRequestDispatcher("ProductoAdmin.jsp").forward(request, response);
	        } else {
	        	System.out.println("No se encuentra el producto");
	            request.setAttribute("error", "Error al listar");
	        }
	    } else {	    	
	        request.setAttribute("error", "Ingrese un código o nombre para buscar.");
	        getProdAdmin(request, response);
	    }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
