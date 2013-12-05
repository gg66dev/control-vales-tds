<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>Solicitar Vale</title>
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#fecha_uso").datepicker(
							{
								dateFormat : "dd/mm/yy",
								dayNames : [ "Domingo", "Lunes", "Martes",
										"Miércoles", "Jueves", "Viernes",
										"Sábado" ],
								dayNamesMin : [ "Do", "Lu", "Ma", "Mi", "Ju",
										"Vi", "Sa" ],
								monthNames : [ "Enero", "Febrero", "Marzo",
										"Abril", "Mayo", "Junio", "Julio",
										"Agosto", "Septiembre", "Octubre",
										"Noviembre", "Diciembre" ],
								monthNamesShort : [ "Ene", "Feb", "Mar", "Abr",
										"May", "Jun", "Jul", "Ago", "Sep",
										"Oct", "Nov", "Dic" ]
							});
				});
	</script>
	<center>
		<div id="mystyle" class="myform">
			<form id="form" name="form" method="post"
				action="SolicitarValeServlet">
				<h1>Solicitar Vale</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>

				<label>Fecha de Uso <span class="small">24/01/2013</span></label> <input
					type="text" name="fecha_uso" id="fecha_uso" /> <label>Origen
					<span class="small">Origen</span>
				</label> <input type="text" name="origen" id="origen" /> <label>Destino
					<span class="small">Destino</span>
				</label> <input type="text" name="destino" id="destino" /> <label>Motivo
					de viaje <span class="small">Motivo de viaje</span>
				</label> <input type="text" name="motivo" id="motivo" /> <label>Monto
					estipulado<span class="small">Monto estipulado</span>
				</label> <input type="text" name="monto_estipulado" id="monto_estipulado" />
				
				<button type="submit">Solicitar Vale</button>
				<div class="spacer"></div>

			</form>
		</div>
		<br/>
		<a href="index.jsp">volver</a><br />
	</center>
</body>
</html>