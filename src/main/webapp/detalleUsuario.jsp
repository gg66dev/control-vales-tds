<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.controller.UsuarioController"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@page import="cl.tds.controlvales.util.NumberUtil"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.Rut.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
<title>Administrar usuario</title>
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
<div class="row">
	<h1 class="text-center">Administrar usuario</h1>
	<p class="note text-center">Por favor ingrese la siguiente informaci&oacute;n</p>
</div>
<%
	Usuario usuario = (Usuario ) request.getSession().getAttribute("usuario");
	if( usuario != null ){
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
							id="domicilio" value="<%= usuario.getDomicilio() %>" /> <label>Perfil
						</label> <select size=1 name="perfil">
							<%
								for( Perfil p : Perfil.values() ) {
											if( usuario.getPerfil().equals(p) ) {
							%>
							<option value="<%= p.toString().toLowerCase() %>"
								selected="selected">
								<%= p.toString() %>
							</option>
							<%
								}else{
							%>
							<option value="<%= p.toString().toLowerCase() %>"><%= p.toString() %></option>
							<%
								}
										}
							%>
						</select>
						<%
							CentroCostoController centroCostoController = new CentroCostoController();
											List<CentroCosto> centroCostos = centroCostoController.listarCentroCostos();
											if( centroCostos != null && centroCostos.size() != 0 ){
						%>
						<label>Centro de costo</label> <select size=1 name="centro_costo">
							<%
								for( CentroCosto c : centroCostos ){
											if( usuario.getCentroCosto() != null && usuario.getCentroCosto().equals(c) ){
							%>
							<option value="<%= c.getIdcentro_costo() %>" selected="selected">
								<%= c.getNombre() %>
							</option>
							<%
								}else{
							%>
							<option value="<%= c.getIdcentro_costo() %>"><%= c.getNombre() %></option>
							<%
								}
										}
							%>
						</select>
						<%
							}
						%>
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
<script>
	var validator = new FormValidator(
			'form',
			[ {
				name : 'nombre',
				rules : 'required'
			}, {
				name : 'usuario',
				rules : 'required'
			}, {
				name : 'email',
				rules : 'required'
			}, {
				name : 'rut',
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