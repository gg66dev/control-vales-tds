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
import cl.tds.controlvales.controller.UsuarioController;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "EliminarUsuarioServlet", urlPatterns = { "/EliminarUsuarioServlet" })
public class EliminarUsuarioServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4556747597028982163L;
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String opcion = request.getParameter("opcion");
		Usuario usuario = (Usuario ) request.getSession().getAttribute("usuario");
		
		PrintWriter out = response.getWriter();
		boolean eliminado = false;
		try {
			UsuarioController usuarioController = new UsuarioController();
			if( opcion != null && opcion.equals("si")){
				eliminado = usuarioController.eliminar(usuario);
			}
		} finally {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Eliminar Usuario</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if ( opcion.equals("si") || opcion.equals("no") ) {
				out.println("<h1>Modificaci&oacute;n exitosa</h1>");
			} else if( !eliminado ) {
				out.println("<h1>Ha fallado la eliminaci&oacute;n</h1>");
				out.println("Esto puede deberse a que no se encontr&oacute; el usuario en la base de datos.");
			}
			out.println("Para volver al sitio <a href=index.jsp>Haz click aqu&iacute;</a>");
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");
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
		return "Servlet para eliminar registros de usuarios";
	}
}
