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
                            <h3 class="titulo">Introducci??n</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            La asfixia se presenta como un fallo de la respiraci??n pulmonar, donde hay una falta de ox??geno en el aire o por la imposibilidad de que ??ste llegue a los pulmones.
                            El ox??geno del aire no puede llegar a los pulmones cuando las v??as respiratorias queden obstruidas.
                            <br>
                            Son ejemplos de asfixia en general: 
                            <br>
                            1.	Ausencia o reducci??n de la presi??n de ox??geno en la atm??sfera o la sustituci??n del mismo por un gas inerte. 
                            Obturaci??n de los orificios respiratorios externos. Obstrucci??n del tracto respiratorio. 
                            <br>
                            2.	Restricci??n de los movimientos respiratorios del t??rax. 
                            <br>
                            3.	Enfermedades pulmonares que impiden o disminuyen el intercambio gaseoso. 
                            <br>
                            4.	Disminuci??n de la funci??n cardiaca, lo cual impide mantener el flujo circulatorio 
                            (para mantener la oxigenaci??n sangu??nea). 
                            <br>
                            5.	Disminuci??n de la capacidad de la sangre para transportar el ox??geno. 
                            <br>
                            6.	Incapacidad de las c??lulas de los tejidos perif??ricos para usar el ox??geno.
                            <br>
                            <br>
                            En este curso hablaremos espec??ficamente de la asfixia mec??nica 
                            La asfixia mec??nica es la suspensi??n de la corriente de aire por paro m??s o menos completo del acto respiratorio.

                        

                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub"> Posibles Causas</p>
                                La asfixia puede ser provocada por cualquiera de las siguientes causas:
                                <br>
                                ???	Comer demasiado r??pido, no masticar bien los 
                                alimentos o comer con pr??tesis dentales que no est??n bien ajustadas.
                                <br>
                                ???	Consumir alcohol (incluso una peque??a cantidad 
                                afecta el estado de conciencia)
                                <br>
                                ???	Estar inconsciente y broncoaspirarse con v??mito
                                <br>
                                ???	Inhalar objetos peque??os (ni??os peque??os)
                                <br>
                                ???	Lesi??n en la cabeza y la cara (por ejemplo, la hinchaz??n, 
                                el sangrado o una deformidad pueden causar asfixia)
                                <br>
                                ???	Problemas para tragar luego de un accidente cerebrovascular
                                <br>
                                ???	Agrandamiento de las am??gdalas o tumores del cuello y la garganta
                                <br>
                                ???	Problemas con el es??fago

                                <p class="sub">Clasificaci??n</p>
                                1.	Obstrucci??n de los orificios respiratorios
                                <br>
                                2.	Oclusi??n de las v??as respiratorias
                                <br>
                                3.	Compresi??n toraco-ambdominal o ???asfixia traum??tica???
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
          <h2 class="titulocuestionario"> Cuestionario M??dulo 1 </h2>
            <hr>
            
            <form action="Cuestionarios" method="GET" name="ASFmod1" onsubmit="return asfmod1(this)">
                <br>
                <label for="p1" class="pregunta">??Qu?? es la asfixia o ahogamiento?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Se presenta como un fallo de la respiraci??n pulmonar
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second">Reanimaci??n cardiopulmonar
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second" checked>Incapacidad para hablar
                <br>
                <br>
                <label for="p2" class="pregunta">Posibles causas de la asfixia</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Comer demasiado r??pido
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Agrandamiento de las am??gdalas
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second" >Todas las anteriores
                <br>
                <br>
                <label for="p3" class="pregunta">??Qu?? es la asifixia mec??nica?</label>
                <br>
                <br>    
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Penetraci??n de agua en las v??as respiratorias
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">La suspensi??n de la corriente de aire
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">La constricci??n del cuello ejercida por un lazo
                <br>
                <br>
                <label for="p4" class="pregunta">Una clasificaci??n de las asfixia mec??nica</label>
                <br>
                <br>    
                <input type="radio" name="p4" value="1" class="fadeIn third" checked>Disminuci??n de la capacidad de la sangre para transportar oxigeno 
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Disminuci??n de la funci??n cardiaca
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Comprensi??n toraco-abdominal
                <br>
                <br>
                <label for="p5" class="pregunta">Ejemplo de asfixias </label>
                <br>
                <br>    
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Compresiones en el pecho
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Ausencia o reducci??n de ox??geno
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
