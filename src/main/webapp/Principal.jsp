
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Modelo.Empleado"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<body>
<div class="">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
						<a class="nav-link" href="ProductoS?menu=listar"  target="myFrame">Productos</a> 
						<a class="nav-link" href="EmpleadoS?menu=listar" target="myFrame">Empleados</a> 					
						<a class="nav-link" href="ClienteS?menu=listar" target="myFrame">Clientes</a>						
						<a class="nav-link" href="VentaS?menu=listar" target="myFrame">Ventas</a>
						<a class="nav-link" aria-current="page" href="info.jsp" target="myFrame">Info</a> 
				</div>
			</div>
			<!-- Example split danger button -->

			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">${usuario.getNom()}</button>
				<ul class="dropdown-menu dropdown-menu-end text-center"
					aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="#"> <svg
								xmlns="http://www.w3.org/2000/svg" width="48" height="48"
								fill="#0dcaf0" class="bi bi-person-square" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
					  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z" />
						</svg>
					</a></li>
					<li><a class="dropdown-item" href="#">Usuario:
							${usuario.getUser()}</a></li>
					<li><a class="dropdown-item" href="#">${usuario.getNom()}</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><form action="Validacion" method="post">
							<button name="accion" value="Salir" class="dropdown-item">Salir</button>
						</form></li>
				</ul>
			</div>
		</div>
	</nav>
</div>

<div style="height: 600px">
	<iframe class="w-100 h-100" name="myFrame"></iframe>
</div>
</body>
</html>