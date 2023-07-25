<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.List"%>
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
	<h1>Módulo Clientes</h1>
	<div class="row">
		<div class="col-6 col-sm-4">
			<form action="ClienteS" method="post">
					<div class="form-group" >
					<label>Id</label>
						<input type="text" name="txtId" class="form-control" value="${cliente.getId()}"></div>			
					<div class="form-group">
					<label>Codigo</label>
						<input type="text" name="txtCodigo" class="form-control" value="${cliente.getCodigo()}"></div>			
					<div class="form-group">
					<label>Dni</label>
						<input type="text" name="txtDni" class="form-control"value="${cliente.getDni()}"></div>
					<div class="form-group">
					<label>Nombres</label>
						<input type="text" name="txtNombres" class="form-control"value="${cliente.getNom()}"></div>
						<div class="form-group">
					<label>Direccion</label>
						<input type="text" name="txtDireccion" class="form-control"value="${cliente.getDir()}"></div>
						<div class="form-group">
					<label>Estado</label>
						<input type="text" name="txtEstado" class="form-control"value="${cliente.getEstado()}"></div>				
					
					<div class="form-group my-3 text-center">
					 <input type="submit" name="menu" value="Agregar" class="btn btn-info text-white">
					 <input type="submit" name="menu" value="Actualizar" class="btn btn-info text-white">					
					</div>					

			</form>
		</div>
	

		<div class= "col-6 col-sm-8">
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