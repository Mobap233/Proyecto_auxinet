<%-- 
    Document   : mod3_bot.jsp
    Created on : 8/06/2021, 04:47:53 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MAlumno"%>
<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.Vistacue"%>
<%@page import="Modelo.Vistarac"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    Vistarac vis_rac = new Vistarac();
    Vistacue vis_cue = new Vistacue();
    MCurso cur = new MCurso();
    MCurso con_cur = new MCurso();
    MAlumno alu = new MAlumno();
    String nombre="", nombre_curso = "";
    int id_modulo = 0, id_curso = 0;
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
        alu = (MAlumno)sesionusu.getAttribute("alumno");
        nombre = usuario.getNom_usu();
        nombre_curso = "BOTIQUIN";
        id_modulo = 25;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_asf.jsp">
        <jsp:param name="error" value="Debe de primero ingresar al curso o terminar el modulo 1 o 2" />
        
    </jsp:forward>
    
    <%
        
    }
        
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/dentrocurso.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <script src="JS/validacion_cuestionario.js"></script>
    <title>Curso Botiquin</title>
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

    <table>
        <tr>
            <td class="nav2">
                <div>
                    <a href="menu_bot.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                    <img src="IMG/botiquin_curso.png">
                    <br>
                    <br>
                    <ul>
                        <li class="lista">
                            <a href="mod1_bot.jsp" class="boton">Introducción</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="mod2_bot.jsp" class="boton">Utilidad</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="" class="botonseleccionado">Instrumentación</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                    </ul>
                </div>
            </td>
        <td>
        <div class="tema">
            <ul>
                <li class="lista">
                    <h3 class="titulo">Instrumentación</h3>
                </li>
                <hr>
                <br>
                <br>
                <br>
                <li class="lista">


                    El siguiente video muestra la instrumentación, que se debe de tener contemplada cuando hablado de un botiquín de primeros auxilios.
                    <br>
                    <br>

                </li>
                <br>
                <br>

                <li class="lista">
                    <div class="primero">
                        <p class="sub">Botiquín de Emergencia</p>
                        <br>
                        <iframe class="video_b" src="https://www.youtube.com/embed/GUIv62M6RPU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                    </div>    
                </li>
            </ul>
        </div>
            <%
    if(!vis_cue.saberRac(id_curso, alu.getId_alu())){
    %>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <h2 class="titulocuestionario"> Cuestionario Módulo 3</h2>
                <hr>

                <form action="Cuestionarios" method="GET" name="BOTmod3" onsubmit="return botmod3(this)">
                    <br>

                    <label for="p6" class="pregunta">¿Con qué tipos de elementos se puede desinfectar una herida? </label>
                    <br>
                    <br>
                    <input type="radio" name="p1" value="1" class="fadeIn fourth" checked>Agua y jabón
                    <br>
                    <input type="radio" name="p1" value="2" class="fadeIn fourth" >Alcohol y Antisépticos
                    <br>
                    <input type="radio" name="p1" value="3" class="fadeIn fourth">Gel antibacterial y limón.
                    <br>
                    <br>
                    <br>
                    <label for="p7" class="pregunta">¿Con qué tipos de elementos podemos tratar heridas pequeñas?</label>
                    <br>
                    <br>
                    <input type="radio" name="p2" value="1" class="fadeIn fourth" checked>Cintas
                    <br>
                    <input type="radio" name="p2" value="2" class="fadeIn fourth">Apositos adhesivos
                    <br>
                    <input type="radio" name="p2" value="3" class="fadeIn fourth">Torniquetes
                    <br>
                    <br>
                    <br>
                    <label for="p8" class="pregunta">¿De los siguientes elementos cual es el más recomendable para evitar hacer contacto con la sangre? </label>
                    <br>
                    <br>
                    <input type="radio" name="p3" value="1" class="fadeIn fourth" checked>Guantes Nitrilo
                    <br>
                    <input type="radio" name="p3" value="2" class="fadeIn fourth" >Guantes de latex
                    <br>
                    <input type="radio" name="p3" value="3" class="fadeIn fourth">Guantes de Vinilo
                    <br>
                    <br>
                    <br>
                    <label for="p9" class="pregunta">Este elemento es indispensable cortar gasas, apositos y compresas:</label>
                    <br>
                    <br>
                    <input type="radio" name="p4" value="1" class="fadeIn fourth" checked>Bisturí
                    <br>
                    <input type="radio" name="p4" value="2" class="fadeIn fourth">Tijeras
                    <br>
                    <input type="radio" name="p4" value="3" class="fadeIn fourth">Cutter
                    <br>
                    <br>
                    <br>
                    <label for="p10" class="pregunta">Instrumento que nos ayuda a detener hemorragias:</label>
                    <br>
                    <br>

                    <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Apositos Hemostático.
                    <br>
                    <input type="radio" name="p5" value="2" class="fadeIn fourth">Gasa.
                    <br>
                    <input type="radio" name="p5" value="3" class="fadeIn fourth">Cintas de algodón.
                    <br>
                    <br>
                    <br>

                    <input type="hidden" name="curso" value="BOTIQUIN">
                    <input type="hidden" name="modulo" value="3">
                    <input type="submit" class="fadeIn fourth" value="Enviar">
                </form>
            </div>
        </div>
            <%
    }
    %>
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
