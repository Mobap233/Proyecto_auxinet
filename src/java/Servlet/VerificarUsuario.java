/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import Modelo.MAlumno;
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
public class VerificarUsuario extends HttpServlet {

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
            String user, pass;
            user = request.getParameter("usu");
            pass = request.getParameter("pass");
            if(user == null || pass == null){
                response.sendRedirect("iniciosesion.jsp");
            }
            else{
                //genero el objeto del usuario
                MUsuario u = new MUsuario();
                MAlumno alu = new MAlumno();
                MAlumno con_alu = new MAlumno();
                Validaciones val = new Validaciones();
                //Verifico el tipo de usuario
                if(!val.iniciosesion(user, pass)){
                    response.sendRedirect("iniciosesion.jsp");
                }
                else{
                    u = u.verificarUsuario(user, pass);
                    //Verifico la sesion
                    if(u!=null){
                        /*
                        El usario existe en la base de datos y la clave es correcta
                        */
                        System.out.println(u.getNom_usu());
                        System.out.println(u.getPass_usu());
                        System.out.println(u.getId_priv());
                        HttpSession sesionusu = request.getSession(true);
                        //ahora saber el tipo de usuario a traves de sus atributos
                        sesionusu.setAttribute("usuario", u);

                        if(u.getId_priv() == 15){
                            //este es el admin
                            response.sendRedirect("MenuAdmin.jsp");
                        }else{
                            //este es el cliente
                            if(con_alu.verificar_alumno(u.getId_usu())){
                                alu = con_alu.buscar_Alumno(u.getId_usu());
                                sesionusu.setAttribute("alumno", alu);
                            }
                            else{
                                int estatus = 0;
                                alu.setId_usu(u.getId_usu());
                                estatus = MAlumno.guardarAlumno(alu);
                                if(estatus > 0){
                                    alu = con_alu.buscar_Alumno(u.getId_usu());
                                    sesionusu.setAttribute("alumno", alu);
                                }
                                else{
                                    response.sendRedirect("iniciosesion.jsp");
                                }
                            }
                            response.sendRedirect("MenuUsuario.jsp");

                        }

                    } else{
                        //el usuario no esta registrado o no existe
                        response.sendRedirect("iniciosesion.jsp");
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
