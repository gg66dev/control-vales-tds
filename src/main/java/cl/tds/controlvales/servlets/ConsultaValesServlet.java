/**
 * 
 */
package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controllers.ValeController;
import cl.tds.controlvales.util.ValidacionUtil;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "ConsultaValesServlet", urlPatterns = { "/ConsultaValesServlet" })
public class ConsultaValesServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("opcion");
		String input = request.getParameter("input");
		
		ValeController valeController = new ValeController();
		List<Vale> vales = null;
		if( opcion != null && input != null){
			if ( opcion.equals("rut") && ValidacionUtil.validarRut(input) ){
				vales = valeController.listarVales(input);
			}else if( opcion.equals("nombre") ){
				vales = valeController.listarVales(input);
			}
		}
		
		request.getSession().setAttribute("vales", vales);
		response.sendRedirect("listarVales.jsp");
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
		return "Permite el proceso de filtrado del listado de vales a mostrar";
	}
}
