package cl.tds.controlvales.util;

import java.io.File;
import java.util.ArrayList;
import java.util.logging.Logger;

public class FileXlsUtil {

	private final String ruta = "C:/Apache-tomcat-7.0.47/webapps/data/planillas/";
	private static Logger LOGGER = Logger.getLogger("InfoLogging");
	
	public FileXlsUtil() {

	}

	public ArrayList<String> getListXlsFile() {
		String files;
		ArrayList<String> fileList = new ArrayList<String>();
		
		File folder = new File(ruta);
		File[] listOfFiles = folder.listFiles();

		for (int i = 0; i < listOfFiles.length; i++) {

			if (listOfFiles[i].isFile()) {
				files = listOfFiles[i].getName();
				fileList.add(files);
			}
		}
		
		return fileList;
	}

}
