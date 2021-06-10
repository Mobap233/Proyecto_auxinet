<%-- 
    Document   : iniciosesion
    Created on : 6/06/2021, 08:58:31 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/registro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <title>Inicio de Sesión</title>
</head>
<body>
    <nav>
        <a href="index.html" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="index.html">INICIO</a></li>
            <li><a href="">INICIAR SESION</a></li>
            <li><a href="cursos_ini.jsp">CURSOS</a></li>
        </ul>
    </nav>

    <div class="wrapper fadeInDown">
        <div id="formContent">
          <h2 class="active"> Iniciar Sesión </h2>
          <a href="registro.jsp"><h2 class="inactive underlineHover"> Registrarse </h2></a>

          <div class="fadeIn first">
            <img src="IMG/Logo_Auxinet.png" id="icon" alt="User Icon" class="icon">
          </div>

          <form method="post" action="VerificarUsuario" name="registroUsuario">
            <input type="text" id="usuario" class="fadeIn second" placeholder="Usuario" name="usu" required>
            <input type="password" id="contraseña" class="fadeIn third" placeholder="Contraseña" name="pass" required>
            <input type="submit" class="fadeIn fourth" value="Iniciar Sesión">
          </form>
        </div>
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
            <li>
                <h2>Links</h2>
                <ul class="box">
                    <li><a href="index.html">INICIO</a></li>
                    <li><a href="">INICIAR SESION</a></li>
                    <li><a href="cursos_ini.jsp">CURSOS</a></li>
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