<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@ page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#desde,#hasta").datepicker({
				dateFormat : "dd/mm/yy"
			});
		});
	</script>
	<center>
		<h1 class="text-center">Consultar Vale</h1>
		<%
			String opcion = request.getParameter("opcion");
			if (opcion == null) opcion = "";
			@SuppressWarnings("unchecked")
			List<Vale> vales = ( List<Vale> )request.getSession().getAttribute("vales");
			if( opcion.equals("rut") || opcion.equals("nombre") ){
				
		%>
		<form class="vform" name="f_filtro" method="post"
			action="ConsultaValesServlet">
			<p>filtros de busqueda</p>
			<p id="error"></p>
			<table>
				<tr>
					<td class="text-center">Nombre o rut</td>
				</tr>
				<tr>
					<td class="text-center"><input id="texto" type="text"
						name="input"></td>
				</tr>
				<tr>
					<td class="text-center"><button type="submit">Buscar</button></td>
				</tr>
			</table>
		</form>
		<%
			} else if( opcion.equals("fecha") ){
		%>
		<form class="vform" name="f_filtro" method="post"
			action="ConsultaValesServlet">
			<p id="error"></p>
			<table>
				<tr>
					<td colspan="2" class="text-center">Fecha</td>
				</tr>
				<tr>
					<td class="text-center">Desde <input id="desde" type="text"
						name="desde" placeholder="01/01/2013"></td>
					<td class="text-center">Hasta <input id="hasta" type="text"
						name="hasta" placeholder="31/12/2013"></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center"><button type="submit">Buscar</button></td>
				</tr>
			</table>
		</form>
		<%
			} else if( opcion.equals("centro_costo") ){
		%>
		<form class="vform" name="f_filtro" method="post"
			action="ConsultaValesServlet">
			<p id="error"></p>
			<table>
				<tr>
					<td class="text-center">Centro de costo</td>
				</tr>
				<tr>
					<%
						CentroCostoController centroCostoController = new CentroCostoController();
						List<CentroCosto> centroCostos = centroCostoController.listarCentroCostos();
						if( centroCostos != null && centroCostos.size() != 0 ){
					%>
					<td class="text-center">
					<select size=1 name="centro_costo">
					<%
						for( CentroCosto c : centroCostos ){
					%>
						<option value="<%=c.getIdcentro_costo()%>"><%=c.getNombre()%></option>
					<%
						}
					%>
					</select>
					</td>
				</tr>
				<tr>
					<td class="text-center"><button type="submit">Buscar</button></td>
					<%
						} else {
					%>
					<td class="text-center"> No hay centros de costo registrados en el sistema. 
					<a href="index.jsp">Volver</a>.
					</td>
					<%
						}
					%>
				</tr>
			</table>
		</form>
		<%
			} else if( opcion.equals("folio") ){
		%>
		<form class="vform" name="f_filtro" method="post"
			action="ConsultaValesServlet">
			<p id="error"></p>
			<table>
				<tr>
					<td class="text-center">Folio</td>
				</tr>
				<tr>
					<td class="text-center"><input id="texto" type="text"
						name="folio"></td>
				</tr>
				<tr>
					<td class="text-center"><button type="submit">Buscar</button></td>
				</tr>
			</table>
		</form>
		<% 
			} else if ( vales != null ) {
				
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
								if ( v.getEstado().equals(Estado.abierto) ){
						%>
						<tr class="text-center">
							<td class="text-center"><%= v.getUsuario().getNombre() %></td>
							<td class="text-center"><%= v.getFecha_uso() %></td>
							<td class="text-center"><%= v.getOrigen() %></td>
							<td class="text-center"><%= v.getDestino() %></td>
							<td class="text-center"><%= v.getMotivo_viaje() %></td>
							<td class="text-center"><%= v.getMonto_estipulado() %></td>
							<td class="text-center"><input
								value="<%= v.getIdvale().toString()+"-"+"aceptado" %>"
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
							<td class="text-center"><input
								value="<%= v.getIdvale().toString()+"-"+"rechazado" %>"
								name="<%= "opcion-"+v.getIdvale() %>" type="radio"></td>
						</tr>
						<%
								}
							}
						%>
						<tr>
							<td colspan=8 class="text-center">
								<button type="submit">Enviar</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%
			} else {
		%>
		<form class="vform" name="f_opcion" method="post"
			action="autorizarVales.jsp">
			<p id="error"></p>
			<table>
				<tr>
					<td><input type="radio" name="opcion" value="centro_costo">
						Centro de costo<br></td>
				</tr>
				<tr>
					<td><input type="radio" name="opcion" value="folio">
						Folio<br></td>
				</tr>
				<tr>
					<td><input type="radio" name="opcion" value="fecha">
						Fecha<br></td>
				</tr>
				<tr>
					<td><input type="radio" name="opcion" value="rut"> Rut<br></td>
				</tr>
				<tr>
					<td><input type="radio" name="opcion" value="nombre">
						Nombre<br></td>
				</tr>
				<tr>
					<td class="text-center"><button type="submit">Seleccionar</button></td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
		<br /> <a href="index.jsp">volver</a><br />
	</center>
	<script>
		var validator = new FormValidator(
				't_filtro',
				[ {
					name : 'opcion',
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