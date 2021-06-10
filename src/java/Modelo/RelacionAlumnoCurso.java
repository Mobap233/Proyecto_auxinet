
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
public class RelacionAlumnoCurso {
    private int id_rac, id_cur, id_alu;
    private String fec_alu;
    public RelacionAlumnoCurso(){
        
    }

    public boolean ingresoCurso(int id_alumno, int curso){
        boolean bandera = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from relacionalumnocurso where id_alu = ? and id_cur = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_alumno);
            ps.setInt(2, curso);
            rs = ps.executeQuery();
            while(rs.next()){
                bandera = true;
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar al usuario");
            System.out.println(sq.getMessage());
            bandera = true;
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
    
    public static int registrarUsuario(RelacionAlumnoCurso rac){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "insert into relacionalumnocurso(id_alu, id_cur, fec_alu)"
                    + "values(?, ?, ?)";
            ps = con.prepareStatement(q);
            ps.setInt(1, rac.getId_alu());
            ps.setInt(2, rac.getId_cur());
            ps.setString(3, rac.getFec_alu());
            estatus = ps.executeUpdate();
            System.out.println("El usuario ha sido registrado con exito");
        } catch(SQLException sq){
            System.out.println("Error al registrar el usuario en la BD");
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
    
    public int getId_rac() {
        return id_rac;
    }

    public void setId_rac(int id_rac) {
        this.id_rac = id_rac;
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

    public String getFec_alu() {
        return fec_alu;
    }

    public void setFec_alu(String fec_alu) {
        this.fec_alu = fec_alu;
    }
    
}
