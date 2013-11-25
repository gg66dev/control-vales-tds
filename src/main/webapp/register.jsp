<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Registro</title>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post" action="RegisterServlet">
				<h1>Registro</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Su nombre <span class="small">Nombre</span>
				</label> <input type="text" name="nombre" id="nombre" /> <label>Nombre
					de usuario <span class="small">Nombre de usuario</span>
				</label> <input type="text" name="usuario" id="usuario" /> <label>Password
					<span class="small">Password</span>
				</label> <input type="password" name="password1" id="password1" /> <label>Repita
					password <span class="small">Password</span>
				</label> <input type="password" name="password2" id="password2" /> <label>Email
					<span class="small">Ej: eric20@gmail.com</span>
				</label> <input type="text" name="email" id="email" /> <label>Rut <span
					class="small">Rut</span>
				</label> <input type="text" name="rut" id="rut" />

				<button type="submit">Registrarse</button>
				<div class="spacer"></div>

			</form>
		</div>
	</center>
</body>
</html>