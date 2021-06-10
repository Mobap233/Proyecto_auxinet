<%-- 
    Document   : mod3_epi.jsp
    Created on : 8/06/2021, 01:49:21 PM
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
        id_modulo = 25;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_epi.jsp">
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
                            <a href="mod1_epi.jsp" class="boton">Introducción</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="mod2_epi.jsp" class="boton">Sintomas y Causas</a>
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
                            <h3 class="titulo">Pasos a realizar</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            
                            Existen muchos tipos de convulsiones. La mayoría de las convulsiones terminan en unos pocos minutos. Las siguientes son medidas generales para ayudar a alguien que esté teniendo algún tipo de convulsión:
                           <br>
                            •	Permanezca con la persona hasta que la convulsión haya pasado y esté completamente consciente. Después de que pase, ayude a la persona a sentarse en un lugar seguro. Una vez que esté consciente y se pueda comunicar, cuéntele lo ocurrido en términos sencillos.
                           <br>
                            •	Conforte a la persona y hable de manera calmada.
                           <br>
                            •	Fíjese si la persona lleva un brazalete médico u otra información de emergencia.
                           <br>
                            •	Manténgase calmado y mantenga a los demás calmados.
                           <br>
                            •	Ofrezca llamar un taxi o a alguien más para asegurarse de que la persona llegue a casa segura.
                           <br>
                            A continuación indicamos algunas cosas que usted puede hacer para ayudar a una persona que presente ese tipo de convulsión:
                           <br>
                            •	Con cuidado recueste a la persona en el piso.
                           <br>
                            •	Voltee a la persona suavemente hacia un lado. Esto la ayudará a respirar.
                           <br>
                            •	Retire del área alrededor de la persona los objetos duros o filosos para prevenir lesiones.
                           <br>
                            •	Ponga la cabeza de la persona sobre algo suave y plano, como una chaqueta doblada.
                           <br>
                            •	Si tiene anteojos, quíteselos.
                           <br>
                            •	Suéltele la corbata o cualquier cosa que tenga alrededor del cuello que pueda dificultar su respiración.


                        </li>
                        <br>
                        <br>
                        <li class="lista">
                            <div class="primero">
                                <b>Lo que no debe hacerse:</b>
                                <br>
                                <br>
                            Es importante saber lo que NO se debe hacer para mantener a la persona segura durante o después de una convulsión.
                            <br>
                            Nunca haga nada de lo siguiente:
                            <br>
                            <br>

                            •	No trate de sujetar a la persona o evitar que se mueva.
                            <br>
                            •	No ponga nada en la boca de la persona porque podría lesionarle los dientes o la mandíbula. Una persona con una convulsión no se puede tragar la lengua.
                            <br>
                            •	No intente darle respiración boca a boca (como RCP). Por lo general, las personas comienzan a respirar de nuevo por su cuenta después de una convulsión.
                            <br>
                            •	No le ofrezca agua ni alimentos a la persona hasta que no esté completamente alerta.
                            <br>
                            <hr>
                            <br>
                            <iframe width="900" height="450" src="https://www.youtube.com/embed/-ZRKueLrTRo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            <br>
                            <hr>
                            <br>
                            <iframe width="900" height="450" src="https://www.youtube.com/embed/WmxppSx3Vmo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            <br>
                            <hr>
                            
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
          <h2 class="titulocuestionario"> Cuestionario Módulo 3 </h2>

        <form action="Cuestionarios" method="GET" name="EPImod3" onsubmit="return epimod3(this)">
            <br>
            <p class="pregunta">¿Cuál de las siguientes respuestas es una medida general para ayudar a alguien que sufre de una convulsión?</p>
            <input type="radio" name="p1" value="1" class="fadeIn second">Inclinarlo rapidamente en el piso.
            <br>
            <input type="radio" name="p1" value="2" class="fadeIn second" checked>Ayudarle a levantarse rápido.
            <br>
            <input type="radio" name="p1" value="3" class="fadeIn second">Confortar a la persona y hablar de manera calmada
            <br>
            <br>
            <p class="pregunta">¿Qué se debe de hacer en caso de una convulsión?</p>
            <input type="radio" name="p2" value="1" class="fadeIn second">Retirar del área alrededor de la persona obejtos filoso o punzocortantes para evitar un accidente
            <br>
            <input type="radio" name="p2" value="2" class="fadeIn second">Levantar su cabeza estrepitosamente para que no golpee con el suelo.
            <br>
            <input type="radio" name="p2" value="3" class="fadeIn second" checked>Tomar de manera calmada y esperar a las autoridades correspondientes
            <br>
            <br>
            <p class="pregunta">¿De las siguientes respuestas que se debe de evitar hacer en caso de una convulsión?</p>
            <br>
            <input type="radio" name="p3" value="1" class="fadeIn third">No poner nada en la boca de la persona para evitar una lesión en la boca o en los dientes.
            <br>
            <input type="radio" name="p3" value="2" class="fadeIn third" checked>Llamar al 911 si la convulsión dura más de 5 minutos.
            <br>
            <input type="radio" name="p3" value="3" class="fadeIn third">Recostar a la persona en el piso.
            <br>
            <br>
            <p class="pregunta">¿Que hacer en caso de que una persona quede inconciente depues de una convulsión?</p>
            <input type="radio" name="p4" value="1" class="fadeIn third" checked>Esperar la ayuda adecuada.
            <br>
            <input type="radio" name="p4" value="2" class="fadeIn third">Colocar la cebeza hacia atrás para depejar sus vías respiratorias.
            <br>
            <input type="radio" name="p4" value="3" class="fadeIn third">Darle RCP
            <br>
            <br>
            <p class="pregunta">¿Qué hacer en caso de alguna persona saque espuma por la boca al momento de la covulsión?</p>
            <input type="radio" name="p5" value="1" class="fadeIn fourth">Esperar a que salga toda la espuma.
            <br>
            <input type="radio" name="p5" value="2" class="fadeIn fourth" checked>No hacer nada.
            <br>
            <input type="radio" name="p5" value="3" class="fadeIn fourth">Limpiar la espuma de la boca.
            <br>
            <br>
            <br>
            <input type="hidden" name="curso" value="EPILEPSIA">
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
