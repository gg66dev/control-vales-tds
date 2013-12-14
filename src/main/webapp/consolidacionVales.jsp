<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.util.ValeXls"%>
<%@page import="cl.tds.controlvales.util.FileXlsUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>

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
<%
if( session.getAttribute("login") != null ){
	Usuario login = (Usuario ) session.getAttribute("login");
	if( login.getPerfil().equals(Perfil.gerente) ){
%>
<body>
	<center>
		<form class="vform" id="form" name="form" method="post"
			action="ProcesarPlanillaServlet">
			<h1 class="text-center">Consolidaci&oacute;n de vales</h1>
			<p>Por favor seleccionar el mes a cargar</p>

			<%
				@SuppressWarnings("unchecked")
				List<ValeXls> valesCorrectos = (List<ValeXls>) request.getSession()
						.getAttribute("valesXlsCorrectos");
				@SuppressWarnings("unchecked")
				List<ValeXls> valesErroneos = (List<ValeXls>) request.getSession()
					.getAttribute("valesXlsErroneos");
				@SuppressWarnings("unchecked")
				List<ValeXls> valesInexistente = (List<ValeXls>) request
					.getSession().getAttribute("valesXlsInexistente");
				
				//if(valesCorrectos.isEmpty()) valesCorrectos = null; 
				//if(valesErroneos.isEmpty()) valesErroneos = null;
				//if(valesInexistente.isEmpty()) valesInexistente = null;
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
			if (valesCorrectos != null && !valesCorrectos.isEmpty()) {
		%>
		<h4 class="text-center">Vales Correctos</h4>
		<form method="post" action="detalleConsolidado.jsp">
			<table>
				<%
					if (valesCorrectos != null) {
				%>
				<tr>
					<th></th>
					<th class="text-center">folio</th>
					<th class="text-center">Fecha de Uso</th>
					<th class="text-center">monto</th>
				</tr>
				<%
					for (ValeXls v : valesCorrectos) {
				%>
				<tr>
					<td><input type="radio" name="valor_valexls"
						value="<%=v.folio + "+" + v.fecha + "+" + v.monto%>"></td>
					<td class="text-center"><%=v.folio%></td>
					<td class="text-center"><%=v.fecha%></td>
					<td class="text-center"><%=v.monto%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan=7 class="text-center"><button type="submit">Ver
							detalle</button></td>
				</tr>
				<%
			}
		%>
			</table>
		</form>
		<%
			}
			if (valesErroneos != null && !valesErroneos.isEmpty()) {
		%>
		<h4 class="text-center">Vales cuyo monto no coincide</h4>
		<form method="post" action="detalleConsolidado.jsp">
			<table>
				<%
					if (valesErroneos != null) {
				%>
				<tr>
					<th></th>
					<th class="text-center">folio</th>
					<th class="text-center">Fecha de Uso</th>
					<th class="text-center">monto</th>
				</tr>
				<%
					for (ValeXls v : valesErroneos) {
				%>
				<tr>
					<td><input type="radio" name="valor_valexls"
						value="<%=v.folio + "+" + v.fecha + "+" + v.monto%>"></td>
					<td class="text-center"><%=v.folio%></td>
					<td class="text-center"><%=v.fecha%></td>
					<td class="text-center"><%=v.monto%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan=7 class="text-center"><button type="submit">Ver
							detalle</button></td>
				</tr>
				<%
			}
		%>
			</table>
		</form>
		<%
			}
			if (valesInexistente != null && !valesInexistente.isEmpty()) {
		%>
		<h4 class="text-center">Vales que no estan en la base de datos</h4>
		<table>
				<%
					if (valesInexistente != null) {
				%>
				<tr>
					<th class="text-center">folio</th>
					<th class="text-center">Fecha de Uso</th>
					<th class="text-center">monto</th>
				</tr>
				<%
					for (ValeXls v : valesInexistente) {
				%>
				<tr>
					<td class="text-center"><%=v.folio%></td>
					<td class="text-center"><%=v.fecha%></td>
					<td class="text-center"><%=v.monto%></td>
				</tr>
				<%
					}
			}
		%>
		</table>
		<%
			}
		%>
	<br /> <a href="index.jsp">Inicio</a><br />
	</center>
<%
	}
}
%>
</body>
</html>