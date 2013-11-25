/**
 * 
 */
package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.controllers.UsuarioController;

/**
 * @author "Fernando Valencia"
 * 
 */
@WebServlet(name = "RegisterServlet", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3847699448602280976L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String nombre = request.getParameter("nombre");
		String usuario = request.getParameter("usuario");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String rut = request.getParameter("rut");
		String email = request.getParameter("email");
		Usuario user = new Usuario(nombre, usuario, password1, rut, email);

		PrintWriter out = response.getWriter();

		try {
			UsuarioController usuarioController = new UsuarioController();
			boolean result = usuarioController.register(user, password2);
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result) {
				out.println("<h1>Registro exitoso</h1>");
				out.println("Para ingresar al sitio con su nueva cuenta "
						+ "<a href=login.jsp>haga click aqu&iacute;</a>");
			} else {
				out.println("<h1>Ha fallado el registro</h1>");
				out.println("Esto puede deberse a que el nombre de usuario ya existe o los passwords "
						+ "no coinciden, no tienen el m&iacute;nimo tama&ntilde;o o alg&uacute;n campo "
						+ "no cumple con los formatos exigidos.");
				out.println();
				out.println("Para intentar de nuevo <a href=register.jsp>Haz click aqu&iacute;</a>");
			}
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");
		} finally {
			out.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Servlet para realizar registros de usuarios";
	}
}
