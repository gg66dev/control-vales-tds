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

import cl.tds.controlvales.beans.CentroCosto;
import cl.tds.controlvales.beans.Departamento;
import cl.tds.controlvales.controller.CentroCostoController;
import cl.tds.controlvales.controller.DepartamentoController;

import org.springframework.web.util.HtmlUtils;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "RegistrarCentroDeCostoServlet", urlPatterns = { "/RegistrarCentroDeCostoServlet" })
public class RegistrarCentroDeCostoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4539069919832703390L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String nombre = HtmlUtils.htmlEscape( request.getParameter("nombre") );
		String descripcion = HtmlUtils.htmlEscape( request.getParameter("descripcion") );
		String id_departamento = request.getParameter("departamento");
		long id = Long.parseLong(id_departamento);
		DepartamentoController deptoController = new DepartamentoController();
		Departamento departamento = deptoController.obtenDepartamento(id);
		CentroCosto centroCosto = new CentroCosto(nombre, descripcion, departamento);

		PrintWriter out = response.getWriter();

		try {
			CentroCostoController centroCostoController = new CentroCostoController();
			long result = centroCostoController.registrar(centroCosto);
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
				out.println("Esto puede deberse a que falto completar el campo nombre o el campo departamento.");
			}
			out.println("Para regresar al sitio <a href=index.jsp>haga click aqu&iacute;</a>");
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
		return "Servlet para realizar registros de centros de costos";
	}
}
