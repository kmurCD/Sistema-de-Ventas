<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container my-5 col-lg-4">
		<div class="card col-sm-10 my-3">
			<div class="card-body ">
				<form class="form my-3" action="Validacion" method="post">

					<div class="form-group text-center my-3">

						<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64"
							fill="currentColor" class="bi bi-shop mx-2" viewBox="0 0 16 16" style="color: #212529;">
  						<path
								d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375
								 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 
								 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375
								  0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
						</svg>
						<label class="fs-1 mx-2 align-middle">CiberTech</label>
					</div>
					<div class="form-group text-center my-3">
						<h3>Bienvenidos al Sistema</h3>
					</div>
					<div class="form-group my-2">
					<label>Seleccionar rol:</label>

						<select class="form-select" name="txtRol" required>
							<option value="" disabled selected> Tipo de Usuario </option>
					        <option value="Administrador">Administrador</option>
					        <option value="Vendedor">Vendedor</option>
											</select>

					</div>
					<div class="form-group my-2">
						<label>Usuario:</label> <input type="text" name="txtuser"
							id="txtuser" class="form-control" required>
					</div>
					<div class="form-group my-2">
						<label>Password:</label> <input type="password" name="txtpass"
							id="txtpass" class="form-control" required>
					</div>
					<div class="my-4"></div>
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
						
					<div class="my-4"></div>
					<input type="submit" name="accion" id="accion" value="Ingresar"
						class="btn btn-secondary col-12 text-white">

				</form>
			</div>
		</div>
	</div>
</body>

</html>
