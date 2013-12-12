<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cl.tds.controlvales.servlets.LoginServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<script type="text/javascript" src="./js/validate.min.js"></script>
<title>Login</title>
</head>
<body>
	<center>
			<form class="vform" id="form" name="form" method="post" action="LoginServlet">
				<h1 class="text-center">Login</h1>
				<p>
					Por favor ponga su informaci&oacute;n para ingresar
				</p>
				<p id="error"></p>
				
				<label>Nombre de usuario
				</label> <input type="text" name="username" id="username" /> <label>Password
					
				</label> <input type="password" name="password" id="password" />

				<button type="submit">Login</button>
			</form>
	</center>
	<script>
	var validator = new FormValidator('form', [{
	    name: 'username',
	    rules: 'required'
	}, {
	    name: 'password',
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