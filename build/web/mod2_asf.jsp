<%-- 
    Document   : mod2_asf
    Created on : 8/06/2021, 11:46:06 AM
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
        nombre_curso = "ASFIXIA";
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
                    <a href="menu_asf.jsp"><i class="far fa-arrow-alt-circle-left fa-3x"></i></a>
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
                            <a href="" class="botonseleccionado">Tipos de asfixia</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                        %>
                        <li class="lista">
                            <a href="mod3_asf.jsp" class="boton">Pasos por hacer</a>
                        </li>
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
                            <h3 class="titulo">Explicaci??n de cada clasificaci??n de la asfixia </h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <img src="./IMG/img_asfixia_c.jpeg" class="img_b">
                            
                                1. Por obstrucci??n de los orificios respiratorios: que impide el paso de aire produciendo anoxia. 
                                El agente causal puede ser una tela, un material impermeable o la mano, incluso el caso de accidentes 
                                laborales puede tratarse de un agente s??lido como arena, granos o barro. La sofocaci??n puede ocurrir 
                                cuando el agente obstruye los orificios respiratorios o porque aplican el peso pasivo de la cabeza hacia 
                                abajo comprimiendo los mismos. Los signos cl??sicos de asfixia est??n presentes muy rara vez, excepto cuando 
                                la persona ofrece resistencia y hay intentos de respiraci??n, lo cual puede producir congesti??n, cianosis y 
                                algunas veces petequias faciales o conjuntivales. Adem??s, pueden encontrarse otras contusiones simples. 
                                Ejemplos: bolsa pl??stica sobre la cabeza (puede tambi??n producir inhibici??n cardiaca), asfixias con almohada, 
                                dec??bito prono contra objeto blando, mordazas, accidentes laborales.
                                <br>
                                <br>
                                2. Por oclusi??n de las v??as respiratorias: generalmente entre la faringe y la bifurcaci??n de la tr??quea. Puede presentarse hipoxia pura por oclusi??n de la v??a ??rea o espasmo lar??ngeo o bronquial. Ambos se acompa??an de congesti??n, cianosis e incluso petequias, aunque tambi??n puede darse inhibici??n cardiaca, ya sea pura o acelerada por el exceso de catecolaminas. Dentro de las posibles causas se encuentran: cuerpos extra??os, piezas dentales reales o pr??tesis, hemorragia en dental, nasal o en o??do, lesiones o infecciones agudas (epiglotis o hipersensibilidad a sustancias con edema o broncoespasmo), material alimenticio (la bronca aspiraci??n se considera un fen??meno ag??nico con algunas excepciones como en las personas en estado de ebriedad)
                                <br>
                                <br>

                                3. Por compresi??n toraco abdominal o "asfixia traum??tica": produce la fijaci??n de los movimientos respiratorios. Es muy frecuente en accidentes y presenta todos los llamados signos cl??sicos de asfixia. Generalmente ocurre en dos condiciones: 
                                ???	el pecho (puede incluir el abdomen), es comprimido por alguna sustancia u objeto, impidiendo la expansi??n tor??cica y el descenso del diafragma Ej.: persona debajo de un veh??culo o del material de un derrumbe.
                                ???	aplastamiento por multitudes.
                                Los hallazgos incluyen toda la gama de "signos cl??sicos de asfixia", donde la congesti??n y cianosis son muy marcadas especialmente en la cara (mascarilla esquem??tica). Adem??s, hay lesiones locales en relaci??n a la causa de la asfixia. En este grupo tambi??n se incluye a las asfixias posturales, donde una persona permanece en una determinada posici??n por un periodo prolongado de tiempo (atrapado, drogado, alcoholizado), lo cual le impide realizar adecuadamente los movimientos respiratorios y el retorno venoso. Ejemplos: inversi??n, atrapamiento boca abajo o en posici??n de cuchilla, crucifixi??n.

                                <br>
                                <br>


                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">

                                4. Por carencia de aire respirable: Por la reducci??n de la concentraci??n de ox??geno para respirar o por la sustituci??n del mismo por otro gas. La disminuci??n del ox??geno entre un 8 a 10%, produce p??rdida de conciencia y si la concentraci??n es menor del 8%, muerte. Ejemplos: 
                                ???	descompresi??n de un avi??n a grandes alturas, que reduce la presi??n parcial de ox??geno y por tanto la penetraci??n del mismo por la pared alveolar. 
                                ???	varias personas confinadas en un lugar cerrado. 
                                ???	reemplazo del ox??geno por gases inertes (cuevas, lugares cerrados, etc.). En este ??ltimo caso, una muerte r??pida es com??n antes de que la hipoxia tenga efecto, por lo que se presume que tiene lugar una inhibici??n cardiaca refleja por estimulaci??n del sistema parasimp??tico. Generalmente los signos cl??sicos de asfixia se encuentran ausentes. Si se trata de verdaderas hipoxias puede encontrarse congesti??n y edema.


                                
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
          <h2 class="titulocuestionario"> Cuestionario M??dulo 2 </h2>
            <hr>
            <form action="Cuestionarios" method="GET" name="ASFmod2" onsubmit="return asfmod2(this)">
                <br>
                <label for="p1" class="pregunta">??Cu??l es una posible causa de la oclusi??n de las v??as respiratorias?</label>
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Lesiones o infecciones agudas
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Bolsa pl??stica sobre la cabeza
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Todas las anteriores
                <br>
                <br>
                <label for="p2" class="pregunta">??Cu??l es un signo cl??sico de asfixia?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Perdida del conocimiento
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">La congesti??n y cianosis son marcadas en la cara
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Muerte inmediata
                <br>
                <br>
                <label for="p3" class="pregunta">??Qu?? porcentaje de oxigeno producir??a la muerte?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third">Menor al 8%
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Del 10 al 8%
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third" checked>Mayor al 10%
                <br>
                <br>
                <label for="p4" class="pregunta">??Cu??l es la diferencia entre la obstrucci??n de los orificios respiratorios y la oclusi??n de las v??as respiratorias?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third" >La oclusi??n es por la faringe
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third" checked>La compresi??n tor??cica se da en la oclusi??n 
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Ninguna de las anteriores 
                <br>
                <br>
                <label for="p5" class="pregunta">??Qu?? puede encontrarse en verdaderas hipoxias?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Congesti??n y edema
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Lesiones locales
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Gritos de la persona asfixiada
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="ASFIXIA">
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