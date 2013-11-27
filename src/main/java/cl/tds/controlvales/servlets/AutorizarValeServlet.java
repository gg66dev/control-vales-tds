/**
 * 
 */
package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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

	@SuppressWarnings("unchecked")
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		List<Vale> vales = (List<Vale>) request.getSession().getAttribute("vales");
		
		PrintWriter out = response.getWriter();

		try {
			ValeController valeController = new ValeController();
			
			if( vales != null ){
				for( Vale v : vales ){
					//si se ha enviado informacion del formulario por post
					if( request.getParameter("opcion-"+v.getIdvale()) != null ){
						String[] opcion = request.getParameter("opcion-"+v.getIdvale()).split("-");
						if( opcion[1] != null && opcion[1].equals("aceptado") ){
							valeController.autorizarVale(v, Estado.autorizado);
						}else if ( opcion[1] != null && opcion[1].equals("rechazado")){
							valeController.autorizarVale(v, Estado.rechazado);
						}
					}
				}
			}
			
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Registro</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
//			if (result) {
//				out.println("<h1>Vale "+estado+" exitosamente</h1>");
//				out.println("Para volver al sitio <a href=login.jsp>haz click aqu&iacute;</a>");
//			} else {
//				out.println("<h1>Ha fallado el registro</h1>");
//				out.println("No se pudo autorizar el vale");
//				out.println();
//				out.println("Para intentar de nuevo <a href=listarVales.jsp>Haz click aqu&iacute;</a>");
//			}
			out.println("<h1>Vales actualizados exitosamente</h1>");
			out.println("Para volver al sitio <a href=login.jsp>haz click aqu&iacute;</a>");
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
