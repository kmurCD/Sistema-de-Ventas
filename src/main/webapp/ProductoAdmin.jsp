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
<style>
	
    .form-control.error {
        border-color: red;
        box-shadow: 0 0 0 0.2rem rgba(255, 0, 0, 0.25);
    }
    
     tr.pointer {
        cursor: pointer;
    }
</style>
<body>
<h3 class=" mt-4 ms-4">Registrar Producto</h3>	
<div class="container-fuid  ms-4 me-4">
	<div class="d-flex ">				
			<form action="ProductoS" method="post" class="col-sm-12 ">							 
				    <div class="form-group d-flex justify-content-end">				       			       
					        <div class="d-flex">
					          <input type="text" name="txtBuscar" class="form-control m-1" placeholder=" Ingrese codigo o nombre">
					          <button type="submit" name="menu" value="FiltroAdmin" class="btn btn-outline-secondary m-1">Buscar</button>
				       	 </div>			       	  
				    </div>				
				</form>	
			</div>			
		<div class="row">
			<div class="col-6 col-sm-3">
				<form action="ProductoS" method="post" enctype="multipart/form-data" >
					<div class="d-flex justify-content-between mb-2">
						<div class="form-group d-flex col-sm-6 justify-content-between align-items-center">								
							<div class="col-sm-3 text-end">
								<label >Codigo</label >
							</div>
							<div class="col-sm-8">
								<input class="form-control" type="text"name="txtCodigo"  maxlength="4" value="${producto.getCodigo()}" placeholder="Codigo" oninput="validarCodigo(this)"/>							
							</div>														
						</div>							
						<div class="form-group d-flex col-sm-4 justify-content-between align-items-center" >
							<div class="col-sm-2 text-end" >
							<label>ID </label>
							</div>
							<div class="col-sm-9">
							<input class="form-control bg-light" type="text"  name="txtId" value="${producto.getId()}" readonly/>
							</div>							
						</div>						
					</div>
						<div class="mb-2">
							<div  id="codigoError" style="color: red;"></div>
						</div>	
					<div class="form-group d-flex  justify-content-between align-items-center mb-2">
						<div class="col-sm-2">
						<label>Nombre</label> 
						</div>					
						<div class="col-sm-10">
						<input class="form-control" type="text" name="txtNombre" value="${producto.getNombre()}" placeholder="Nombre del Producto" oninput="validarNombre(this)"/>
						</div>																			
					</div>
						<div class="mb-2">
							<div  id="errorNombre" style="color: red;"></div>
						</div>					
					<div class="d-flex justify-content-between align-items-center mb-2" >
						<div class="form-group  d-flex col-sm-5 align-items-center">
							<div class="col-sm-5">
								<label>Precio</label> 
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text" name="txtPrecio" value="${producto.getPrecio()}" placeholder="S/.0.00" oninput="validarCod(this)"/>
							</div>			
						</div>
						<div class="form-group  d-flex col-sm-4 align-items-center">
							<div class="col-sm-6">
								<label>Cantidad</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text"name="txtStock" value="${producto.getStock()}" placeholder="Stock" oninput="validarCod(this)"/>	
							</div>													
						</div>  							 							  
						<div class="form-check align-items-center">
							  <label class="form-check-label" for="CheckEstado">Activo</label> 								
							  <input class="form-check-input" type="checkbox" id="CheckEstado" name ="txtEstado"value ="1"
   													 ${producto.getEstado() == 1 ? 'checked' : ''}>
   													 <input type="hidden" name="txtEstado" value="0">	  
						</div>						
					</div>
					<div class="mb-2">
							<div  id="errorCodigo" style="color: red;"></div>
						</div>					
					<div class="form-group">
								

				    <div>
				        <input class="form-control" type="file" name="txtImagen" onchange="validarArchivo()"/>				        
				    </div>
				    <div class="mb-2">
							<div  id="errorImagen" style="color: red;"></div>
						</div>	
					</div>				
					
					<div>
								<% 
						    String errorMessage = (String) request.getAttribute("error");
						    if (errorMessage != null && !errorMessage.isEmpty()) { 
						    	
						%>
						    <div class="alert alert-danger d-flex align-items-center" role="alert">
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
						<button type="submit" class="btn btn-secondary bi-eraser-fill" name="menu" value="limpiar"></button>											 								 									
						<button type="button" class="btn btn-success  w-25" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> ${producto.getId() != null ? 'Actualizar' : 'Agregar'} </button>
					</div>



					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">${producto.getId() != null ? 'Actualizar' : 'Agregar'}</h1>
					        <button type="button" class="btn-close w-10" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ${producto.getId() != null ? 'Esta seguro de actualizar el producto  ' : 'Esta seguro de agregar el producto'} ${producto.getNombre()}
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary w-20" data-bs-dismiss="modal">Cancelar</button>
					        <button type="submit" name="menu" value="Enviar Datos" class="btn btn-success  w-20" data-bs-toggle="modal" data-bs-target="#staticBackdrop">${producto.getId() != null ? 'Actualizar' : 'Agregar'}</button>
					      </div>
					    </div>
					  </div>
					</div>
					
										
										
				</form>
			</div>
			<div class="col-6 col-sm-9">
			
							
				<table class="table text-center table-bordered table-hover align-middle">
					<thead class="table-secondary">
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Categoria</th>
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
						<tr class="pointer" ondblclick="editarProducto('<%= p.getCodigo()%>')">							
							<td><%=p.getCodigo()%></td>
							<td><%=p.getNombre()%></td>
							<td><%= p.getId()%></td>
							<td>S/.<%=p.getPrecio()%></td>
							<td><%=p.getStock() %></td>
							<td ><% int estado = Integer.parseInt(p.getEstado()); %>
    						<%= (estado == 1) ? "Activo" : "Inactivo" %></td>														
							<td><img width="40px" height="40px" alt="Product Image" src="data:image/jpeg;base64,<%= p.getBase64()%>"></td>
							<td>                         
                         	<button type="button" class="btn btn-danger bi bi-trash3-fill" data-bs-toggle="modal" data-bs-target="#EliminarProductoModal<%= p.getId()%>">
                        Eliminar
                   				 </button>
                         	
							
													
						</tr>
						
						<%
						}
						}
						%>
						
					</tbody>
					
				</table>				
				<div>
				 <%
				 List<Producto> pro = (List<Producto>) request.getAttribute("productos");
					if (pro != null) {
				 for (Producto p : pro) { %>
				    <div class="modal fade" id="EliminarProductoModal<%= p.getId()%>"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="EliminarProductoModalLabel<%= p.getId()%>" aria-hidden="true">
				        <div class="modal-dialog modal-dialog-centered">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="EliminarProductoModalLabel<%= p.getId()%>">Eliminar Producto</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                    ¿Estás seguro de que deseas eliminar el producto <%= p.getNombre()%>?
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Cancelar</button>
				                    <a href="ProductoS?menu=Eliminar&code=<%= p.getId()%>" class="btn btn-danger bi bi-trash3-fill"> Eliminar</a>
				                </div>
				            </div>
				        </div>
				    </div>
				    <% }
				 }%>
				</div> 
			</div>
		</div>			
	</div>
	
	
	
		
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const checkbox = document.getElementById("CheckEstado");

	    checkbox.addEventListener("change", function() {
	      if (this.checked) {
	        this.value = "1";
	      } else {
	        this.value = "0";
	      }
	    });
	  });
	
	</script>
	<script>	
	
	 function validarArchivo() {
         const input = document.querySelector('input[type="file"]');
         const errorElement = document.getElementById('errorImagen');
         
         const file = input.files[0];
         
         if (file) {
             const allowedTypes = ['image/jpeg', 'image/png'];
             
             if (!allowedTypes.includes(file.type)) {
            	 errorElement.textContent = "Solo se aceptan imágenes en formato JPEG, PNG.";
                 input.value = ''; // Limpia el campo de archivo si no es válido
             }else {
                 errorElement.textContent = ''; 
             }
             
         }
     }
	
    function editarProducto(productCod) {
        // Aquí puedes redirigir a una página de detalles del producto
        window.location.href = "ProductoS?menu=Editar&code=" + productCod;  
    }

	
    function validarCodigo(input) {
        var codigo = input.value;
        var codigoError = document.getElementById("codigoError");
        
        if (!/^\d*$/.test(codigo)) {
            codigoError.textContent = "Solo se admiten numeros.";
            input.classList.add("error");
        } else {
            codigoError.textContent = "";
            input.classList.remove("error");
        }
    }
    
    
    function validarNombre(input) {
        var valor = input.value;
        var errorNombre = document.getElementById("errorNombre");

        if (!/^[a-zA-Z0-9 -]*$/.test(valor)) {
            errorNombre.textContent = "Solo se admiten letras, números y guiones.";
            input.classList.add("error");
        } else {
        	errorNombre.textContent = "";
            input.classList.remove("error");
        }
    }
    
    function validarCod(input) {
        var Precio = input.value;
        var errorCod = document.getElementById("errorCodigo");

        if (!/^[0-9.]*$/.test(Precio)) {
        	errorCod.textContent = "Solo se admiten números";
            input.classList.add("error");
        } else {
        	errorCod.textContent = "";
            input.classList.remove("error");
        }
    }
    
</script>
</body>	
</html>