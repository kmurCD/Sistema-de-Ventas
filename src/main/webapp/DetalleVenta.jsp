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

 <div class="container-fluid d-flex justify-content-center align-items-center ">
 
	<div class="d-flex flex-column">
  	<div class="col-12 m-4">
  		<div class="card ">
  		<form action="VentaS" method="post">
  			<div class="card-body">
  				<div class="form-group d-flex mb-2 justify-content-between">
	  					<div class="col-sm-7">
	  					<h3>CiberTech </h3>
	  					<h6>Ruc 20552103816</h6>
	  					<label>Datos del cliente</label>
	  					</div>
	  					
	  					<div class="col-sm-4 d-flex justify-content-between align-items-center">
	  					<div class="col-sm-3">
							<label >Vendedor</label> 
						</div>	 
		  					<div class="col-sm-9 text-center">
		  					<label style="color: blue;">${usuario.getNom()} </label>
		  						
		  					</div>
	  					</div>
	  					
  					</div>
  					
  				<div class="form-group d-flex mb-2 align-items-center justify-content-between">
  					<div class="col-sm-3 d-flex   align-items-center">
  					<div class="col-sm-3">
						<label>DNI</label> 
						</div>	 					
						<div class="text-center" >
						<label style="color: red;">${cliente.getDni()} </label>
							
						</div >					
					</div>
					
  					<div class="col-sm-4 d-flex align-items-center">
  					<div  class="col-sm-3">
						<label >Direccion</label> 
						</div>	 						 				
  					<div class="col-sm-9 text-center">
  					<label style="color: red;">${cliente.getDir()}</label> 						
  					</div>
  					</div>
  					
  					<div class="col-sm-4 d-flex align-items-center">
  					<div class="col-sm-3">
						<label>Nombre</label> 
						</div>	
  					<div class="col-sm-9 text-center">
  					<label style="color: red;">${cliente.getNom()}</label> 						
  					</div>	
  					</div>
  				</div>					
  				</div>
  			</form>
  		</div>
  	</div>
  		<div class="col-12 m-4">
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
								</tr>
							  <% 
                               }
                               }
                               %>  							    		  
							</tbody>	
						 </table>
	  				</div>
	  							
								<div class="col-sm-12 d-flex text-end justify-content-end">
								
								<div class="justify-content-end col-sm-4">
								<input type="text" name="txtTotal" value="s/.${totalPagar}" class="form-control bg-light " readonly>
								</div>																	
		  							
		  						</div >
	  						
	  						
	  					</div>
	  					</div >
	  					<div class="col-sm-12 d-flex mt-2 justify-content-end" >
	  					<div class="col-sm-3 d-flex justify-content-end">
	  						<button type="button" class="btn btn-secondary w-20" onclick="print()">Imprimir</button>
	  						</div>
	  					
	  					</div>
	  						
  				</div>
  				
  				
  				</div>
  			</div>	

</body>
</html>