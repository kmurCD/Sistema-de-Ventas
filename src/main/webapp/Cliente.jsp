<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cliente</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<body>
<div class="container-fuid m-4">
	<h1>Módulo Clientes</h1>
	<div class="row">
		<div class="col-6 col-sm-4">
			<form action="" method="post">
					<div class="form-group">
					<label>Dni</label>
						<input type="text" name="txtDni" class="form-control" value=""></div>			
					<div class="form-group">
					<label>Nombres</label>
						<input type="text" name="txtNombres" class="form-control"value=""></div>
					<div class="form-group">
					<label>Telefono</label>
						<input type="text" name="txtDireccion" class="form-control"value=""></div>
					<div class="form-group">
					<label>Estado</label>
						<input type="text" name="txtEstado" class="form-control"value="">
					</div>
					<div class="form-group my-3 text-center">
					 <input type="submit" name="accion" value="Agregar" class="btn btn-info text-white">
					 <input type="submit" name="accion" value="Actualizar" class="btn btn-info text-white">					
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
					<th>DIRECCIÓN</th>
					<th>ESTADO</th>
					<th>ACCIONES</th>											
				</tr>
				</thead>
				<tbody>
				    
				    <tr>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td></td>
				        <td>
				            <a href="ControladorServlet?menu=Cliente&accion=Editar&code=" class="bi bi-pencil-square" style="color: #0dcaf0;"></a>
				            <a href="ControladorServlet?menu=Cliente&accion=Eliminar&code="class="bi bi-trash3-fill" style="color: #0dcaf0;"></a>
				        </td>
				    </tr>
				    
				</tbody>


			 </table>			
		</div>
	</div></div>
</body>
</html>