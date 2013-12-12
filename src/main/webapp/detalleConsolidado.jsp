<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<%@ page import="cl.tds.controlvales.util.NumberUtil"%>
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
	<div class="row">
		<h1 class="text-center">Detalle Vale</h1>
	</div>
	<div class="content">
		<div class="grid">
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<%
						String valeXls = request.getParameter("valor_valexls");
						if (valeXls != null) {
							String[] array = valeXls.split("\\+");
							String folio = array[0];
							folio = folio.split("\\.")[0];
							String fecha_uso = array[1];
							String monto = array[2];
							ValeController valeController = new ValeController();
							Vale v = valeController.obtenerValeFolio(Long.parseLong(folio));
					%>
					<table>
						<tr>
							<th>Campo</th>
							<th>Valor</th>
						</tr>
						<tr>
							<td>Empleado</td>
							<td><%=v.getUsuario().getNombre()%></td>
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
						<tr>
							<td>Datos Entregados</td>
							<td>
								Fecha de uso	<%=fecha_uso %> <br/>
								monto registrado <%=monto %>
							</td>
						</tr>

						<%
							}
						} else {
						%>
						<tr>
							<td>Problema al mostrar el vale</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
				<div class="c4 last"></div>
			</div>
		</div>
		<div class="row">
			</p>
			<p class="note text-center">
				<a href="consolidacionVales.jsp">volver</a>
			</p>
			<p class="note text-center">
				<a href="index.jsp">Inicio</a>
			</p>
		</div>
	</div>
</body>
</html>