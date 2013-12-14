<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Listar centro de costos</title>
</head>
<body>
<%
if( session.getAttribute("login") != null ){
	Usuario login = (Usuario ) session.getAttribute("login");
	if( login.getPerfil().equals(Perfil.administrador) ){
%>
<div class="row space-bot">
	<h1 class="text-center">Administrar centro de costos</h1>
</div> 
	<div class="content">
		<div class="grid">
			<%
				if(session.getAttribute("centroCosto") != null)
					session.removeAttribute("centroCosto");
				CentroCostoController centroCostoController = new CentroCostoController();
				List<CentroCosto> list = centroCostoController.obtenerListaCentroCostos();
				if (!list.isEmpty()) {
			%>
			<hr>
			<div class="row space-bot">
				<div class="c2 first"></div>
				<div class="c8">
					<form name="form" method="post" action="opcionCentroCosto.jsp">
						<p class="note text-center">Por favor seleccione un centro de costo a
							modificar</p>
						<p id="error"></p>
						<table>
							<tr>
								<th class="text-center">Centro de costo</th>
								<th class="text-center">Nombre</th>
								<th class="text-center">Descripci&oacute;n</th>
							</tr>
							<%
								int i = 0;
									for (CentroCosto cc : list) {
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
									value="<%=cc.getIdcentro_costo()%>" name="centroCosto" type="radio">
								</td>
								<td class="text-center">
									<%=cc.getNombre()%>
								</td>
								<td class="text-center">
									<%=cc.getDescripcion()%>
								</td>
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
				<p class="note text-center">No hay departamentos registrados.</p>
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
<%
	}
}
%>
</body>
</html>