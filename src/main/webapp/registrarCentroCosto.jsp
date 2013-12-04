<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.controller.DepartamentoController"%>
<%@page import="cl.tds.controlvales.beans.Departamento"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Registrar Centro de costo</title>
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.validate.js"></script>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post"
				action="RegistrarCentroDeCostoServlet">
				<h1>Registro de centros de costo</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Nombre <span class="small">Nombre del centro
						de costo</span>
				</label> <input type="text" name="nombre" id="nombre" required /> <label>Descripci&oacute;n
					<span class="small">Descripci&oacute;n</span>
				</label> <input type="text" name="descripcion" id="descripcion" /> <label>Departamento
					<span class="small">Departamento</span>
				</label>
				<%
					DepartamentoController deptoController = new DepartamentoController();
					List<Departamento> departamentos = deptoController
							.listarDepartamentos();
					if (departamentos != null && departamentos.size() != 0) {
				%>
				<select size="1" name="departamento">
					<%
						for (Departamento d : departamentos) {
					%>
					<option value="<%=d.getIddepartamento().toString()%>"><%=d.getNombre()%></option>
					<%
						}
					%>
				</select>
				<%
					}
				%>
				<button type="submit">Registrar</button>
				<div class="spacer"></div>

			</form>
		</div>
	</center>
</body>
</html>