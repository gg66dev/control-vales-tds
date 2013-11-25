/**
 * 
 */
package cl.tds.controlvales.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author "Fernando Valencia"
 *
 */
public class DateUtil {

	static public boolean isDate( String input ){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			sdf.parse(input);
			return true;
		}catch( Exception e ){
			return false;
		}
	}
	
	static public Date toDate( String input ){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			return sdf.parse(input);
		}catch( Exception e ){
			return null;
		}
	}
}
