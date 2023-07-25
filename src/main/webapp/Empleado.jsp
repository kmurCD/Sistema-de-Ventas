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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body> 
<div class="container-fuid m-4">
    <h3>Modulo Empleado</h3>
    <div class="row">
<<<<<<< HEAD
        <div class="col-6 col-sm-3">
            <form id="formEmpleado" action="EmpleadoS" method="post">
=======
        <div class="col-4 col-sm-4">
            <form name="formEmpleado" id="formEmpleado" action="EmpleadoS" method="post">
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
                    <div class="form-group" style="display: none;">
                      <label>ID</label>
                      <input type="text" name="txtId" class="form-control" value="${empleado.getId()}">
                    </div>
					<div class="form-group my-2">
					<label>Seleccionar rol:</label>
						<select class="form-control" name="rol" required disable>
							<option value="" disabled selected> - Selecciona - </option>
					        <option value="Administrador">Administrador</option>
					        <option value="Vendedor">Vendedor</option>
						</select>
					</div>
                    <div class="form-group">
                        <label>Dni</label>
                        <input type="text" name="txtDni" class="form-control"value="${empleado.getDni()}"
						pattern= "[0-9]+" maxlength="8" title="Por favor, ingrese solo números, maximo 10 caracteres (sin guiones ni espacios)" required></div>          
                    <div class="form-group">
                        <label>Nombres</label>
                        <input type="text" name="txtNombres" class="form-control" value="${empleado.getNom()}"
						pattern="[A-Za-z ]+" maxlength="20"title="Por favor, ingrese solo letras y espacios" required></div>
	                    <div class="form-group">
						<label>Seleccionar rol:</label>							
					<select class="form-control" name="txtRol" id="rol" >
					    <option value="" disabled selected> - Selecciona - </option>
					    <option value="Administrador" >Administrador</option>
					    <option value="Vendedor" >Vendedor</option>
					</select></div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" name="txtTelefono" class="form-control"value="${empleado.getTel()}"
                        pattern= "[0-9]+" maxlength="9" title="Por favor, ingrese solo números, maximo 9 caracteres(sin guiones ni espacios)" required></div>
                    <div class="form-group">
                    <label>Estado</label>
                        <input type="text" name="txtEstado" id="txtEstado" class="form-control"value="${empleado.getEstado()}"
                        pattern= "[0-1]" maxlength="1" title="Por favor, ingrese solo 1 o 0 (sin guiones ni espacios)" required></div>
                    <div class="form-group">
                    <label>Usuario</label>
                        <input type="text" name="txtUsuario" class="form-control" value="${empleado.getUser()}"
                        pattern="[A-Za-z0-9\s,.-]+" maxlength="8" title="Por favor, ingrese una dirección válida (solo letras, números, espacios, comas, puntos y guiones)" required></div>                     
                    <br>
                    
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
					<a href="EmpleadoS?menu=limpiar"  class="btn btn-secondary text-white">Nuevo</a>
					 <input type="submit" name="menu" value="Enviar Datos" class="btn btn-info text-white">					 					 					
					</div>	                 

            </form>
        </div>

<<<<<<< HEAD
        <div class= "col-6 col-sm-9">
=======
        <div class= "col-8 col-sm-8">
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
            <table class="table table-hover text-center" >                  
                <thead>
                <tr>
                	<th>ROL</th>
                    <th>DNI</th>
                    <th>NOMBRES</th>
                    <th>TELEFONO</th>
                    <th>ESTADO</th>
                    <th>USUARIO</th>
                    <th>ROL</th>
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
                    	<td><%= em.getRol() %></td>
                        <td><%= em.getDni() %></td>
                        <td><%= em.getNom() %></td>
                        <td><%= em.getTel() %></td>
                        <td><%= em.getEstado()%></td>
                        <td><%= em.getUser() %></td>
                        <td><%= em.getRol() %></td>
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
<<<<<<< HEAD
=======
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("form[name='formEmpleado']")
                .validate(
                        {
                        	errorElement: "span", 
                            errorClass: "text-danger", 
                            rules : {
                            	rol: {
                                    required: true
                                },	
                                txtDni : {
                                    required : true,
                                    maxlength : 8,
                                    digits : true
                                },
                                txtEstado : {
                                    required : true,
                                    digits : true,
                                    range: [0, 1]
                                },
                                txtTelefono : {
                                    maxlength : 9
                                },
                                txtUsuario : {
                                	required : true,
                                    maxlength : 8
                                },
                                txtNombres : {
                                	required : true,
                                	maxlength : 50
                                }
                            },
                            messages : {
                            	rol : {
                            		required : "Selecciona un rol"
                            	},
                                txtDni : {
                                    required : "Ingrese el DNI",
                                    maxlength : "El DNI debe tener máximo 8 caracteres",
                                    digits : "El DNI debe contener solo números"
                                },
                                txtEstado : {
                                    required : "Ingrese el Estado (0 o 1)",
                                    digits : "El Estado solo debe contener dígitos",
                                    range: "El Estado solo debe ser 0 o 1"
                                },
                                txtTelefono : {
                                    maxlength : "El Teléfono debe tener máximo 9 caracteres"
                                },
                                txtUsuario : {
                                	required : "Este campo es requerido",
                                    maxlength : "El Usuario debe tener máximo 8 caracteres"
                                },
                                txtNombres : {
                                    required : "Ingrese el Nombre"
                                }
                            },
                            submitHandler : function(form) {
                                form.submit();
                            }
                        });
    });
</script>
>>>>>>> 93ac0b40f72fa6cdd19ec043c570b5f2a42cec8f
</html>