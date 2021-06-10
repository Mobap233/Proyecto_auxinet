<%-- 
    Document   : mod1_epi
    Created on : 8/06/2021, 01:21:11 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.Vistarac"%>
<%@page import="Modelo.Vistacue"%>
<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.MUsuario"%>
<%@page import="Modelo.MAlumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        nombre_curso = "EPILEPSIA";
        id_modulo = 5;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_epi.jsp">
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
    <title>Curso Epilepsia</title>
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
                    <a href="menu_epi.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                    <img src="IMG/epilepsia_curso.png">
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
                            <a href="mod2_epi.jsp" class="boton">Síntomas y Causas</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <% 
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 20, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod3_epi.jsp" class="boton">Pasos por hacer</a>
                        </li>
                        <%
                            }   
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
                            
                            La epilepsia es un trastorno del sistema nervioso central (neurológico) en el que la 
                            actividad cerebral se vuelve anormal, lo que provoca convulsiones o períodos de comportamientos 
                            o sensaciones inusuales y, a veces, pérdida de conciencia.
                            <br>
                            <br>
                            Cualquier persona puede desarrollar epilepsia. 
                            <br>

                            La epilepsia afecta tanto a hombres como a 
                            mujeres de todas las razas, orígenes étnicos y edades.
                            <br>
                            <br>
                            Los síntomas de las convulsiones pueden variar ampliamente. Algunas personas con epilepsia 
                            simplemente miran de manera fija por unos segundos durante una convulsión, mientras que otras 
                            mueven repetidamente los brazos o las piernas. 
                            <br>
                            Tener una sola convulsión no significa que padezcas 
                            epilepsia. Por lo general, se requieren al menos dos convulsiones no provocadas para determinar un 
                            diagnóstico de epilepsia.


                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                
                                El tratamiento con medicamentos o, en ocasiones, la cirugía pueden controlar las convulsiones en la mayoría de las personas que tienen epilepsia.
                                <br>

                                Algunas personas requieren tratamiento de por vida para controlar las convulsiones, 
                                sin embargo, en otros casos, las convulsiones eventualmente desaparecen. 
                                Algunos niños con epilepsia pueden superar la enfermedad con la edad.
                                <br>
                                
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

            <form action="Cuestionarios" method="GET" name="EPImod1" onsubmit="return epimod1(this)">
                <br>
                <label for="p1" class="pregunta">¿Qué es la epilepsia?</label>
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second" checked>Trastorno del sistema inmunológico.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second">Trastorno del sistema nervioso.
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Trastorno del sistema respiratorio.
            
        
            
                <br>
                <br>
                <label for="p2" class="pregunta">¿Qué tipos de trastorno es la epilepsia?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Físico.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Psicológico.
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Neurológico.
            
                <br>
                <br>
            
                <label for="p3" class="pregunta">¿Qué provoca la epilepsia?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third">Convulsiones o perdidas de conciencia. 
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Dolor de cabeza.
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third" checked>Psicosis.
            
                <br>
                <br>
            
                <label for="p4" class="pregunta">Sintomas de epilepsia:</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third">Movimientos repentinos de brazos o piernas, mirada fija durante una convulsión.
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third" checked>Delirio y falta de apetito.
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Daño neuronal permanente y problemas de visión.
            
                <br>
                <br>
            
                <label for="p5" class="pregunta">¿Con qué tratamientos se puede superar la epilepsia:</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Cirugía.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Quimioterapia.
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Nebulisaciones.
            
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="EPILEPSIA">
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