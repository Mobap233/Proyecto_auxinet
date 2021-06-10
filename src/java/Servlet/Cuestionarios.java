/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Modelo.MAlumno;
import Modelo.Validacion_cuestionario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Cuestionarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Validacion_cuestionario val_cue = new Validacion_cuestionario();
            HttpSession sesionusu = request.getSession();
            String p1, p2, p3, p4, p5, nombre, modulo;
            int id_curso = (int)sesionusu.getAttribute("id_curso");
            MAlumno alu = new MAlumno();
            alu = (MAlumno)sesionusu.getAttribute("alumno");
            p1 = request.getParameter("p1");
            p2 = request.getParameter("p2");
            p3 = request.getParameter("p3");
            p4 = request.getParameter("p4");
            p5 = request.getParameter("p5");
            nombre = request.getParameter("curso");
            modulo = request.getParameter("modulo");
            if(p1 == null || p2 == null || p3 == null || p4 == null || p5 == null || nombre == null || modulo == null){
                response.sendRedirect("cursos.jsp");
            }else{                       
                if(nombre.equals("RCP")){
                    if(modulo.equals("1")){
                        if(val_cue.rcpmod1(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod2_rcp.jsp");
                        }
                        else{
                            response.sendRedirect("mod1_rcp.jsp");
                        }
                    }
                    else if(modulo.equals("2")){
                        if(val_cue.rcpmod2(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_rcp.jsp");
                        }
                        else{
                            response.sendRedirect("mod2_rcp.jsp");
                        }
                    }
                    else if(modulo.equals("3")){
                        if(val_cue.rcpmod3(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_rcp.jsp");
                        }
                        else{
                            response.sendRedirect("mod3_rcp.jsp");
                        }
                    }
                    else{
                        response.sendRedirect("cursos.jsp");
                    }
                } else if(nombre.equals("ASFIXIA")){
                    if(modulo.equals("1")){
                        if(val_cue.asfmod1(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod2_asf.jsp");
                        }
                        else{
                            response.sendRedirect("mod1_asf.jsp");
                        }
                    }
                    else if(modulo.equals("2")){
                        if(val_cue.asfmod2(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_asf.jsp");
                        }
                        else{
                            response.sendRedirect("mod2_asf.jsp");
                        }
                    }
                    else if(modulo.equals("3")){
                        if(val_cue.asfmod3(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_asf.jsp");
                        }
                        else{
                            response.sendRedirect("mod3_asf.jsp");
                        }
                    }
                    else{
                        response.sendRedirect("cursos.jsp");
                    }
                } else if(nombre.equals("EPILEPSIA")){
                    if(modulo.equals("1")){
                        if(val_cue.epimod1(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod2_epi.jsp");
                        }
                        else{
                            response.sendRedirect("mod1_epi.jsp");
                        }
                    }
                    else if(modulo.equals("2")){
                        if(val_cue.epimod2(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_epi.jsp");
                        }
                        else{
                            response.sendRedirect("mod2_epi.jsp");
                        }
                    }
                    else if(modulo.equals("3")){
                        if(val_cue.epimod3(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_epi.jsp");
                        }
                        else{
                            response.sendRedirect("mod3_epi.jsp");
                        }
                    }
                    else{
                        response.sendRedirect("cursos.jsp");
                    }
                } else if(nombre.equals("BOTIQUIN")){
                    if(modulo.equals("1")){
                        if(val_cue.botmod1(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod2_bot.jsp");
                        }
                        else{
                            response.sendRedirect("mod1_bot.jsp");
                        }
                    }
                    else if(modulo.equals("2")){
                        if(val_cue.botmod2(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_bot.jsp");
                        }
                        else{
                            response.sendRedirect("mod2_bot.jsp");
                        }
                    }
                    else if(modulo.equals("3")){
                        if(val_cue.botmod3(p1, p2, p3, p4, p5, id_curso, alu.getId_alu())){
                            response.sendRedirect("mod3_bot.jsp");
                        }
                        else{
                            response.sendRedirect("mod3_bot.jsp");
                        }
                    }
                    else{
                        response.sendRedirect("cursos.jsp");
                    }
                } else{
                    response.sendRedirect("cursos.jsp");
                }
            }   
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
