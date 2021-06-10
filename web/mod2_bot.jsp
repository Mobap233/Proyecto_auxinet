<%-- 
    Document   : mod2_bot
    Created on : 8/06/2021, 04:36:45 PM
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
        id_modulo = 15;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_asf.jsp">
        <jsp:param name="error" value="Debe de primero ingresar al curso o terminar el modulo 1" />
        
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
                            <a href="" class="botonseleccionado">Utilidad</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                        %>
                        <li class="lista">
                            <a href="mod3_bot.jsp" class="boton">Instrumentación</a>
                        </li>
                        <%
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
                            <h3 class="titulo">Utilidad e instrumentación</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">

                            <h3>¿Cómo debemos de organizar nuestro botiquín</h3>
                            Antes de conocer los artículos y medicamentos que deben equipar un botiquín, también es importante mencionar unas cuestiones previas que nos ayudarán a componer un espacio de salud útil para cualquier imprevisto:
                            <br>
                            <br>

                                •	El botiquín debe ser una caja, bolsa, estuche o cajón limpio, duradero y espacioso, que garantice que su contenido está protegido del exterior y la suciedad.
                                <br>
                                •	Debe estar colocado o guardado en un lugar seco y fresco y que sea conocido por todos los miembros de la familia o personas que vivan en la casa, pero que no resulte de fácil acceso para los niños.
                                <br>
                                •	No ha de tener cerradura ni cerrarse mediante contraseña o códigos, ya que en un momento de urgencia estos pueden resultar problemáticos.
                                <br>
                                •	Las gasas, vendas, algodones… deben guardarse cerrados, para que mantengan su entorno estéril.
                                <br>
                                •	Conviene revisar todos los artículos periódicamente con el objetivo de descartar 
                                los que estén caducados o reponer los que se hayan acabado. 
                                Si contamos con una relación de los elementos que guardamos en el botiquín,
                                 esta tarea será más sencilla.


                            <br>
                            <br>

                            Además, hay que hacer una diferencia esencial: por un lado tendremos el botiquín de primeros auxilios para curas y, por otro, un pequeño dispensario o espacio con los medicamentos, que guardaremos en sus propios envases para tener siempre a mano el prospecto y la información relevante al respecto.

                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub">Los inmprsindibles de nuestro botiquín</p>
                                <img src="./IMG/elementos_b.jpeg" alt="" class="element">
                                Tanto el botiquín de primeros auxilios como el dispensario 
                                médico que tengamos en casa deben contar con unos elementos
                                imprescindibles.
                                <br>
                                <br>

                                <h2>Botiquín de primeros auxilios:</h2>
                                    1. Antisépticos. Previenen la infección evitando 
                                    que los gérmenes penetren por la herida.
                                <br>
                                <br>
                                    2. Vendas hemostáticas. Son útiles en el 
                                    control de hemorragias. 
                                    Conviene que sean de diferentes tamaños.
                                <br>
                                <br>
                                    3. Elementos para hacer una cura de heridas. 
                                    El agua oxigenada, las gasas esterilizadas, 
                                    el suero fisiológico y el esparadrapo nos permitirán
                                     limpiar y curar de manera rápida una herida. Además, 
                                     unas pinzas, tiritas, y unas pequeñas tijeras tampoco deben faltar para realizar pequeñas curas, así como unos guantes de látex o vinilo, que nos protegerán del contacto directo con la sangre y otros fluidos
                                <br>
                                <br>
                                    4. Toallitas de alcohol. Debemos usarlas siempre antes de realizar una cura, para desinfectar nuestras manos. Y nunca aplicarlas directamente sobre las heridas.
                                <br>
                                <br>
                                    5. Pañuelo triangular. Resulta un elemento de mucha utilidad para varias situaciones, como cubrir heridas o quemaduras o improvisar un cabestrillo o un vendaje… Puede tener un tamaño aproximado de 140x100x100 cm.
                                <br>
                                <br>
                                    6. Listado de teléfonos de urgencias de la zona. Una pequeña tarjeta con los números del pediatra o médico de familia, la ambulancia e incluso la policía o los bomberos nunca está demás. Es de esperar que nunca la necesitemos, pero si así fuese, de este modo sabremos donde encontrarla de manera rápida.
                                <br>
                                <br>
                                    <h2>Dispensario de medicamentos:</h2>
                                    
                                    1.	Nuestra medicación habitual. Si utilizamos de forma crónica una medicación, es interesante que junto a ella guardemos un papel en el cual indiquemos los medicamentos que tomamos, la dosis y los momentos en los que los tomamos. Esto puede ayudarnos a organizarnos para que no nos falte medicación o bien no tener en exceso. También en caso de urgencia, nuestros familiares pueden indicar y conocer la medicación que tomamos.
                                <br>
                                <br>

                                    2. Analgésicos. Paracetamol o ibuprofeno son los analgésicos habituales que suelen emplearse habitualmente en caso de dolor, fiebre o inflamación (por ejemplo, en el caso de contusiones).
                                <br>
                                <br>

                                    3. Antihistamínicos. Debemos contar con ellos, sobre todo en caso de que seamos alérgicos, tanto a plantas como a alimentos.
                                <br>
                                <br>

                                    4. Antigripales. Los antigripales son medicamentos que asocian varios principios activos y debemos escoger aquellos que se ajusten más a nuestras necesidades. Es común la asociación entre paracetamol (analgésico y para la fiebre), junto a un fármaco especifico para la tos y un descongestivo nasal.
                                 <br>
                                 <br>

                                    5. Antidiarreicos. Pueden utilizarse con el fin deevitar la deshidratación, causada por las diarreas, en el caso de que se produzca una gastroenteritis. Sin embargo, este tipo de fármacos son aconsejables sólo en caso de viajes. En general, los antidiarreicos no deben emplearse sin consultar al medico/ farmacéutico.
                                <br>
                                <br>

                                    6. Termómetro. Aunque no sea un medicamento, tenerlo en el botiquín nos servirá para cerciorarnos de la temperatura exacta y, si tenemos fiebre, nos indicará cuando será necesario tomar un medicamento antitérmico.


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
          <h2 class="titulocuestionario"> Cuestionario Módulo 2</h2>
            <hr>

            <form action="Cuestionarios" method="GET" name="BOTmod2" onsubmit="return botmod2(this)">
                <br>
                <label for="p1" class="pregunta">¿Cuál de las siguientes respuestas define mejor las características de un botiquín?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Estuche grande y duradero, guardado en espacio secos, facíl de encontrar y materiales sellados.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Baúl pequeño, guardado en espacios humedos y cerrado con llave.
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Bolsa mediana, guardada en espacios semi secos y con gasas de emvoltura cerrada.
                <br>
                <br>
                <label for="p2" class="pregunta">A parte del botiquín también necesitamos…</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Reporte de registros para medicamentos.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Mochila de documentos importantes.
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Dispensario de medicamentos.
                <br>
                <br>
                <label for="p3" class="pregunta">¿Qué elementos debe de tener un botiquín de emergencia?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Analgésicos
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Antisépticos
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Antibioticos
                <br>
                <br>
                <label for="p4" class="pregunta">¿Qué debemos de tener en nuestro dispensario?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third" checked>Estetoscopio
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Aguaja he hilo
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Térmometro
                <br>
                <br>
                <label for="p5" class="pregunta">¿Por qué es importante tener un listado de telefonos de urgencia y nuestra medicación habitual?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Para pedir medicamento a domicilio y recetarme a mi mismo.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth" >Para identificar los nombres de los hospitales y saber la enfermedad que tenemos.
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth" >Por que es más facil identificar las instituciones de salud más cerca de mi resdencia y ayuda a saber el tipo de mediacamento y la dosis correcta.
                <br>
                <br>
                <br>

                <input type="hidden" name="curso" value="BOTIQUIN">
            <input type="hidden" name="modulo" value="2">
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
