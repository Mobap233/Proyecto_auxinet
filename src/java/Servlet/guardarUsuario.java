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

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class guardarUsuario extends HttpServlet {

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
            MUsuario usu = new MUsuario();
            Validaciones val = new Validaciones();
            MUsuario con_usu = new MUsuario();
            String name, password, confirmed_password, moment_edad, sexo;
            int edad, estatus;
            name =  request.getParameter("nom");
            password = request.getParameter("pass");
            confirmed_password = request.getParameter("conf_pass");
            moment_edad = request.getParameter("edad");
            sexo = request.getParameter("sexo");
            if(sexo.equals("Prefiero no decirlo")){
                sexo = "Otro";
            }
            if(name == null || password == null || confirmed_password == null || sexo == null || moment_edad == null){
                response.sendRedirect("registro.jsp");
            }
            else{
                if(!val.guardarUsuario(name, password, confirmed_password, moment_edad)){
                    response.sendRedirect("registro.jsp");
                }
                else{
                    if(!sexo.equals("Otro") && !sexo.equals("Masculino") && !sexo.equals("Femenino")){
                        response.sendRedirect("registro.jsp");
                    }
                    else{
                        edad = Integer.parseInt(moment_edad);
                        usu.setEdad_usu(edad);
                        usu.setId_priv(1);
                        usu.setNom_usu(name);
                        usu.setPass_usu(password);
                        usu.setSex_usu(sexo);
                        if(!con_usu.consultarNombre(name)){
                            estatus = MUsuario.registrarUsuario(usu);
                            if(estatus > 0){
                                response.sendRedirect("iniciosesion.jsp");
                            }
                            else{
                                response.sendRedirect("registro.jsp");
                            }
                        }
                        else{
                            System.out.println("El nombre de usuario ya ha sido registrado");
                            response.sendRedirect("registro.jsp");
                        }
                    }
                    
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
