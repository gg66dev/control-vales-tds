<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@ page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<%@ page import="cl.tds.controlvales.beans.Usuario"%>
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
<title>Consultar Vale</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#desde,#hasta").datepicker({
				dateFormat : "dd/mm/yy"
			});
		});
	</script>
	<div class="row">
		<h1 class="text-center">Consultar Vale</h1>
	</div>
	<div class="content">
		<div class="grid">
			<%
				String opcion = request.getParameter("opcion");
				if (opcion == null) opcion = "";
				@SuppressWarnings("unchecked")
				List<Vale> vales = ( List<Vale> )request.getSession().getAttribute("vales");
				if( opcion.equals("fecha") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post"
						action="ConsultaValesServlet">
						<p id="error"></p>
						<input type="hidden" value="usuario" name="perfil" />
						<table>
							<tr>
								<th class="text-center">Desde</th>
								<th class="text-center">Hasta</th>
							</tr>
							<tr>
								<td class="text-center">
									<center>
										<input id="desde" type="text" name="desde"
											placeholder="01/01/2013">
									</center>
								</td>
								<td class="text-center">
									<center>
										<input id="hasta" type="text" name="hasta"
											placeholder="31/12/2013">
									</center>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-center"><button type="submit">Buscar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if( opcion.equals("estado") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post"
						action="ConsultaValesServlet">
						<p id="error"></p>
						<input type="hidden" value="usuario" name="perfil" />
						<table>
							<tr>
								<th class="text-center">Estado</th>
							</tr>
							<tr>
								<td class="text-center">
									<center>
										<select size=1 name="estado">
											<%
												for( Estado e : Estado.values() ){
											%>
											<option value="<%=e%>"><%=e%></option>
											<%
												}
											%>
										</select>
									</center>
								</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Buscar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if( opcion.equals("folio") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post"
						action="ConsultaValesServlet">
						<p id="error"></p>
						<input type="hidden" value="usuario" name="perfil" />
						<table>
							<tr>
								<th class="text-center">Folio</th>
							</tr>
							<tr>
								<td class="text-center">
									<center>
										<input id="texto" type="text" name="folio">
									</center>
								</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Buscar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if ( vales != null ) {
			%>
			<hr>
			<div class="row space-bot">
				<div class="c2 first"></div>
				<div class="c8">
					<form name="f_detalle" method="post"
						action="confirmarValorVale.jsp">
						<table>
							<tr>
								<th class="text-center">Vale</th>
								<th class="text-center">Fecha de Uso</th>
								<th class="text-center">Origen</th>
								<th class="text-center">Destino</th>
								<th class="text-center">Motivo de viaje</th>
								<th class="text-center">Estado</th>
								<th class="text-center">Monto estipulado</th>
							</tr>
							<%
								Usuario usuario = null;
												if (session.getAttribute("usuario") != null) {
													usuario = (Usuario) session.getAttribute("usuario");
												}
												for ( Vale v : vales ){
													if ( usuario != null 
															&& v.getUsuario().getIdusuario().equals(usuario.getIdusuario()) ){
							%>
							<tr>
								<td><input type="radio" name="id_vale"
									value="<%=v.getIdvale()%>"></td>
								<td class="text-center"><%=v.getFecha_uso()%></td>
								<td class="text-center"><%=v.getOrigen()%></td>
								<td class="text-center"><%=v.getDestino()%></td>
								<td class="text-center"><%=v.getMotivo_viaje()%></td>
								<td class="text-center"><%=v.getEstado()%></td>
								<td class="text-center"><%=v.getMonto_estipulado()%></td>
							</tr>
							<%
								}
												}
							%>
							<tr>
								<td colspan=7 class="text-center"><button type="submit">Seleccionar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c2 last"></div>
			</div>
			<%
				} else {
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_opcion" method="post"
						action="consultarVales.jsp">
						<p id="error"></p>
						<table>
							<tr>
								<th>Escoja opci&oacute;n</th>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="estado">
									Estado</td>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="folio">
									Folio</td>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="fecha">
									Fecha</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Seleccionar</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				}
			%>
			<hr>
			<div class="row">
				<p class="note text-center">
					<a href="index.jsp">volver</a>
				</p>
			</div>
		</div>
	</div>
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