<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="cl.tds.controlvales.beans.Usuario"%>
<%@page import="cl.tds.controlvales.beans.Perfil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
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
<title>Inicio</title>
</head>
<body>
<%
	//para que al seleccionar una vista no inicie con el resultado de otra
	//vista la cual no tiene relacion
	if (session.getAttribute("vales") != null)
		session.removeAttribute("vales");
	if(session.getAttribute("valesXlsCorrectos") != null)
		session.removeAttribute("valesXlsCorrectos");
	if(session.getAttribute("valesXlsErroneos") != null)
		session.removeAttribute("valesXlsErroneos");
	if(session.getAttribute("valesXlsInexistente") != null)
		session.removeAttribute("valesXlsInexistente");
	if(session.getAttribute("centroCosto") != null)
		session.removeAttribute("centroCosto");
	if(session.getAttribute("departamento") != null)
		session.removeAttribute("departamento");
	if(session.getAttribute("usuario") != null)
		session.removeAttribute("usuario");
	
	Usuario login = null;
	if (session.getAttribute("login") != null) {
		login = (Usuario) session.getAttribute("login");
%>
<div class="row space-bot">
	<h1 class="text-center">Bienvenido</h1>
	<p class="text-center">Usted ha ingresado como <b><%=login.getNombre()%></b> </p>
</div> 
<%
	if( login.getPerfil().equals(Perfil.usuario)){
%>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="modificarUsuario.jsp">
							Modificar mis datos
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="consultarVales.jsp">
							Consultar Vales
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="solicitarVale.jsp">
							Solicitar Vales
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="logout.jsp">
							Logout
						</a>
					</p>
				</div>
			</div>
		</div> <!-- fin row -->
	</div> <!-- fin grid -->
</div> <!-- fin content -->
<%
	}else if( login.getPerfil().equals(Perfil.administrador)){
%>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="modificarUsuario.jsp">
							Modificar mis datos
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="registrarCentroCosto.jsp">
							Crear Centro de costo
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="registrarDepartamento.jsp">
							Crear Departamento
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="registrarUsuario.jsp">
							Crear Usuario
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="administrarCentroCostos.jsp">
							Administrar Centros de costos
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="administrarDepartamentos.jsp">
							Administrar Departamentos
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="administrarUsuarios.jsp">
							Administrar Usuarios
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="ingresoPlanilla.jsp">
							Ingresar Planilla
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="logout.jsp">
							Logout
						</a>
					</p>
				</div>
			</div>
		</div> <!-- fin row -->
	</div> <!-- fin grid -->
</div> <!-- fin content -->
<%
	}else if( login.getPerfil().equals(Perfil.gerente)){
%>
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="modificarUsuario.jsp">
							Modificar mis datos
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="autorizarVales.jsp">
							Autorizar Vales
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="consolidacionVales.jsp">
							Consolidaci&oacute;n de Vales
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="moduloInformes.jsp">
							Informes
						</a>
					</p>
				</div>
			</div>
			<div class="row space-bot">
				<div class="c4 centered first">
					<p class="note text-center">
						<a href="logout.jsp">
							Logout
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
<div class="row space-top space-bot">
	<p class="note text-center">
		No tiene perfil
	</p>
</div>

<%	
	}
} else {
	response.sendRedirect("login.jsp");
}
%>
</body>
</html>
