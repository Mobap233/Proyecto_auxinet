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
                            <a href="mod1_bot.jsp" class="boton">Introducci??n</a>
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
                            <a href="mod3_bot.jsp" class="boton">Instrumentaci??n</a>
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
                            <h3 class="titulo">Utilidad e instrumentaci??n</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">

                            <h3>??C??mo debemos de organizar nuestro botiqu??n</h3>
                            Antes de conocer los art??culos y medicamentos que deben equipar un botiqu??n, tambi??n es importante mencionar unas cuestiones previas que nos ayudar??n a componer un espacio de salud ??til para cualquier imprevisto:
                            <br>
                            <br>

                                ???	El botiqu??n debe ser una caja, bolsa, estuche o caj??n limpio, duradero y espacioso, que garantice que su contenido est?? protegido del exterior y la suciedad.
                                <br>
                                ???	Debe estar colocado o guardado en un lugar seco y fresco y que sea conocido por todos los miembros de la familia o personas que vivan en la casa, pero que no resulte de f??cil acceso para los ni??os.
                                <br>
                                ???	No ha de tener cerradura ni cerrarse mediante contrase??a o c??digos, ya que en un momento de urgencia estos pueden resultar problem??ticos.
                                <br>
                                ???	Las gasas, vendas, algodones??? deben guardarse cerrados, para que mantengan su entorno est??ril.
                                <br>
                                ???	Conviene revisar todos los art??culos peri??dicamente con el objetivo de descartar 
                                los que est??n caducados o reponer los que se hayan acabado. 
                                Si contamos con una relaci??n de los elementos que guardamos en el botiqu??n,
                                 esta tarea ser?? m??s sencilla.


                            <br>
                            <br>

                            Adem??s, hay que hacer una diferencia esencial: por un lado tendremos el botiqu??n de primeros auxilios para curas y, por otro, un peque??o dispensario o espacio con los medicamentos, que guardaremos en sus propios envases para tener siempre a mano el prospecto y la informaci??n relevante al respecto.

                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub">Los inmprsindibles de nuestro botiqu??n</p>
                                <img src="./IMG/elementos_b.jpeg" alt="" class="element">
                                Tanto el botiqu??n de primeros auxilios como el dispensario 
                                m??dico que tengamos en casa deben contar con unos elementos
                                imprescindibles.
                                <br>
                                <br>

                                <h2>Botiqu??n de primeros auxilios:</h2>
                                    1. Antis??pticos. Previenen la infecci??n evitando 
                                    que los g??rmenes penetren por la herida.
                                <br>
                                <br>
                                    2. Vendas hemost??ticas. Son ??tiles en el 
                                    control de hemorragias. 
                                    Conviene que sean de diferentes tama??os.
                                <br>
                                <br>
                                    3. Elementos para hacer una cura de heridas. 
                                    El agua oxigenada, las gasas esterilizadas, 
                                    el suero fisiol??gico y el esparadrapo nos permitir??n
                                     limpiar y curar de manera r??pida una herida. Adem??s, 
                                     unas pinzas, tiritas, y unas peque??as tijeras tampoco deben faltar para realizar peque??as curas, as?? como unos guantes de l??tex o vinilo, que nos proteger??n del contacto directo con la sangre y otros fluidos
                                <br>
                                <br>
                                    4. Toallitas de alcohol. Debemos usarlas siempre antes de realizar una cura, para desinfectar nuestras manos. Y nunca aplicarlas directamente sobre las heridas.
                                <br>
                                <br>
                                    5. Pa??uelo triangular. Resulta un elemento de mucha utilidad para varias situaciones, como cubrir heridas o quemaduras o improvisar un cabestrillo o un vendaje??? Puede tener un tama??o aproximado de 140x100x100 cm.
                                <br>
                                <br>
                                    6. Listado de tel??fonos de urgencias de la zona. Una peque??a tarjeta con los n??meros del pediatra o m??dico de familia, la ambulancia e incluso la polic??a o los bomberos nunca est?? dem??s. Es de esperar que nunca la necesitemos, pero si as?? fuese, de este modo sabremos donde encontrarla de manera r??pida.
                                <br>
                                <br>
                                    <h2>Dispensario de medicamentos:</h2>
                                    
                                    1.	Nuestra medicaci??n habitual. Si utilizamos de forma cr??nica una medicaci??n, es interesante que junto a ella guardemos un papel en el cual indiquemos los medicamentos que tomamos, la dosis y los momentos en los que los tomamos. Esto puede ayudarnos a organizarnos para que no nos falte medicaci??n o bien no tener en exceso. Tambi??n en caso de urgencia, nuestros familiares pueden indicar y conocer la medicaci??n que tomamos.
                                <br>
                                <br>

                                    2. Analg??sicos. Paracetamol o ibuprofeno son los analg??sicos habituales que suelen emplearse habitualmente en caso de dolor, fiebre o inflamaci??n (por ejemplo, en el caso de contusiones).
                                <br>
                                <br>

                                    3. Antihistam??nicos. Debemos contar con ellos, sobre todo en caso de que seamos al??rgicos, tanto a plantas como a alimentos.
                                <br>
                                <br>

                                    4. Antigripales. Los antigripales son medicamentos que asocian varios principios activos y debemos escoger aquellos que se ajusten m??s a nuestras necesidades. Es com??n la asociaci??n entre paracetamol (analg??sico y para la fiebre), junto a un f??rmaco especifico para la tos y un descongestivo nasal.
                                 <br>
                                 <br>

                                    5. Antidiarreicos. Pueden utilizarse con el fin deevitar la deshidrataci??n, causada por las diarreas, en el caso de que se produzca una gastroenteritis. Sin embargo, este tipo de f??rmacos son aconsejables s??lo en caso de viajes. En general, los antidiarreicos no deben emplearse sin consultar al medico/ farmac??utico.
                                <br>
                                <br>

                                    6. Term??metro. Aunque no sea un medicamento, tenerlo en el botiqu??n nos servir?? para cerciorarnos de la temperatura exacta y, si tenemos fiebre, nos indicar?? cuando ser?? necesario tomar un medicamento antit??rmico.


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
          <h2 class="titulocuestionario"> Cuestionario M??dulo 2</h2>
            <hr>

            <form action="Cuestionarios" method="GET" name="BOTmod2" onsubmit="return botmod2(this)">
                <br>
                <label for="p1" class="pregunta">??Cu??l de las siguientes respuestas define mejor las caracter??sticas de un botiqu??n?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Estuche grande y duradero, guardado en espacio secos, fac??l de encontrar y materiales sellados.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Ba??l peque??o, guardado en espacios humedos y cerrado con llave.
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Bolsa mediana, guardada en espacios semi secos y con gasas de emvoltura cerrada.
                <br>
                <br>
                <label for="p2" class="pregunta">A parte del botiqu??n tambi??n necesitamos???</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Reporte de registros para medicamentos.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Mochila de documentos importantes.
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Dispensario de medicamentos.
                <br>
                <br>
                <label for="p3" class="pregunta">??Qu?? elementos debe de tener un botiqu??n de emergencia?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Analg??sicos
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Antis??pticos
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Antibioticos
                <br>
                <br>
                <label for="p4" class="pregunta">??Qu?? debemos de tener en nuestro dispensario?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third" checked>Estetoscopio
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Aguaja he hilo
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">T??rmometro
                <br>
                <br>
                <label for="p5" class="pregunta">??Por qu?? es importante tener un listado de telefonos de urgencia y nuestra medicaci??n habitual?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Para pedir medicamento a domicilio y recetarme a mi mismo.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth" >Para identificar los nombres de los hospitales y saber la enfermedad que tenemos.
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth" >Por que es m??s facil identificar las instituciones de salud m??s cerca de mi resdencia y ayuda a saber el tipo de mediacamento y la dosis correcta.
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
