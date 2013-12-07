<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.Rut.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
<title>Administrar usuario</title>
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
	<center>
		<%
			String id = request.getParameter("usuario");
			if( id != null && NumberUtil.isLong(id) ){
				UsuarioController uc = new UsuarioController();				
				Usuario usuario = uc.obtenUsuario(Long.parseLong(id));
				if( usuario != null ){
		%>
		<form class="vform" id="form" name="form" method="post"
			action="ModificarUsuarioServlet">
			<h1 class="text-center">Administrar usuario</h1>
			<p>Por favor ingrese la siguiente informaci&oacute;n</p>
			<p id="error"></p>

			<input type="hidden" value="<%= usuario.getIdusuario() %>" name="id" />
			<label>Nombre </label> <input type="text" name="nombre" id="nombre" 
				value="<%= usuario.getNombre() %>"/>
			<label>Nombre de usuario </label> <input type="text" name="usuario"
				id="usuario" value="<%= usuario.getUsuario() %>"/>
			<label>Email</label> <input type="text" name="email" id="email" 
				value="<%= usuario.getEmail() %>" /> 
			<label>Rut</label> <input type="text" name="rut" id="rut" 
				value="<%= usuario.getRut() %>" /> 
			<label>Perfil </label> <select size=1 name="perfil">
				<%
					for( Perfil p : Perfil.values() ) {
						if( usuario.getPerfil().equals(p) ) {
				%>
					<option value="<%=p.toString().toLowerCase()%>" selected="selected">
						<%=p.toString()%>
					</option>
				<%
						}else{
				%>
					<option value="<%=p.toString().toLowerCase()%>"><%=p.toString()%></option>
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
					<option value="<%=c.getIdcentro_costo()%>" selected="selected">
						<%=c.getNombre()%>
					</option>
				<%
						}else{
				%>
					<option value="<%=c.getIdcentro_costo()%>"><%=c.getNombre()%></option>
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
		<%
			}
			}
		%>
		<br/>
		<a href="index.jsp">volver</a><br />
	</center>
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