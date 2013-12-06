<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Solicitar Vale</title>
<link rel="stylesheet"
	href="./css/smoothness/jquery-ui-1.10.3.custom.css">
<script src="./js/jquery-1.9.1.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="./js/validate.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#fecha_uso").datepicker();
		});
	</script>
	<center>
		<form class="vform" id="form" name="form" method="post"
			action="SolicitarValeServlet">
			<h1 class="text-center">Solicitar Vale</h1>
			<p>Por favor ingrese la siguiente informaci&oacute;n</p>
			<p id="error"></p>

			<label>Fecha de Uso</label> <input type="text" name="fecha_uso"
				id="fecha_uso" placeholder="24/01/2013" /> <label>Origen </label> <input
				type="text" name="origen" id="origen" /> <label>Destino </label> <input
				type="text" name="destino" id="destino" /> <label>Motivo de
				viaje </label> <input type="text" name="motivo" id="motivo" /> <label>Monto
				estipulado </label> <input type="text" name="monto_estipulado"
				id="monto_estipulado" />

			<button type="submit">Solicitar Vale</button>

		</form>
	</center>
	<script>
	var validator = new FormValidator('form', [{
	    name: 'fecha_uso',
	    rules: 'required'
	}, {
	    name: 'origen',
	    rules: 'required'
	}, {
	    name: 'destino',
	    rules: 'required'
	}, {
	    name: 'motivo',
	    rules: 'required'
	}, {
	    name: 'monto_estipulado',
	    display: 'monto estipulado',
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