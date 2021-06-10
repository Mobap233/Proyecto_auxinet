/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Modelo.MUsuario;
import Modelo.Validaciones;
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
public class actualiza extends HttpServlet {

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
            Validaciones con_val = new Validaciones();
            usu = (MUsuario)sesionusu.getAttribute("usuario");
            String pas_act="", pas_new="", conf="";
            pas_act = request.getParameter("password_act");
            pas_new = request.getParameter("password_new");
            conf = request.getParameter("conf_password");
            if(pas_act == null || pas_new == null || conf == null){
                response.sendRedirect("actualizar.jsp");
            }
            else{
                if(usu.getPass_usu().equals(pas_act)){
                    if(!pas_act.equals(pas_new)){
                        if(con_val.actualizar(pas_new, conf)){
                            int estatus = 0;
                            estatus = MUsuario.actualizarUsuario(usu, pas_new);
                            if(estatus > 0){
                                response.sendRedirect("MenuUsuario.jsp");
                            }
                            else{
                                response.sendRedirect("actualizar.jsp");
                            }
                        }
                        else{
                            response.sendRedirect("actualizar.jsp");
                        }
                    }
                    else{
                        response.sendRedirect("actualizar.jsp");
                    }
                    
                }
                else{
                    response.sendRedirect("actualizar.jsp");
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
