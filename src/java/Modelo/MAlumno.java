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

public class MAlumno {
    private int id_alu, id_usu;
    
    public MAlumno(){
        
    }
        
    public boolean verificar_alumno(int id_usuario){
        boolean bandera = false;
        MUsuario u = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from malumno where id_usu = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_usuario);
            rs = ps.executeQuery();
            while(rs.next()){
                bandera = true;
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar al usuario");
            System.out.println(sq.getMessage());
            u = null;
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
    
    public MAlumno buscar_Alumno(int id_usuario){
        MAlumno alu = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from malumno where id_usu = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_usuario);
            rs = ps.executeQuery();
            while(rs.next()){
                alu = new MAlumno();
                alu.setId_usu(rs.getInt("id_usu"));
                alu.setId_alu(rs.getInt("id_alu"));
                break;
            }   
            
        }catch (SQLException sq){
            System.out.println("Error al consultar al usuario");
            System.out.println(sq.getMessage());
            alu = null;
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
            return alu;
        }
    }
    
    public static int guardarAlumno(MAlumno alu){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "insert into malumno(id_usu)"
                    + "values(?)";
            ps = con.prepareStatement(q);
            ps.setInt(1, alu.getId_usu());
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
    
    public int getId_alu() {
        return id_alu;
    }

    public void setId_alu(int id_alu) {
        this.id_alu = id_alu;
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }
    
}
