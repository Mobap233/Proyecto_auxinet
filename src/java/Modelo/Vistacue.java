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
public class Vistacue {
    private int id_cur, id_alu;
    private boolean apb_cue;
    public Vistacue(){
        
    }

    public boolean saberRac(int id_curso, int id_alumno){
        boolean bandera = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from vistacue where id_cur = ? and id_alu = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_curso);
            ps.setInt(2, id_alumno);
            rs = ps.executeQuery();
            while(rs.next()){
                if(rs.getBoolean("apb_dcue")){
                    bandera = true;
                    break;
                }
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
    
    public int getId_cur() {
        return id_cur;
    }

    public void setId_cur(int id_cur) {
        this.id_cur = id_cur;
    }

    public int getId_alu() {
        return id_alu;
    }

    public void setId_alu(int id_alu) {
        this.id_alu = id_alu;
    }

    public boolean isApb_cue() {
        return apb_cue;
    }

    public void setApb_cue(boolean apb_cue) {
        this.apb_cue = apb_cue;
    }
    
}
