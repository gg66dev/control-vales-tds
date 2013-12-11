package cl.tds.controlvales.servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controller.ValeController;
import cl.tds.controlvales.util.NumberUtil;
import cl.tds.controlvales.util.ValidacionUtil;


@WebServlet(name = "ModuloInformeServlet", urlPatterns = { "/ModuloInformeServlet" })
public class ModuloInformeServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 284662960174416441L;


	private static Logger LOGGER = Logger.getLogger("InfoLogging");
	
	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String estado = request.getParameter("estado");
		String desde = request.getParameter("desde");
		String hasta = request.getParameter("hasta");
		String centro_costo = request.getParameter("centro_costo");
		String departamento = request.getParameter("departamento");
		String frecuencia = (String)request.getSession().getAttribute("frecuencia");
		String tipo  = (String)request.getSession().getAttribute("tipo");
		
		
		if(tipo != null) LOGGER.info("tipo " + tipo);
		if(frecuencia != null) LOGGER.info("frecuencia " + frecuencia);
		if(estado != null) LOGGER.info("estado " + estado);
		if(desde != null) LOGGER.info("desde " + desde);
		if(hasta != null) LOGGER.info("hasta " + hasta);
		if(centro_costo != null) LOGGER.info("centro_Costo " + centro_costo);
		if(departamento != null) LOGGER.info("departamento " + departamento);
		
		/*
		 * Resto del servlet
		 * 
		 * */
	
		response.sendRedirect("index.jsp");
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
		return "crea un registro para que se envie emails a un usuario usando un criterio";
	}
}