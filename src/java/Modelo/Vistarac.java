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
public class Vistarac {
    private int id_usu, id_mod, id_cur;
    private String nom_cur;
    public Vistarac(){
        
    }
    
    public boolean saberRac(String nombre, int mod, int id_alumno){
        boolean bandera = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from vistarac where id_usu = ? and nom_cur = ? and id_mod = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_alumno);
            ps.setString(2, nombre);
            ps.setInt(3, mod);
            rs = ps.executeQuery();
            while(rs.next()){
                bandera = true;
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar al usuario");
            System.out.println(sq.getMessage());
            bandera = false;
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
            return bandera;
        }
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public int getId_mod() {
        return id_mod;
    }

    public void setId_mod(int id_mod) {
        this.id_mod = id_mod;
    }

    public int getId_cur() {
        return id_cur;
    }

    public void setId_cur(int id_cur) {
        this.id_cur = id_cur;
    }

    public String getNom_cur() {
        return nom_cur;
    }

    public void setNom_cur(String nom_cur) {
        this.nom_cur = nom_cur;
    }
    
}
