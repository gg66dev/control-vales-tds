<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controller.UsuarioController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Lista de usuarios</title>
</head>
<body>
	<center>
	<div class="c6">
			<h1 class="text-center">Bienvenido</h1>
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
					<tr class="text-center">
						<th class="text-center">id usuario</th>
						<th class="text-center">nombre</th>
						<th class="text-center">usuario</th>
						<th class="text-center">rut</th>
						<th class="text-center">email</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Usuario u : list) {
					%>
					<tr class="text-center">
						<td class="text-center"><%=u.getIdusuario()%></td>
						<td class="text-center"><%=u.getNombre()%></td>
						<td class="text-center"><%=u.getUsuario()%></td>
						<td class="text-center"><%=u.getRut()%></td>
						<td ><%=u.getEmail()%></td>
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
</div>
	</center>
</body>
</html>