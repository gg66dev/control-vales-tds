<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.servlets.LoginServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Login</title>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post" action="LoginServlet">
				<h1>Login</h1>
				<p>
					Por favor ponga su informaci&oacute;n para ingresar <br />¿Nuevo
					usuario? <a href="register.jsp">Registrese</a>
				</p>
				<label>Nombre de usuario <span class="small">Ponga su
						nombre de usuario</span>
				</label> <input type="text" name="username" id="username" /> <label>Password
					<span class="small">M&iacute;nimo 6 letras</span>
				</label> <input type="password" name="password" id="password" />

				<button type="submit">Login</button>
				<div class="spacer"></div>
			</form>
		</div>
	</center>
</body>
</html>