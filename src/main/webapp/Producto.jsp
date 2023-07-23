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

</head>
<body>


<div class="container-fuid m-4">
		<h1>Registrar Producto</h1>
		<div class="row">
			<div class="col-6 col-sm-4">
				<form action="ProductoServlet?type=registrar" method="post">
					<input class="form-control" type="text" style="display: none"
							name="txtId" readonly="readonly" value="${producto.id}"/>
					<div class="form-group">
						<label>Codigo</label> <input class="form-control" type="text"
							name="txtCodigo" value="${producto.codigo}"/>
					</div>
					<div class="form-group">
						<label>Nombre</label> <input class="form-control" type="text"
							name="txtNombre" value="${producto.nombre}"/>
					</div>
					<div class="form-group">
						<label>Precio</label> <input class="form-control" type="text"
							name="txtPrecio" value="${producto.precio}" />
					</div>
					<div class="form-group">
						<label>Cantidad</label> <input class="form-control" type="text"
							name="txtCantidad" value="${producto.cantidad}" />
					</div>
					<div class="form-group">
						<label>Imagen</label> <input class="form-control" type="text"
							name="txtImagen" value="${product.imagen}"/>
					</div>
					<div class="form-group my-3 text-center">
					<input class="btn btn-info text-white" type="submit"
						value="Enviar datos" />
					
					<a class="btn btn-info text-white" href="ProductoServlet?type=nuevo">Nuevo Registro</a>
					</div>
				</form>
			</div>
			<div class="col-6 col-sm-8">
				<table class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Precio</th>
							<th>Catidad</th>
							<th>Total</th>
							<th>Imagen</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<%
						List<Producto> producto = (List<Producto>) request.getAttribute("producto");
						if (producto != null) {
							for (Producto p : producto) {
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getCodigo()%></td>
							<td><%=p.getNombre()%></td>
							<td><%=p.getPrecio()%></td>
							<td><%=p.getCantidad()%></td>
							<td><%=p.importeTotal()%></td>
							<td><img width="40px" alt="" src="<%=p.getImagen()%>"></td>
							<td><a href="ProductoServlet?type=editar&codigo=<%=p.getId()%>" style="margin-right: 8px">
								<img width="20px" src="img/lapiz.png"></a> 
								<a href="ProductServlet?type=eliminar&codigo=<%=p.getId()%>">
								<img width="20px" src="img/boton-x.png"></a>
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