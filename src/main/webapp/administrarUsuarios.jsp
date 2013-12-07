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
		<div class="row spce-bot">
			<div class="c8 centered">
				<h1 class="text-center">Lista de usuarios</h1>
				<p>Por favor seleccione un usuario a modificar</p>
				<%
					UsuarioController usuarioController = new UsuarioController();
					List<Usuario> list = usuarioController.obtenerListaUsuario();
					if (!list.isEmpty()) {
				%>
				<form method="post" action="detalleUsuario.jsp">
					<table>
						<tr class="text-center">
							<th class="text-center">Usuario</th>
							<th class="text-center">Nombre</th>
							<th class="text-center">Nombre de usuario</th>
							<th class="text-center">Rut</th>
							<th class="text-center">Email</th>
						</tr>
						<%
							for (Usuario u : list) {
						%>
						<tr>
							<td class="text-center"><input
								value="<%=u.getIdusuario()%>" name="usuario" type="radio">
							</td>
							<td class="text-center"><%=u.getNombre()%></td>
							<td class="text-center"><%=u.getUsuario()%></td>
							<td class="text-center"><%=u.getRut()%></td>
							<td><%=u.getEmail()%></td>
						</tr>
						<%
							}
						%>
						<tr>
						<td colspan=5 class="text-center">
							<button type="submit">Seleccionar</button>
						</td>
						</tr>
					</table>
				</form>
				<%
					} else {
				%>
				No hay usuarios registrados.
				<%
					}
				%>

			</div>
		</div>
		<br /> <a href="index.jsp">volver</a><br />
	</center>
</body>
</html>