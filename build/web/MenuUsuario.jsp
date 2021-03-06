<%-- 
    Document   : MenuUsuario
    Created on : 7/06/2021, 12:18:52 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    String nombre="";
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
        nombre = usuario.getNom_usu();
    }
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/index.css">
    <link rel="stylesheet" href="./CSS/normalize.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <title>Auxinet</title>
</head>
<body>
    <nav>
        <a href="" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="">INICIO</a></li>
            <li><a href="actualizar.jsp"><%=nombre%></a></li>
            <li><a href="cursos.jsp">CURSOS</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>
<!--<body>-->
    <section>
        <img class="portada" src="./IMG/portadaimg.png">
    </section>
    <section>
        <table class="tabla" cellspacing="40">
            <tr>
                <td class="caja">
                    <ul class="lista">
                        <li class="titulo_caja">
                            Nuestros Cursos
                            <br>
                        </li>
                        <!--<br>-->
                        <li>
                            Tenemos dos clases de cursos, los r??pidos y los extensos.
                            Estos cursos se realizaron con el fin de salvar m??s vidas 
                            y asegurarnos que m??s gente tenga conocimientos sobre primeros
                            auxilios. 
                        </li>
                    </ul>
                </td>
                <td class="caja">
                    <ul class="lista">
                        <li class="titulo_caja">
                            Experiencia
                            <br>
                        </li>
                        <!--<br>-->
                        <li>
                            Mucha gente ha hecho nuestros cursos y han llegado a la conlcusi??n
                            que gracias a este proyecto han sabido como actuar ante alguna problem??tica
                            que se les ha llegado a presentar. 

                        </li>
                    </ul>
                </td>
                <td class="caja">
                    <ul class="lista">

                        <li class="titulo_caja">
                            Habilidades
                            <br>
                        </li>
                        <!--<br>-->
                        <li>
                            Las personas que han concluido con nuestros, terminan sabiendo como actuar
                            antes una situaci??n en la cual requiera atenci??n m??dica, adem??s aprenden algunos 
                            de los valores que se requieren ante tales situaciones.
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </section>
    <section>
        <center><h2>CURSOS R??PIDOS</h2></center>

        <hr>
    </section>
    <section class="carrousel">
        <input type="radio" name="position" checked />
        <input type="radio" name="position" />
        <input type="radio" name="position" />
        <input type="radio" name="position" />
        <main id="carousel">
            <div class="item">
                <center><h2>Medir la Glucosa</h2></center>
                <ul class="lista">
                    <li>
                        Se necesita un gluc??metro o medidor de glucosa, lancetas y tiras reactivas de glucosa. 
                        Estas suponen un m??todo muy eficaz para conocer el nivel de glucosa.    
                        <br>
                    </li>
                     
                    <li>
                        Tienes que pincharte el dedo de la mano, en la zona de la yema del dedo m??s pr??xima 
                        a la u??a (previamente lavada con agua y jab??n), con la lanceta para extraer una gota 
                        de sangre.Posteriormente colocas la muestra de sangre en una tira reactiva y, 
                        a trav??s del gluc??metro, podr??s ver tus resultados.
                        <br>
                    </li>
                    
                    <li>
                        <!--<center><img class="imgcar" src="IMG/glucosa.jpg" src="./r_glucosa.html"></center>-->
                        <center><img class="imgcar" src="IMG/glucosa.jpg"></center>
                    </li>
                </ul>
            </div>
            <div class="item">
                <center><h2>Medir la Presi??n</h2></center>
                <ul class="lista">
                    <li>
                        Col??quese el manguito sobre el brazo descubierto y si??ntese con la espalda erguida y 
                        apoyada, los pies planos sobre el suelo y el brazo apoyado al nivel del coraz??n. 
                        Aseg??rese que el extremo inferior del manguito quede directamente por arriba del doblez 
                        del codo. Rel??jese unos cinco minutos antes de medirse la presi??n. 
                        Resista el impulso de hablar o mirar un tel??fono celular.               
                        <br>
                    </li>
                    
                    <li>
                        <center><img class="imgcar" src="IMG/presion.jpg"></center>
                    </li>
                </ul>
            </div>
            <div class="item">
                <center><h2>Temperatura</h2></center>
                <ul class="lista">
                    <li>
                        Casi siempre se sugieren los term??metros electr??nicos.
                        <br>
                    </li>
                    
                    <li>
                        La boca: coloque el bulbo bajo la lengua y cierre la boca.
                        Utilice los labios para mantener el term??metro bien fijo en su lugar. 
                        Deje el term??metro en la boca por 3 minutos o hasta que el dispositivo pite. 
                        <br>
                    </li>
                    
                    <li>
                        La axila: coloque el term??metro en la axila. 
                        Presione el brazo contra el cuerpo. Espere 5 minutos antes de leerlo.            
                    </li>
                    <li>
                        <center><img class="imgcar" src="IMG/temperatura.jpg"></center>
                    </li>
                </ul>
            </div>
            <div class="item">
                <center><h2>Desangrado</h2></center>
                <ul class="lista">
                    <li>
                        Aplique presi??n en la herida con una gasa est??ril o alg??n material absorbente
                        para detener la hemorragia o disminuir la perdida de sangre.
                        <br>
                    </li>
                    
                    <li>
                        Si la herida es severa, recuerde llamar a emergencias 911 o pida que alguien m??s lo haga.
                        Mientras llegue la ayuda, mantenga presionada la herida.            
                        <br>
                    </li>
                    <li>
                        <center><img class="imgcar" src="IMG/hemorragia.jpg"></center>
                    </li>
                </ul>
            </div>
        </main>
    </section>
    <br>
    <br>

    <center><a href="">Para ver los cursos a fondo por favor da click en los siguientes enlaces</a></center>

    <hr>
    <div class="cursos_rapidos">
        <b><a href="glucosa.jsp">Glucosa</a></b>
        <b><a href="presion.jsp">Presi??n</a></b>
        <b><a href="temperatura.jsp">Temperatura</a></b>
        <b><a href="inyeccion.jsp">Inyecci??n</a></b>
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
            <p>P??gina hecha para ense??ar mediante cursos 
                did??ctidos temas de primeros auxilios.
            </p>
        </div>
        <ul class="footer-right">
            <li>
                <h2>Links</h2>
                <ul class="box">
                    <li><a href="">INICIO</a></li>
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

<!--</body>-->
</body>
</html> 
