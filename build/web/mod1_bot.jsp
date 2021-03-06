<%-- 
    Document   : mod1_bot
    Created on : 8/06/2021, 04:15:18 PM
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
        id_modulo = 5;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_asf.jsp">
        <jsp:param name="error" value="Tienes que registrarte en el curso primero" />
        
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
                            <a href="" class="botonseleccionado">Introducci??n</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod2_bot.jsp" class="boton">Utilidad</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <% 
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 20, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod3_bot.jsp" class="boton">Instrumentaci??n</a>
                        </li>
                        <%
                            }      
                            }
                        %>
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
                            <h3 class="titulo">Introducci??n</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">

                            Los accidentes dom??sticos son mucho m??s comunes de lo que imaginamos, y suceden inevitablemente pese a todas las precauciones que podamos tomar. 
                            <br>
                            La mayor??a de estos percances no tiene consecuencias graves para la salud de las personas, pero muchos precisan de una m??nima atenci??n o de unos 
                            primeros auxilios. 
                            <br>
                            Por lo tanto, la presencia de un botiqu??n con los elementos sanitarios y medicamentos b??sicos es un recurso de primera necesidad 
                            para ofrecer una respuesta adecuada ante una de estas situaciones.
                            Un botiqu??n de primeros auxilios bien equipado, y guardado en un
                            lugar de f??cil acceso, es una necesidad en cualquier casa.
                            Tener todo su contenido bien preparado con tiempo de antelaci??n 
                            lo ayudar?? a afrontar cualquier urgencia m??dica al instante.  
                            Tenga un botiqu??n de primeros auxilios en casa y otro en cada uno de sus coches.  
                            Aseg??rese tambi??n de llevarlo consigo cuando vaya de vacaciones con su familia.
                            <br>
                            <br>
                            Puede comprar el botiqu??n de primeros auxilios en una farmacia, una droguer??a o la sede 
                            local de la Cruz Roja, o bien prepar??rselo usted mismo. Si se lo prepara usted mismo, elija un 
                            malet??n para llevar los art??culos sanitarios que sea espacioso, resistente, 
                            f??cil de trasportar y f??cil de abrir. Las cajas de pl??stico duro con asas o los 
                            recipientes que se utilizan para guardar materiales para las artes pl??sticas son ideales, 
                            porque son ligeros, tienen asas, son muy espaciosos y disponen de compartimentos independientes. 
                            
                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub">??Cu??les son los percances m??s frecuentes en el hogar?</p>
                                La cocina es la estancia de la casa donde se dan la mayor??a de los percances dom??sticos, 
                                ya que concentra muchos utensilios peligrosos como cuchillos, tijeras, aparatos el??ctricos, 
                                elementos que alcanzan altas temperaturas o productos de limpieza que pueden resultar nocivos 
                                si se utilizan de manera inadecuada. As??, los cortes, quemaduras, intoxicaciones alimentarias 
                                o golpes resultan de lo m??s habitual. Tambi??n en el ba??o pueden ocurrir ca??das y resbalones 
                                en la ba??era, y accidentes con los aparatos el??ctricos o los art??culos de higiene.
                                <br>
                                <br>

                                En lo que respecta al resto del hogar, es posible tener alg??n susto con los enchufes; 
                                tambi??n los choques, golpes o aplastamientos por culpa del mobiliario, escaleras, 
                                cantos afilados o juguetes tirados son frecuentes; y hay que tener cuidado con otros elementos como ventanas, terrazas, barandillas o literas, entre otros.

                            </div>    
                        </li>
                        <br>
                        <br>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <%
    if(!vis_cue.saberRac(id_curso, alu.getId_alu())){
        %>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <h2 class="titulocuestionario"> Cuestionario M??dulo 1 </h2>
            <hr>

            <form action="Cuestionarios" method="GET" name="BOTmod1" onsubmit="return botmod1(this)">
                <br>
                <label for="p1" class="pregunta">??En d??nde es recomendable tener un botiqu??n?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second" checked>Casa y Autom??vil
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Oficina y Ba??o
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Tienda y Transporte P??blico
                <br>
                <br>
                <label for="p2" class="pregunta">??En donde puede adquirir un botiqu??n de primeros auxilios?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>En un supermercado
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">En una tienda de hospital
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">En una droguer??a
                <br>
                <br>
                <label for="p3" class="pregunta">??En donde suceden m??s comunmente los percanses dom??sticos.</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Sala
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third" >Cocina
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Ba??o
                <br>
                <br>
                <label for="p4" class="pregunta">??De los siguientes percanses dom??sticos cu??l es el m??s com??n?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third" checked>Gripe, cuerpo cortado , fiebre
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Ojos irritados, sudoraci??n excesiva, dolor de cabeza
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Cortes, quemaduras, intoxicaciones
                <br>
                <br>
                <label for="p5" class="pregunta">??Por qu?? es importante tener un botiqu??n de emergencias?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Sirve ??nicamente para controlar enfermedades.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Tener equipo de emergencia para alguna situaci??n de riesgo
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Para ayudar a los dem??s 
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="BOTIQUIN">
                <input type="hidden" name="modulo" value="1">
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
            <p>P??gina hecha para ense??ar mediante cursos 
                did??ctidos temas de primeros auxilios.
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
                    <li>Cerecedo Ram??rez Sebasti??n</li>
                    <li>Horteales Morales Antony Rafael</li>
                    <li>Mart??nez Gamboa Natalia</li>
                    <li>Toral Hern??ndez Leonardo Javier</li>
                </ul>
            </li>
        </ul>
        <div class="footer-bottom">
            ????? 2021 Copyright | <b>Auxinet</b> | Desarrollado por <b>DonkeyBit</b>
        </div>       
    </footer>
</div>
</body>
</html>