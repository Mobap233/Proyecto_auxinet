<%-- 
    Document   : mod3_rcp
    Created on : 7/06/2021, 10:52:32 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MAlumno"%>
<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.Vistacue"%>
<%@page import="Modelo.MUsuario"%>
<%@page import="Modelo.Vistarac"%>
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
        nombre_curso = "RCP";
        id_modulo = 25;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_rcp.jsp">
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
    <title>Curso RCP 3</title>
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
                    <a href="menu_rcp.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                    <img src="IMG/rcp_curso.png">
                    <br>
                    <br>
                    <ul>
                        <li class="lista">
                            <a href="mod1_rcp.jsp" class="boton">Introducción</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="mod2_rcp.jsp" class="boton">Causas y Consecuencias</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="" class="botonseleccionado">Pasos por hacer</a>
                        </li>
                    </ul>
                </div>
            </td>
            <td>
                <div class="tema">
                    <ul>
                        <li class="lista">
                            <h3 class="titulo">Pasos por hacer</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            Antes de comenzar
                            <br>

                                Antes de comenzar la reanimación cardiopulmonar, verifica lo siguiente:
                                <br>
                                •	¿La persona está en un entorno seguro?
                                <br>
                                •	¿La persona está consciente o inconsciente?
                                <br>
                                •	Si la persona parece inconsciente, tócale o golpéale el hombro y pregúntale en voz alta "¿Te encuentras bien?"
                                <br>
                                •	Si la persona no responde y hay dos personas disponibles, pídele a una que llame al 911 o al número local para emergencias y trae el desfibrilador, si hay una persona disponible, y pídele a la otra que comience la reanimación cardiopulmonar.
                                <br>
                                •	Si estás solo y tienes acceso inmediato a un teléfono, llama al 911 o al número local de emergencias antes de comenzar la reanimación cardiopulmonar. Si tienes un AED cerca, tráelo.
                                <br>
                                •	Ni bien tengas el desfibrilador, proporciona una descarga si lo indica el dispositivo y, luego, comienza a realizar RCP.

                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                Compresiones: restaurar la circulación sanguínea
                                <br>
                                <br>
                                1.	Acuesta a la persona de espalda sobre una superficie firme.
                                <br>
                                2.	Arrodíllate junto al cuello y los hombros de la persona.
                                <br>
                                3.	Coloca la base de la palma de una de tus manos sobre el centro del pecho de la persona, entre los pezones. Coloca tu otra mano encima de la mano que está sobre el pecho. Mantén los codos estirados y coloca tus hombros directamente encima de tus manos.
                                <br>
                                4.	Con el peso de la parte superior de tu cuerpo (no solo con los brazos) presiona hacia abajo (comprime) el pecho al menos 2 pulgadas (unos 5 centímetros), pero no más de 2,4 pulgadas (aproximadamente 6 centímetros). Presiona el pecho con firmeza a un ritmo de 100 a 120 compresiones por minuto.
                                <br>
                                5.	Si no estás capacitado en reanimación cardiopulmonar, continúa realizando compresiones en el pecho hasta que haya señales de movimiento o hasta que llegue el personal médico de emergencia. Si has recibido capacitación para hacer reanimación cardiopulmonar, abre las vías respiratorias y proporciona respiración de rescate.
                                
                            </div>    
                        </li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <br>
    <br>
    
    <%
    if(!vis_cue.saberRac(id_curso, alu.getId_alu())){
    %>
    
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <h2 class="titulocuestionario"> Cuestionario Módulo 3 </h2>
            <hr>


            <form action="Cuestionarios" method="GET" name="RCPmod3" onsubmit="return rcpmod3(this)">
                <br>
                <label for="p1" class="pregunta">¿Qué hago si la persona esta inconsciente?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second" checked>Comenzar a dar RCP 
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second">Golpea su hombro y pregunta si esta bien 
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Todas las anteriores 
                <br>
                <br>
                <label for="p2" class="pregunta">¿Qué es lo primero que se recomienda antes de aplicar RCP?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second">Buscar ayuda y llamar al 911 
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second" checked>Nnguna empezar de inmediato a dar RCP 
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Usar un desfribilador  
                <br>
                <br>
                <label for="p3" class="pregunta">Primer paso durante el RCP</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third">Acuesta a la persona de espalda sobre una superficie firme.  
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third" checked>Dar respiracion boca boca. 
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Arrodillate junto al cuello y los hombros de las perosna. 
                <br>
                <br>
                <label for="p4" class="pregunta">Si no estas tan capacitado ¿Qué es lo mejor?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third">Pedir ayuda y alejarse de la zona 
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third" checked>No hacer nada
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Solo realizar compresiones en el pecho hasta que muestre señales
                <br>
                <br>
                <label for="p5" class="pregunta">¿Cómo se debe de aplicar precio en el pecho?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Solo con la fuerza de la muñeca 
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Con el peso superior de tu cuerpo con un ritmo de 100 a 120   
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Con las rodillas en él tórax  
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="RCP">
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
