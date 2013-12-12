<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.controller.UsuarioController"%>
<%@page import="cl.tds.controlvales.util.NumberUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Opciones</title>
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
<div class="row space-bot">
	<h1 class="text-center">Administrar Usuarios</h1>
	<p class="text-center">Por favor escoga una opci&oacute;n </p>
</div>
<%
	String id = request.getParameter("usuario");
	if( id != null && NumberUtil.isLong(id) ){
		UsuarioController uc = new UsuarioController();				
		Usuario usuario = uc.obtenUsuario(Long.parseLong(id));
		if( usuario != null ){
			request.getSession().setAttribute("usuario", usuario);
%>
<hr>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="detalleUsuario.jsp">
							Modificar Usuario
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="eliminarUsuario.jsp">
							Eliminar usuario
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="index.jsp">
							Volver al inicio
						</a>
					</p>
				</div>
			</div>
		</div> <!-- fin row -->
	</div> <!-- fin grid -->
</div> <!-- fin content -->
<%
		}else{
%>
<div class="row">
	<p class="note text-center">
		Usuario no encontrado
	</p>
</div>
<%
		}
	}
%>
</body>
</html>