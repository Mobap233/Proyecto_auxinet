<%-- 
    Document   : registro
    Created on : 6/06/2021, 09:01:59 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./CSS/registro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <script src="JS/validacion_registro.js"></script>
    <title>Registro</title>
</head>
<body>
    <nav>
        <a href="index.html" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="index.html">INICIO</a></li>
            <li><a href="iniciosesion.jsp">INICIAR SESION</a></li>
            <li><a href="cursos_ini.jsp">CURSOS</a></li>
        </ul>
    </nav>

    <div class="wrapper fadeInDown">
        <div id="formContent">
          <h2 class="active"> Registrarse </h2>
          <a href="iniciosesion.jsp"><h2 class="inactive underlineHover"> Iniciar Sesión </h2></a>

          <div class="fadeIn first">
            <img src="IMG/Logo_Auxinet.png" id="icon" alt="User Icon" class="icon">
          </div>

          <form method="post" action="guardarUsuario" name="registroUsuario" onsubmit="return val_registro(this)">
            <input type="text" id="usuario" class="fadeIn second" placeholder="Usuario" name="nom" required>
            <input type="password" id="contraseña" class="fadeIn second" placeholder="Contraseña" name="pass" required>
            <input type="password" id="contraseña2" class="fadeIn second" placeholder="Confirmar Contraseña" name="conf_pass" required>
            <input type="number" id="edad" class="fadeIn third" placeholder="Edad" name="edad" min="15" max="99" required>
            <select type=select name="sexo" class="fadeIn third">
                <option>Femenino</option>
                <option>Masculino</option>
                <option>Prefiero no decirlo</option>
            </select>
            <input type="submit" class="fadeIn fourth" value="Registrarse">
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
                    <li><a href="iniciosesion.jsp">INICIAR SESION</a></li>
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