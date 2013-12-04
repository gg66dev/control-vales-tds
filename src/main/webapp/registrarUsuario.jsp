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
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Registro</title>
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery.Rut.js"></script>
<script src="./js/jquery.validate.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(
		function() {
			$('#rut').Rut({
				  on_error: function(){ alert('Rut incorrecto'); }
				});
		});
</script>
<script>
$("form").validate();
</script>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post" action="RegistrarUsuarioServlet">
				<h1>Registro</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Su nombre <span class="small">Nombre</span>
				</label> <input type="text" name="nombre" id="nombre" required /> <label>Nombre
					de usuario <span class="small">Nombre de usuario</span>
				</label> <input type="text" name="usuario" id="usuario" required /> <label>Password
					<span class="small">M&iacute;n. 6 letras</span>
				</label> <input type="password" name="password1" id="password1" required /> <label>Repita
					password
				</label> <input type="password" name="password2" id="password2" required /> <label>Email
					<span class="small">Ej: eric20@gmail.com</span>
				</label> <input type="text" name="email" id="email" required /> <label>Rut <span
					class="small">156663557</span>
				</label> <input type="text" name="rut" id="rut" required /> <label>Perfil <span
					class="small">Perfil de usuario</span>
				</label>
				<select size=1 name="perfil">
				<%
					for(Perfil p : Perfil.values()){
						%>
						<option value ="<%= p.toString().toLowerCase() %>"><%= p.toString() %></option>
						<%
					}
				%>
				</select>
				<%
					CentroCostoController centroCostoController = new CentroCostoController();
					List<CentroCosto> centroCostos = centroCostoController.listarCentroCostos();
					if( centroCostos != null && centroCostos.size() != 0 ){
						%>
						<label>Centro de costo <span class="small">Centro de costo</span></label>
						<select size=1 name="centro_costo">
						<%
							for( CentroCosto c : centroCostos ){
						%>
						<option value ="<%= c.getIdcentro_costo() %>"><%= c.getNombre() %></option>
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