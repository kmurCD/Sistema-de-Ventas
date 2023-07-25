<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.List"%>
     <%@ page import="java.io.*, java.util.*" %>
    <%@page import="Modelo.Cliente"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CLIENTES</title>
</head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<body>

			
			
<div class="container-fuid m-4">
	<h3>Módulo Clientes</h3>
	<div class="row">
		<div class="col-6 col-sm-3">
			<form name="formCliente" action="ClienteS" method="post">
					<div class="form-group" style="display: none;" >
					<label>Id</label>
						<input type="text" name="txtId" class="form-control" value="${cliente.getId()}"></div>								
					<div class="form-group">
					<label>Codigo</label>
						<input type="text" name="txtCodigo" class="form-control" value="${cliente.getCodigo()}"
						 pattern= "[0-9]+" maxlength="5" title="Por favor, ingrese solo números, maximo 5 caracteres(sin guiones ni espacios)" required></div>			
					<div class="form-group">
					<label>Dni</label>
						<input type="text" name="txtDni" class="form-control"value="${cliente.getDni()}"
						pattern= "[0-9]+" maxlength="8" title="Por favor, ingrese solo números, maximo 10 caracteres (sin guiones ni espacios)" required></div>
					<div class="form-group">
					<label>Nombres</label>
						<input type="text" name="txtNombres" class="form-control"value="${cliente.getNom()}"
						pattern="[A-Za-z ]+" maxlength="20"title="Por favor, ingrese solo letras y espacios" required></div>
						<div class="form-group">
					<label>Direccion</label>
						<input type="text" name="txtDireccion" class="form-control"value="${cliente.getDir()}"
						pattern="[A-Za-z0-9\s,.-]+" maxlength="20" title="Por favor, ingrese una dirección válida (solo letras, números, espacios, comas, puntos y guiones)" required></div>
						<div class="form-group">
					<label>Estado</label>
						<input type="text" name="txtEstado" class="form-control"value="${cliente.getEstado()}"
						pattern= "[0-1]" maxlength="1" title="Por favor, ingrese solo 1 o 0 (sin guiones ni espacios)" required></div>				
					<br>
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
					<a href="ClienteS?menu=limpiar"  class="btn btn-secondary text-white">Nuevo</a>
					 <input type="submit" name="menu" value="Enviar Datos" class="btn btn-info text-white">					 					 					
					</div>					

			</form>
		</div>
	

		<div class= "col-6 col-sm-9">
			<table class="table table-hover text-center" >					
				<thead>
				<tr>
					<th>ID</th>
					<th>CODIGO</th>
					<th>DNI</th>
					<th>NOMBRES</th>
					<th>DIRECCIÓN</th>
					<th>ESTADO</th>
					<th>ACCIONES</th>											
				</tr>
				</thead>
				<tbody>
				     <% 
                    List<Cliente> listCli = (List<Cliente>)request.getAttribute("clientes");             
                    if (listCli != null) {
                        for (Cliente c : listCli) {                                    
                    %>
				    <tr>
				    	<td><%= c.getId() %></td>
				    	<td><%= c.getCodigo() %></td>
                        <td><%= c.getDni() %></td>
                        <td><%= c.getNom() %></td>
                        <td><%= c.getDir() %></td>
                        <td><%= c.getEstado()%></td>                        
				        <td>
				            <a href="ClienteS?menu=Editar&code=<%= c.getId() %>" class="bi bi-pencil-square" style="color: #0dcaf0;"></a>
				            <a href="ClienteS?menu=Eliminar&code=<%= c.getId() %>" class="bi bi-trash3-fill" style="color: #0dcaf0;"></a>
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