/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Modelo.MAlumno;
import Modelo.MCuestionario;
import Modelo.MCurso;
import Modelo.MUsuario;
import Modelo.RelacionAlumnoCurso;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class Modulo_Botiquin extends HttpServlet {

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
            HttpSession sesionusu = request.getSession();
            MUsuario usu = new MUsuario();
            MAlumno alu = new MAlumno();
            MCurso cur = new MCurso();
            MCurso con_cur = new MCurso();
            cur = con_cur.Datos_curso("BOTIQUIN", 5);
            RelacionAlumnoCurso con_rac = new RelacionAlumnoCurso();
            RelacionAlumnoCurso rac = new RelacionAlumnoCurso();
            
            usu = (MUsuario)sesionusu.getAttribute("usuario");
            alu = (MAlumno)sesionusu.getAttribute("alumno");
            if(!con_rac.ingresoCurso(alu.getId_alu(), cur.getId_cur())){
                java.util.Date fecha = new Date();
                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                String fec_alu = formato.format(fecha);
                
                
                int estatus = 0;
                rac.setFec_alu(fec_alu);
                rac.setId_alu(alu.getId_alu());
                rac.setId_cur(cur.getId_cur());
                estatus = RelacionAlumnoCurso.registrarUsuario(rac);
                if(estatus > 0){
                    response.sendRedirect("mod1_bot.jsp");
                }
                else{
                    response.sendRedirect("menu_bot.jsp");
                }
            }
            else{
                response.sendRedirect("mod1_bot.jsp");
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
