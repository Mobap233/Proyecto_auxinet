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
import java.util.*;
/**
 *
 * @author MARIA DEL REFUGIO
 */
public class MCuestionario {
    
    private int id_cue, id_alu, id_cur, id_dcue;
    
    public MCuestionario(){
        
    }
    
    public static int registrarCuestionario(MCuestionario cue){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "insert into mcuestionario(id_cur, id_alu, id_dcue)"
                    + "values(?, ?, ?)";
            ps = con.prepareStatement(q);
            ps.setInt(1, cue.getId_cur());
            ps.setInt(2, cue.getId_alu());
            ps.setInt(3, cue.getId_dcue());
            estatus = ps.executeUpdate();
            System.out.println("El cuestionario ha sido registrado con exito");
        } catch(SQLException sq){
            System.out.println("Error al registrar el cuestionario en la BD");
            System.out.println(sq.getMessage());
        } catch(Exception e){
            System.out.println(e.getMessage());
        } finally{
            try{
                ps.close();
                con.close();
            } catch(Exception e){
                System.out.println(e.getMessage());
            }
        }
        return estatus;
    }

    public int getId_cue() {
        return id_cue;
    }

    public void setId_cue(int id_cue) {
        this.id_cue = id_cue;
    }

    public int getId_alu() {
        return id_alu;
    }

    public void setId_alu(int id_alu) {
        this.id_alu = id_alu;
    }

    public int getId_cur() {
        return id_cur;
    }

    public void setId_cur(int id_cur) {
        this.id_cur = id_cur;
    }

    public int getId_dcue() {
        return id_dcue;
    }

    public void setId_dcue(int id_dcue) {
        this.id_dcue = id_dcue;
    }
    
}
