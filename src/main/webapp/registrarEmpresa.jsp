<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Registrar empresa</title>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post" action="RegistrarEmpresaServlet">
				<h1>Registrar Empresa</h1>
				<p>
					Por favor la siguiente informaci&oacute;n
				</p>
				<label>Nombre <span class="small">Nombre</span></label> 
				<input type="text" name="nombre" id="nombre" /> 
				<label>Rut <span class="small">Rut </span></label>
				<input type="text" name="rut" id="rut" />

				<button type="submit">Registrar Empresa</button>
				<div class="spacer"></div>
			</form>
		</div>
	</center>
</body>
</html>