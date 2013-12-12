<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" type="text/css" href="./css/ivory.css" />
<title>Logout</title>
</head>
<body>
	<%
		session.removeAttribute("usuario");
		session.removeAttribute("password");
		session.invalidate();
	%>
	<center>
		<h1>Usted se ha salido exitosamente</h1>
		Para ingresar nuevamente <a href="login.jsp">haz click aqu&iacute;</a>.
	</center>
</body>
</html>