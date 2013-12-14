<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@page import="cl.tds.controlvales.beans.Departamento"%>
<%@page import="cl.tds.controlvales.controller.DepartamentoController"%>
<%@page import="cl.tds.controlvales.util.NumberUtil"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.Rut.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
<title>Administrar centro de costo</title>
<style>
	.content{width: 100%; height: auto; background-color: #EBEAE8; padding: 30px 12px;}
	.note {
		background-color: #ffffff; 
		padding: 10px 0; 
		color: #333333; 
				border-radius:5px; 
		   -moz-border-radius:5px; 
		-webkit-border-radius:5px;
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);
	       -moz-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.2);
	}
</style>
</head>
<body>
<%
if( session.getAttribute("login") != null ){
	Usuario login = (Usuario ) session.getAttribute("login");
	if( login.getPerfil().equals(Perfil.administrador) ){
%>
<script>
	$("form").validate();
</script>
<div class="row">
	<h1 class="text-center">Administrar centro de costo</h1>
	<p class="note text-center">Por favor ingrese la siguiente informaci&oacute;n</p>
</div>
<%
	CentroCosto centroCosto = (CentroCosto ) request.getSession().getAttribute("centroCosto");
	if( centroCosto != null ){
%>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<form class="vform" id="form" name="form" method="post"
						action="ModificarCentroDeCostoServlet">
						<p id="error"></p>
							<input type="hidden" value="<%= centroCosto.getIdcentro_costo() %>"
							name="id" />
							<label>Nombre </label>
							<input type="text" name="nombre" id="nombre" 
							value="<%= centroCosto.getNombre() %>" /> 
							<label>Descrici&oacute;n </label> 
							<input type="text" name="descripcion" id="descripcion"
							value="<%= centroCosto.getDescripcion() %>" />
						<%
							DepartamentoController departamentoController = new DepartamentoController();
											List<Departamento> departamentos = 
													departamentoController.obtenerListaDepartamentos();
											if( departamentos != null && departamentos.size() != 0 ){
						%>
						<label>Departamento</label> <select size=1 name="departamento">
							<%
								for( Departamento d : departamentos ){
											if( centroCosto.getDepartamento() != null 
													&& centroCosto.getDepartamento().getIddepartamento() == d.getIddepartamento() ){
							%>
							<option value="<%= d.getIddepartamento() %>" selected="selected">
								<%= d.getNombre() %>
							</option>
							<%
								}else{
							%>
							<option value="<%= d.getIddepartamento() %>"><%= d.getNombre() %></option>
							<%
								}
										}
							%>
						</select>
						<%
							}
						%>
						<button type="submit">Actualizar centro de costo</button>
					</form>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div class="row">
		<div class="row space-bot">
			<div class="c4 centered first">
				<p class="note text-center">
					<a href="index.jsp">Volver al inicio</a>
				</p>
			</div>
		</div>	
	</div>
</div>
<script>
	var validator = new FormValidator(
			'form',
			[ {
				name : 'nombre',
				rules : 'required'
			}],
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
<%
	}
}
%>
</body>
</html>