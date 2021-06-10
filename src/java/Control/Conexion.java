/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Control;

import java.sql.*;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Conexion {
    public static Connection getConexion(){
        String url, userName, password;
        
        url = "jdbc:mysql://localhost/auxinet";
        userName = "root";
        password = "Hongui.121";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, userName, password);
            System.out.println("Se conecto a la BD");
        
        }catch(Exception e){
            System.out.println("No se conecto a la BD");
            System.out.println(e.getMessage());
        
        }
        return con;
    }
}
