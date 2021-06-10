<%-- 
    Document   : presion
    Created on : 8/06/2021, 09:15:02 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    String nombre="";
    HttpSession sesionusu = request.getSession();
    if(sesionusu.getAttribute("usuario")!=null){
        usuario = (MUsuario)sesionusu.getAttribute("usuario");
        if(usuario.getId_priv() == 15){
             %>
    
    <jsp:forward page="MenuAdmin.jsp">
        <jsp:param name="error" value="Esta pagina es de clientes" />
        
    </jsp:forward>
    
    <%
        }
        nombre = usuario.getNom_usu();
    }
    %>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./CSS/dentrocurso.css">
        <link rel="stylesheet" href="./CSS/normalize.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
        <title>Presion</title>
    </head>
    <body>
        <%
        if(nombre != ""){
            %>
            <nav>
        <a href="MenuUsuario.jsp" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuUsuario.jsp">INICIO</a></li>
            <li><a href="actualizar.jsp"><%=nombre%></a></li>
            <li><a href="cursos.jsp">CURSOS</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>
    
    <%
        }
        else{
            %>
            <nav>
        <a href="index.html" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuUsuario.jsp">INICIO</a></li>
            <li><a href="iniciosesion.jsp">INICIARSESION</a></li>
            <li><a href="cursos_ini.jsp">CURSOS</a></li>
        </ul>
    </nav>
        <%
        }            
    %>
        



    <div class="principal-container">
    <!--Aquí podemos poner los divs que se van a utilzar-->
        <article>

            <h2>COMO TOMAR LA PRESION ARTERIAL</h2>

            <p><!-- Texto -->
                Hoy en dia consideramos que es muy importante tomar la presion arterial,
                es tan importante como el saber tomar la temperatura.
                La presión arterial es una medida de la fuerza sobre las paredes de las 
                arterias a medida que el corazón bombea sangre a través del cuerpo.
                Usted se puede medir la presión arterial en su casa o ayudar a otra persona a 
                revisar su presion arterial 
            </p>

            <h2>COMO SE REALIZA</h2>
            <P>
                Lo primero que tiene que hacer es sentrase con una postura adecuada y estar 
                tranquilo, las piernas no deben de estar cruzadas y los pies deven de estar
                sobre el suelo. Su brazo debe de esta apoyado de manera que el antebrazo esté a nivel del corazon.
                Arrenabqyes para que el brazo quede desnudo. Asegurese que la manga no esté 
                apretando su brazo. Si lo llega a hacer a apretar, saque el brazo de la manga o 
                quitese la camisa.
            </P>
            
            <p>
                Viene la parte divertida, ya sea usted o su emdico o la persona que este realizando 
                la medicion devera de envolover el esfigmomanometro(1) cómodamente alredeor de su
                brazo. El borde más bajo del manguito debe estar a 2.5 cm por encima del doblez del codo.

            </p>

            <p>
                <h2>SI SU ESFIGMOMANÓMETRO ES ANALOGICO</h2>
                <ul>
                    <li>
                        El manguito se inflará rápidamente. Esto se hace ya sea bombeando con la pera o 
                        pulsando un botón en el dispositivo. Usted sentirá opresión alrededor del brazo.
                    </li>
                    <br>
                    <li>
                        Luego, la válvula del manguito se abre ligeramente, dejando que la presión descienda 
                        de manera lenta.
                    </li>
                    <br>
                    <li>
                        A medida que la presión baja, se registra la lectura apenas se escucha el sonido de 
                        la sangre pulsando. Esta es la presión sistólica.
                    </li>
                    <br>
                    <li>
                        A medida que el aire continúa saliendo, los sonidos desaparecen. Se registra el punto 
                        en el cual el sonido se detiene. Esta es la presión diastólica.
                    </li>
                </ul>
            </p>
            
            <center>
                <table>
                    <tr>
                        <td>
                            <img src="IMG/esfigmomanómetro_Auxinet.jpg" alt="esfigmomanómetro" width="300" height="300">
                        </td>
                        <td>
                            <img src="IMG/esfigmomanómetroA_Auxinet.jpg" alt="esfigmomanómetro analogico" width="300" height="300">
                        </td>
                    </tr>
                
                    <tr>
                        <td>
                            <center>
                                ESFIGMOMANÓMETRO DIGITAL(1)
                            </center> 
                        </td>
                        <td>
                            <center>
                                ESFIGMOMANÓMETRO ANALOGICO(1)
                            </center>
                        </td>
                    </tr>
                
                </table>
            </center>
            
            <p>
                <h2>SI SU ESFIGMOMANÓMETRO ES DIGITAL</h2>
                <ul>
                    <li>
                        Seria cuestion de igual manera colocar el manguillo a 2.5 cm por encima del doblez del codo 
                    </li>
                    <br>
                    <li>
                        Se da inicio a la medicion 
                    </li>
                    <br>
                    <li>
                        Esperar a que el aparato termine de hacer la medicion 
                    </li>
                    <br>
                    <li>
                        A medida que el aire continúa saliendo, los sonidos desaparecen. Se registra el punto 
                        en el cual el sonido se detiene. Esta es la presión diastólica.
                    </li>
                </ul>
            </p>

            <h3>
                RECUERDA QUE ES IMPORTANTE MANTERNER UNA BUENA ALIMNENTACION PARA MANTENER UNA PRECION 
                ARTERIAL SANA 
            </h3>

        </article>

    </div>

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
            
                <%
        if(nombre != ""){
            %>
            <li>
                <h2>Links</h2>
            <ul class="box">
                    <li><a href="index.html">INICIO</a></li>
                    <li><a href="iniciosesion.jsp">INICIAR SESION</a></li>
                    <li><a href="cursos_ini.jsp">CURSOS</a></li>
                </ul>
            </li>
    
    <%
        }
        else{
            %>
            <li>
                <h2>Links</h2>
            <ul class="box">
                    <li><a href="MenuUsuario.jsp">INICIO</a></li>
                    <li><a href="actualizar.jsp">MI CUENTA</a></li>
                    <li><a href="cursos.jsp">CURSOS</a></li>
                </ul>
            </li>
        <%
        }            
    %>
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
