/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

import Control.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class MCurso {
    private int id_cur, id_mod;
    private String nom_cur;
    public MCurso(){
        
    }

    public MCurso Datos_curso(String nombre, int mod){
        MCurso cur = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from mcursos where nom_cur = ? AND id_mod = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, nombre);
            ps.setInt(2, mod);
            rs = ps.executeQuery();
            while(rs.next()){
                cur = new MCurso();
                cur.setId_cur(rs.getInt("id_cur"));
                cur.setNom_cur(rs.getString("nom_cur"));
                cur.setId_mod(rs.getInt("id_mod"));
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar al usuario");
            System.out.println(sq.getMessage());
            cur = null;
        }
        finally{
            try{
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e){
                System.out.println("Error cuando no encuentra la clase");
                System.out.println(e.getMessage());
            }
            return cur;
        }
    }
    
    public int getId_cur() {
        return id_cur;
    }

    public void setId_cur(int id_cur) {
        this.id_cur = id_cur;
    }

    public int getId_mod() {
        return id_mod;
    }

    public void setId_mod(int id_mod) {
        this.id_mod = id_mod;
    }

    public String getNom_cur() {
        return nom_cur;
    }

    public void setNom_cur(String nom_cur) {
        this.nom_cur = nom_cur;
    }
    
}
