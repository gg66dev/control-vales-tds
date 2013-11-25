/**
 * 
 */
package cl.tds.controlvales.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.text.MaskFormatter;

/** Mascara para fecha/hora a nuestro gusto */
public class FormatoFecha extends MaskFormatter{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2100226995004675406L;

	/** Se construye con el patrón deseado */
    public FormatoFecha() throws ParseException
    {
        // Las # son cifras y representa "dd/mm/yy hh:mm:ss"
        super ("##/##/####");
    }

    /** Una clase adecuada para convertir Date a String y viceversa de forma cómoda. Puedes ver cómo se hace el patrón "dd/MM/yy kk:mm:ss" en la API.
        El patrón que pongamos aquí debe cuadrar correctamente con la máscara que hemos puesto en el constructor */
    private SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

    /** Convierte el texto del editor en un Date */
    public Object stringToValue(String text) throws ParseException
    {
        return formato.parseObject(text);
    }

    /** Redibe un Date o null y debe convertirlo a texto que cumpla el patrón indicado anteriormente */
    public String valueToString(Object value) throws ParseException
    {
        if (value instanceof Date)
            return formato.format((Date)value);
        return formato.format(new Date());
    }
    
    public boolean isThisDateValid(String dateToValidate, String dateFromat){
    	if(dateToValidate == null){
			return false;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		sdf.setLenient(false);
 
		try {
			//if not valid, it will throw ParseException
			Date date = sdf.parse(dateToValidate);
			System.out.println(date);
 		} catch (ParseException e) {
 			e.printStackTrace();
			return false;
		}
 		return true;
	}
}
