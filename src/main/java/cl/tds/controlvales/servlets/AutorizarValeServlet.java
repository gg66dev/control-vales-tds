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

import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controller.ValeController;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "AutorizarValeServlet", urlPatterns = { "/AutorizarValeServlet" })
public class AutorizarValeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 814556017658012777L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Vale vale = (Vale) request.getSession().getAttribute("vale");
		String autorizado = request.getParameter("autorizar");
		PrintWriter out = response.getWriter();

		try {
			ValeController valeController = new ValeController();
			
			if( autorizado != null && autorizado.equals("aceptado") ){
				valeController.autorizarVale(vale, Estado.autorizado);
			}else if ( autorizado != null && autorizado.equals("rechazado")){
				valeController.autorizarVale(vale, Estado.rechazado);
			}
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			out.println("<h1>Vales actualizados exitosamente</h1>");
			out.println("Para volver al sitio <a href=index.jsp>haz click aqu&iacute;</a>");
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
		return "Permite el proceso de autentificacion del usuario";
	}
}
