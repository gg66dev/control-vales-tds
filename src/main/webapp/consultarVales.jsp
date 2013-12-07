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
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
<title>Consultar Vale</title>
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#desde,#hasta").datepicker({
				dateFormat : "dd/mm/yy"
			});
		});
	</script>
	<center>
		<div class="c6 centered">
			<form class="vform" name="form" method="post"
				action="ConsultaValesUsuarioServlet">
				<h1 class="text-center">Consultar Vale</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>
				<p id="error"></p>
				<table>
					<tr>
						<td class="text-center"><input
							onclick="document.getElementById('desde').disabled = false;
					document.getElementById('hasta').disabled = false;
					document.getElementById('folio').disabled = true;
					document.getElementById('estado').disabled = true;"
							type="radio" name="opcion" value="fecha"> Fecha<br></td>
						<td class="text-center"><input
							onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('folio').disabled = false;
					document.getElementById('estado').disabled = true;"
							type="radio" name="opcion" value="folio"> Folio<br></td>
						<td class="text-center"><input
							onclick="document.getElementById('desde').disabled = true;
					document.getElementById('hasta').disabled = true;
					document.getElementById('folio').disabled = true;
					document.getElementById('estado').disabled = false;"
							type="radio" name="opcion" value="estado"> Estado<br></td>
						<td><button type="submit">Filtrar</button></td>
					</tr>
					<tr>
						<td colspan="4" class="text-center">Folio</td>
					</tr>
					<tr>
						<td colspan="4" class="text-center"><input id="folio" type="text"
							name="folio" size="35" disabled="disabled"></td>
					</tr>
					<tr>
						<td colspan="4" class="text-center">Estado</td>
					</tr>
					<tr>
						<td colspan="4" class="text-center"><SELECT id="estado"
							name="estado" SIZE="1" disabled="disabled">
								<OPTION value="abierto">abierto</OPTION>
								<OPTION value="autorizado">autorizado</OPTION>
								<OPTION value="rechazado">rechazado</OPTION>
								<OPTION value="consolidado">consolidado</OPTION>
						</SELECT>
					</tr>
					<tr>
						<td colspan="4" class="text-center">Fecha</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">Desde <input id="desde" type="text"
							name="desde" disabled="disabled"></td>
						<td colspan="2" class="text-center">Hasta <input id="hasta" type="text"
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
			<form name="form2" method="post" action="confirmarValorVale.jsp">
				<table>
					<tr>
						<th class="text-center"></th>
						<th class="text-center">Folio</th>
						<th class="text-center">Fecha de Uso</th>
						<th class="text-center">Motivo de viaje</th>
					</tr>
					<%
						for (Vale v : vales) {
					%>
					<tr>
						<td class="text-center"><input value="<%=v.getIdvale()%>" name="id_vale"
							type="radio" width=10 checked></td>
						<td class="text-center"><%=v.getFolio()%></td>
						<td class="text-center"><%=v.getFecha_uso()%></td>
						<td class="text-center"><%=v.getMotivo_viaje()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<button type="submit">Ingresar valor del Vale</button>
			</form>
		</div>
		<%
			} else {
		%>
		<p>No hay vales para confirmar</p>
		<%
			}
		%>
		<br /> <a href="index.jsp">index</a><br />
	</center>
	<script>
		var validator = new FormValidator(
				'form',
				[ {
					name : 'opcion',
					rules : 'required'
				} ],
				function(errors, event) {
					if (errors.length > 0) {
						var errorString = '';

						for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
						}

						document.getElementById('error').innerHTML = errorString;
					}
				});
	</script>
</body>
</html>