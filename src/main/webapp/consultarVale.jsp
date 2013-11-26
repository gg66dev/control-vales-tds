<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.controllers.ValeController" %>
<%@ page import="cl.tds.controlvales.beans.Vale" %>
<%@ page import="cl.tds.controlvales.beans.Estado" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Consultar Vale</title>
</head>
<body>
	<center>
		<div id="mystyle" class="myform">
		<form action="consultarVale.jsp" method="post">
		
				<h1>Consultar Vale</h1>
				<p>filtros de busqueda</p>
				
				<%
					String value = request.getParameter("filter"); 
				   	if(value == null) value ="";
				%>
		
				<% if( value.equals("folio") ){ %>
					<p><input type="radio" name="filter" value="folio" checked> numero de folio<br></p>
					<p><input type="radio" name="filter" value="estado"> estado del vale<br></p>
					<p><input type="radio" name="filter" value="fecha"> fecha de emisión<br></p>
					<p><input type="submit" name="submit" value="seleccionar"><br></p>
					</div>
					
					<div id="mystyle" class="myform">
					<p><label>Numero de Folio </label><input type="text" name="folio_vale" id="folio_vale" /><br></p>
					<p><input type="submit" name="buscar" value="buscar"><br></p>
					</div>
				<% } %>
				<% if(value.equals("estado")){ %>
					<p><input type="radio" name="filter" value="folio"> numero de folio<br></p>
					<p><input type="radio" name="filter" value="estado" checked> estado del vale<br></p>
					<p><input type="radio" name="filter" value="fecha"> fecha de emisión<br></p>
					<p><input type="submit" name="submit" value="seleccionar"><br></p>
					</div>
				
					<div id="mystyle" class="myform">
					<p><label>Estado del vale </label>
					<SELECT name="estado" SIZE="1">
						<OPTION value="abierto">abierto</OPTION>
						<OPTION value="aceptado">aceptado</OPTION>
						<OPTION value="rechazado">rechazado</OPTION>
						<OPTION value="consolidado">consolidado</OPTION>
					</SELECT><br></p>
					<p><input type="submit" name="buscar" value="buscar"><br></p>
					</div>
					
				<% }%>
				<% if(value.equals("fecha")){ %>
					<p><input type="radio" name="filter" value="folio"> numero de folio<br></p>
					<p><input type="radio" name="filter" value="estado"> estado del vale<br></p>
					<p><input type="radio" name="filter" value="fecha" checked> fecha de emisión<br></p>
					<p><input type="submit" name="submit" value="seleccionar"><br></p>
					</div>
					
					<div id="mystyle" class="myform">
					<p><label>Entre </label> <input
					type="text" name="fecha_inicio" id="fecha_inicio" />
					<label>Y </label>
					 <input
					type="text" name="fecha_termino" id="fecha_termino" /> 
					<span class="small">(ej. 24/01/2013)</span></p>
					<p><input type="submit" name="buscar" value="buscar"><br></p>
					</div>
					
				<% } %>
				<% if(value.equals("")){ %>
					<p><input type="radio" name="filter" value="folio"> numero de folio<br></p>
					<p><input type="radio" name="filter" value="estado"> estado del vale<br></p>
					<p><input type="radio" name="filter" value="fecha"> fecha de emisión<br></p>
					<p><input type="submit" name="submit" value="seleccionar"><br></p>
					</div>
				<% } %>
				</form>
				
				<%
				List<Vale> listavales = null;
				Vale val = null;
				String buscar = request.getParameter("buscar"); 
			  	if(value == null) value ="";
			   	else{
			   		ValeController valeController = new ValeController();
			   		if(value.equals("folio")){
			   			String folio = request.getParameter("folio_vale");
			   			if(folio != null){
			   				long id = Long.parseLong(folio);
			   				val = valeController.obtenerVale(id);
			   			}
			   		}
			   		/*esperando_autorizacion, autorizado, rechazado, consolidado*/
					if(value.equals("estado")){
						String estado = request.getParameter("estado");
			   			if(estado != null){
							if(estado.equals("aceptado"))
				   				listavales = valeController.listarVales(Estado.autorizado);
				   			if(estado.equals("rechazado"))
				   				listavales = valeController.listarVales(Estado.rechazado);
				   			if(estado.equals("consolidado"))		
				   				listavales = valeController.listarVales(Estado.consolidado);
				   			if(estado.equals("abierto"))		
				   				listavales = valeController.listarVales(Estado.esperando_autorizacion);
			   			}
			   		}
			   		if(value.equals("fecha")){
			   			String fecha_termino = request.getParameter("fecha_inicio");
			   			String fecha_inicio = request.getParameter("fecha_termino");
			   			try {
			   				  SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy", new Locale("es", "ES"));
			   		    	  Date inicioDate = new java.sql.Date(sdf.parse(fecha_inicio).getTime());
			   		    	  Date terminoDate = new java.sql.Date(sdf.parse(fecha_termino).getTime());
			   		    	  listavales = valeController.listarVales(inicioDate,terminoDate);
			   			} catch (Exception ex) {
			   		    	  System.out.println("Error al obtener el formato de la fecha/hora: " + ex.getMessage());
			   			}
			   		}
				} 
				%>

				<%
				if( listavales != null ){
				%>
				<form method="post" action="SelectValeServlet">
				<table>
					<tr>
						<th></th>
						<th>Folio del vale</th>
						<th>Estado</th>
						<th>Fecha de emision</th>
					</tr>
					<%
					for ( Vale v : listavales ){
						%>
						<tr>
							<td><input value="<%= v.getIdvale() %>" name="seleccionado" 
								type="radio" ></td>
							<td><%= v.getIdvale() %></td>
							<td><%= v.getEstado() %></td>
							<td><%= v.getFecha_uso() %></td>
						</tr>
						<%
					}
					%>
				</table>
					<INPUT type="submit" value="Consultar vale">
				</form>			
				<%
			} else {
				if(val != null){
				%>
					<form method="post" action="SelectValeServlet">
					<table>
					<tr>
						<th></th>
						<th>Folio del vale</th>
						<th>Estado</th>
						<th>Fecha de emision</th>
					</tr>
						<tr>
							<td><input value="<%= val.getIdvale() %>" name="seleccionado" 
								type="radio" ></td>
							<td><%= val.getIdvale() %></td>
							<td><%= val.getEstado() %></td>
							<td><%= val.getFecha_uso() %></td>
						</tr>
				</table>
					<INPUT type="submit" value="Consultar vale">
				</form>
				<% 
				}else{
				%>
					<p>No hay vales para confirmar </p>
				<%
				}
			}
		%>
	</center>
</body>
</html>