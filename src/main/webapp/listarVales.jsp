<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Estado" %>
<%@ page import="cl.tds.controlvales.beans.Vale" %>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controllers.ValeController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Autorizar Vale</title>
</head>
<body>
	<center>
		<form method="post" action="ConsultaValesServlet">
			<table>
				<tr>
					<td><input type="radio" name="opcion" value="rut"> Rut<br></td>
					<td><input type="radio" name="opcion" value="nombre"> Nombre<br></td>
					<!-- <td><input type="radio" name="opcion" value="estado"> Estado<br></td> -->
					<td><input type="submit" value="Filtrar"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="text" name="input"></td>
			</table>
		</form>
		<%
		/* 	ValeController valeController = new ValeController();
			List<Vale> vales = valeController.listarVales(Estado.esperando_autorizacion); */
			List<Vale> vales = ( List<Vale> )request.getSession().getAttribute("vales");
			if( vales != null ){
				%>
				<form method="post" action="AutorizarValeServlet">
					<table>
						<tr>
							<th>Empresa</th>
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
								<td><%= v.getEmpresa().getNombre() %></td>
								<td><%= v.getUsuario().getNombre() %></td>
								<td><%= v.getFecha_uso() %></td>
								<td><%= v.getOrigen() %></td>
								<td><%= v.getDestino() %></td>
								<td><%= v.getMotivo_viaje() %></td>
								<td><%= v.getMonto_estipulado() %></td>
								<td><input value="<%= v.getIdvale() %>" name="aceptado" type="radio" 
								value="<%= Estado.autorizado %>" ></td>
								<td><input value="<%= v.getIdvale() %>" name="rechazado" type="radio" 
								value="<%= Estado.rechazado %>" ></td>
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
	</center>
</body>
</html>