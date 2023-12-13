<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
						<a class="nav-link bi bi-bag" href="ProductoS?menu=listVendedor"  target="myFrame"> Productos</a> 
						<a class="nav-link bi bi-person-add" href="ClienteS?menu=listar" target="myFrame"> Clientes</a>						
						<a class="nav-link bi bi-cart" href="VentaS?menu=Principal" target="myFrame"> Ventas</a>
						<a class="nav-link bi bi-info-circle" aria-current="page" href="info.jsp" target="myFrame"> Info</a> 
				</div>
			</div>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">${usuario.getNom()}</button>
				<ul class="dropdown-menu dropdown-menu-end text-center"
					aria-labelledby="dropdownMenuButton1">
					<li><a class=" icono dropdown-item"  href="#">
					<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="#0dcaf0" class="bi bi-person-circle" viewBox="0 0 16 16">
  						<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  						<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>					
					</a></li>					
					<li><a class="dropdown-item" href="#">${usuario.getUser()}</a></li>							
					<li><hr class="dropdown-divider"></li>
					<li><form action="Validacion" method="post">
							<button name="accion" value="Salir" class="dropdown-item">Salir</button>
						</form></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<br>
<div style="height: 90vh">
	<iframe class="w-100 h-100" name="myFrame"></iframe>
</div>
<div class="bg-dark navbar navbar-expand-lg ">nav</div>
</body>
</html>