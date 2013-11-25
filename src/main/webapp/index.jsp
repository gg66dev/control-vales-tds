<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controllers.UsuarioController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Home</title>
</head>
<body>
	<center>
		<div id="mystyle">
			<h1>Bienvenido</h1>
			<%= new Date() %>
			<%
				Usuario usuario = null;
				if (session.getAttribute("usuario") != null) {
					usuario = (Usuario) session.getAttribute("usuario");
			%>
			<b><%=usuario.getUsuario()%></b> <br /> <a href="logout.jsp">Logout</a>
			<br /> <a href="solicitarVale.jsp">Solicitar un Vale</a>
			<br /> <a href="registrarEmpresa.jsp">Registrar una empresa</a>
			<%
				} else {
			%>
			<br /> <b>Para ingresar al sistema <a href="login.jsp">Haz
					click aqu&iacute;</a></b>
			<%
				}
			%>

		</div>
	</center>
</body>
</html>