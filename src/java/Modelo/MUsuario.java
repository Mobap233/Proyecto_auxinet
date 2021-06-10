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

import Control.Conexion;
import java.sql.*;
import java.util.*;

public class MUsuario {
    
    private int id_usu, id_priv, edad_usu;
    private String sex_usu, nom_usu, pass_usu;
    
    public MUsuario(){
        
    }

    public static int registrarUsuario(MUsuario u){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "insert into musuario(nom_usu, pas_usu, eda_usu, sex_usu, id_priv)"
                    + "values(?, ?, ?, ?, ?)";
            ps = con.prepareStatement(q);
            ps.setString(1, u.getNom_usu());
            ps.setString(2, u.getPass_usu());
            ps.setInt(3, u.getEdad_usu());
            ps.setString(4, u.getSex_usu());
            ps.setInt(5, u.getId_priv());
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
    
    public static int actualizarUsuario(MUsuario u, String new_pass){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "update musuario set  pas_usu = ?"
                    + "where id_usu = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, new_pass);
            ps.setInt(2, u.getId_usu());
            estatus = ps.executeUpdate();
            System.out.println("El usuario ha sido actualizado con exito");
        } catch(SQLException sq){
            System.out.println("Error al actualizar el usuario en la BD");
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
    
    public Vector<MUsuario> usuarios(){
        Vector<MUsuario> register = new Vector<MUsuario>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "select * from musuario where id_priv = 5";
            
            ps = con.prepareStatement(q);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                MUsuario alu = new MUsuario();
                alu.setId_usu(rs.getInt("id_usu"));
                alu.setSex_usu(rs.getString("sex_usu"));
                alu.setNom_usu(rs.getString("nom_usu"));
                alu.setEdad_usu(rs.getInt("eda_usu"));
                register.add(alu);
                
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
    
    public static int eliminarUsuario(int id){
        int estatus = 0;
        PreparedStatement ps = null;
        Connection con = null;
        try{
            con = Conexion.getConexion();
            String q = "delete from musuario where id_usu = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus = ps.executeUpdate();
            System.out.println("El usuario ha sido eliminado con exito");
        } catch(SQLException sq){
            System.out.println("Error al eliminar el usuario en la BD");
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
    
    public MUsuario verificarUsuario(String user, String pass){
        MUsuario u = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from MUsuario where nom_usu = ? AND pas_usu = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()){
                u = new MUsuario();
                u.setId_usu(rs.getInt("id_usu"));
                u.setNom_usu(rs.getString("nom_usu"));
                u.setEdad_usu(rs.getInt("eda_usu"));
                u.setPass_usu(rs.getString("pas_usu"));
                u.setSex_usu(rs.getString("sex_usu"));
                u.setId_priv(rs.getInt("id_priv"));
                break;
            }   
            System.out.println("Se conecto al MUsuario");
            
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
            return u;
        }
    }
    
    public boolean consultarNombre(String nombre){
        boolean bandera = false;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "Select * from MUsuario where nom_usu = ?";
            ps = con.prepareStatement(q);
            ps.setString(1, nombre);
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
    
    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public int getId_priv() {
        return id_priv;
    }

    public void setId_priv(int id_priv) {
        this.id_priv = id_priv;
    }

    public int getEdad_usu() {
        return edad_usu;
    }

    public void setEdad_usu(int edad_usu) {
        this.edad_usu = edad_usu;
    }

    public String getSex_usu() {
        return sex_usu;
    }

    public void setSex_usu(String sex_usu) {
        this.sex_usu = sex_usu;
    }

    public String getNom_usu() {
        return nom_usu;
    }

    public void setNom_usu(String nom_usu) {
        this.nom_usu = nom_usu;
    }

    public String getPass_usu() {
        return pass_usu;
    }

    public void setPass_usu(String pass_usu) {
        this.pass_usu = pass_usu;
    }
    
}
