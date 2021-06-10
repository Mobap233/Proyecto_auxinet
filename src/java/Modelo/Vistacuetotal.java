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
import java.util.Vector;
/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Vistacuetotal {
    private boolean p1, p2, p3, p4, p5, apb;
    private int id_cue, id_alu, id_mod;
    private String nom_cur;
    public Vistacuetotal(){
        
    }

    public Vector<Vistacuetotal> registros(){
        Vector<Vistacuetotal> register = new Vector<Vistacuetotal>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "select * from vistacuestotal";
            
            ps = con.prepareStatement(q);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                Vistacuetotal cues = new Vistacuetotal();
                cues.setId_cue(rs.getInt("id_cue"));
                cues.setId_alu(rs.getInt("id_alu"));
                cues.setId_mod(rs.getInt("id_mod"));
                cues.setP1(rs.getBoolean("p1_dcue"));
                cues.setP2(rs.getBoolean("p2_dcue"));
                cues.setP3(rs.getBoolean("p3_dcue"));
                cues.setP4(rs.getBoolean("p4_dcue"));
                cues.setP5(rs.getBoolean("p5_dcue"));
                cues.setApb(rs.getBoolean("apb_dcue"));
                cues.setNom_cur(rs.getString("nom_cur"));
                register.add(cues);
                
            }
            
        }catch(SQLException sq){
            System.out.println("Error al consultar los productos");
            System.out.println(sq.getMessage());
            register = null;
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
                
            
            }catch(Exception e){
                System.out.println("No encontro la clase");
                System.out.println(e.getMessage());
            
            }
        }
        return register;
    }
    
    public boolean isP1() {
        return p1;
    }

    public void setP1(boolean p1) {
        this.p1 = p1;
    }

    public boolean isP2() {
        return p2;
    }

    public void setP2(boolean p2) {
        this.p2 = p2;
    }

    public boolean isP3() {
        return p3;
    }

    public void setP3(boolean p3) {
        this.p3 = p3;
    }

    public boolean isP4() {
        return p4;
    }

    public void setP4(boolean p4) {
        this.p4 = p4;
    }

    public boolean isP5() {
        return p5;
    }

    public void setP5(boolean p5) {
        this.p5 = p5;
    }

    public boolean isApb() {
        return apb;
    }

    public void setApb(boolean apb) {
        this.apb = apb;
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
