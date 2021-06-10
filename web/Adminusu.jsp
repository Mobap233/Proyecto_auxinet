<%-- 
    Document   : Adminusu
    Created on : 8/06/2021, 08:00:39 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    int privilegio = 0;
    HttpSession sesionusu = request.getSession();
    if(sesionusu.getAttribute("usuario")==null){
    
    %>
    
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%
    
    }else{
        usuario = (MUsuario)sesionusu.getAttribute("usuario");
        privilegio = usuario.getId_priv();
        if(privilegio == 5){
            %>
    
    <jsp:forward page="MenuUsuario.jsp">
        <jsp:param name="error" value="Esta pagina es solo de administradores" />
        
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
    <link rel="stylesheet" href="./CSS/normalize.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <title>Auxinet</title>
</head>
<body>
    <nav>
        <a href="index.html" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuAdmin.jsp">MENU</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>

    <center><h1 class="Titulo">Consulta de Usuarios
    </h1></center>
    <div class="cuadro">
    <table align="center" cellspacing="40" class="table_c">
        <tr>
            <td>
               ID_Usuario
            </td>
            <td>
               Nombre
            </td>
            <td>
                Edad
            </td>
            <td>
                Sexo
            </td>
        </tr>
        <%
            Vector<MUsuario> lista = new Vector<MUsuario>();
            MUsuario con_usu = new MUsuario();
            lista = con_usu.usuarios();
            int numero = 0;
            
            if(lista != null){
                numero = lista.size();
                for(MUsuario usu: lista){
                    %>
            <tr>
                <td><%=usu.getId_usu()%></td>
                <td><%=usu.getNom_usu()%></td>
                <td><%=usu.getEdad_usu()%></td>
                <td><%=usu.getSex_usu()%></td>
        </tr>
        <%
                }
                %>
            <tr>
                <td colspan="3">Usuarios que han ingresado a la plataforma</td>
                <td><%=numero%></td>
            </tr>
        <%
            }
        %>
        
    </table>
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
                    <li><a href="MenuAdmin.jsp">INICIO</a></li>
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