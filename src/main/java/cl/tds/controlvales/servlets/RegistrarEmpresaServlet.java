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

import cl.tds.controlvales.beans.Empresa;
import cl.tds.controlvales.controllers.EmpresaController;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "RegistrarEmpresaServlet", urlPatterns = { "/RegistrarEmpresaServlet" })
public class RegistrarEmpresaServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7206540968365363621L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String nombre = request.getParameter("nombre");
		String rut = request.getParameter("rut");
		Empresa e = new Empresa(nombre, rut);

		PrintWriter out = response.getWriter();

		try {
			EmpresaController empresaController = new EmpresaController();
			boolean result = empresaController.registrarEmpresa(e);
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result) {
				out.println("<h1>Registro exitoso</h1>");
				out.println("Para regresar al sitio "
						+ "<a href=index.jsp>haga click aqu&iacute;</a>");
			} else {
				out.println("<h1>Ha fallado el registro</h1>");
				out.println("Esto puede deberse a alg&uacute;n problema de acceso a los datos.");
				out.println();
				out.println("Para intentar de nuevo <a href=registrarEmpresa.jsp>Haz click aqu&iacute;</a>");
			}
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");
		} finally {
			out.close();
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public String getServletInfo() {
		return "Servlet para realizar registros de usuarios";
	}
}
