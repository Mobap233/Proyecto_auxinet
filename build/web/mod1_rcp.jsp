<%-- 
    Document   : mod1_rcp
    Created on : 7/06/2021, 04:28:29 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MAlumno"%>
<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.Vistacue"%>
<%@page import="Modelo.Vistarac"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
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
        id_modulo = 5;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_rcp.jsp">
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
    <title>Curso RCP</title>
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
                            <a href="mod2_rcp.jsp" class="boton">Causas y Consecuencias</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <% 
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 20, usuario.getId_usu())){
                                %>
                        <li class="lista">
                            <a href="mod3_rcp.jsp" class="boton">Pasos por hacer</a>
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
                            <p class="sub">Primer Caso</p>
                            <table>
                                <tr>
                                    <td class="temita">
                                        <div>
                                            El primer testimonio escrito que tenemos sobre la reanimaci??n cardiopulmonar se encuentra en el Antiguo 
                                            Testamento y data del a??o 600 antes de Cristo, m??s concretamente en el libro 2 Reyes 4. En sus p??ginas 
                                            se habla sobre la resucitaci??n de un ni??o que hab??a muerto mediante un milagro del profeta Eliseo. 
                                            Para ello Eliseo or?? a Yahveh, despu??s puso su boca sobre la del peque??o y cuando se retir?? el ni??o estornud?? siete veces y abri?? los ojos.
                                            <br>
                                            A principios de la d??cada de los cincuenta, los doctores Kouwenhoven, Knickerbocker y Jude descubrieron 
                                            las ventajas de la compresi??n tor??cicas para provocar la circulaci??n artificial. M??s tarde en1960, 
                                            la reanimaci??n boca a boca y el masaje externo del coraz??n se combinaron para crear el RCP que se usa hoy en d??a.
                                        </div>
                                    </td>
                                    <td>
                                        <img src="IMG/rcp1.gif" class="gifs">
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <br>
                        <li class="lista">
                            <p class="sub">Historia</p>
                            <table class="temas">
                                <tr>
                                    <td>
                                        <IMG src="IMG/rcp2.gif" class="gifs">
                                    </td>
                                    <td class="temita">
                                        El m??dico belga Andr??s Vesalio fue pionero en describir a mediados del siglo XVI la funci??n de 
                                        la v??a a??rea para realizar una traqueotom??a. Para ello, introduc??a pajitas en la tr??quea de perros 
                                        para mantenerlos con vida y estudiar su anatom??a.
                                        <br>
                                        Dos siglos m??s tarde, un hombre llamado William Tossach escribi?? su experiencia 
                                        sobre un minero que hab??a sido intoxicado por los gases y que recobr?? la vida 
                                        tras hacerle el boca a boca. A partir de ese momento, los m??dicos parisinos 
                                        aconsejaron realizar esta pr??ctica sobre los ahogados.
                                        <br>
                                        Sin embargo, no ser??a hasta bien entrado el siglo XX, m??s concretamente en 1958, 
                                        cuando se pondr??an las bases de la reanimaci??n cardiopulmonar. Nos estamos refiriendo 
                                        al trabajo de Safar, Escarga y Elam que afirmaron la mayor eficacia del boca a boca 
                                        frente a los m??todos de muelles y m??scaras mencionados anteriormente. Ese mismo a??o, la Academia Nacional 
                                        de las Ciencias reconoci?? esta t??cnica como una opci??n frente a emergencias.
                                        <br>
                                        <br>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="temita">
                                        La desfibrilaci??n el??ctrica comenz?? sus escarceos en el siglo XVIII y buena muestra de ello 
                                        la tenemos en un trabajo publicado en 1775 donde se detallan estudios emp??ricos realizados con 
                                        bater??as caseras. Durante los a??os siguientes se llevaron a cabo experimentos en animales y 
                                        no fue hasta 1947 que Claude Beck efectu?? la primera desfibrilaci??n interna en un coraz??n humano.
                                        <br>
                                        A partir de este momento, los investigadores comienzan a preguntarse si la combinaci??n de las t??cnicas 
                                        de ventilaci??n y desfibrilaci??n ser??an m??s eficaces que por separado. George Washington Crile escribi?? 
                                        un art??culo revolucionario en el que mediante compresiones tor??cicas, ventilaciones e inyecciones de 
                                        adrenalina obtuvo grandes ??xitos en la reanimaci??n de animales. 
                                        Adem??s, fue el primero en empezar a entender el coraz??n como una bomba impulsora.
                                        <br>
                                        En 1960 los anteriormente citados William Kouwenhoven, James Jude y Guy Knickerbocker defendieron 
                                        el masaje cardiaco externo combinado con la ventilaci??n boca a boca. Obtuvieron excelentes resultados 
                                        y adem??s recomendaron 
                                        la utilizaci??n de la desfibrilaci??n externa cuando el paciente est?? en 
                                        fibrilaci??n ventricular.
                                        <br>
                                    </td>
                                    <td>
                                        <img src="IMG/rcp3.gif" class="gifs">
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                RCP significa reanimaci??n cardiopulmonar. Es un procedimiento de emergencia para salvar vidas 
                                que se realiza cuando alguien ha dejado de respirar o el coraz??n ha cesado de palpitar. 
                                <br>
                                La RCP combina respiraci??n boca a boca y compresiones tor??cicas.
                                <br>
                                <br>
                                ???	La respiraci??n boca a boca suministra ox??geno a los pulmones de la persona.
                                <br>
                                ???	Las compresiones tor??cicas mantienen la sangre oxigenada circulando hasta 
                                que se puedan restablecer la respiraci??n y las palpitaciones card??acas.
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
          <h2 class="titulocuestionario"> Cuestionario M??dulo 1 </h2>
            <hr>

            <form action="Cuestionarios" method="GET" name="RCPmod1" onsubmit="return rcpmod1(this)">
                <br>
                <label for="p1" class="pregunta">??Qu?? se convino para crear el RCP en 1960?</label>
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">La reanimacion boca a boca y el masaje externo del corazon.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Golpear fueremente el pecho y que el paciente inhale sales de amonio. 
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second" >Tapar la nariz y dar respiracion del paciente. 
                <br>
                <br>
                <label for="p2" class="pregunta">??Que significa RCP?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Regresion de la Circulacion por Precion.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Reanimacion Cerebropulmonal.
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Reanimacion Cardiopulmonal.
                <br>
                <br>
                <label for="p3" class="pregunta">??Qui??n fue el pionero en describir a mediados del siglo XVI la funcio de la v??a a??rea para realizar una traqueotom??a?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third">William Tossach. 
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Andr??s Vesalio.
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third" checked>Kouwenhoven.
                <br>
                <br>
                <label for="p4" class="pregunta">??A??o en el qu?? se concreta el uso de RCP?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third"checked>1960.
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">1900.
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">1958.
                <br>
                <br>
                <label for="p5" class="pregunta">??C??mo inicio la desfribilacion?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth">Estudios emp??ricos realizados con baterias caseras.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth" checked>En estudios y practicas con animales. 
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Todas las anteriores.
                <br>
                <input type="hidden" name="curso" value="RCP">
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