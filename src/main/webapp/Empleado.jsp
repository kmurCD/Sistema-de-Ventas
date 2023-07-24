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
    <h1>Modulo Empleado</h1>
    <div class="row">
        <div class="col-6 col-sm-4">
            <form name="formEmpleado" id="formEmpleado" action="EmpleadoS" method="post">
                    <div class="form-group" style="display: none;">
                      <label>ID</label>
                      <input type="text" name="txtId" class="form-control" value="${empleado.getId()}">
                    </div>          
                    <div class="form-group">
                        <label>Dni</label>
                        <input type="text" name="txtDni" id="txDni" class="form-control" value="${empleado.getDni()}">
                        <span id="errorDNI"></span></div>           
                    <div class="form-group">
                        <label>Nombres</label>
                        <input type="text" name="txtNombres" class="form-control"value="${empleado.getNom()}">
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" name="txtTelefono" class="form-control"value="${empleado.getTel()}">
                    </div>
                    <div class="form-group">
                    <label>Estado</label>
                        <input type="text" name="txtEstado" id="txtEstado" class="form-control"value="${empleado.getEstado()}">
                        <span id="errorEstado"></span>
                    </div>
                    <div class="form-group">
                    <label>Usuario</label>
                        <input type="text" name="txtUsuario" class="form-control"value="${empleado.getUser()}">
                    </div>
                    <div class="form-group my-3 text-center">
                    
                     <input type="submit" name="menu" value="Agregar" class="btn btn-info text-white">
                     <input type="submit" name="menu" value="listar" class="btn btn-info text-white">                   
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
                    <tr>
                        <td><%= em.getId() %></td>
                        <td><%= em.getDni() %></td>
                        <td><%= em.getNom() %></td>
                        <td><%= em.getTel() %></td>
                        <td><%= em.getEstado()%></td>
                        <td><%= em.getUser() %></td>
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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
	    $("form[name='formEmpleado']").validate({
	        rules : {
	            txtDni : {
	                required : true,
	                maxlength : 8,
	                digits : true
	            },                              
	            txtNombres : {
	                required : true,
	                pattern: /^[A-Za-z\s]+$/, // Coma faltante después de la expresión regular
	                digits: false // Quitamos esta línea ya que no es necesaria
	            },
	            txtTelefono : {
	                required : true,
	                maxlength : 9,
	                digits: true 
	            },
	            txtEstado : {
	                required : true,
	                maxlength : 1,
	                range: [0, 1]
	            },
	            txtUsuario: {
	                required : true,
	                maxlength : 5, // Cambiamos "digits" a "maxlength" para limitar el número de caracteres
	                pattern: /^[A-Za-z0-9]+$/
	            },
	        },
	        messages : {
	            txtDni : {
	                required :"Ingrese el DNI",
	                maxlength :"El DNI debe tener máximo 8 caracteres",
	                digits : "Este campo solo debe contener dígitos numéricos"
	            },
	            txtNombres : {
	                required : "Ingrese un Nombre",                         
	                pattern: "Este campo solo debe contener letras y espacios"
	            },
	            txtTelefono : {
	                required : "Ingrese el Teléfono",
	                maxlength : "El Teléfono debe tener máximo 9 dígitos",
	                digits: "Este campo solo debe contener dígitos numéricos"
	            },                               
	            txtEstado : {
	                required : "Ingrese el Estado (0 o 1)",
	                digits : "El Estado solo debe contener dígitos",
	                range: "El Estado solo debe ser 0 o 1"
	            },
	            txtUsuario: {
	                required : "Ingrese un Usuario",
	                maxlength : "El Usuario debe tener máximo 5 caracteres",
	                pattern: "Este campo no permite espacios"
	            },
	        },
	        submitHandler : function(form) {
	            form.submit();
	        }
	    });
	});
</script>
</html>