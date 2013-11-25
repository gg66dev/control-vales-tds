<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Empresa"%>
<%@page import="cl.tds.controlvales.controllers.EmpresaController"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Solicitar Vale</title>
</head>
<body>
	<center>
		<%
			EmpresaController empresaController = new EmpresaController();
			List<Empresa> empresas = empresaController.listarEmpresas();
			if (empresas != null) {
		%>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post"
				action="SolicitarValeServlet">
				<h1>Solicitar Vale</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Fecha de Uso <span class="small">24/01/2013</span></label> <input
					type="text" name="fecha_uso" id="fecha_uso" /> <label>Origen
					<span class="small">Origen</span>
				</label> <input type="text" name="origen" id="origen" /> <label>Destino
					<span class="small">Destino</span>
				</label> <input type="text" name="destino" id="destino" /> <label>Motivo
					de viaje <span class="small">Motivo de viaje</span>
				</label> <input type="text" name="motivo" id="motivo" /> <label>Monto
					estipulado<span class="small">Monto estipulado</span>
				</label> <input type="text" name="monto_estipulado" id="monto_estipulado" /><label>Empresa
					<span class="small">Empresa </span>
				</label> 
					<SELECT NAME="empresa" SIZE="1">
						<%
							for (Empresa e : empresas) {
						%>
						<OPTION VALUE="<%=e.getIdempresa()%>"><%=e.getNombre()%></OPTION>
						<%
							}
						%>
					</SELECT>
				<button type="submit">Solicitar Vale</button>
				<div class="spacer"></div>

			</form>
		</div>
		<%
			} else {
		%>
		<b> Debe registrar al menos una empresa antes de solicitar un
			vale.</b>
		<%
			}
		%>
	</center>
</body>
</html>