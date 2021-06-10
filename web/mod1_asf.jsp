<%-- 
    Document   : mod1_asf
    Created on : 7/06/2021, 11:58:36 PM
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
        nombre_curso = "ASFIXIA";
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
    <title>Curso Asifixia</title>
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
                    <a href="menu_asf.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                    <img src="IMG/asfixia_curso.png">
                    <br>
                    <br>
                    <ul>
                        
                        <li class="lista">
                            <a href="" class="botonseleccionado">Introducción</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod2_asf.jsp" class="boton">Tipos de asfixia</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <% 
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 20, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod3_asf.jsp" class="boton">Primeros auxilios</a>
                        </li>
                        <%
                            }
                        %>
                        
                        
                        <%
                                
                            }
                        %>
                    </ul>
                </div>
            </td>
            <td>
                <div class="tema">
                    <ul>
                        <li class="lista">
                            <h3 class="titulo">Introducción</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            La asfixia se presenta como un fallo de la respiración pulmonar, donde hay una falta de oxígeno en el aire o por la imposibilidad de que éste llegue a los pulmones.
                            El oxígeno del aire no puede llegar a los pulmones cuando las vías respiratorias queden obstruidas.
                            <br>
                            Son ejemplos de asfixia en general: 
                            <br>
                            1.	Ausencia o reducción de la presión de oxígeno en la atmósfera o la sustitución del mismo por un gas inerte. 
                            Obturación de los orificios respiratorios externos. Obstrucción del tracto respiratorio. 
                            <br>
                            2.	Restricción de los movimientos respiratorios del tórax. 
                            <br>
                            3.	Enfermedades pulmonares que impiden o disminuyen el intercambio gaseoso. 
                            <br>
                            4.	Disminución de la función cardiaca, lo cual impide mantener el flujo circulatorio 
                            (para mantener la oxigenación sanguínea). 
                            <br>
                            5.	Disminución de la capacidad de la sangre para transportar el oxígeno. 
                            <br>
                            6.	Incapacidad de las células de los tejidos periféricos para usar el oxígeno.
                            <br>
                            <br>
                            En este curso hablaremos específicamente de la asfixia mecánica 
                            La asfixia mecánica es la suspensión de la corriente de aire por paro más o menos completo del acto respiratorio.

                        

                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub"> Posibles Causas</p>
                                La asfixia puede ser provocada por cualquiera de las siguientes causas:
                                <br>
                                •	Comer demasiado rápido, no masticar bien los 
                                alimentos o comer con prótesis dentales que no están bien ajustadas.
                                <br>
                                •	Consumir alcohol (incluso una pequeña cantidad 
                                afecta el estado de conciencia)
                                <br>
                                •	Estar inconsciente y broncoaspirarse con vómito
                                <br>
                                •	Inhalar objetos pequeños (niños pequeños)
                                <br>
                                •	Lesión en la cabeza y la cara (por ejemplo, la hinchazón, 
                                el sangrado o una deformidad pueden causar asfixia)
                                <br>
                                •	Problemas para tragar luego de un accidente cerebrovascular
                                <br>
                                •	Agrandamiento de las amígdalas o tumores del cuello y la garganta
                                <br>
                                •	Problemas con el esófago

                                <p class="sub">Clasificación</p>
                                1.	Obstrucción de los orificios respiratorios
                                <br>
                                2.	Oclusión de las vías respiratorias
                                <br>
                                3.	Compresión toraco-ambdominal o “asfixia traumática”
                                <br>
                                4.	Carencia de aire respirable

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
          <h2 class="titulocuestionario"> Cuestionario Módulo 1 </h2>
            <hr>
            
            <form action="Cuestionarios" method="GET" name="ASFmod1" onsubmit="return asfmod1(this)">
                <br>
                <label for="p1" class="pregunta">¿Qué es la asfixia o ahogamiento?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Se presenta como un fallo de la respiración pulmonar
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second">Reanimación cardiopulmonar
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second" checked>Incapacidad para hablar
                <br>
                <br>
                <label for="p2" class="pregunta">Posibles causas de la asfixia</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Comer demasiado rápido
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Agrandamiento de las amígdalas
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second" >Todas las anteriores
                <br>
                <br>
                <label for="p3" class="pregunta">¿Qué es la asifixia mecánica?</label>
                <br>
                <br>    
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Penetración de agua en las vías respiratorias
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">La suspensión de la corriente de aire
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">La constricción del cuello ejercida por un lazo
                <br>
                <br>
                <label for="p4" class="pregunta">Una clasificación de las asfixia mecánica</label>
                <br>
                <br>    
                <input type="radio" name="p4" value="1" class="fadeIn third" checked>Disminución de la capacidad de la sangre para transportar oxigeno 
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Disminución de la función cardiaca
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Comprensión toraco-abdominal
                <br>
                <br>
                <label for="p5" class="pregunta">Ejemplo de asfixias </label>
                <br>
                <br>    
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Compresiones en el pecho
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Ausencia o reducción de oxígeno
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Todas las anteriores
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="ASFIXIA">
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
