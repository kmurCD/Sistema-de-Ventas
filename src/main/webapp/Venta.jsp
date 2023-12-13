<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Modelo.Venta"%>
     <%@page import="Modelo.Producto"%>
      <%@page import="Modelo.Empleado"%>
     <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Venta</title>
<style>
	@media print {
	@page {
        size: A4 landscape; /* Tamaño A4 en orientación horizontal */
        margin: 1cm; /* Márgenes de 1cm en todos los lados */
    }
    .part1, .accion, .btn {
        display: none !important;
    }
}

</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<body>
<div class="container-fuid m-4 ">
 <h3>Módulo Ventas</h3>
  <div class="row  ">
  	<div class="col-sm-4 part1">
  		<div class="card ">
  		<form action="VentaS" method="post">
  			<div class="card-body">
  				<div class="form-group d-flex mb-2">
	  					<div class="col-sm-8">
	  					<label>Datos del cliente</label>
	  					</div>
	  					<div class="col-sm-4">
	  					<input type="text" name="nomEmpleado" class="form-control bg-light text-black" placeholder="Usuario" value="${usuario.getUser()}" readonly>
	  					</div>
  					</div>
  					
  				<div class="form-group d-flex mb-2">
  					<div class="col-sm-6 d-flex  justify-content-between"> 					
						<div class="col-sm-5">
							<input type="text" name="DNICliente" class="form-control" placeholder="DNI" value="${cliente.getDni()}" >
						</div  >
						<div class="col-sm-6">						
							 <button type="submit" name="menu" value="BuscarCliente" class="btn btn-outline-secondary">Buscar</button>
						</div>
					</div>	 						 				
  					<div class="col-sm-6">
  						<input type="text" name="nomCliente" class="form-control  bg-light text-black" placeholder="Cliente" value="${cliente.getNom()}"readonly>
  					</div>	
  				</div>					
  					
  					
  				<div class="form-group mb-2">
  				<label>Datos del Producto</label>
  				</div>		
  				
  				<div class="form-group d-flex mb-2">
  					<div class="col-sm-6 d-flex justify-content-between">
		  					<div class="col-sm-5">
		  						<input type="text" name="cdoProducto"  value="${producto.getCodigo()}" class="form-control" placeholder="Codigo" >
		  					</div>		  					
		  					<div class="col-sm-6">		  						
		  						 <button type="submit" name="menu" value="BuscarProducto" class="btn btn-outline-secondary">Buscar</button>
		  					</div>
  						</div> 					  								
  					<div class="col-sm-6">
  						<input type="text" name="nomProducto" class="form-control bg-light text-black" placeholder="Producto" value="${producto.getNombre()}" readonly>
  					</div>   				 				
  				</div>				
  					<div class="form-group d-flex justify-content-between mb-2">
  					<div class="col-sm-5">
  					<div class="col-sm-6">
  					<input type="text" name="stock" class="form-control bg-light  text-black" value="${producto.getStock()}" placeholder="Stock" readonly>
  					</div>
		  					
		  					</div>
  					
  					  						 												
  					
	  					<div class="col-sm-6 d-flex justify-content-between">
		  					<div class="col-sm-5">
		  					<input type="number" name="cant" class="form-control  text-black" value="1" placeholder="" >
		  					</div>  
		  					
		  					<div class="col-sm-5">
		  					<input type="text" name="precio" class="form-control bg-light" value="${producto.getPrecio()}" placeholder="S/.0.00" readonly>
		  					</div> 						  																		  					
		  					
		  					
	  					</div> 
  					</div>
  					
  					<div class="form-group d-flex justify-content-end mb-2" >
	  					<div>
	  						<input type="submit" name="menu" value="Agregar" class="btn btn-secondary">
	  					</div>					
  					</div>
  					<div>
  							<% 
						    String errorMessage = (String) request.getAttribute("error");
						    if (errorMessage != null && !errorMessage.isEmpty()) { 
						    	
						%>
						    <div class="alert alert-primary d-flex align-items-center" role="alert">
						  	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Warning:">
						    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
						  	</svg>
						  <div>
						  		 <%= errorMessage %>
						  </div></div>
						<%        
						}
						%>
						<% 
						    String ConfirrMessage = (String) request.getAttribute("mensaje");
						    if (ConfirrMessage != null && !ConfirrMessage.isEmpty()) { 
						    	
						%>
						 <div class="alert alert-success d-flex align-items-center" role="alert">
						 <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
						  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
						  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
						  </symbol></svg>
						  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
						  <div>
						   		 <%= ConfirrMessage %>
						  </div></div>
						<%        
						}
						%>
  					</div>
  							
  				</div>
  			</form>
  		</div>
  	</div>
  		<div class="col-sm-8">
  			<div class="card">
  				<div class="card-body">
  					<div class="d-flex">
  					<div class=" col-sm-8"></div>	   								
					  <div class=" col-sm-4 d-flex">
					    <label>NRO SERIE</label>
					    <input type="text" name="NroSerie" value="${nserie}" class="form-control bg-light" readonly>				 
					</div>					
					</div>
					<br>
	  				<div>
	  					<table class="table table-hover text-center" id="tabla-container" >					
							<thead>
							<tr>
								<th>NRO</th>
								<th>CODIGO</th>
								<th>DESCRIPCION</th>								
								<th>PRECIO</th>
								<th>CANTIDAD</th>
								<th>SUBTOTAL</th>
								<th class="accion">ACCIONES</th>											
							</tr>
							</thead>
							<tbody>
							<% List<Venta> lista = (List<Venta>) request.getAttribute("listaVenta");
            				   if (lista != null) {
               				   int item = 1;
             				   for (Venta venta : lista) {
        					%>
							    <tr>
								<td><%= item++ %></td>
								<td><%= venta.getIdproducto() %></td>
								<td><%= venta.getCodigoP()%></td>
                        		<td><%= venta.getDescripcionP() %></td>
                       			<td><%= venta.getPrecio() %></td>
                        		<td><%= venta.getCantidad() %></td>
                        		<td><%= venta.getSubtotal() %></td> 
								<td>
									<a href="VentaS?menu=EliminarProducto&codigo=<%= venta.getCodigoP()%>" class="accion bi bi-trash3-fill" style="color: #dc3545;"></a>
								</td>
								</tr>
							  <% 
                               }
                               }
                               %>  							    		  
							</tbody>	
						 </table>
	  				</div>
	  				<div class="card-footer"></div>
	  					<div class="d-flex">
	  						<div class="accion col-sm-6 d-flex ml-2">
	  						<div  class="col-sm-3">
	  						 	<a href="VentaS?menu=GenerarVenta" class="btn btn-success " > Generar Venta</a>
	  						</div>	  					
	  						<div class="col-sm-4"> 
	  							 <a href="VentaS?menu=CancelarVenta" class="btn btn-danger ml-2 " > Cancelar</a> 						
	  						</div>
									
																					
							</div>
							<div class="col-sm-6 d-flex justify-content-end">
								<div class="col-sm-9"></div>
								<div class="col-sm-3">
		  							<input type="text" name="txtTotal" value="s/.${totalPagar}" class="form-control bg-light " readonly>
		  						</div>
	  						</div>
	  					</div>
  				</div>
  			</div>	
  		</div>
 	 </div> 
   </div>
</body>
</html>