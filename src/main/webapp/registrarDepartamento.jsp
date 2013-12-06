<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Registrar Departamento</title>
<script type="text/javascript" src="./js/validate.js"></script>
</head>
<body>
	<center>
			<form class="vform" id="form" name="form" method="post" action="RegistrarDepartamentoServlet">
				<h1>Registro de departamentos</h1>
				<p>Por favor ingrese la siguiente informaci&oacute;n</p>
				<p id="error"></p>

				<label>Nombre
				</label> <input type="text" name="nombre" id="nombre" /> <label>Descripcion
				</label> <input type="text" name="descripcion" id="descripcion" />

				<button type="submit">Registrar departamento</button>

			</form>
	</center>
	
	<script>
	var validator = new FormValidator('form', [{
	    name: 'nombre',
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