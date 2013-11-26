<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controllers.UsuarioController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Lista de usuarios</title>
</head>
<body>
	<center>
		<div id="mystyle">
			<h1>Bienvenido</h1>
			<p>
				<%=new Date()%>
				<%
					Usuario usuario = null;
					if (session.getAttribute("usuario") != null) {
						usuario = (Usuario) session.getAttribute("usuario");
				%>
				<b><%=usuario.getUsuario()%></b> <br /> <a href="logout.jsp">Logout</a>
				<%
					} else {
				%>
				<br /> <b>Para ingresar al sistema <a href="login.jsp">Haz
						click aqu&iacute;</a></b>
				<%
					}
				%>

				<%
					UsuarioController usuarioController = new UsuarioController();
					List<Usuario> list = usuarioController.obtenerListaUsuario();
					if (!list.isEmpty()) {
				%>
			</p>
			<table>
				<thead>
					<tr>
						<th>id usuario</th>
						<th>nombre</th>
						<th>usuario</th>
						<th>rut</th>
						<th>email</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Usuario u : list) {
					%>
					<tr>
						<td><%=u.getIdusuario()%></td>
						<td><%=u.getNombre()%></td>
						<td><%=u.getUsuario()%></td>
						<td><%=u.getRut()%></td>
						<td><%=u.getEmail()%></td>
					</tr>
					<%
						}
						} else {
					%>
					<h3>No hay usuarios registrados</h3>
					<%
						}
					%>
				
				<tbody>
			</table>
			<br />
		</div>
	</center>
</body>
</html>