<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.controller.UsuarioController"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@page import="cl.tds.controlvales.controller.CentroCostoController"%>
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
<title>Modificar datos</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		$('#rut').Rut({
			on_error : function() {
				alert('Rut incorrecto');
			}
		});
	});
</script>
<script>
	$("form").validate();
</script>
<div class="row space-bot">
	<h1 class="text-center">Modificar datos</h1>
	<p class="text-center">Por favor rellene su informaci&oacute;n </p>
</div>
<%
	Usuario usuario = (Usuario ) request.getSession().getAttribute("login");
	if( usuario != null ){
		request.getSession().setAttribute("usuario", usuario);
%>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<form class="vform" id="form" name="form" method="post"
						action="ModificarUsuarioServlet">
						<p id="error"></p>
							<input type="hidden" value="<%= usuario.getIdusuario() %>"
							name="id" /> <label>Nombre </label> <input type="text"
							name="nombre" id="nombre" value="<%= usuario.getNombre() %>" /> <label>Nombre
							de usuario </label> <input type="text" name="usuario" id="usuario"
							value="<%= usuario.getUsuario() %>" /> <label>Email</label> <input
							type="text" name="email" id="email"
							value="<%= usuario.getEmail() %>" /> <label>Rut</label> <input
							type="text" name="rut" id="rut" value="<%= usuario.getRut() %>" />
						<label>Domicilio</label> <input type="text" name="domicilio"
							id="domicilio" value="<%= usuario.getDomicilio() %>" />
						<label>Password </label> 
							<input type="password" name="password1" id="password1" 
							value="<%= usuario.getPassword() %>"/> 
						<label>Repita password </label>
							<input type="password" name="password2" id="password2"
							value="<%= usuario.getPassword() %>"/> 
						<button type="submit">Actualizar usuario</button>
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
</body>
</html>