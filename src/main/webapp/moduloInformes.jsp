<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.beans.Vale"%>
<%@ page import="java.util.List"%>
<%@ page import="cl.tds.controlvales.controller.ValeController"%>
<%@ page import="cl.tds.controlvales.controller.CentroCostoController"%>
<%@ page import="cl.tds.controlvales.controller.DepartamentoController"%>
<%@ page import="cl.tds.controlvales.beans.CentroCosto"%>
<%@ page import="cl.tds.controlvales.beans.Estado"%>
<%@ page import="cl.tds.controlvales.beans.Departamento"%>
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
	<div class="row">
		<h1 class="text-center">Modulo de Informes</h1>
	</div>
	<div class="content">
		<div class="grid">
			<%
				String opcion = request.getParameter("opcion");
				String frecuencia = request.getParameter("frecuencia");
				String tipo = request.getParameter("tipo");
				if (opcion == null) opcion = "";
				if (frecuencia == null) 
					frecuencia = "";
				else
					request.getSession().setAttribute("frecuencia", frecuencia);
				if (tipo == null) 
					tipo = "";
				else
					request.getSession().setAttribute("tipo", tipo);
				if( opcion.equals("estado") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post" action="ModuloInformeServlet">
						<p id="error"></p>
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
								<td class="text-center"><button type="submit">Guardar Registro</button></td>
							</tr>
						</table>
					</form>
					<form class="hform" method="post" action="moduloInformes.jsp">
						<button type="submit" name="opcion" value="criterio">volver</button>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				}else if( opcion.equals("fecha") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post" action="ModuloInformeServlet">
						<p id="error"></p>
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
								<td colspan="2" class="text-center"><button type="submit">Guardar Registro</button></td>
							</tr>
						</table>
					</form>
					<form class="hform" method="post" action="moduloInformes.jsp">
						<button type="submit" name="opcion" value="criterio">volver</button>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if( opcion.equals("centro_costo") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post" action="ModuloInformeServlet">
						<p id="error"></p>
							<table>
							<tr>
								<th class="text-center">Centro de costo</th>
							</tr>
							<tr>
								<%
									CentroCostoController centroCostoController = new CentroCostoController();
												List<CentroCosto> centroCostos = centroCostoController.listarCentroCostos();
												if( centroCostos != null && centroCostos.size() != 0 ){
								%>
								<td class="text-center">
								<center>
								<select size=1 name="centro_costo">
										<%
											for( CentroCosto c : centroCostos ){
										%>
										<option value="<%=c.getIdcentro_costo()%>"><%=c.getNombre()%></option>
										<%
											}
										%>
								</select>
								</center>
								</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Guardar Registro</button></td>
								<%
									} else {
								%>
								<td class="text-center">No hay centros de costo registrados
									en el sistema. 
								</td>
								<%
									}
								%>
							</tr>
						</table>
					</form>
					<form class="hform" method="post" action="moduloInformes.jsp">
						<button type="submit" name="opcion" value="criterio">volver</button>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if( opcion.equals("departamento") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_filtro" method="post" action="ModuloInformeServlet">
						<p id="error"></p>
						<table>
							<tr>
								<th class="text-center">Departamentos</th>
							</tr>
							<tr>
								<%
									DepartamentoController departamentoController = new DepartamentoController();
									List<Departamento> departamentos = departamentoController.listarDepartamentos();
									if( departamentos != null && departamentos.size() != 0 ){
								%>
								<td class="text-center">
									<center>
										<select size=1 name="departamento">
											<%
												for( Departamento d : departamentos ){
											%>
											<option value="<%=d.getIddepartamento()%>"><%=d.getNombre()%></option>
											<%
												}
											%>
										</select>
									</center>
								</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Guardar Registro</button></td>
								<%
									} else {
								%>
								<td class="text-center">No hay centros de costo registrados
									en el sistema.
								</td>
								<%
									}
								%>
							</tr>
						</table>
					</form>
					<form class="hform" method="post" action="moduloInformes.jsp">
						<button type="submit" name="opcion" value="criterio">volver</button>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				} else if( opcion.equals("criterio") ){
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" name="f_opcion" method="post"
						action="moduloInformes.jsp">
						<p id="error"></p>
						<table>
							<tr>
								<th>Escoja opci&oacute;n</th>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="fecha" checked>
									Fecha Emision<br></td>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="estado">
									Estado<br></td>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="departamento">
									Departamento<br></td>
							</tr>
							<tr>
								<td><input type="radio" name="opcion" value="centro_costo">
									Centro de costo<br></td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit">Seleccionar</button></td>
							</tr>
						</table>
					</form>
					<form class="hform" method="post" action="moduloInformes.jsp">
						<button type="submit" name="opcion" value="">volver</button>
					</form>
				</div>
				<div class="c4 last"></div>
			</div>
			<%
				}else {
			%>
			<hr>
			<div class="row space-bot">
				<div class="c4 first"></div>
				<div class="c4">
					<form class="hform" method="post" action="moduloInformes.jsp">
							<table>
							<tr>
								<th>Escoja opci&oacute;n</th>
							</tr>
							<tr>
								<td><input type="checkbox" name="tipo" value="i_consolidados">
									Informe Detallado de consolidaciones<br></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="tipo" value="i_emitidos">
									Informe de vales Emitidos <br></td>
							</tr>
							<tr>
								<td class="text-center">
									<center>
										<select size=1 name="frecuencia">
											<option value="diario">diario</option>
											<option value="semanal">semanal</option>
											<option value="mensual">mensual</option>
										</select>
									</center>
								</td>
							</tr>
							<tr>
								<td class="text-center"><button type="submit"
								 name="opcion" value="criterio">siguiente</button></td>
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
					<a href="index.jsp">Inicio</a>
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

						for ( var i = 0, errorLength = errors.length; i < errorLength; i++) {
							errorString += errors[i].message + '<br />';
						}

						document.getElementById('error').innerHTML = errorString;
					}
				});
	</script>
</body>
</html>