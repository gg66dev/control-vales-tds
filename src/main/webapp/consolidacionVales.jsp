<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.util.ValeXls"%>
<%@page import="cl.tds.controlvales.util.FileXlsUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Consolidaci&oacute;n de vales</title>
<script src="./js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
</head>
<body>
	<center>
		<form class="vform" id="form" name="form" method="post"
			action="ProcesarPlanillaServlet">
			<h1 class="text-center">Consolidaci&oacute;n de vales</h1>
			<p>Por favor seleccionar el mes a cargar</p>

			<%
				@SuppressWarnings("unchecked")
				List<ValeXls> vales = (List<ValeXls>) request.getSession()
						.getAttribute("valesXls");
			%>

			<select size="1" name="mes-consulta">
				<%
					ArrayList<String> fileList;
					FileXlsUtil f = new FileXlsUtil();
					fileList = f.getListXlsFile();
					for (String fileName : fileList) {
				%>
				<option value="<%=fileName%>"><%=fileName%></option>
				<%
					}
				%>
			</select>

			<button type="submit">Cargar</button>
		</form>
		<%
			if (vales != null) {
		%>

		<form method="post" action="detalleConsolidado.jsp">
		<table>
			<tr>
				<th></th>
				<th class="text-center">folio</th>
				<th class="text-center">Fecha de Uso</th>
				<th class="text-center">monto</th>
			</tr>
			<%
				for (ValeXls v : vales) {
			%>
			<tr>
				<td><input type="radio" name="valor_valexls"
					value="<%=v.folio +"+"+ v.fecha +"+"+v.monto%>"></td>
				<td class="text-center"><%=v.folio%></td>
				<td class="text-center"><%=v.fecha%></td>
				<td class="text-center"><%=v.monto%></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan=7 class="text-center"><button type="submit">Ver detalle</button></td>
			</tr>
		</table>
		</form>

		<%
			}
		%>

		<br /> <a href="index.jsp">Inicio</a><br />
	</center>
</body>
</html>