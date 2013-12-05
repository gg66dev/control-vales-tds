<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Confirmar valor del vale</title>
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
			<h1>Confirmar Valor del Vale</h1>
			<p>Por favor ingrese el valor del monto real</p>
			<%
				String id = request.getParameter("id_vale");
				ValeController valeController = new ValeController();
				Vale v = valeController.obtenerVale(Long.parseLong(id));
				request.getSession().setAttribute("vale", v);
			%>
			<label>Folio </label><label><%=v.getFolio()%></label> 
			<label>Fecha de Uso </label> <label><%=v.getFecha_uso()%> </label> 
			<label>Origen </label><label><%=v.getOrigen()%></label>
			<label>Destino </label><label><%=v.getDestino()%></label>
			<label>Motivo de viaje </label><label><%=v.getMotivo_viaje()%></label>
			<label>Monto estipulado </label><label><%=v.getMonto_estipulado()%></label>
	
			<% if(v.getEstado() == Estado.consolidado){%>
				<label>Monto Real </label><label><%=v.getMonto_real()%></label>
				<label>Fecha Confirmacion </label><label><%=v.getFecha_confirmacion()%></label>
			<%}else if(v.getEstado() == Estado.autorizado){ %>
				<form id="form" name="form" method="post" action="ConfirmarMontoServlet">
				<label>monto Real </label><input type="text" name="monto_real" id="monto_real" />
				<button type="submit">Confirmar Valor</button>
				</form>
			<%}else if(v.getEstado() == Estado.abierto){%>
				 <label><p></p>El vale aun no ha sido autorizado</label>
			<%}else if(v.getEstado() == Estado.rechazado){ %>
				<label><p></p> El vale a sido rechazado</label>
			<%} else{%>
				<label><p></p> Problema al mostrar el vañe</label>
			<%}%>
			 
			<div class="spacer"></div></br>
			<a href="consultarVales.jsp">Volver</a><br />
			<a href="index.jsp">index</a><br />
		</div>
	</center>
</body>
</html>