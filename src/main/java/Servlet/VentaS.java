package Servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Factory.DAOFactory;
import Interface.ClienteInterface;
import Interface.ProductoInterface;
import Interface.VentaInterface;
import Modelo.Cliente;
import Modelo.Empleado;
import Modelo.Producto;
import Modelo.Venta;




@WebServlet(name = "VentaS", urlPatterns = {"/VentaS"})

public class VentaS extends HttpServlet {
	private static final long serialVersionUID = 1L;
		DAOFactory daoFactory = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		VentaInterface vdao = daoFactory.getVenta();
		ClienteInterface cdao = daoFactory.getCliente();
		ProductoInterface pdao = daoFactory.getProducto();
		Producto p = new Producto();	
		Cliente cli = new Cliente();
		Empleado e = new Empleado();
		List<Venta>lista=new ArrayList<>();	
		Venta v = new Venta();
		String numeroserie;
		double Monto= 0.0;
		int i;
	
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
				HttpSession session = request.getSession();
				Empleado empleado = (Empleado) session.getAttribute("usuario");
				e = empleado ;							
				request.setAttribute("usuario", e);				
				GenerarSerie(request, response);					
				request.getRequestDispatcher("Venta.jsp").forward(request, response);
				break;			 		
			case "BuscarCliente":
				getBuscarCliente(request, response); break;
			case "BuscarProducto":
				getBuscarProducto(request, response); break;
			case "GenerarVenta":
				request.setAttribute("totalPagar", Monto);
				getGuardarVenta(request, response); break;
			case "Agregar":
				getAgregarVenta(request, response); break;
			case "EliminarProducto":
				getEliminarP(request, response); break;
			case "CancelarVenta":
				reiniciarVariables(request); 
				request.getRequestDispatcher("Venta.jsp").forward(request, response);
				break;
				
			default:	
				
				
				break;
			}
	}

	private void getEliminarP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String CodigoProducto = request.getParameter("codigo");

		   if (CodigoProducto != null && !CodigoProducto.isEmpty()) {	            
		        Venta ventaAEliminar = null;
		        for (Venta venta : lista) {
		            if (venta.getCodigoP().equals(CodigoProducto)) {
		                ventaAEliminar = venta;
		                break;
		            }
		        }
		        
		        if (ventaAEliminar != null) {
		            lista.remove(ventaAEliminar);

		            double totalPagar = 0.0;
		            for (Venta venta : lista) {
		                totalPagar += venta.getSubtotal();
		            }

	            Monto = totalPagar;

	            request.setAttribute("cliente", cli);
	            request.setAttribute("totalPagar", totalPagar);
	            getAtributos(request);

	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        }
		  }
	}

	private void getAgregarVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int item = 0;
	    item = item + 1;
	    Double totalPagar = 0.0;

	    String CodProduct = request.getParameter("cdoProducto");
	    String precioStr = request.getParameter("precio");
	    String cantStr = request.getParameter("cant");
	    String NombreP = request.getParameter("nomProducto");
	    if (CodProduct != null && !CodProduct.isEmpty() &&
	        precioStr != null && !precioStr.isEmpty() &&
	        cantStr != null && !cantStr.isEmpty()) {

	        double precio = Double.parseDouble(precioStr);
	        int cant = Integer.parseInt(cantStr);

	        if (cant > 0) {
	            double PrecioCant = precio * cant;
	            Producto p = pdao.getProducto(0,Integer.parseInt(CodProduct));

	            Venta v = new Venta();

	            v.setItem(item);
	            v.setIdproducto(p.getId());
	            v.setDescripcionP(p.getNombre());
	            v.setPrecio(p.getPrecio());
	            v.setCantidad(cant);
	            v.setSubtotal(PrecioCant);
	            v.setCodigoP(CodProduct);
	            lista.add(v);

	            for (Venta venta : lista) {
	                totalPagar += venta.getSubtotal();	            
	            }

	            Monto = totalPagar;

	            request.setAttribute("cliente", cli);
	            request.setAttribute("totalPagar", totalPagar);
	            getAtributos(request);

	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        } else {

	            request.setAttribute("totalPagar", totalPagar);
	            getAtributos(request);
	            request.setAttribute("error", "La cantidad debe ser un número positivo");
	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        }
	    } else {	    	
            request.setAttribute("totalPagar", totalPagar);
            getAtributos(request);
	        request.setAttribute("error", "Los campos no pueden estar vacíos");
	        request.getRequestDispatcher("Venta.jsp").forward(request, response);
	    }
	}


	private void GenerarSerie(HttpServletRequest request, HttpServletResponse response) {
	     numeroserie = vdao.GenerarSerie();
	    
	    if (numeroserie == null) { 
	        numeroserie = "000000001";
	    } else {	    
	        
	        int incrementar = Integer.parseInt(numeroserie) + 1;	      
	        numeroserie = String.format("%08d", incrementar);
	    }
	    
	    request.setAttribute("nserie", numeroserie);
	}
	private void getUpdateStock() {
		
		for (Venta venta : lista) {		
		    Producto p = pdao.getProducto(0,Integer.parseInt(venta.getCodigoP()));
		    
		    if (p != null) {
		        int cantidadVenta = venta.getCantidad();
		        
		        if (p.getStock() >= cantidadVenta) {
		            p.setStock(p.getStock() - cantidadVenta);	            
		            pdao.updateStock(p);
		        } else {
		        	System.out.println("Objeto Stock menor que 0");
		        }
		    } else {
		    	System.out.println("Objeto Producto Vacio");
		    }
		}
	}

	private void getBuscarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		String code = request.getParameter("DNICliente");

	    if (code != null && !code.isEmpty()) {
	        cli = cdao.getCliente(Integer.parseInt(code));
	        
	        if (cli != null) {
	            request.setAttribute("cliente", cli);
	            getAtributos(request);
	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        } else {
	        	
	        	getAtributos(request);
	            request.setAttribute("error", "Cliente no encontrado");
	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        }
	    } else {
	    	
	    	getAtributos(request);
	        request.setAttribute("error", "Código de cliente inválido");
	        request.getRequestDispatcher("Venta.jsp").forward(request, response);
	    }
	}
	private void getBuscarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("cdoProducto");
		
		if(code !=null && !code.isEmpty()) {
			Producto p = pdao.getProducto(0,Integer.parseInt(code));	
			
			 if (p != null) {				 
			    	request.setAttribute("cliente", cli);
			        request.setAttribute("producto", p);
			        getBuscarCliente(request, response);
			    } else {
			    	request.setAttribute("cliente", cli);
			    	getAtributos(request);
			    	request.setAttribute("mensaje", "Error al obtener producto");
			    	request.getRequestDispatcher("Venta.jsp").forward(request, response);
			    }				
		}else {
				request.setAttribute("cliente", cli);
				getAtributos(request);
		        request.setAttribute("error", "Código de producto inválido");
		        request.getRequestDispatcher("Venta.jsp").forward(request, response);			
		}   
	}
	
	private void getGuardarVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    try {
	    	java.util.Date utilDate = new java.util.Date();
		    java.sql.Date fechaActual = new java.sql.Date(utilDate.getTime()); 
		    
		    Venta v = new Venta();
		    
	        v.setIdcliente(cli.getId());
	        v.setIdempleado(e.getId());
	        v.setNumserie(numeroserie);
	        v.setFecha(fechaActual);
	        v.setMonto(Monto);
	        v.setEstado("1");

	        if (validarVenta(v)) {
	            vdao.guardarVenta(v);
	            System.out.println("Se agregaron datos de venta");

	            String idVentasStr = vdao.IdVentas();

	            if (!idVentasStr.isEmpty()) {
	                int idv = Integer.parseInt(idVentasStr);
	                for (int i = 0; i < lista.size(); i++) {
	                	v = new Venta();
	                	v.setId(idv);
	                	v.setIdproducto(lista.get(i).getIdproducto());
	                	v.setCantidad(lista.get(i).getCantidad());
	                	v.setPrecio(lista.get(i).getPrecio());
	                }
	                    if (validarDetalleVenta(v)) {
	                        vdao.guardarDetalleVenta(v);
	                        request.setAttribute("cliente", cli);
	                        getAtributos(request);
	                        request.setAttribute("mensaje", "Se genero una venta");
	                        request.getRequestDispatcher("DetalleVenta.jsp").forward(request, response);
	                    } else {
	                    	getAtributos(request);
	                        request.setAttribute("error", "No se obtuvo ID, cantidad o precio del Producto");
	                        request.getRequestDispatcher("Venta.jsp").forward(request, response);
	                        return;
	                    }
	                
	            } else {
	            	getAtributos(request);
	                request.setAttribute("error", "No se obtuvo un registro de venta anterior");
	                request.getRequestDispatcher("Venta.jsp").forward(request, response);
	                return; 
	            }
	        } else {
	        	getAtributos(request);
	            request.setAttribute("error", " Datos incompletos para generar venta");
	            request.getRequestDispatcher("Venta.jsp").forward(request, response);
	            return; 
	        }
	        getUpdateStock();
	        reiniciarVariables(request);	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Error en el proceso de venta");
	        getAtributos(request);
	        request.getRequestDispatcher("Venta.jsp").forward(request, response);
	        	        
	    }
	}
	private void getAtributos (HttpServletRequest request) throws ServletException, IOException {		
		request.setAttribute("listaVenta", lista);
        request.setAttribute("nserie", numeroserie);
        request.setAttribute("usuario", e);
        
	}
	
	private boolean validarDetalleVenta(Venta ve) {
		if (ve.getIdproducto() == null) {
	        return false;
	    }
	    if (ve.getCantidad() <= 0) {
	        return false;
	    }
	    if (ve.getPrecio() <= 0) {	  
	        return false;
	    }
	    return true;
	}
	
	private boolean validarVenta(Venta v) {
	    if (v.getIdcliente() == null) {
	        return false;
	    }
	    if (v.getIdempleado() == null) {
	        return false;
	    }
	    if (v.getNumserie() == null || v.getNumserie().isEmpty()) {
	        return false;
	    }
	    if (v.getFecha() == null) {
	        return false;
	    }
	    if (v.getMonto() == null || v.getMonto() <= 0) {
	        return false;
	    }
	    if (v.getEstado() == null || v.getEstado().isEmpty()) {
	        return false;
	    }
	    return true;
	}
	
	private void reiniciarVariables(HttpServletRequest request) throws ServletException, IOException {			
			p = new Producto();
	        cli = new Cliente();
	        lista = new ArrayList<>();
	        v = new Venta();
	        Monto = 0.0;
	        i = 0;
	        getAtributos(request);
	        
	    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public static void main(String[] args) {
		
	}

}
