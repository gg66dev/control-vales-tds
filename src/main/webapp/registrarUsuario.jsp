<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Registro</title>
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.Rut.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
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
		<form class="vform" id="form" name="form" method="post"
			action="RegistrarUsuarioServlet">
			<h1 class="text-center">Registro</h1>
			<p>Por favor ingrese la siguiente informaci&oacute;n</p>
			<p id="error"></p>

			<label>Su nombre </label> <input type="text" name="nombre"
				id="nombre" /> <label>Nombre de usuario </label> <input type="text"
				name="usuario" id="usuario" /> <label>Password </label> <input
				type="password" name="password1" id="password1" /> <label>Repita
				password </label> <input type="password" name="password2" id="password2" />
			<label>Email </label> <input type="text" name="email" id="email"
				placeholder="eric20@gmail.com" /> <label>Rut </label> <input
				type="text" name="rut" id="rut" placeholder="156663557" /> <label>Perfil
			</label> <select size=1 name="perfil">
				<%
					for(Perfil p : Perfil.values()){
				%>
				<option value="<%=p.toString().toLowerCase()%>"><%=p.toString()%></option>
				<%
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
				%>
				<option value="<%=c.getIdcentro_costo()%>"><%=c.getNombre()%></option>
				<%
					}
				%>
			</select>
			<%
				}
			%>
			<button type="submit">Registrar</button>

		</form>
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
					name : 'password1',
					display : 'password',
					rules : 'required'
				}, {
					name : 'password2',
					display : 'repita password',
					rules : ('required', 'matches[password1]')
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