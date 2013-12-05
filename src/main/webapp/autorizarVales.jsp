<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Vale" %>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Autorizar Vale</title>
</head>
<body>
	<center>
		<form method="post" action="ConsultaValesServlet">
			<table>
				<tr>
					<td><input 
					onclick="document.getElementById('desde').disabled = false;
					document.getElementById('hasta').disabled = false;
					document.getElementById('texto').disabled = true;"
					type="radio" name="opcion" value="fecha"> Fecha<br></td>
					<td><input
					onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('texto').disabled = false;" 
					type="radio" name="opcion" value="rut"> Rut<br></td>
					<td><input
					onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('texto').disabled = false;"
					type="radio" name="opcion" value="nombre"> Nombre<br></td>
					<!-- <td><input type="radio" name="opcion" value="estado"> Estado<br></td> -->
					<td><input type="submit" value="Filtrar"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">Nombre o rut</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input id="texto" type="text" name="input" size="35" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">Fecha</td>
				</tr>
				<tr>
					<td colspan="2">Desde <input id="desde" type="text" name="desde" disabled="disabled"></td>
					<td colspan="2">Hasta <input id="hasta" type="text" name="hasta" disabled="disabled"></td>
				</tr>
			</table>
		</form>
		<%
		/* 	ValeController valeController = new ValeController();
			List<Vale> vales = valeController.listarVales(Estado.esperando_autorizacion); */
			@SuppressWarnings("unchecked")
			List<Vale> vales = ( List<Vale> )request.getSession().getAttribute("vales");
			if( vales != null ){
				%>
				<form method="post" action="AutorizarValeServlet">
					<table>
						<tr>
							<th>Usuario</th>
							<th>Fecha de Uso</th>
							<th>Origen</th>
							<th>Destino</th>
							<th>Motivo de viaje</th>
							<th>Monto estipulado</th>
							<th>Aceptar</th>
							<th>Rechazar</th>
						</tr>
						<%
						for ( Vale v : vales ){
							%>
							<tr>
								<td><%= v.getUsuario().getNombre() %></td>
								<td><%= v.getFecha_uso() %></td>
								<td><%= v.getOrigen() %></td>
								<td><%= v.getDestino() %></td>
								<td><%= v.getMotivo_viaje() %></td>
								<td><%= v.getMonto_estipulado() %></td>
								<td><input value="<%= v.getIdvale().toString()+"-"+"aceptado" %>" 
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
								<td><input value="<%= v.getIdvale().toString()+"-"+"rechazado" %>" 
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
								<td></td>
							</tr>
							<%
						}
						%>
					</table>
					<INPUT type="submit" value="Enviar">
				</form>
				<%
			} else {
				%>
				<p>No hay vales para confirmar </p>
				<%
			}
		%>
		<br/>
		<a href="index.jsp">index</a><br />
	</center>
</body>
</html>