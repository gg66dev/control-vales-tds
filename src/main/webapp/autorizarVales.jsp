<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Vale" %>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
<title>Autorizar Vale</title>
</head>
<body>
	<center>
		<form class="vform" name="t_filtro" method="post" action="ConsultaValesServlet">
		<p id="error"></p>
			<table>
				<tr>
					<td><input type="radio" name="opcion" value="fecha"> Fecha<br></td>
					<td><input type="radio" name="opcion" value="rut"> Rut<br></td>
					<td><input type="radio" name="opcion" value="nombre"> Nombre<br></td>
					<!-- <td><input type="radio" name="opcion" value="estado"> Estado<br></td> -->
					<td><input type="submit" value="Filtrar"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">Nombre o rut</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<input id="texto" type="text" name="input" size="35">
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">Fecha</td>
				</tr>
				<tr>
					<td colspan="2">Desde <input id="desde" type="text" name="desde"></td>
					<td colspan="2">Hasta <input id="hasta" type="text" name="hasta"></td>
				</tr>
			</table>
		</form>
		<%
			@SuppressWarnings("unchecked")
			List<Vale> vales = ( List<Vale> )request.getSession().getAttribute("vales");
			if( vales != null ){
				%>
				<div class="row spce-bot">
			<div class="c8 centered">
				<form method="post" action="AutorizarValeServlet">
					<table>
						<tr class="text-center">
							<th class="text-center">Usuario</th>
							<th class="text-center">Fecha de Uso</th>
							<th class="text-center">Origen</th>
							<th class="text-center">Destino</th>
							<th class="text-center">Motivo de viaje</th>
							<th class="text-center">Monto estipulado</th>
							<th class="text-center">Aceptar</th>
							<th class="text-center">Rechazar</th>
						</tr>
						<%
						for ( Vale v : vales ){
							%>
							<tr class="text-center">
								<td class="text-center"><%= v.getUsuario().getNombre() %></td>
								<td class="text-center"><%= v.getFecha_uso() %></td>
								<td class="text-center"><%= v.getOrigen() %></td>
								<td class="text-center"><%= v.getDestino() %></td>
								<td class="text-center"><%= v.getMotivo_viaje() %></td>
								<td class="text-center"><%= v.getMonto_estipulado() %></td>
								<td class="text-center"><input value="<%= v.getIdvale().toString()+"-"+"aceptado" %>" 
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
								<td class="text-center"><input value="<%= v.getIdvale().toString()+"-"+"rechazado" %>" 
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
							</tr>
							<%
						}
						%>
					
					</table>
					<INPUT type="submit" value="Enviar">
				</form>
				</div>
				</div>
				<%
			} else {
				%>
				<p>No hay vales para confirmar </p>
				<%
			}
		%>
		<br/>
		<a href="index.jsp">index</a><br />
	</center>
	<script>
	var validator = new FormValidator('t_filtro', [{
	    name: 'opcion',
	    rules: 'required'
	}], function(errors, event) {
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