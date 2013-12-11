package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controller.ValeController;
import cl.tds.controlvales.util.NumberUtil;

@WebServlet(name = "ConfirmarMontoServlet", urlPatterns = { "/ConfirmarMontoServlet" })
public class ConfirmarMontoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6982589621656737388L;

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		
		
		if( NumberUtil.isInteger(request.getParameter("monto_real"))){
			Vale vale = (Vale)(request.getSession().getAttribute("vale"));
			String monto_real = request.getParameter("monto_real");
			PrintWriter out = response.getWriter();
			try {
				ValeController valeController = new ValeController();
				valeController.actualizarVale(vale, Integer.parseInt(monto_real));
				//obtiene fecha actual de cuando se confirma
				java.util.Calendar cal = java.util.Calendar.getInstance(); 
				Date timeNow = new Date(cal.getTimeInMillis()); 
				valeController.actualizarVale(vale,timeNow);
				
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Registro</title>");
				out.println("</head>");
				out.println("<body>");
				out.println("<center>");
				out.println("<h1>Vale actualizado exitosamente</h1>");
				out.println("Para volver al sitio <a href=index.jsp>haz click aqu&iacute;</a>");
				out.println("</center>");
				out.println("</body>");
				out.println("</html>");
				
				//remueve atributo que ya no lo utilizara
				request.getSession().removeAttribute("vale");
			} finally {
				out.close();
			}
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
		return "Permite el proceso de ingresar monto real al vale";
	}
}
