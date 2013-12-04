/**
 * 
 */
package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controller.ValeController;
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
		String desde = request.getParameter("desde");
		String hasta = request.getParameter("hasta");
		
		ValeController valeController = new ValeController();
		List<Vale> vales = null;
		if( opcion != null ){
			if ( opcion.equals("rut") && input != null && ValidacionUtil.validarRut(input) ){
				vales = valeController.listarVales(input);
			}else if( opcion.equals("nombre") && input != null ){
				vales = valeController.listarVales(input);
			}else if( opcion.equals("fecha") && desde != null && hasta != null 
					&& ValidacionUtil.validaFechaMascara(desde, "dd/MM/yyyy")
					&& ValidacionUtil.validaFechaMascara(hasta, "dd/MM/yyyy")){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date d = null, h = null;
				try {
					d = new Date(sdf.parse(desde).getTime());
					h = new Date(sdf.parse(hasta).getTime());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				vales = valeController.listarVales(d, h);
			}
			request.getSession().setAttribute("vales", vales);
		}
		response.sendRedirect("autorizarVales.jsp");
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
