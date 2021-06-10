/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Validaciones {
    public boolean guardarUsuario(String name, String password, String conf_password, String moment_edad){
        String numeros = "^[0-9]+$";
        String val_name = "^[A-Za-z]{1}[\\w]+$";
        String val_pass = "^(\\w|@|\\.|-)+$";
        int longitud = name.length();
        if(longitud < 5){
            System.out.println("La longitud del nombre debe ser mayor o igual a 5 caracteres");
            return false;
        }
        if(longitud > 30){
            System.out.println("La longitud del nombre debe ser menor o igual a 30 caracteres");
            return false;
        }
        if(!name.matches(val_name)){
            System.out.println("Los caracteres validos para el nombre de usuario son las letras, numeros y guion bajo, tambien debe de iniciar con una letra el nombre de usuario");
            return false;
        }
        longitud = password.length();
        if(longitud < 5){
            System.out.println("La contraseña debe de ser mayor o igual a 5 caracteres");
            return false;
        }
        if(longitud > 30){
            System.out.println("La contraseña debe de ser menor o igual a 30 caracteres");
            return false;
        }
        if(!password.matches(val_pass)){
            System.out.println("Los caracteres validos para la contraseña son letras , guion , guion bajo , arroba y punto");
            return false;
        }
        if(!password.equals(conf_password)){
            System.out.println("Las contraseñas no coinciden");
            return false;
        }
        if(!moment_edad.matches(numeros)){
            System.out.println("La edad del usuario solo debe de contener numeros");
            return false;
        }
        int edad = Integer.parseInt(moment_edad);
        if(edad < 15){
            System.out.println("La edad del usuario debe ser mayor o igual a 15");
            return false;
        }
        if(edad > 99){
            System.out.println("La edad del usuario debe ser menor o igual a 99");
            return false;
        }
        
        return true;
        
    }
    public boolean iniciosesion(String name, String password){
        String val_name = "^[A-Za-z]{1}[\\w]+$";
        String val_pass = "^(\\w|@|\\.|-)+$";
        int longitud = name.length();
        if(longitud < 5){
            return false;
        }
        if(longitud > 30){
            return false;
        }
        if(!name.matches(val_name)){
            return false;
        }
        longitud = password.length();
        if(longitud < 5){
            return false;
        }
        if(longitud > 30){
            return false;
        }
        if(!password.matches(val_pass)){
            System.out.println("Los caracteres validos para la contraseña son letras , guion , guion bajo , arroba y punto");
            return false;
        }        
        return true;
    }
    
    public boolean actualizar(String password, String conf_password){
        String val_pass = "^(\\w|@|\\.|-)+$";
        int longitud = password.length();
        if(longitud < 5){
            return false;
        }
        if(longitud > 30){
            return false;
        }
        if(!password.matches(val_pass)){
            return false;
        }
        if(!password.equals(conf_password)){
            return false;
        }
        return true;
    }
}
