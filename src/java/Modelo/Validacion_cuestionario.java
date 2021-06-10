/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Modelo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Validacion_cuestionario {
    
    public int relacion(int id_alumno, String nom_curso, int modulo){
        MCurso cur = new MCurso();
        MCurso con_cur = new MCurso();
        int estatus = 0;
        RelacionAlumnoCurso rac = new RelacionAlumnoCurso();
        cur = con_cur.Datos_curso(nom_curso, modulo);
        java.util.Date fecha = new Date();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        String fec_alu = formato.format(fecha);
        rac.setId_alu(id_alumno);
        rac.setId_cur(cur.getId_cur());
        rac.setFec_alu(fec_alu);
        estatus = RelacionAlumnoCurso.registrarUsuario(rac);
        return estatus;
    }
    
    public int detalles(int id_dcue, int id_cur, int id_alu){
        MCuestionario cue = new MCuestionario();
        int estatus = 0;
        cue.setId_alu(id_alu);
        cue.setId_dcue(id_dcue);
        cue.setId_cur(id_cur);
        estatus = MCuestionario.registrarCuestionario(cue);
        return estatus;
    }
    
    public int asignacion(boolean q1, boolean q2, boolean q3, boolean q4, boolean q5, boolean apb){
        DCuestionario dcue = new DCuestionario();
        DCuestionario con_dcue = new DCuestionario();
        int retorno = 0, id_dcue = 0;
        dcue.setApb_dcue(apb);
        dcue.setP1_dcue(q1);
        dcue.setP2_dcue(q2);
        dcue.setP3_dcue(q3);
        dcue.setP4_dcue(q4);
        dcue.setP5_dcue(q5);
        int estatus = DCuestionario.registrarDCuestionario(dcue);
        if(estatus > 0){
            id_dcue = con_dcue.maxid_dcue();
            System.out.println(id_dcue);
            if(id_dcue != 0){
                retorno = id_dcue;
            }
        }
        return retorno;
    }
    
    public boolean rcpmod1(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("2")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("3")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "RCP", 15);
        }
        
        return apb_cue;
    }
    
    public boolean rcpmod2(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("3")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("1")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("3")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "RCP", 25);
        }
        
        return apb_cue;
    }
    
    public boolean rcpmod3(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("3")){
            pre1 = false;
        }
        if(!p2.equals("1")){
            pre2 = false;
        }
        if(!p3.equals("1")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        
        return apb_cue;
    }
    
    public boolean asfmod1(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("2")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "ASFIXIA", 15);
        }
        
        return apb_cue;
    }
    
    public boolean asfmod2(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("2")){
            pre2 = false;
        }
        if(!p3.equals("1")){
            pre3 = false;
        }
        if(!p4.equals("1")){
            pre4 = false;
        }
        if(!p5.equals("1")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "ASFIXIA", 25);
        }
        
        return apb_cue;
    }
    
    public boolean asfmod3(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("2")){
            pre2 = false;
        }
        if(!p3.equals("3")){
            pre3 = false;
        }
        if(!p4.equals("1")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        
        return apb_cue;
    }
    
    public boolean epimod1(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("2")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("1")){
            pre3 = false;
        }
        if(!p4.equals("1")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "EPILEPSIA", 15);
        }
        
        return apb_cue;
    }
    
    public boolean epimod2(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("1")){
            pre2 = false;
        }
        if(!p3.equals("3")){
            pre3 = false;
        }
        if(!p4.equals("1")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "EPILEPSIA", 25);
        }
        
        return apb_cue;
    }
    
    public boolean epimod3(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("3")){
            pre1 = false;
        }
        if(!p2.equals("1")){
            pre2 = false;
        }
        if(!p3.equals("1")){
            pre3 = false;
        }
        if(!p4.equals("2")){
            pre4 = false;
        }
        if(!p5.equals("3")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        
        return apb_cue;
    }
    
    public boolean botmod1(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("2")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("2")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "BOTIQUIN", 15);
        }
        
        return apb_cue;
    }
    
    public boolean botmod2(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("1")){
            pre1 = false;
        }
        if(!p2.equals("3")){
            pre2 = false;
        }
        if(!p3.equals("2")){
            pre3 = false;
        }
        if(!p4.equals("3")){
            pre4 = false;
        }
        if(!p5.equals("3")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        if(apb_cue){
            estatus = relacion(id_alumno, "BOTIQUIN", 25);
        }
        
        return apb_cue;
    }
    
    public boolean botmod3(String p1, String p2, String p3, String p4, String p5, int id_curso, int id_alumno){
        boolean pre1 = true, pre2 = true, pre3 = true, pre4 = true, pre5 = true, apb_cue = false;
        int id_dcue = 0, estatus = 0;
        if(!p1.equals("2")){
            pre1 = false;
        }
        if(!p2.equals("2")){
            pre2 = false;
        }
        if(!p3.equals("2")){
            pre3 = false;
        }
        if(!p4.equals("2")){
            pre4 = false;
        }
        if(!p5.equals("1")){
            pre5 = false;
        }
        if(pre1 && pre2 && pre3 && pre4 && pre5){
            apb_cue = true;
        }
        id_dcue = asignacion(pre1, pre2, pre3, pre4, pre5, apb_cue);
        if(id_dcue != 0){
            estatus = detalles(id_dcue, id_curso, id_alumno);
            if(estatus == 0){
                apb_cue = false;
            }
        }
        else{
            apb_cue = false;
        }
        
        return apb_cue;
    }
}