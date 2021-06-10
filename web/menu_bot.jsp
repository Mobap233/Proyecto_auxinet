<%-- 
    Document   : menu_bot
    Created on : 8/06/2021, 04:10:04 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.MAlumno"%>
<%@page import="Modelo.RelacionAlumnoCurso"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    boolean bandera = false;
    RelacionAlumnoCurso con_rac = new RelacionAlumnoCurso();
    MAlumno alu = new MAlumno();
    MUsuario usuario = new MUsuario();
    String nombre="";
    HttpSession sesionusu = request.getSession();
    if(sesionusu.getAttribute("usuario")==null){
    
    %>
    
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%
    
    }else{
        usuario = (MUsuario)sesionusu.getAttribute("usuario");
        if(usuario.getId_priv() == 15){
             %>
    
    <jsp:forward page="MenuAdmin.jsp">
        <jsp:param name="error" value="Esta pagina es de clientes" />
        
    </jsp:forward>
    
    <%
        }
        MCurso cur = new MCurso();
        MCurso con_cur = new MCurso();
        cur = con_cur.Datos_curso("BOTIQUIN", 5);
        alu = (MAlumno)sesionusu.getAttribute("alumno");
        nombre = usuario.getNom_usu();
        bandera = con_rac.ingresoCurso(alu.getId_alu(), cur.getId_cur());
        nombre = usuario.getNom_usu();
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/disenio_curso.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <title>Botiquin</title>
</head>
<body>
    <nav>
        <a href="MenuUsuario.jsp" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuUsuario.jsp">INICIO</a></li>
            <li><a href="actualizar.jsp"><%=nombre%></a></li>
            <li><a href="cursos.jsp">CURSOS</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>

    <table class="tabla">
        <tr>
            <td>
                <a href="cursos.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                <h2 class="titulo">
                    Curso sobre el Botiquín de Emergencia
                </h2>
                <p class="subtitulo">
                    Aprende a como crear y hacer un buen uso de tu botiquín.
                </p>
                <br>
                <%
                    if(bandera){
                        %>
                        <a href="mod1_bot.jsp" class="boton">Continuar Curso</a>
                <%
                    }else{
                        %>
                         <a href="Modulo_Botiquin" class="boton">Comenzar Curso</a>
                        <%
                    }
                    
                %>
            </td>
            <td>
                <img class="rcp" src="IMG/curso_kit.png">
            </td>
        </tr>
    </table>
    <br>
    <hr>
    <br>
    <table class="tabla">
        <tr>
            <td class="parte1">
                <h3 class="acerca">Acerca de este curso</h3>
                <p class="parrafo">
                    Con este curso gratuito aprenderás a que tener en tu botiquín o kit 
                    de emergencia. Nunca sabemos cuando necesitaremos algun medicamento o 
                    utensilio, por ello hay que estar listos. Aprenderás lo suficiente para salvarle la vida 
                    a alguien.
                </p>
            </td>
            <td>
                <ul class="lista2">
                    <li class="ct">
                        Características del Curso 
                    </li>
                    <br>
                    <br>
                    <li>
                        <i class="fas fa-check-circle fa-1.5x"></i>
                        Curso Gratuito
                    </li>
                    <br>
                    <li>
                        <i class="fas fa-check-circle fa-1.5x"></i>
                        Aprende a crear tu botiquín de emergencia
                    </li>
                    <br>
                    <li>
                        <i class="fas fa-check-circle fa-1.5x"></i>
                        Contenido Dinámico
                    </li>
                    <br>
                    <li>
                        <i class="fas fa-check-circle fa-1.5x"></i>
                        Acceso Ilimitado
                    </li>
                    <br>
                    <li>
                        <i class="fas fa-check-circle fa-1.5x"></i>
                        Para principiantes
                    </li>
                </ul>
            </td>
        </tr>
    </table>
    <div class="separacion">
        <br>
        <center><h1>Temas</h1></center>
        <table class="tabla2" align="center">
            <tr>
                <td>
                    <div class="caja">
                        <div>
                            <br>
                            <center><i class="fas fa-book-medical fa-3x"></i></center>
                        </div>
                        <br>
                        <br>
                        <center><p class="decaja">Introducción</p></center>
                        <br>
                    </div>
                </td>
                <td>
                    <div class="caja">
                        <div>
                            <br>
                            <center><i class="fas fa-question fa-3x"></i></center>
                        </div>
                        <br>
                        <br>
                        <center><p class="decaja">¿Qués es? - ¿Para qué sirve?</p></center>
                    </div>
                </td>
                <td>
                    <div class="caja">
                        <div>
                            <br>
                            <center><i class="fas fa-clipboard-list fa-3x"></i></center>
                        </div>
                        <br>
                        <br>
                        <center><p class="decaja">¿Qué materiales debemos tener?</p></center>
                    </div>
                </td>
                <td>
                    <div class="caja">
                        <div>
                            <br>
                            <center><i class="fas fa-user-graduate fa-3x"></i></center>
                        </div>
                        <br>
                        <br>
                        <center><p class="decaja">Cuestionario</p></center>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br>
    <br>
    <br>
    <br>

<div class="pie">
    <hr>
    <footer class="footer">
        <div class="footer-left">
            <img src="IMG/Logo_Auxinet.png" alt="">
            <p>Página hecha para enseñar mediante cursos 
                didáctidos temas de primeros auxilios.
            </p>
        </div>
        <ul class="footer-right">
            <li>
                <h2>Links</h2>
                <ul class="box">
                    <li><a href="MenuUsuario.jsp">INICIO</a></li>
                    <li><a href="actualizar.jsp">MI CUENTA</a></li>
                    <li><a href="cursos.jsp">CURSOS</a></li>
                </ul>
            </li>
            <li>
                <h2>Desarrollado Por:</h2>
                <ul class="box">
                    <li>Arzate Bello Sergio Sachiel</li>
                    <li>Basilio Polo Mario Oswaldo</li>
                    <li>Cerecedo Ramírez Sebastián</li>
                    <li>Horteales Morales Antony Rafael</li>
                    <li>Martínez Gamboa Natalia</li>
                    <li>Toral Hernández Leonardo Javier</li>
                </ul>
            </li>
        </ul>
        <div class="footer-bottom">
            ©️ 2021 Copyright | <b>Auxinet</b> | Desarrollado por <b>DonkeyBit</b>
        </div>       
    </footer>
</div>
</body>
</html>