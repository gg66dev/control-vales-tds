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

import cl.tds.controlvales.beans.Departamento;
import cl.tds.controlvales.controller.DepartamentoController;

import org.springframework.web.util.HtmlUtils;

/**
 * @author "Fernando Valencia"
 * 
 */
@WebServlet(name = "ModificarDepartamentoServlet", urlPatterns = { "/ModificarDepartamentoServlet" })
public class ModificarDepartamentoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -944132770981096460L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String id = HtmlUtils.htmlEscape( request.getParameter("id") );
		String nombre = HtmlUtils.htmlEscape( request.getParameter("nombre") );
		String descripcion = HtmlUtils.htmlEscape( request.getParameter("descripcion") );
		
		PrintWriter out = response.getWriter();
		boolean result = false;
		try {
			DepartamentoController departamentoController = new DepartamentoController();
			Departamento departamento = departamentoController.obtenDepartamento(Long.parseLong(id));
			departamento.setNombre(nombre);
			departamento.setDescripcion(descripcion);
			result = departamentoController.actualiza(departamento);
		} finally {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result) {
				out.println("<h1>Modificaci&oacute;n exitosa</h1>");
				out.println("Para regresar al sitio "
						+ "<a href=index.jsp>haga click aqu&iacute;</a>");
			} else {
				out.println("<h1>Ha fallado la operaci&oacute;n</h1>");
				out.println("Esto puede deberse a que el departamento ya existe.");
				out.println();
				out.println("Para intentar de nuevo <a href=administrarDepartamentos.jsp>Haz click aqu&iacute;</a>");
			}
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
		return "Servlet para modificar usuarios";
	}
}
