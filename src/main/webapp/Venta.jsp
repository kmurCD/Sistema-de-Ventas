<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Venta</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<body>
<div class="container-fuid m-4">
 <h3>Módulo Ventas</h3>
  <div class="d-flex">
  	<div class="col-sm-5">
  		<div class="card">
  		<form action="VentaS" method="post">
  			<div class="card-body">
  				<div class="form-group">
  					<label>Datos del cliente</label>
  					</div>
  					<br>
  				<div class="form-group d-flex">
  					<div class="col-sm-4 d-flex ">
  						<input type="text" name="cdoCliente" class="form-control" placeholder="Codigo">
  						<input type="submit" name="accion" value="Buscar" class="btn btn-outline-info" >
  					</div>	
  					
  					<div class="col-sm-2"></div>
  						 				
  					<div class="col-sm-6">
  					<input type="text" name="nomCliente" class="form-control" placeholder="Cliente">
  					</div>	
  				</div><br>					
  					
  					
  				<div class="form-group">
  				<label>Datos del Producto</label>
  				</div><br>			
  				
  				<div class="form-group d-flex">
  					<div class="col-sm-4 d-flex ">
  						<input type="text" name="cdoCliente" class="form-control" placeholder="Codigo">
  						<input type="submit" name="accion" value="Buscar" class="btn btn-outline-info">
  						</div>
  						<div class="col-sm-2"></div> 				
  					<div class="col-sm-6">
  					<input type="text" name="nomCliente" class="form-control" placeholder="Producto" ></div> 
  				</div><br>
  				
  				
  				
  					
  					<div class="form-group d-flex">
  					<div class="col-3"><input type="text" name="precio" class="form-control" placeholder="S/.0.00"></div>  						 												
  					<div class="col-sm-3"></div>
	  					<div class="col-sm-6 d-flex">
		  					<div class="col-sm-4"><input type="number" name="cant" class="form-control" placeholder=""></div>   						  																
		  					<div class="col-sm-4"></div>
		  					<div class="col-sm-4"><input type="text" name="stock" class="form-control" placeholder="Stock"></div>
	  					</div> 
  					</div><br>
  					
  					<div class="form-group">
  					<input type="submit" name="accion" value="Agregar" class="btn btn-outline-info">
  					</div>		
  				</div>
  			</form>
  		</div>
  	</div>
  		<div class="col-sm-7">
  			<div class="card">
  				<div class="card-body">
  					<div class="d-flex">
  					<div class=" col-sm-8"></div>	   								
					  <div class=" col-sm-4 d-flex">
					    <label>NRO SERIE</label>
					    <input type="text" name="NroSerie" class="form-control">				 
					</div>					
					</div>
					<br>
	  				<div>
	  					<table class="table table-hover text-center" >					
							<thead>
							<tr>
								<th>NRO</th>
								<th>CODIGO</th>
								<th>DESCRIPCION</th>
								<th>PRECIO</th>
								<th>CANTIDAD</th>
								<th>SUBTOTAL</th>
								<th>ACCIONES</th>											
							</tr>
							</thead>
							<tbody>
							   
							    <tr>
							        <td></td>
							        <td></td>
							      	<td></td>
							      	<td></td>
							      	<td></td>						      	
							        
							        <td>
							            <a href="" style="color: #0dcaf0;"></a>
							            <a href="" style="color: #0dcaf0;"></a>				            				            
							        </td>
							    </tr>						  
							</tbody>		
						 </table>
	  				</div>
	  				<div class="card-footer"></div>
	  					<div>
							<input type="submit" name="accion" value="Generar Venta" class="btn btn-success">
							<input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
	  					</div>
  				</div>
  			</div>	
  		</div>
  </div> 
 
</body>
</html>