package cl.tds.controlvales.servlets;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import cl.tds.controlvales.beans.Estado;
import cl.tds.controlvales.beans.Vale;
import cl.tds.controlvales.controller.ValeController;
import cl.tds.controlvales.util.ValeXls;

/**
 * @author "Fernando Valencia"
 * 
 */
@WebServlet(name = "ProcesarPlanillaServlet", urlPatterns = { "/ProcesarPlanillaServlet" })
public class ProcesarPlanillaServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3268280970123582388L;

	private final String ruta = "C:/Apache-tomcat-7.0.47/webapps/data/planillas/";
	private static Logger LOGGER = Logger.getLogger("InfoLogging");

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		ArrayList<ValeXls> listaValesXls = new ArrayList<ValeXls>();
		String file = request.getParameter("mes-consulta");
		LOGGER.info(ruta + file);
		List cellDataList = new ArrayList();
		try {
			FileInputStream fileInputStream = new FileInputStream(ruta + file);
			// if(! fileInputStream.markSupported()) {
			PushbackInputStream pushBakcfileInputStream = new PushbackInputStream(
					fileInputStream, 8);
			// }

			// obtiene primera planilla
			// Office 2007+
			if (POIFSFileSystem.hasPOIFSHeader(pushBakcfileInputStream)) {
				HSSFWorkbook workBook = new HSSFWorkbook(
						pushBakcfileInputStream);
				HSSFSheet hssfSheet = workBook.getSheetAt(0);
				/**
				 * itera las filas y celdas de la planilla para obtener todos
				 * los datos
				 */
				Iterator rowIterator = hssfSheet.rowIterator();
				int i = 0;
				while (rowIterator.hasNext()) {
					HSSFRow hssfRow = (HSSFRow) rowIterator.next();
					// se salta la primera fila que es la de los nombres
					if (i > 0) {
						Iterator iterator = hssfRow.cellIterator();
						List cellTempList = new ArrayList();
						while (iterator.hasNext()) {
							HSSFCell hssfCell = (HSSFCell) iterator.next();
							cellTempList.add(hssfCell.toString());
						}
						ValeXls valexls = new ValeXls(
								(String) cellTempList.get(0),
								(String) cellTempList.get(1),
								(String) cellTempList.get(2));
						cellDataList.add(valexls);
						//convalida el vale
						ValeController valeController = new ValeController();
						String sv  = (String) cellTempList.get(0);
						Vale v =  valeController.obtenerValeFolio(Long.parseLong(sv.split("\\.")[0]));							
						valeController.autorizarVale(v, Estado.consolidado);
					}
					i++;
				}
			} else {
				// Office 2007+ XML
				if (POIXMLDocument.hasOOXMLHeader(pushBakcfileInputStream)) {
					XSSFWorkbook workBook = new XSSFWorkbook(
							OPCPackage.open(pushBakcfileInputStream));
					XSSFSheet xssfSheet = workBook.getSheetAt(0);
					/**
					 * itera las filas y celdas de la planilla para obtener
					 * todos los datos
					 */
					Iterator rowIterator = xssfSheet.rowIterator();
					int i = 0;
					while (rowIterator.hasNext()) {
						XSSFRow xssfRow = (XSSFRow) rowIterator.next();
						// se salta la primera fila que es la de los nombres
						if (i > 0) {
							Iterator iterator = xssfRow.cellIterator();
							List cellTempList = new ArrayList();
							while (iterator.hasNext()) {
								XSSFCell xssfCell = (XSSFCell) iterator.next();
								cellTempList.add(xssfCell.toString());
							}
							// ocupa la clase valeXls para guardar cada objetos
							ValeXls valexls = new ValeXls(
									(String) cellTempList.get(0),
									(String) cellTempList.get(1),
									(String) cellTempList.get(2));
							cellDataList.add(valexls);
							//convalida el vale
							ValeController valeController = new ValeController();
							String sv  = (String) cellTempList.get(0);
							Vale v =  valeController.obtenerValeFolio(Long.parseLong(sv.split("\\.")[0]));							
							valeController.autorizarVale(v, Estado.consolidado);
						}
						i++;
					}

				}
			}
		} catch (Exception ex) {
			System.out.println("getWorkbook Error: " + ex.getMessage());
		}

		// envia lista a jsp
		request.getSession().setAttribute("valesXls", cellDataList);
		response.sendRedirect("consolidacionVales.jsp");

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
		return "procesa las planillas y las retorna como una lista de objetos vales";
	}

}
