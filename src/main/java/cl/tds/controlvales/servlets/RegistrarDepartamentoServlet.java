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
@WebServlet(name = "RegistrarDepartamentoServlet", urlPatterns = { "/RegistrarDepartamentoServlet" })
public class RegistrarDepartamentoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8738788067544462465L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String nombre = HtmlUtils.htmlEscape( request.getParameter("nombre") );
		String descripcion = HtmlUtils.htmlEscape( request.getParameter("descripcion") );
		Departamento departamento = new Departamento(nombre, descripcion);

		PrintWriter out = response.getWriter();
		long result = 0l;
		try {
			DepartamentoController departamentoController = new DepartamentoController();
			result = departamentoController.registrar(departamento);
		} finally {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result > 0) {
				out.println("<h1>Registro exitoso</h1>");
			} else {
				out.println("<h1>Ha fallado el registro</h1>");
				out.println("Esto puede deberse a que falto el campo nombre o ya existe el departamento.");
			}
			out.println("Para regresar al sitio <a href=index.jsp>haga click aqu&iacute;</a>");
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
		return "Servlet para realizar registros de departamentos";
	}
}
