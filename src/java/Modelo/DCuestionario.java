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
public class DCuestionario {
    private int id_dcue;
    private boolean p1_dcue, p2_dcue, p3_dcue, p4_dcue, p5_dcue, apb_dcue;
    public DCuestionario(){
        
    }

    public int maxid_dcue(){
        int id_dcue = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select max(id_dcue) from DCuestionario";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while(rs.next()){
                id_dcue = rs.getInt("max(id_dcue)");
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar el detalle del cuestionario");
            System.out.println(sq.getMessage());
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
            return id_dcue;
        }
    }
    
    public static int registrarDCuestionario(DCuestionario dcue){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "insert into dcuestionario(p1_dcue, p2_dcue, p3_dcue, p4_dcue, p5_dcue, apb_dcue)"
                    + "values(?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(q);
            ps.setBoolean(1, dcue.isP1_dcue());
            ps.setBoolean(2, dcue.isP2_dcue());
            ps.setBoolean(3, dcue.isP3_dcue());
            ps.setBoolean(4, dcue.isP4_dcue());
            ps.setBoolean(5, dcue.isP5_dcue());
            ps.setBoolean(6, dcue.isApb_dcue());
            estatus = ps.executeUpdate();
            System.out.println("El detalle del cuestionario ha sido registrado con exito");
        } catch(SQLException sq){
            System.out.println("Error al registrar el detalle del cuestionario en la BD");
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
    
    public int getId_dcue() {
        return id_dcue;
    }

    public void setId_dcue(int id_dcue) {
        this.id_dcue = id_dcue;
    }

    public boolean isP1_dcue() {
        return p1_dcue;
    }

    public void setP1_dcue(boolean p1_dcue) {
        this.p1_dcue = p1_dcue;
    }

    public boolean isP2_dcue() {
        return p2_dcue;
    }

    public void setP2_dcue(boolean p2_dcue) {
        this.p2_dcue = p2_dcue;
    }

    public boolean isP3_dcue() {
        return p3_dcue;
    }

    public void setP3_dcue(boolean p3_dcue) {
        this.p3_dcue = p3_dcue;
    }

    public boolean isP4_dcue() {
        return p4_dcue;
    }

    public void setP4_dcue(boolean p4_dcue) {
        this.p4_dcue = p4_dcue;
    }

    public boolean isP5_dcue() {
        return p5_dcue;
    }

    public void setP5_dcue(boolean p5_dcue) {
        this.p5_dcue = p5_dcue;
    }

    public boolean isApb_dcue() {
        return apb_dcue;
    }

    public void setApb_dcue(boolean apb_dcue) {
        this.apb_dcue = apb_dcue;
    }
    
}
