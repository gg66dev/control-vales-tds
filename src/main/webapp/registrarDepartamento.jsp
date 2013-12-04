<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Registrar Departamento</title>
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.validate.js"></script>
</head>
<body>
<script>
$("form").validate();
</script>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post" action="RegistrarDepartamentoServlet">
				<h1>Registro de departamentos</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Nombre <span class="small">Nombre del depto.</span>
				</label> <input type="text" name="nombre" id="nombre" required /> <label>Descripcion
					<span class="small">Descripcion</span>
				</label> <input type="text" name="descripcion" id="descripcion" />

				<button type="submit">Registrar</button>
				<div class="spacer"></div>

			</form>
		</div>
	</center>
</body>
</html>