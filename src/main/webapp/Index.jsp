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
							fill="currentColor" class="bi bi-shop mx-2" viewBox="0 0 16 16" style="color: #0dcaf0;">
  						<path
								d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
						</svg>
						<label class="fs-1 mx-2 align-middle">CiberTech</label>
					</div>
					<div class="form-group text-center my-3">
						<h3>Bienvenidos al Sistema</h3>
					</div>
					<div class="form-group my-2">
					<label>Seleccionar rol:</label>
						<select class="form-control" name="rol" required disable>
							<option value="" disabled selected> - Selecciona - </option>
					        <option value="Administrador">Administrador</option>
					        <option value="Vendedor">Vendedor</option>
						</select>
					</div>
					<div class="form-group my-2">
						<label>Usuario:</label> <input type="text" name="txtuser"
							id="txtuser" class="form-control">
					</div>
					<div class="form-group my-2">
						<label>Password:</label> <input type="password" name="txtpass"
							id="txtpass" class="form-control">
					</div>
					<div class="my-4"></div>
					<input type="submit" name="accion" id="accion" value="Ingresar"
						class="btn btn-info col-12 text-white">

				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("form.form").validate({
            errorElement: "span",
            errorClass: "text-danger",
            rules: {
                rol: {
                    required: true
                },
                txtuser: {
                    required: true
                },
                txtpass: {
                    required: true
                }
            },
            messages: {
                rol: {
                    required: "Selecciona un rol"
                },
                txtuser: {
                    required: "Ingresa el usuario"
                },
                txtpass: {
                    required: "Ingresa la contraseña"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
</html>
