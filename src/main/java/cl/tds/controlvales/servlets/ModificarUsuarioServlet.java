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
import cl.tds.controlvales.beans.Perfil;
import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.controller.CentroCostoController;
import cl.tds.controlvales.controller.UsuarioController;

import org.springframework.web.util.HtmlUtils;

/**
 * @author "Fernando Valencia"
 * 
 */
@WebServlet(name = "ModificarUsuarioServlet", urlPatterns = { "/ModificarUsuarioServlet" })
public class ModificarUsuarioServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -944132770981096460L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String id = HtmlUtils.htmlEscape( request.getParameter("id") );
		String nombre = HtmlUtils.htmlEscape( request.getParameter("nombre") );
		String usuario = HtmlUtils.htmlEscape( request.getParameter("usuario") );
		String rut = request.getParameter("rut");
		String domicilio = HtmlUtils.htmlEscape( request.getParameter("domicilio") );
		String email = request.getParameter("email");
		String perfil = request.getParameter("perfil");
		
		PrintWriter out = response.getWriter();

		try {
			UsuarioController usuarioController = new UsuarioController();
			Usuario user = usuarioController.obtenUsuario(Long.parseLong(id));
			if( user != null ){
				for(Perfil p : Perfil.values()){
					if( p.toString().toLowerCase().equals(perfil) ){
						user.setPerfil(p);
						break;
					}
				}
				String id_centroCosto = (String ) request.getParameter("centro_costo");
				if( id_centroCosto != null ){
					long idCentroCosto = Long.parseLong(id_centroCosto);
					CentroCostoController centroCostoController = new CentroCostoController();
					CentroCosto centroCosto = centroCostoController.obtenCentroCosto(idCentroCosto);
					user.setCentroCosto(centroCosto);
				}
			}
			user.setNombre(nombre);
			user.setEmail(email);
			user.setUsuario(usuario);
			user.setRut(rut);
			user.setDomicilio(domicilio);
			boolean result = usuarioController.actualiza(user);
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
				out.println("Esto puede deberse a que el nombre de usuario ya existe o alg&uacute;n campo "
						+ "no cumple con los formatos exigidos.");
				out.println();
				out.println("Para intentar de nuevo <a href=administrarUsuarios.jsp>Haz click aqu&iacute;</a>");
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
		return "Servlet para modificar usuarios";
	}
}
