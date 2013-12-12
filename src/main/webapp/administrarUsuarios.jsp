<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controller.UsuarioController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Listar usuarios</title>
</head>
<body>
<div class="row space-bot">
	<h1 class="text-center">Administrar usuarios</h1>
	<p class="text-center">Por favor escoga un usuario a modificar </p>
</div> 
	<div class="content">
		<div class="grid">
			<%
				request.getSession().removeAttribute("usuario");
				UsuarioController usuarioController = new UsuarioController();
				List<Usuario> list = usuarioController.obtenerListaUsuario();
				if (!list.isEmpty()) {
			%>
			<hr>
			<div class="row space-bot">
				<div class="c2 first"></div>
				<div class="c8">
					<form name="form" method="post" action="opcionUsuario.jsp">
						<p class="note text-center">Por favor seleccione un usuario a
							modificar</p>
						<p id="error"></p>
						<table>
							<tr>
								<th class="text-center">Usuario</th>
								<th class="text-center">Nombre</th>
								<th class="text-center">Nombre de usuario</th>
								<th class="text-center">Rut</th>
								<th class="text-center">Email</th>
							</tr>
							<%
								int i = 0;
									for (Usuario u : list) {
										if (i % 2 == 1) {
							%>
							<tr class="even">
								<%
									} else {
								%>
							
							<tr>
								<%
									}
								%>

								<td class="text-center"><input
									value="<%=u.getIdusuario()%>" name="usuario" type="radio">
								</td>
								<td class="text-center">
									<%=u.getNombre()%>
								</td>
								<td class="text-center">
									<%=u.getUsuario()%>
								</td>
								<td class="text-center"><%=u.getRut()%></td>
								<td class="text-center"><%=u.getEmail()%></td>
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
				</div>
				<div class="c2 last"></div>
			</div>
			<%
				} else {
			%>
			<div class="row space-bot">
				<p class="note text-center">No hay usuarios registrados.</p>
			</div>
			<%
				}
			%>
			<hr>
			<div class="row">
				<p class="note text-center">
					<a href="index.jsp">Inicio</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>