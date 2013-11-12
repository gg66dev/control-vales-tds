<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="cl.tds.controlvales.beans.Usuario" %>
<%@ page import="cl.tds.controlvales.dao.UsuarioDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hola</title>
</head>
<body>
	
	
	<%  
	Usuario u = new Usuario();
    u.setNombre(request.getParameter("nombre"));
    u.setUsuario(request.getParameter("usuario"));
    u.setPassword(request.getParameter("passwd"));
    u.setRut(request.getParameter("rut"));
    u.setEmail(request.getParameter("email"));
    UsuarioDAO uDAO = new UsuarioDAO();
    uDAO.guardaUsuario(u);
	%>

Se ingreso el usuario con exito
	
</body>
</html>