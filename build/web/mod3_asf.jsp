<%-- 
    Document   : mod3_asf
    Created on : 8/06/2021, 11:59:44 AM
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
    <title>Curso ASFIXIA</title>
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
                            <a href="mod1_asf.jsp" class="boton">Introducci??n</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="mod2_asf.jsp" class="boton">Tipos de asfixia</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="" class="botonseleccionado">Primeros auxilios</a>
                        </li>
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
                            El atragantamiento ocurre cuando un objeto extra??o se aloja en la garganta o la tr??quea y bloquea el flujo de aire. En los adultos, un trozo de comida suele ser el culpable. Los ni??os peque??os a menudo tragan objetos peque??os. Debido a que el atragantamiento corta el ox??geno al cerebro, brinda primeros auxilios lo m??s r??pido posible.
                                El signo universal de atragantamiento son las manos apretadas a la garganta. Si la persona no da la se??al, busca estas indicaciones:
                                <br>
                                <br>
                                ???	incapacidad de hablar;
                                <br>
                                ???	dificultad para respirar o respiraci??n ruidosa;
                                <br>
                                ???	sonidos chirriantes al intentar respirar;
                                <br>
                                ???	tos, que puede ser d??bil o fuerte;
                                <br>
                                ???	piel, labios y u??as que se tornan azules u oscuras;
                                <br>
                                ???	piel enrojecida y luego p??lida o de color azulado;
                                <br>
                                ???	p??rdida del conocimiento.
                                <br>
                                <br>
                                Si la persona puede toser con fuerza, debe seguir tosiendo. Si la persona se est?? ahogando y no puede hablar, llorar o re??r con fuerza, la Cruz Roja Estadounidense recomienda un enfoque de "cinco y cinco" para brindar primeros auxilios:
                                <br>
                                <br>
                                ???	Da 5 golpes en la espalda. P??rate a un lado y justo detr??s de un adulto que se est?? atragantando. En el caso de un ni??o, arrod??llate detr??s. Coloca un brazo sobre el pecho de la persona como apoyo. Dobla a la persona por la cintura para que la parte superior del cuerpo quede paralela al suelo. Da cinco golpes separados en la espalda entre los om??platos de la persona con la palma de tu mano.
                                <br>
                                ???	Da 5 compresiones abdominales. Realiza cinco compresiones abdominales (tambi??n conocida como maniobra de Heimlich).
                                <br>
                                ???	Alterna entre 5 golpes y 5 estocadas hasta que se desaloje la obstrucci??n.
                                <br>
                                <br>
                                La Asociaci??n Estadounidense del Coraz??n no ense??a la t??cnica del golpe por la espalda; solo los procedimientos de empuje abdominal. Est?? bien no dar golpes en la espalda si no has aprendido la t??cnica. Ambos enfoques son aceptables.
                                <br>
                                <br>
                                Para realizar compresiones abdominales (maniobra de Heimlich) en otra persona:
                                <br>
                                <br>
                                ???	P??rate detr??s de la persona. Coloca un pie ligeramente delante del otro para mantener el equilibrio. Envuelve sus brazos alrededor de la cintura. Inclina a la persona ligeramente hacia adelante. Si un ni??o se est?? ahogando, arrod??llate detr??s de ??l.
                                <br>
                                ???	Haz un pu??o con una mano. Col??calo ligeramente por encima del ombligo de la persona.
                                <br>
                                ???	Agarra el pu??o con la otra mano. Presiona con fuerza el abdomen con un r??pido empuje hacia arriba, como si intentaras levantar a la persona.
                                <br>
                                ???Realiza entre seis y 10 compresiones abdominales hasta que se desaloje la obstrucci??n.
                                <br>
                                <br>
                                Si eres el ??nico rescatador, realiza golpes en la espalda y compresiones abdominales antes de llamar al 911 o al n??mero de emergencia local para pedir ayuda. Si hay otra persona disponible, p??dele a esa persona que busque ayuda mientras realizas los primeros auxilios.
                                <br>
                                <br>
                                Si la persona pierde el conocimiento, realiza una reanimaci??n cardiopulmonar (RCP) est??ndar con compresiones tor??cicas y respiraciones de rescate.
                                <br>
                                <br>
                                Para realizar compresiones abdominales (maniobra de Heimlich) para t?? mismo:
                                <br>
                                <br>
                                Primero, si est??s solo y te atragantas, llama al 911 o al n??mero de emergencia local de inmediato. Luego, aunque no podr??s darte golpes en la espalda de manera eficaz a ti mismo, a??n puedes realizar compresiones abdominales para desalojar el objeto.
                                <br>
                                <br>
                                ???	Pon un pu??o ligeramente por encima de tu ombligo.
                                <br>
                                ???	Agarra tu pu??o con la otra mano e incl??nate sobre una superficie dura; una encimera o una silla pueden servir.
                                <br>
                                ???	Empuja tu pu??o hacia adentro y hacia arriba.
                                <br>
                                <br>
                                Para despejar las v??as respiratorias de una mujer embarazada o una persona obesa:
                                <br>
                                <br>
                                ???	Coloca tus manos un poco m??s arriba que con una maniobra de Heimlich normal, en la base del estern??n, justo por encima de la uni??n de las costillas inferiores.
                                <br>
                                ???	Procede como con la maniobra de Heimlich, presionando con fuerza en el pecho, con un empuj??n r??pido.
                                <br>
                                ???	Repite hasta que la comida u otra obstrucci??n se desaloje. Si la persona pierde el conocimiento, sigue estos pasos.
                                <br>
                                Para despejar las v??as respiratorias de una persona inconsciente:
                                <br>
                                ???	Baja a la persona de espaldas al suelo, con los brazos a los lados.
                                <br>
                                ???	Libera las v??as respiratorias. Si una obstrucci??n es visible en la parte posterior de la garganta o en la parte alta de la garganta, mete un dedo en la boca y quita la causa de la obstrucci??n. No intentes hacer un barrido con el dedo si no puedes ver el objeto. Ten cuidado de no empujar los alimentos u objetos m??s profundamente en las v??as respiratorias, lo que puede ocurrir con facilidad en los ni??os peque??os.
                                <br>
                                ???	Comienza a practicar RCP si el objeto permanece alojado y la persona no responde despu??s de tomar las medidas anteriores. Las compresiones tor??cicas utilizadas en RCP pueden desalojar el objeto. Recuerda volver a revisar la boca peri??dicamente.
<br>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                
                                <iframe width="900" height="450" border-radius="40px" text-align="center" src="https://www.youtube.com/embed/IuPX-rLT_rE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
          <h2 class="titulocuestionario"> Cuestionario M??dulo 3</h2>
            <hr>
            <form action="Cuestionarios" method="GET" name="ASFmod3" onsubmit="return asfmod3(this)">
                <br>
                <label for="p1" class="pregunta">??Qu?? es un enfoque de cinco y cinco?</label>
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">5 compresiones abdominales 
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>5 compresiones en la espalda, 5 segundos de respiraci??n boca a boca
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Ninguna de las anteriores
                <br>
                <br>
                <label for="p2" class="pregunta">Primer paso de la maniobra de Heimlich</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Empuja tu pu??o hacia adentro y hacia arriba
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Pon un pu??o ligeramente por encima del ombligo
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Libera las v??as respiratorias
                <br>
                <br>
                <label for="p3" class="pregunta">??Qu?? indicaciones da una persona atragantada?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Tos, piel p??lida o de color azulado 
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Perdida del conocimiento
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Todas las anteriores 
                <br>
                <br>
                <label for="p4" class="pregunta">??Qu?? no hacer en caso de que la persona quede inconsciente?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third">Hacer un barrido con el dedo si no ves el objeto
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third" checked>Bajar a la persona de espaldas al suelo
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Practicar RCP
                <br>
                <br>
                <label for="p5" class="pregunta">??Cu??l es la diferencia en los pasos de primeros auxilios en una persona con obesidad?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Compresiones m??s fuertes 
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Colocar tus manos un poco m??s arriba
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Ninguna
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="ASFIXIA">
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
