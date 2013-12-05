<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Consultar Vale</title>
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#desde,#hasta").datepicker(
							{
								dateFormat : "dd/mm/yy",
								dayNames : [ "Domingo", "Lunes", "Martes",
										"Miércoles", "Jueves", "Viernes",
										"Sábado" ],
								dayNamesMin : [ "Do", "Lu", "Ma", "Mi", "Ju",
										"Vi", "Sa" ],
								monthNames : [ "Enero", "Febrero", "Marzo",
										"Abril", "Mayo", "Junio", "Julio",
										"Agosto", "Septiembre", "Octubre",
										"Noviembre", "Diciembre" ],
								monthNamesShort : [ "Ene", "Feb", "Mar", "Abr",
										"May", "Jun", "Jul", "Ago", "Sep",
										"Oct", "Nov", "Dic" ]
							});
				});
	</script>
	<center>
		<form method="post" action="ConsultaValesUsuarioServlet">
			<table>
				<tr>
					<td><input
						onclick="document.getElementById('desde').disabled = false;
					document.getElementById('hasta').disabled = false;
					document.getElementById('folio').disabled = true;
					document.getElementById('estado').disabled = true;"
						type="radio" name="opcion" value="fecha"> Fecha<br></td>
					<td><input
						onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('folio').disabled = false;
					document.getElementById('estado').disabled = true;"
						type="radio" name="opcion" value="folio"> Folio<br></td>
					<td><input
						onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('folio').disabled = true;
					document.getElementById('estado').disabled = false;"
						type="radio" name="opcion" value="estado"> Estado<br></td>
					<!-- <td><input type="radio" name="opcion" value="estado"> Estado<br></td> -->
					<td><input type="submit" value="Filtrar"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">Folio</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input id="folio" type="text"
						name="folio" size="35" disabled="disabled"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">Estado</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><SELECT id="estado"
						name="estado" SIZE="1" disabled="disabled">
							<OPTION value="abierto">abierto</OPTION>
							<OPTION value="autorizado">autorizado</OPTION>
							<OPTION value="rechazado">rechazado</OPTION>
							<OPTION value="consolidado">consolidado</OPTION>
					</SELECT>
				</tr>
				<tr>
					<td colspan="4" align="center">Fecha</td>
				</tr>
				<tr>
					<td colspan="2">Desde <input id="desde" type="text"
						name="desde" disabled="disabled"></td>
					<td colspan="2">Hasta <input id="hasta" type="text"
						name="hasta" disabled="disabled"></td>
				</tr>
			</table>
		</form>
		<%
			@SuppressWarnings("unchecked")
			List<Vale> vales = (List<Vale>) request.getSession().getAttribute(
					"vales");
			if (vales != null) {
		%>
		<form method="post" action="confirmarValorVale.jsp">
		<table>
			<tr>
				<th></th>
				<th>Folio</th>
				<th>Fecha de Uso</th>
				<th>Motivo de viaje</th>
			</tr>
			<%
				for (Vale v : vales) {
			%>
			<tr>
				<td><input value="<%=v.getIdvale()%>" name="id_vale"
					type="radio" width=10 checked></td>
				<td><%=v.getFolio()%></td>
				<td><%=v.getFecha_uso()%></td>
				<td><%=v.getMotivo_viaje()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<INPUT type="submit" value="Ingresar valor del vale">
		</form>
		<%
			} else {
		%>
		<p>No hay vales para confirmar</p>
		<%
			}
		%>
		<br/>
		<a href="index.jsp">index</a><br />
	</center>
</body>
</html>