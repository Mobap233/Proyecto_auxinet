<%-- 
    Document   : Admincue
    Created on : 8/06/2021, 07:16:04 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="java.util.Vector"%>
<%@page import="Modelo.Vistacuetotal"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    String nombre="";
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
        <a href="MenuAdmin.jsp" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuAdmin.jsp">MENU</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>
    
    <center><h1 class="Titulo">Consulta de Cuestionario</h1></center>
    <div class="cuadro">
    <table align="center" cellspacing="40" class="table_c">
        <tr>
            <td>
               ID_Alumno
            </td>
            <td>
               Nombre Curso
            </td>
            <td>
                ID_Módulo
            </td>
            <td>
                ID_Cuestionario
            </td>
            <td>
                Pregunta 1
            </td>
            <td>
                Pregunta 2
            </td>
            <td>
                Pregunta 3
            </td>
            <td>
                Pregunta 4
            </td>
            <td>
                Pregunta 5
            </td>
            <td>
               Aprobado 
            </td>
        </tr>
        
            <%
                
                Vector<Vistacuetotal> lista = new Vector<Vistacuetotal>();
                Vistacuetotal con_viscue = new Vistacuetotal();
                lista = con_viscue.registros();
                if(lista != null){
                    
                int cue_apb = 0, p1 = 0, p2 = 0, p3 = 0, p4 = 0, p5 = 0, longitud = 0;
                longitud = lista.size();
                    for(Vistacuetotal nuevo: lista){
                        if(nuevo.isApb()){
                            cue_apb++ ;
                        }
                        if(nuevo.isP1()){
                            p1++;
                        }
                        if(nuevo.isP2()){
                            p2++;
                        }
                        if(nuevo.isP3()){
                            p3++;
                        }
                        if(nuevo.isP4()){
                            p4++;
                        }
                        if(nuevo.isP5()){
                            p5++;
                        }

                    %>
        <tr>
            <td>
               <%=nuevo.getId_alu()%>
            </td>
            <td>
               <%=nuevo.getNom_cur()%>
            </td>
            <td>
               <%=nuevo.getId_mod()%>
            </td>
            <td>
                <%=nuevo.getId_cue()%>
            </td>
            <td>
                <%=nuevo.isP1()%>
            </td>
            <td>
                <%=nuevo.isP2()%>
            </td>
            <td>
                <%=nuevo.isP3()%>
            </td>
            <td>
                <%=nuevo.isP4()%>
            </td>
            <td>
                <%=nuevo.isP5()%>
            </td>
            <td>
               <%=nuevo.isApb()%>
            </td>
        </tr>
            <%
                }
            %>
            <tr>
                <td colspan="4">Resultados de preguntas y cuestionarios aprobados</td>
                <td><%=p1%></td>
                <td><%=p2%></td>
                <td><%=p3%></td>
                <td><%=p4%></td>
                <td><%=p5%></td>
                <td><%=cue_apb%></td>
            </tr>
            <tr>
                <td colspan="4">Resultados de preguntas y cuestionarios reprobados</td>
                <td><%=longitud-p1%></td>
                <td><%=longitud-p2%></td>
                <td><%=longitud-p3%></td>
                <td><%=longitud-p4%></td>
                <td><%=longitud-p5%></td>
                <td><%=longitud-cue_apb%></td>
            </tr>
            <tr>
                <td colspan="4">Total de preguntas y cuestionarios presentados</td>
                <td><%=longitud%></td>
                <td><%=longitud%></td>
                <td><%=longitud%></td>
                <td><%=longitud%></td>
                <td><%=longitud%></td>
                <td><%=longitud%></td>
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