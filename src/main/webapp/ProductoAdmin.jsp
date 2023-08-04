<%@page import="Modelo.Producto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Productos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

</head>
<body>


<div class="container-fuid m-4">
	<div class="d-flex justify-content-between">
		<h3>Registrar Producto</h3>		
		<form action="ProductoS" method="post">
				    <div class="form-group d-flex ">				       
				        <div class="">				        			           
					        </div>
					        <div class=" d-flex ">
					            <input type="text" name="txtBuscar" class="form-control m-1" placeholder=" Ingrese codigo o nombre">
					            <button type="submit" name="menu" value="FiltroAdmin" class="btn btn-outline-info m-1">Buscar</button>
				       	 </div>			       	  
				    </div>				
				</form>	
			</div>			
		<div class="row">
			<div class="col-6 col-sm-3">
				<form action="ProductoS" method="post" enctype="multipart/form-data" name="formProducto">
					<div class="form-group" style="display: none;" >
					<label>ID</label>
					<input class="form-control" type="text"  name="txtId"  value="${producto.getId()}"/>
						</div>
					<div class="form-group">		
						<label>Codigo</label> <input class="form-control" type="text"
							name="txtCodigo" value="${producto.getCodigo()}"
							pattern= "[0-9]+" maxlength="5" title="Por favor, ingrese solo n�meros, maximo 5 caracteres(sin guiones ni espacios)" required/>
					</div>
					<div class="form-group">
						<label>Nombre</label> <input class="form-control" type="text"
							name="txtNombre" value="${producto.getNombre()}"
							pattern="[A-Za-z][A-Za-z0-9 ]*" maxlength="20"title="Por favor, ingrese solo letras o numeros " required/>
					</div>
					<div class="form-group">
						<label>Precio</label> <input class="form-control" type="text"
							name="txtPrecio" value="${producto.getPrecio()}" placeholder="S/.0.00" 
							pattern="[0-9]+(\.[0-9]+)?" step="any" title="Por favor, ingrese solo n�meros decimales (p. ej. 10 o 10.5)"  maxlength="6" required/>
					</div>
					<div class="form-group">
						<label>Estado</label> <input class="form-control" type="text"
							name="txtEstado" value="${producto.getEstado()}" pattern= "[0-1]" maxlength="1" title="Por favor, ingrese solo 1 o 0 (sin guiones ni espacios)" required/>
					</div>
					<div class="form-group">
						<label>Cantidad</label> <input class="form-control" type="text"
							name="txtStock" value="${producto.getStock()}" placeholder="Stock"
							pattern= "[0-9]+" maxlength="3" title="Por favor, ingrese solo n�meros, maximo 3 caracteres(sin guiones ni espacios)" required/>
					</div>
					<div class="form-group">
				    <label></label><br>
				    <div>
				        <input class="form-control" type="file" name="txtImagen"  value=""/>				        
				    </div>
					</div><br>				
					
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
					<div class="form-group my-3 text-end">
					 <a href="ProductoS?menu=limpiar"  class="btn btn-secondary text-white">Nuevo</a>
					 <input type="submit" name="menu" value="Enviar Datos" class="btn btn-info text-white">					 									
					</div>
				</form>
			</div>
			<div class="col-6 col-sm-9">				
				<table class="table text-center">
					<thead>
						<tr>
							<th>Id</th>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Catidad</th>
							<th>Estado</th>
							<th>Imagen</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Producto> producto = (List<Producto>) request.getAttribute("productos");
						if (producto != null) {
							
							for (Producto p : producto)
							{
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getCodigo()%></td>
							<td><%=p.getNombre()%></td>
							<td>S/.<%=p.getPrecio()%></td>
							<td><%=p.getStock() %></td>
							<td><%=p.getEstado()%></td>														
							<td><img width="40px" height="40px" alt="Product Image" src="data:image/jpeg;base64,<%= p.getBase64() %>"></td>
							<td>
                           <a href="ProductoS?menu=Editar&code=<%= p.getId() %>" class="bi bi-pencil-square" style="color: #0dcaf0;"></a>
                           <a href="ProductoS?menu=Eliminar&code=<%= p.getId() %>"class="bi bi-trash3-fill" style="color: #0dcaf0;"></a>
							</td>
						</tr>
						<%
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>