/**
 * 
 */
package cl.tds.controlvales.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Clase de utilidad para verificar diferentes tipos de campos
 * @author "Fernando Valencia"
 *
 */
public class ValidacionUtil {

	/** M&eacute;todo auxiliar para validar que un rut chileno sea v&aacute;lido
	 * 
	 * @param rut el rut (s&oacute;lo n&uacute;meros, sin d&iacute;gito verificador) 
	 * @param dv el d&iacute;gito verificador
	 * @return {@code true} si el rut es v&aacute;lido, {@code false} caso contrario
	 */
	public static boolean validarRut(int rut, char dv){
        int m = 0, s = 1;
        if( !Character.isDigit(dv) )
        	Character.toUpperCase(dv);
        for (; rut != 0; rut /= 10) {
            s = (s + rut % 10 * (9 - m++ % 6)) % 11;
        }
        return dv == (char) (s != 0 ? s + 47 : 75);
    }

	/** M&eacute;todo auxiliar para validar que un rut chileno sea v&aacute;lido
	 * 
	 * @param rut el rut
	 * @return {@code true} si el rut es v&aacute;lido, {@code false} caso contrario
	 */
	public static boolean validarRut(String rut){
		boolean esValido = false;
		if ( rut != null
				&& rut.replaceAll(" ", "").length() != 0 
				&& rut.matches("\\d{1,3}\\.?\\d{3}\\.?\\d{3}-?[\\d|k|K]")){
			/* si el rut no esta vacio se comprueba su buen ingreso */
			String tmp = rut.replaceAll("[.-]", "");
			int num = Integer.parseInt(tmp.substring(0, tmp.length() - 1));
			int tam = tmp.length();
			
			/* si es del largo aceptado */
			if( tam >= 8 && tam <= 10 ){
				/* verificamos que el digito verificador sea correcto */
				if( validarRut(num, tmp.charAt(tam-1)) ){
					esValido = true;
				}
			}
		}
		return esValido;
	}
 
    /**
     * Valida el email con una expresi&oacute;n regular
     * 
     * @param email 
     * @return {@code true} en caso de que sea v&aacute;lido, {@code false} caso contrario
     */
    public static boolean validaEmail(String email) {
    	final String PATTERN_EMAIL = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
                + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
 
        // Compiles the given regular expression into a pattern.
        Pattern pattern = Pattern.compile(PATTERN_EMAIL);
 
        // Match the given input against this pattern
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
