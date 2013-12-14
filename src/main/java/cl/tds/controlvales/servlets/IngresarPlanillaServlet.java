/**
 * 
 */
package cl.tds.controlvales.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * @author "Fernando Valencia"
 *
 */
@WebServlet(name = "IngresarPlanillaServlet", urlPatterns = { "/IngresarPlanillaServlet" })
public class IngresarPlanillaServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1732597084276799693L;
	
	private final String ruta = System.getProperty("catalina.base")+"/webapps/data/planillas/";
	private final String[] tiposPermitidos = {
			"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
			"application/vnd.oasis.opendocument.spreadsheet"
	};

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		
		//crea directorio de la ruta
		(new File(ruta)).mkdirs();		
		
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		PrintWriter out = response.getWriter();
		
		try {
			// request es la HttpServletRequest que recibimos del formulario.
			// Los items obtenidos serán cada uno de los campos del formulario,
			// tanto campos normales como ficheros subidos.
			List<FileItem> items = upload.parseRequest(request);

			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			String nombreArchivo = null;
			String tipoContenido = null;
			boolean aceptado = false;
			while (iter.hasNext()) {
			    FileItem item = iter.next();

			    if (!item.isFormField()) {
			        nombreArchivo = item.getName();
			        tipoContenido = item.getContentType();
			        for( String tipo : tiposPermitidos ){
			        	if( tipoContenido.equals(tipo) ){
			        		aceptado = true;
			        	}
			        }
			        if( aceptado ){
			        	/*cual sera la ruta al archivo en el servidor*/
		                File archivoServer = new File(ruta);
		                if( !archivoServer.exists() ){
		                	// si no existe la carpeta
		                	aceptado = archivoServer.mkdir();
		                }
		                if( aceptado ){
		                	// se creo la carpeta y se confirma que el archivo no exista
		                	archivoServer = new File(ruta+nombreArchivo);
		                	aceptado = !archivoServer.exists();
		                	if( aceptado ){
		                		// si no existe se guarda
				                item.write(archivoServer);
				                break;
		                	}
		                }
			        }
			    }
			}
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Planilla</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<center>");
			if( aceptado ){
				out.println("<h1>Planilla subida exitosamente</h1>");
			}else{
				out.println("<h1>No se pudo subir la planilla</h1>");
				out.println("Esto puede deberse a que el tipo de archivo no era admitido, "
						+ "el archivo ya existe con el mismo nombre o no se tienen permiso de escritura.");
			}
			out.println("Para volver al sitio <a href=index.jsp>haz click aqu&iacute;</a>");
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return "Permite el ingreso de planillas al sistema";
	}
}
