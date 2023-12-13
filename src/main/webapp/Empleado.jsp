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
<h3 class=" mt-4 ms-4">Registrar Empleado</h3>
<div class="container-fuid ms-4 me-4">
<div class="d-flex">   
    <form action="EmpleadoS" method="post" class="col-sm-12 ">
				    <div class="form-group d-flex justify-content-end">				       				     
					        <div class=" d-flex">
					            <input type="text" name="txtBuscar" class="form-control m-1" placeholder=" Ingrese DNI o nombre">
					            <button type="submit" name="menu" value="Filtro" class="btn btn-outline-secondary m-1">Buscar</button>
				       	 </div>			       	  
				    </div>				
				</form>	
				</div>
    <div class="row">
        <div class="col-6 col-sm-3">
            <form action="EmpleadoS" method="post">
 				
 					<div class="d-flex justify-content-between mb-2">			
 						<div class="form-group d-flex col-sm-6 justify-content-between align-items-center">	                   
	                        <div class="col-sm-3 "> 
	                         <label>D.N.I.</label>
	                        </div>
	                        <div class="col-sm-8">
	                        <input type="text" name="txtDni" maxlength="9" class="form-control"value="${empleado.getDni()}" placeholder="DNI" oninput="validarNumeros(this)">	                        
	                        </div>
	                        </div>          
 						
 						<div class="form-group d-flex col-sm-4 justify-content-between align-items-center" >
	                        <div class="col-sm-2 text-end">
	                          <label>ID</label>
	                        </div>
	                      	<div class="col-sm-9">
	                  			<input type="text" name="txtId" class="form-control bg-light"value="${empleado.getId()== 0 ? '' : empleado.getId()}"  readonly></div>                      	
                      		</div>
 					</div>
                    
                    <div class="mb-2">
							<div  id="errorNumero" style="color: red;"></div>
						</div>	
						
                   	 <div class="form-group d-flex  justify-content-between align-items-center mb-2">                   
                       <div class="col-sm-2">
                       <label>Nombres</label>
                       </div> 
                       <div class="col-sm-10">
                       <input type="text" name="txtNombres" class="form-control" value="${empleado.getNom()}"  placeholder= "Nombres y Apellidos" oninput="validarNombre(this)">
                       </div>  
                        </div>
                        
                       <div class="mb-2">
							<div  id="errorNombre" style="color: red;"></div>
						</div>
						
                        <div class="d-flex justify-content-between align-items-center mb-2" >                    
                        <div class="form-group col-sm-6 d-flex align-items-center">
	                    	<div class="col-sm-4">
	                    	<label>Usuario</label>
	                    	</div>
	                    	
	                    	<div class="col-sm-8">
	                    	 	<input type="text" maxlength="8" name="txtUsuario" class="form-control" value="${empleado.getUser()}" placeholder= "Usuario" oninput="validarUser(this)">                  	
	                    	</div>
                        </div> 
		                    <div class="form-group col-sm-5">																	
								<select class="form-select" name="txtRol" id="rol" >
								    <option value="" disabled selected> Tipo de Usuario</option>
								    <option value="Administrador" ${empleado.getRol().equals("Administrador") ? "selected" : "" }>Administrador</option>
								    <option value="Vendedor" ${empleado.getRol().equals("Vendedor") ? "selected" : "" }>Vendedor</option>
							</select>
							</div>
						</div>
						
					<div class="mb-2">
							<div  id="errorUser" style="color: red;"></div>
						</div>
					<div class="d-flex justify-content-between align-items-center mb-2" >
						<div class="form-group  d-flex col-sm-6 align-items-center">
		                   <div class="col-sm-4">
		                    	<label>Telefono</label>
		                    </div>
	                       <div class="col-sm-8">
	                        	<input type="text" maxlength="9" name="txtTelefono" class="form-control"value="${empleado.getTel()}" placeholder="Telefono" oninput="validarTelefono(this)">
	                        </div>
	                    </div>
	                   <div class="form-check align-items-center col-sm-5" >
	                     <label class="form-check-label" for="CheckEstado">Activo</label> 	                        
						 <input class="form-check-input" type="checkbox" id="CheckEstado" name ="txtEstado"value ="1"
   													 ${empleado.getEstado() == 1 ? 'checked' : ''}>
   													 <input type="hidden" name="txtEstado" value="0">
   						</div>
						</div>
						<div class="mb-2">
							<div  id="errorTelefono" style="color: red;"></div>
						</div>
							                                                           
                   
                    
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
				
                    
                    <div class="form-group my-3 text-end">
						<button type="submit" class="btn btn-secondary bi-eraser-fill" name="menu" value="limpiar"></button>											 								 									
						<button type="button" class="btn btn-success  w-25" data-bs-toggle="modal" data-bs-target="#staticBackdrop"> ${empleado.getId() > 0 ? 'Actualizar' : 'Agregar'} </button>
					</div>	                 
						
						
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">${empleado.getId() != null ? 'Actualizar' : 'Agregar'}</h1>
					        <button type="button" class="btn-close w-10" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ${empleado.getId() != null ? 'Esta seguro de actualizar el Cliente  ' : 'Esta seguro de agregar el Cliente'} ${empleado.getNom()}
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary w-20" data-bs-dismiss="modal">Cancelar</button>
					        <button type="submit" name="menu" value="Enviar Datos" class="btn btn-success  w-20" data-bs-toggle="modal" data-bs-target="#staticBackdrop">${empleado.getId() != null ? 'Actualizar' : 'Agregar'}</button>
					      </div>
					    </div>
					  </div>
					</div>
            </form>
        </div>

        <div class= "col-6 col-sm-9">
            <table class="table text-center table-bordered table-hover align-middle">                  
                <thead class="table-secondary">
                <tr>
                	<th>ROL</th>
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
                    <tr class="pointer" ondblclick="editarProducto('<%= em.getDni()%>')">
                    	<td><%= em.getRol() %></td>
                        <td><%= em.getDni() %></td>
                        <td><%= em.getNom() %></td>
                        <td><%= em.getTel() %></td>
                        <td ><% int estado = Integer.parseInt(em.getEstado()); %>
    						<%= (estado == 1) ? "Activo" : "Inactivo" %></td>                      
                        <td><%= em.getUser() %></td>                     
                        <td>
                           <button type="button" class="btn btn-danger bi bi-trash3-fill" data-bs-toggle="modal" data-bs-target="#EliminarProductoModal<%= em.getId()%>">
                        		Eliminar
                   				 </button>
                            
                            
                        </td>
                    </tr>
                    <% 
                    	}
                    } 
                    %>
                </tbody>


             </table>
             <div>
				 <%
				 List<Empleado> emp = (List<Empleado>)request.getAttribute("empleados");             
                 if (emp != null) {
                     for (Empleado em : emp) { %>
				    <div class="modal fade" id="EliminarProductoModal<%= em.getId()%>"  data-bs-backdrop="static" tabindex="-1" aria-labelledby="EliminarProductoModalLabel<%= em.getId()%>" aria-hidden="true">
				        <div class="modal-dialog modal-dialog-centered">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="EliminarProductoModalLabel<%= em.getId()%>">Eliminar Producto</h5>
				                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
				                    ¿Estás seguro de que deseas eliminar el producto <%= em.getNom()%>?
				                </div>
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Cancelar</button>
				                    <a href="EmpleadoS?menu=Eliminar&code=<%= em.getId()%>" class="btn btn-danger bi bi-trash3-fill"> Eliminar</a>
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

	
    function editarProducto(EmpleadoDni) {
        // Aquí puedes redirigir a una página de detalles del producto
        window.location.href = "EmpleadoS?menu=Editar&code=" + EmpleadoDni;  
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

        if (!/^[a-zA-Z ]*$/.test(valor)) {
            errorNombre.textContent = "Solo se admiten letras y espacios";
            input.classList.add("error");
        } else {
        	errorNombre.textContent = "";
            input.classList.remove("error");
        }
    }
    
    function validarNumeros(input) {
        var Numero = input.value;
        var errorNumero = document.getElementById("errorNumero");

        if (!/^[0-9.]*$/.test(Numero)) {
        	errorNumero.textContent = "Solo se admiten números";
            input.classList.add("error");
        } else {
        	errorNumero.textContent = "";
            input.classList.remove("error");
        }
    }
    
    function validarTelefono(input) {
        var Numero = input.value;
        var errorTelefono = document.getElementById("errorTelefono");

        if (!/^[0-9.]*$/.test(Numero)) {
        	errorTelefono.textContent = "Solo se admiten números";
            input.classList.add("error");
        } else {
        	errorTelefono.textContent = "";
            input.classList.remove("error");
        }
    }
    function validarUser(input) {
        var User = input.value;
        var errorUser = document.getElementById("errorUser");

        if (!/^[a-zA-Z0-9]*$/.test(User)) {
        	errorUser.textContent = "Solo se admiten letras y números.";
            input.classList.add("error");
        } else {
        	errorUser.textContent = "";
            input.classList.remove("error");
        }
    }
</script>  
</body>
</html>