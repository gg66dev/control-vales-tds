/**
 * 
 */
package cl.tds.controlvales.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Time;

import javax.swing.text.MaskFormatter;

/** Mascara para fecha/hora a nuestro gusto */
public class FormatoHora extends MaskFormatter{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2100226995004675406L;

	/** Se construye con el patrón deseado */
    public FormatoHora() throws ParseException
    {
        // Las # son cifras y representa "hh:mm:ss"
        super ("##:##:##");
    }

    /** Una clase adecuada para convertir Date a String y viceversa de forma cómoda. Puedes ver cómo se hace el patrón "dd/MM/yy kk:mm:ss" en la API.
        El patrón que pongamos aquí debe cuadrar correctamente con la máscara que hemos puesto en el constructor */
    private SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");

    /** Convierte el texto del editor en un Date */
    public Object stringToValue(String text) throws ParseException
    {
    	java.util.Date d = formato.parse(text);
    	Time t = new Time(d.getTime());
        return t;
    }

    /** Redibe un Date o null y debe convertirlo a texto que cumpla el patrón indicado anteriormente */
    public String valueToString(Object value) throws ParseException
    {
        if (value instanceof Time)
            return formato.format((Time)value);
        return formato.format(new Time(0));
    }
    
    public boolean isThisDateValid(String hourToValidate, String hourFromat){
    	if(hourToValidate == null){
			return false;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(hourFromat);
		sdf.setLenient(false);
 
		try {
			//if not valid, it will throw ParseException
			Time time = new Time(sdf.parse(hourToValidate).getTime());
			System.out.println(time);
 		} catch (ParseException e) {
 			e.printStackTrace();
			return false;
		}
 		return true;
	}
}
