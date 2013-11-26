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
import cl.tds.controlvales.controllers.ValeController;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "AutorizarValeServlet", urlPatterns = { "/AutorizarValeServlet" })
public class AutorizarValeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		long id = 0L;
		Estado estado = null;
		if( request.getParameter("aceptado") != null){
			id = Long.parseLong(request.getParameter("aceptado"));
			estado = Estado.autorizado;
		}else if ( request.getParameter("rechazado") != null ){
			id = Long.parseLong(request.getParameter("rechazado"));
			estado = Estado.rechazado;
		}
		PrintWriter out = response.getWriter();

		try {
			ValeController valeController = new ValeController();
			Vale vale = valeController.obtenerVale(id);
			boolean result = false;
			result= valeController.autorizarVale(vale, estado);
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result) {
				out.println("<h1>Registro exitoso</h1>");
				out.println("Para volver al sitio <a href=login.jsp>haz click aqu&iacute;</a>");
			} else {
				out.println("<h1>Ha fallado el registro</h1>");
				out.println("No se pudo autorizar el siguiente vale :");
				out.println( vale.getEmpresa().getNombre() + " " + vale.getUsuario().getNombre() 
						+ " " + vale.getFecha_uso() + " " + vale.getOrigen() + " " + vale.getDestino() 
						+ " " + vale.getMotivo_viaje() + " " + vale.getMonto_estipulado());
				out.println();
				out.println("Para intentar de nuevo <a href=listarVales.jsp>Haz click aqu&iacute;</a>");
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
		return "Permite el proceso de autentificacion del usuario";
	}
}
