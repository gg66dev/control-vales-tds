package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.tds.controlvales.beans.Empresa;
import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Usuario;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controllers.EmpresaController;
import cl.tds.controlvales.controllers.ValeController;
import cl.tds.controlvales.util.DateUtil;
import cl.tds.controlvales.util.NumberUtil;

/**
 * Servlet implementation class SolicitaVale
 */
@WebServlet(name = "SolicitarValeServlet", urlPatterns = { "/SolicitarValeServlet" })
public class SolicitarValeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		boolean result = false;
		
		if( NumberUtil.isInteger(request.getParameter("monto_estipulado"))
				&& DateUtil.isDate(request.getParameter("fecha_uso")) 
				&& request.getSession().getAttribute("usuario") != null 
				&& request.getParameter("empresa") != null 
				&& NumberUtil.isLong( request.getParameter("empresa") )){
			Date fecha_uso = DateUtil.toDate( request.getParameter("fecha_uso") );
			String origen = request.getParameter("origen");
			String destino = request.getParameter("destino");
			String motivo = request.getParameter("motivo");
			int monto_estipulado = Integer.parseInt( request.getParameter("monto_estipulado") );
			long idempresa = Long.parseLong( request.getParameter("empresa") );
			
			EmpresaController empresaController = new EmpresaController();
			Empresa e = empresaController.obtenEmpresa(idempresa);
			
			Vale vale = new Vale(fecha_uso, origen, destino, motivo, monto_estipulado);
			vale.setEmpresa(e);
			vale.setUsuario( (Usuario ) request.getSession().getAttribute("usuario") );
			vale.setEstado(Estado.esperando_autorizacion);
			
			ValeController valeController = new ValeController();
			result = valeController.solicitaVale( vale );
		}
		PrintWriter out = response.getWriter();
		try {
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Solicitar Vale</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if (result) {
				out.println("<h1>Solicitud exitosa</h1>");
				out.println("Para regresar al sitio <a href=index.jsp>haga click aqu&iacute;</a>");
			} else {
				out.println("<h1>Ha fallado la solicitud</h1>");
				out.println("Esto puede deberse a alg&uacute;n dato ingresado no "
						+ "compatible (recuerde que el formato de la fecha es dd/mm/yyyy"
						+ " y el monto debe ser un n&uacute;mero.");
				out.println();
				out.println("Para intentar de nuevo <a href=solicitarVale.jsp>Haz click aqu&iacute;</a>");
			}
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");
		} finally {
			out.close();
		}
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Servlet para realizar solicitudes de vales";
	}
}
