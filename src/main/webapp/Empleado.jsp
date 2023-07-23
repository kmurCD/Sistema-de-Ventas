<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="Modelo.Empleado"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMPLEADOS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body> 
<div class="container-fuid m-4">
	<h1>Modulo Empleado</h1>
	<div class="row">
		<div class="col-6 col-sm-4">
			<form action="EmpleadoS" method="post">
					<div class="form-group">
					<label>Dni</label>
						<input type="text" name="txtDni" class="form-control" value="${empleado.getDni()}"></div>			
					<div class="form-group">
					<label>Nombres</label>
						<input type="text" name="txtNombres" class="form-control"value="${empleado.getNom()}"></div>
					<div class="form-group">
					<label>Telefono</label>
						<input type="text" name="txtTelefono" class="form-control"value="${empleado.getTel()}"></div>
					<div class="form-group">
					<label>Estado</label>
						<input type="text" name="txtEstado" class="form-control"value="${empleado.getEstado()}">
					</div>
					<div class="form-group">
					<label>Usuario</label>
						<input type="text" name="txtUsuario" class="form-control"value="${empleado.getUser()}">
					</div>
					<div class="form-group my-3 text-center">
					 <input type="submit" name="menu" value="Agregar" class="btn btn-info text-white">
					 <input type="submit" name="menu" value="Agregar" class="btn btn-info text-white">					
					</div>					

			</form>
		</div>

		<div class= "col-6 col-sm-8">
			<table class="table table-hover text-center" >					
				<thead>
				<tr>
					<th>ID</th>
					<th>DNI</th>
					<th>NOMBRES</th>
					<th>TELEFONO</th>
					<th>ESTADO</th>
					<th>USUARIO</th>
					<th>ACCIONES</th>											
				</tr>
				</thead>
				<tbody>
				    <% 
				    List<Empleado> listemp = (List<Empleado>)request.getAttribute("empleados");				
				    if (listemp != null) {
				        for (Empleado em : listemp) {					            	 
				    %>
				    <tr>
				        <td><%= em.getId() %></td>
				        <td><%= em.getDni() %></td>
				        <td><%= em.getNom() %></td>
				        <td><%= em.getTel() %></td>
				        <td><%= em.getEstado()%></td>
				        <td><%= em.getUser() %></td>
				        <td>
				            <a href="EmpleadoS?menu=Editar&code=<%= em.getId() %>" class="bi bi-pencil-square" style="color: #0dcaf0;"></a>
				            <a href="EmpleadoS?menu=Eliminar&code=<%= em.getId() %>"class="bi bi-trash3-fill" style="color: #0dcaf0;"></a>
				            
				            
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
</body>
</html>