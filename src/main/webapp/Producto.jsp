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
		<h1>Registrar Producto</h1>
		<div class="row">
			<div class="col-6 col-sm-4">
				<form action="ProductoS" method="post" enctype="multipart/form-data">
					<div class="form-group" >
					<label>ID</label>
					<input class="form-control" type="text"  name="txtId"  value="${producto.getId()}"/>
						</div>
					<div class="form-group">		
						<label>Codigo</label> <input class="form-control" type="text"
							name="txtCodigo" value="${producto.getCodigo()}"/>
					</div>
					<div class="form-group">
						<label>Nombre</label> <input class="form-control" type="text"
							name="txtNombre" value="${producto.getNombre()}"/>
					</div>
					<div class="form-group">
						<label>Precio</label> <input class="form-control" type="text"
							name="txtPrecio" value="${producto.getPrecio()}" />
					</div>
					<div class="form-group">
						<label>Estado</label> <input class="form-control" type="text"
							name="txtEstado" value="${producto.getEstado()}" />
					</div>
					<div class="form-group">
						<label>Cantidad</label> <input class="form-control" type="text"
							name="txtStock" value="${producto.getStock()}" />
					</div>
					<div class="form-group">
						<label>Imagen</label> <input class="form-control" type="file"
							name="txtImagen" value="${producto.getImagen()}"/>
					</div>
					<div class="form-group my-3 text-center">
					<input class="btn btn-info text-white" type="submit" name="menu" value="Agregar" />	
														
					
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
							<td><%=p.getPrecio()%></td>
							<td><%=p.getStock()%></td>
							<td><%=p.getEstado()%></td>														
							<td><img width="40px" alt="" src="data:image/jpeg;base64,<%= p.getBase64() %>"></td>
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
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("form[name='formProducto']").validate({
            errorElement: "span", 
            errorClass: "text-danger", 
            rules: {
                txtCodigo: {
                    required: true,
                    maxlength: 8
                },
                txtNombre: {
                    required: true
                },
                txtPrecio: {
                    required: true,
                    number: true
                },
                txtEstado: {
                    required: true,
                    digits: true,
                    maxlength: 1
                },
                txtStock: {
                    required: true,
                    digits: true,
                    maxlength: 9
                },
            },
            messages: {
                txtCodigo: {
                    required: "Ingrese el c�digo del producto",
                    maxlength: "El c�digo debe tener m�ximo 8 caracteres"
                },
                txtNombre: {
                    required: "Ingrese el nombre del producto"
                },
                txtPrecio: {
                    required: "Ingrese el precio del producto",
                    number: "Ingrese un valor num�rico"
                },
                txtEstado: {
                    required: "Ingrese un valor (0 o 1)",
                    digits: "Ingrese solo n�meros",
                    maxlength: "Ingrese m�ximo 1 n�mero"
                },
                txtStock: {
                    required: "Ingrese la cantidad del producto",
                    digits: "Ingrese solo n�meros",
                    maxlength: "Ingrese m�ximo 9 n�meros"
                },
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
</html>