<%-- 
    Document   : mod2_epi
    Created on : 8/06/2021, 01:38:26 PM
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
        nombre_curso = "EPILEPSIA";
        id_modulo = 15;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_epi.jsp">
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
                            <a href="mod1_epi.jsp" class="boton">Introducci??n</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="" class="botonseleccionado">Sintomas y Causas</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                        %>
                        <li class="lista">
                            <a href="mod3_epi.jsp" class="boton">Pasos por hacer</a>
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
                            <h3 class="titulo">Sintomas y Causas</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            
                            <b>Sintomas</b>
                            <br>
                            Debido a que la epilepsia se produce a causa de la actividad anormal del cerebro, las convulsiones pueden afectar cualquier proceso que este coordine. Algunos de los signos y s??ntomas de convulsiones son:
                            <br>
                            ???	Confusi??n temporal
                            <br>
                            ???	Episodios de ausencias
                            <br>
                            ???	Movimientos espasm??dicos incontrolables de brazos y piernas
                            <br>
                            ???	P??rdida del conocimiento o conciencia
                            <br>
                            ???	S??ntomas ps??quicos, como miedo, ansiedad o d??j?? vu
                            <br>
                            <br>

                            Los s??ntomas var??an seg??n el tipo de convulsi??n. En la mayor??a de los casos, una persona con epilepsia tender?? a tener el mismo tipo de convulsi??n en cada episodio, de modo que los s??ntomas ser??n similares entre un episodio y otro.
                            Generalmente, los m??dicos clasifican a las convulsiones como focales o generalizadas, en funci??n de c??mo comienza la actividad cerebral anormal.

                            <br>
                            <br>
                            <b>Causas</b>
                            <br>
                            La epilepsia no tiene una causa identificable en casi la mitad de las personas que padecen la enfermedad. 
                            En la otra mitad de los casos, la enfermedad puede producirse a causa de diversos factores, entre ellos:
                            <br>
                            <br>
                                ???	Influencia gen??tica. 
                                <br>
                                <br>
                                Algunos tipos de epilepsia, que se clasifican seg??n el tipo de convulsi??n que se padece o la parte del cerebro que resulta afectada, son hereditarios. En estos casos, es probable que haya influencia gen??tica.
                                Los investigadores han asociado algunos tipos de epilepsia a genes espec??ficos, pero, en la mayor??a de los casos, los genes son solo una parte de la causa de la epilepsia. Algunos genes pueden hacer que una persona sea m??s sensible a las condiciones ambientales que desencadenan las convulsiones.
                                <br>
                                <br>
                                ???	Traumatismo craneal. 
                                <br>
                                <br>
                                Un traumatismo craneal como consecuencia de un accidente automovil??stico o de otra lesi??n traum??tica puede provocar epilepsia.
                                <br>
                                <br>
                                ???	Enfermedades cerebrales. 
                                <br>
                                <br>
                                Las enfermedades cerebrales que da??an el cerebro, como los tumores cerebrales o los accidentes cerebrovasculares, pueden provocar epilepsia. Los accidentes cerebrovasculares son la causa principal de epilepsia en adultos mayores de 35 a??os.
                                <br>
                                <br>
                                ???	Enfermedades infecciosas. 
                                <br>
                                <br>
                                Las enfermedades infecciosas, como meningitis, sida y encefalitis viral, pueden causar epilepsia.
                                <br>
                                <br>

                                ???	Lesiones prenatales. 
                                <br>
                                <br>
                                Antes del nacimiento, los beb??s son sensibles al da??o cerebral que puede originarse por diversos factores, como una infecci??n en la madre, mala nutrici??n o deficiencia de ox??geno. Este da??o cerebral puede provocar epilepsia o par??lisis cerebral infantil.
                                <br>
                                <br>

                                ???	Trastornos del desarrollo. 
                                <br>
                                <br>
                                A veces, la epilepsia puede estar asociada a trastornos del desarrollo, como autismo y neurofibromatosis.


                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <p class="sub">Factores de riesgo</p>
                                Existen ciertos factores que pueden aumentar el riesgo de sufrir epilepsia, como los siguientes:
                                <br>
                                <br>
                                ???	Edad: La aparici??n de la epilepsia es m??s frecuente en ni??os y adultos mayores, pero la enfermedad puede ocurrir en cualquier edad.
                                <br>
                                ???	Antecedentes familiares: Si tienes antecedentes familiares de epilepsia, es posible que tengas un mayor riesgo de desarrollar un trastorno convulsivo.
                                <br>
                                ???	Lesiones en la cabeza: Las lesiones en la cabeza son responsables de algunos casos de epilepsia. Puedes reducir el riesgo mediante el uso del cintur??n de seguridad mientras andas en un veh??culo y mediante el uso de un casco mientras andas en bicicleta, esqu??as, andas en una motocicleta o participas en otras actividades con alto riesgo de recibir lesiones en la cabeza.
                                <br>
                                ???	Accidente cerebrovascular y otras enfermedades vasculares: El accidente cerebrovascular y otras enfermedades de los vasos sangu??neos (vasculares) pueden provocar da??o cerebral que puede desencadenar epilepsia. Puede tomar una serie de medidas para reducir el riesgo de padecer estas enfermedades, entre las que se incluyen limitar el consumo de alcohol y evitar los cigarrillos, seguir una dieta saludable y hacer ejercicio regularmente.
                                <br>
                                ???	Demencia: La demencia puede aumentar el riesgo de desarrollar epilepsia en adultos mayores.
                                <br>
                                ???	Infecciones cerebrales: Las infecciones como la meningitis, que causa inflamaci??n en el cerebro o la m??dula espinal, pueden aumentar el riesgo.
                                <br>
                                ???	Convulsiones en la infancia: Las fiebres altas en la infancia a veces pueden relacionarse con las convulsiones. Los ni??os que tienen convulsiones debido a fiebres altas generalmente no desarrollar??n epilepsia. El riesgo de desarrollar epilepsia aumenta si un ni??o tiene una convulsi??n prolongada, otra enfermedad del sistema nervioso o antecedentes familiares de epilepsia.


                                
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

            <form action="Cuestionarios" method="GET" name="EPImod2" onsubmit="return epimod2(this)">
                <br>
                <label for="p1" class="pregunta">??Cu??les son los principales sint??mas de una convulsi??n?</label>
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Confusi??n temporal y episodios de ausencia.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Dolor de brazos y piernas.
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Falta de apetito.
            
        
            
                <br>
                <br>
                <label for="p2" class="pregunta">??Cu??les son las causas de la epilepsia?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second">No tiene causa identificable en m??s de la mitad de las personas.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Fuertes dolores de cabeza.
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second" checked>Taquicardia.
            
                <br>
                <br>
            
                <label for="p3" class="pregunta">De las siguientes cuales son las m??s normales presentadas:</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third" checked>Anormalidad en tallo cerebral. 
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Formaci??n espontanea de tumores.
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third">Traumatismo craneal y enfermedades cerebrales.
            
                <br>
                <br>
            
                <label for="p4" class="pregunta">??Qu?? tipo de factores puede aumentar el riesgo de epilepsia?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third">Antecedentes familiares y accidente cerebro bascular.
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third">Falta de nutrimentos y carbohidratos.
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third" checked>Dolor en espalda y servicales.
            
                <br>
                <br>
            
                <label for="p5" class="pregunta">??Qu?? es el accidente cerebrovascular?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth">Enfermedad craneal dad por golpes consecutivos.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Enfermedad en las vasos sanguineos que pueden provocar da??o cerebral.
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth" checked>Enfermedad del tallo encef??lico.
            
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="EPILEPSIA">
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
