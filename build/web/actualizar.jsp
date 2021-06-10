<%-- 
    Document   : actualizar
    Created on : 8/06/2021, 08:28:02 PM
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
    <link rel="stylesheet" href="./CSS/registro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <script src="JS/validacion_registro.jsp"></script>
    <title>Curso Botiquin</title>
</head>
<body>
    <nav>
        <a href="MenuUsuario" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuUsuario">INICIO</a></li>
            <li><a href=""><%=nombre%></a></li>
            <li><a href="cursos.jsp">CURSOS</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>
    <br>
    <br>
    <center><h1 class="Titulo">Datos Personales</h1></center>

    <center><div class="cuadro">
    <table align="center" cellspacing="40" class="table_c">
        <tr>
            <td>NOMBRE</td>    
            <td><%=usuario.getNom_usu()%></td> 
        </tr>
        <br>
        <br>
        <tr>
            <td>SEXO</td>
            <td><%=usuario.getSex_usu()%></td>
        </tr>
        <br>
        <br>
        <tr>
            <td>EDAD</td>
            <td><%=usuario.getEdad_usu()%></td>

        </tr>
        <br>
        <br>
    </table>
    </div>
</center>
    
    <br><br>

    <div class="wrapper fadeInDown">
        <div id="formContent">
            <h2 class="active"> Actualizar Datos</h2>

          <div class="fadeIn first">
            <img src="./IMG/usuario_cuenta.jpeg" class="usu_img">
          </div>
          
          <form action="actualiza" method="post" name="actualiza" onsubmit="val_actualizar(this)">
            <input type="password" id="contraseña" name="password_act" class="fadeIn third" placeholder="Contraseña actual">
            <br>
            <br>
            <input type="password" id="usuario" name="password_new" class="fadeIn second" placeholder="Nueva Contraseña">
            <br>
            <br>
            <input type="password" id="contraseña" name="conf_password" class="fadeIn third" placeholder="Confirmar Contraseña">
            <br>
            <br>
            <input type="submit" class="fadeIn fourth" value="Enviar">
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
                    <li><a href="MenuUsuario.jsp">INICIO</a></li>
                    <li><a href="">MI CUENTA</a></li>
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