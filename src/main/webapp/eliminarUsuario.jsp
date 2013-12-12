<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Eliminar usuario</title>
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
</head>
<body>
<div class="row space-bot">
	<h1 class="text-center">Eliminar usuario</h1>
	<p class="text-center">Est&aacute; a punto de eliminar un usuario, 
	considere que al realizar esta operaci&oacute;n usted eliminar&aacute; 
	de la base de datos los vales asociados a dicho usuario.</p>
</div> 
	<div class="grid">
		<p id="error"></p>
		<div class="row space-bot">
			<div class="c4 centered first">
				<form id="form" name="form" method="post"
					action="EliminarUsuarioServlet">
					<table>
							<tr>
								<th class="text-center">Opci&oacute;n</th>
								<th class="text-center">Valor</th>
							</tr>
							<tr>
								<td class="text-center">Si</td>
								<td class="text-center"><input value="si" name="opcion" type="radio" /></td>
							</tr>
							<tr>
								<td class="text-center">No</td>
								<td class="text-center"><input value="no" name="opcion" type="radio" /></td>
							</tr>
							<tr>
								<td colspan=2 class="text-center"><button type="submit">Eliminar</button></td>
							</tr>
						</table>
				</form>
			</div>
		</div>
	</div> <!-- fin grid -->
<div class="content">
	<div class="grid">
		<div class="row">
			<div class="c4 centered first">
				<p class="note text-center">
					<a href="index.jsp">Inicio</a>
				</p>
			</div>
		</div> <!-- fin row -->
	</div> <!-- fin grid -->
</div> <!-- fin content -->
<script>
	var validator = new FormValidator(
			'form',
			[ {
				name : 'opcion',
				rules : 'required'
			],
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