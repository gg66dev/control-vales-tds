<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.controller.DepartamentoController"%>
<%@page import="cl.tds.controlvales.beans.Departamento"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Registrar Centro de costo</title>
<script src="./js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
</head>
<body>
	<center>
		<form class="vform" id="form" name="form" method="post"
			action="RegistrarCentroDeCostoServlet">
			<h1 class="text-center">Registro de centros de costo</h1>
			<p>Por favor ingrese la siguiente informaci&oacute;n</p>
			<p id="error"></p>

			<label>Nombre </label> <input type="text" name="nombre" id="nombre" />
			<label>Descripci&oacute;n </label> <input type="text"
				name="descripcion" id="descripcion" /> <label>Departamento
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
		</form>
		<br /> <a href="index.jsp">Inicio</a><br />
	</center>
	<script>
		var validator = new FormValidator(
				'form',
				[ {
					name : 'nombre',
					rules : 'required'
				}, {
					name : 'departamento',
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