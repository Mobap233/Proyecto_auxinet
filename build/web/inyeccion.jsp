<%-- 
    Document   : inyeccion
    Created on : 8/06/2021, 09:26:02 PM
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
    <title>Inyeccion</title>
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

        <h2>??Como inyectar a una persona?</h2>
        <br>

        <p>
            Inyectar a una persona requiere de mucho valor, no cualquiera puede agarrar una aguja 
            y pinchar a alguien, por lo que necesitas aprender a hacerlo.
            Muchos creerian que es muy complicado realizar esta acci??n; pero en realidad es muy 
            sencillo cuando ya conoces las bases y estas dispuesto a hacerlo.
            <br>
            <b>Definamos que es una Inyecci??n:</b><em>"Es la introducci??n de un medicamento biol??gico al sitio
            de acci??n mediante la punci??n a  presi??n en diferentes tejidos corporales a trav??s de una 
            jeringa o aguja."</em>
        </p>

        <p>
            <img src="./IMG/Aguja.jpeg" class="img_aguja">
            Para poder llevar acabo una inyecci??n se necesita tener paciencia y destreza con la aguja, existen
            diferentes tipos pero las m??s usadas son de pl??stico, que vienen embazadas en una bolsa de silicona 
            herm??tica, estas son est??riles y se utilizan una sola vez, a fin de evitar riesgos a infecciones entre 
            varias personas, las m??s usadas son de 3 y de 5 milimetros pero hay con capacidades m??s altas hasta de 60 milimetros.
            Las agujas tienen un tubo de metal y un adpatador de pl??stico. Mediante este adaptador se fija la aguja 
            al extremo inferior de la jeringa. Al igual que las jeringas, las agujas tambi??n se suministran envasadas
            y individualmente est??riles.
            <br>
            Todas las inyecciones la mayoria de las ocasiones son hipod??rmicas, es decir, que el l??quido se introduce
            debajo de la piel. Sin embargo en estudios recientes se ha propuesto el desarrollo de nanoparches
            como alternatiiva a las inyecciones tradicionalmente. Dichos nanoparches se introducirian en la piel, la sustancia
            activa de una manera indolora, segura y, en el caso de las vacunas, m??s eficientes.

        </p>
        <br>
        <p>

        <h2>??Cu??les son los tipos de inyecci??n?</h2>

            Existen 4 tipos:
            <br>
            <br>
            <img src="./IMG/??ngulos.png" class="type_inyection">
            <b>Inyecci??n Intravenosa:</b>Para esta inyecci??n se necesita introducir la aguja a trav??s de la piel en una vena, siempre 
            y cuando este en un angulo de <b>20??</b> el l??quido entra por lo tanto en el sistema 
            circulatorio
            <br>
            <br>
            <b>Inyecci??n Intramuscular:</b>La aguja penetra en un tejido muscular, en un ??ngulo de <b>90??</b>, depositando 
            el l??quido en ese lugar. Desde all?? el cuerpo lo va absorviendo lentamente a trav??s de los vasos sanguineos capilares.
            En el cuerpo humano se suelen inyectar en los brazos gluteos y muslos.
            <br>
            <br>
            <b>Inyecci??n Subcut??nea:</b> Para la inyecci??n Subcut??nea la aguaj penetra muy poco espacio por debajo de la piel debe ser de <b>45??</b>
            el l??quido se deposita en la zona, desde donde todo es igualmente absoribda de forma lenta por todo el organizmo.
            La absorci??n en el tejido subcut??neo y la sangre, la velocidad de absorci??n es mantenida y lenta, lo que permite asegurar un efecto 
            sostenido.
            La mayoria de los f??rmacos subcut??neos son l??quidos no irritantes para la piel, debido que dicho tejido contiene receptores de dolor,
            las sustancias irritantes pueden producir dolor a la persona que se va a inyectar.
            <br>
            <br>
            <b>Inyecci??n Intrad??rmica:</b> En la inyecci??n intr??dermica la aguja penetra solo en la piel en un ??ngulo de <b>15??</b> paralelo al eje longitudinal
            del antebrazo.Si la inyecci??n es correcta aparecer?? una peque??a p??pula en el punto de inyecci??n que desaparece 
            esp??ntanea en 10 y 30 minutos.
            <br>
            <br>
        </p>    
        <br>
        
        <p>

            <h2>El arte de inyectar</h2>
            
            <b>A continuaci??n te mostraremos un videos de como inyectar para que todo lo aprendido los puedas llevar a la pr??ctica:</b>
            <br>
            <br>
            <center><iframe width="900" height="450" src="https://www.youtube.com/embed/oKMPd7Gtc8o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="video_inyection"></iframe></center>






        </p>







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