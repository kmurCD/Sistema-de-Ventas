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
<<<<<<< HEAD
		<h3>Lista de productos</h3>
=======
		<h1>Lista de productos</h1>
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
		<div class="">
			
			<div class="">
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
<<<<<<< HEAD
=======
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
                    required: "Ingrese el código del producto",
                    maxlength: "El código debe tener máximo 8 caracteres"
                },
                txtNombre: {
                    required: "Ingrese el nombre del producto"
                },
                txtPrecio: {
                    required: "Ingrese el precio del producto",
                    number: "Ingrese un valor numérico"
                },
                txtEstado: {
                    required: "Ingrese un valor (0 o 1)",
                    digits: "Ingrese solo números",
                    maxlength: "Ingrese máximo 1 número"
                },
                txtStock: {
                    required: "Ingrese la cantidad del producto",
                    digits: "Ingrese solo números",
                    maxlength: "Ingrese máximo 9 números"
                },
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
</html>