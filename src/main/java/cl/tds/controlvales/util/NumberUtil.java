/**
 * 
 */
package cl.tds.controlvales.util;

/**
 * @author Fernando Valencia F.
 *
 */
public class NumberUtil {
	
	static public boolean isFloat( String input ){
		try{
			Float.parseFloat(input);
			return true;
		}catch( Exception e ){
			return false;
		}
	}
	
	static public boolean isInteger( String input ){
		try{
			Integer.parseInt(input);
			return true;
		}catch( Exception e ){
			return false;
		}
	}
	
	static public boolean isLong( String input ){
		try{
			Long.parseLong(input);
			return true;
		}catch( Exception e ){
			return false;
		}
	}

}
