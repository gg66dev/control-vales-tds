<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<%@ page import="cl.tds.controlvales.util.NumberUtil"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Detalle vale</title>
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
</head>
<body>
<%
if( session.getAttribute("login") != null ){
	Usuario login = (Usuario ) session.getAttribute("login");
	if( login.getPerfil().equals(Perfil.usuario) ){
%>
	<div class="row">
		<h1 class="text-center">Detalle Vale</h1>
	</div>
	<div class="content">
		<div class="grid">
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<p class="note text-center">Seleccione si quiere autorizar o rechazar el vale</p>
					<%
						String id = request.getParameter("id_vale");
						ValeController valeController = new ValeController();
						Vale v = valeController.obtenerVale(Long.parseLong(id));
						request.getSession().setAttribute("vale", v);
					%>
					<form id="form" name="form" method="post"
						action="AutorizarValeServlet">
						<table>
							<tr>
								<th>Campo</th>
								<th>Valor</th>
							</tr>
							<tr>
								<td>Folio</td>
								<td><%=v.getFolio()%></td>
							</tr>
							<tr>
								<td>Fecha de Uso</td>
								<td><%=v.getFecha_uso()%></td>
							</tr>
							<tr>
								<td>Origen</td>
								<td><%=v.getOrigen()%></td>
							</tr>
							<tr>
								<td>Destino</td>
								<td><%=v.getDestino()%></td>
							</tr>
							<tr>
								<td>Motivo de viaje</td>
								<td><%=v.getMotivo_viaje()%></td>
							</tr>
							<tr>
								<td>Monto estipulado</td>
								<td><%=v.getMonto_estipulado()%></td>
							</tr>
							<%
								if (v.getEstado() == Estado.consolidado) {
							%>
							<tr>
								<td>Monto real</td>
								<td><%=v.getMonto_real()%></td>
							</tr>
							<tr>
								<td>Fecha Confirmacion</td>
								<td><%=v.getFecha_confirmacion()%></td>
							</tr>
							<tr>
								<td>Estado</td>
								<td>Consolidado</td>
							</tr>
							<%
								} else if (v.getEstado() == Estado.autorizado) {
							%>
							<tr>
								<td>Monto real</td>
								<%
									if( NumberUtil.isInteger( String.valueOf( v.getMonto_real() ) ) ){
								%>
									<td><%= v.getMonto_real() %></td>
								<%
									} else {
								%>
									<td>A&uacute;n no se ha ingresado el monto</td>
								<%
									}
								%>
							</tr>
							<%
								} else if (v.getEstado() == Estado.abierto) {
							%>
							<tr>
								<td>Monto real</td>
								<td>El vale a&uacute;n no ha sido autorizado</td>
							</tr>
							<tr>
								<td colspan=2 class="text-center">
									Autorizar <input value="aceptado" name="autorizar" type="radio">
									Rechazar <input value="rechazado" name="autorizar" type="radio">
								</td>
							</tr>
							<%
								} else if (v.getEstado() == Estado.rechazado) {
							%>
							<tr>
								<td>Monto real</td>
								<td>El vale a sido rechazado</td>
							</tr>
							<%
								} else {
							%>
							<tr>
								<td>Monto real</td>
								<td>Problema al mostrar el vale</td>
							</tr>
							<%
								}
							%>
							<tr>
								<td colspan=2 class="text-center"><button type="submit">Enviar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
		</div>
		<div class="row">
			<p class="note text-center">
				<a href="autorizarVales.jsp">Volver</a>
			</p>
			<p class="note text-center">
				<a href="index.jsp">Inicio</a>
			</p>
		</div>
	</div>
<%
	}
}
%>
</body>
</html>