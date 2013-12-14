package cl.tds.controlvales.util;

import java.io.File;
import java.util.ArrayList;

public class FileXlsUtil {

	private final String ruta = System.getProperty("catalina.base")+"/webapps/data/planillas/";
	
	public FileXlsUtil() {

	}

	public ArrayList<String> getListXlsFile() {
		String files;
		ArrayList<String> fileList = new ArrayList<String>();
		
		//crea directorio de la ruta
		(new File(ruta)).mkdirs();		
		
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
