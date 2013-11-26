<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cl.tds.controlvales.controllers.UsuarioController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Home</title>
</head>
<body>
	<center>
		<div id="mystyle">
			<h1>Bienvenido</h1>
			<%= new Date() %>
			<%
				Usuario usuario = null;
				if (session.getAttribute("usuario") != null) {
					usuario = (Usuario) session.getAttribute("usuario");
			%>
			<b><%=usuario.getUsuario()%></b> <br /> <a href="logout.jsp">Logout</a>
			<br /> <a href="solicitarVale.jsp">Solicitar un Vale</a>
			<br /> <a href="registrarEmpresa.jsp">Registrar una empresa</a>
			<%
				} else {
			%>
			<br /> <b>Para ingresar al sistema <a href="login.jsp">Haz
					click aqu&iacute;</a></b>
			<%
				}
			%>
		
		 <h3>usuario</h3>
		 <a href=>solicitar vales</a> (Requiere estar logeado, esta disponible si se logean)<br/>
		 <a href=>confirmar valor de vale</a><br/>
		 <a href=>consultar vale de usuarios</a><br/>
		
		 <h3>administrador</h3>			
		 <a href="userlist.jsp">Listar Usarios Registrados (administrar cuentas)</a><br/>
		 <a href=>Ingresar centro de costo</a><br/>
		 <a href=>Mostrar centro de costo</a><br/>
		 <a href=>Ingresar Planilla</a><br/>
		 
		 <h3>gerente</h3>
		 <a href=>Consulta de vales</a><br/>
		 <a href=>autorizar vales</a><br/>
		 <a href=>informes</a><br/>
		 <a href=>consolidacion de vales</a><br/>
		 <a href=>detalle vale radio taxi</a><br/>
		 
		</div>
	</center>
</body>
</html>
