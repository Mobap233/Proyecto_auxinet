<%-- 
    Document   : glucosa
    Created on : 8/06/2021, 09:27:25 PM
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
    <title>Glucosa</title>
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

            <h2>COMO MEDIR LA GLUCOSA</h2>

            <h3>¿POR QUÉ DEBES MEDIR AZUCAR EN LA SANGRE?</h3>
            <p><!-- Texto -->
                Es es principalmente si tienes diabetes, y lo recomendable es hacer esto diario,la
                informacion de esas mediciones te indica si controlas adecuadamente tu nivel de glucosa
                llevar un control para
            </p>
            <p>
                Además, medir glucosa en sangre te informa de lo siguiente:
            </p>
            <table>
                <tr>
                    <td>
                        <img src="IMG/azucar_Auxinet.jpg" alt="glucosa" width="400" height="100">
                    </td>

                    <td>
                        <ul>
                            <li>
                                Si el tratamiento médico es efectivo y cómo afecta la medicación.
                            </li>
                            <li>
                                Te ayuda a entender en qué medida la dieta afecta a tus niveles.
                            </li>
                            <li>
                                Otras patologías pueden afectar a tu nivel de glucosa. Por ejemplo el estrés.
                            </li>
                            <li>
                                Te ayuda a diferenciar e identificar los niveles altos (hiperglucemia) y bajos (hipoglucemia).
                            </li>
                        </ul>
                    </td>
                </tr>
                   
            </table>
            

            <h3>COMO SE REALIZA</h3>
            <p>
                Primer se recomienda que Después de las comidas es fundamental esperar alrededor de 2 horas para hacer una medición adecuada.
                El nivel de azúcar en sangre se mide con un dispositivo cómodo y transportable, 
                un aparato medidor de glucosa(Glucometro). Éste te permite realizar los controles de forma adecuada incluso 
                fuera de casa.
            </p>
            
            <p>
                
                El glucómetro (aparato medidor de glucosa) puede ser de diferentes tipos y modelos. Pueden variar en su tamaño, 
                en el tipo de tiras de prueba (elemento desechable que reacciona ante la gota de sangre), en la cantidad de sangre que 
                necesitan, el lugar del pinchazo, etc.
            </p>
               
            <h3>VAMOS PASO POR PASO</h3>
            <ul>
                <li>
                    Es aconsejable limpiar el dedo indice con alcohol , antes de ralizar el pinchazo
                    <br>
                </li>

                <li>
                    Devemos de colocar nuestra tira reavtiva dentro del glucometro, este paso puede variar
                    segun el tipo o modelo de glucometro con el que cuente por esta razon recomendamos leer el manual 
                    de su glucometro antes.
                    <br>
                </li>
                <li>
                   Si todo esta correcto y su tiras funcioan le devera de dar los resultados en la pantalla del glucometro
                </li>
            </ul>
            
            <center>
                <table>
                    <tr>
                        <td>
                            <img src="IMG/glucometro_Auxinet.jpg" alt="esfigmomanómetro" height="300" width="300">
                        </td>
                        <td>
                            <img src="IMG/tiras_Auxinet.jpg" alt="esfigmomanómetro analogico" height="300" width="300">
                        </td>
                    </tr>
                
                    <tr>
                        <td>
                            <center>
                                GLUCOMETRO
                            </center> 
                        </td>
                        <td>
                            <center>
                                TIRAS REACTIVAS
                            </center>
                        </td>
                    </tr>
                
                </table>
            </center>

            <h3>COMO INTERPRETAR LA MEDICION</h3>
            <p>
                Los valores normales o normoglucemia dependen de si tienes diabetes o no. Según la Fundación para la Diabetes 
                (España) los valores normales  de glucosa en sangre en ayunas son :
            </p>

            <h4>Sin diabetes entre 70 y 100 mg/dl.</h4>
            <h4>Con diabetes entre 80 y 130 mg/dl.</h4>

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
