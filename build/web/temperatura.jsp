<%-- 
    Document   : temperatura
    Created on : 8/06/2021, 09:23:27 PM
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

    <br>
    <br>

    <div class="principal-container">

        <section>
            <h2>Como definimos a la Temperatura Corporal</h2>

            <p>
                Es una medida de la capacidad del organismo de generar y eliminar
                calor.
                <br>
                El cuerpo humano es un mecanismo de defensa perfecto y excelente para defenderte 
                de los diferentes problemas de salud que se puedan sucitar.
                <br>
                Al momento de empezar con un exceso de temperatura corporal los vasos sangu??neos en la piel se
                dilatan para transportar el exceso de calor en la superficie de la piel,
                
                nuestra temperatura se puede medir en muchos lugares del cuerpo. Los m??s comunes son la boca, el ??ido, 
                la axila y el recto. Aunque tambi??n se puede medir en la frente.
                <br>
                <b>Ahora bien para saber cual es nuestra temperatura corporal se utilizan los term??metros estos se dan en grados Celsius
                (??C)</b>
            </p>
        </section>
        <br>

        <section>       
            <p>
                <img src="./IMG/Temperatura.png" alt="Tabla de temperatura" class="table_temperature">
                <h3>??Cuando tenemos fiebre?</h3>
                <br>
                La fiebre en la mayor??a de personas se considera cuando esta por arriba de los 38??C, esto puede una reaaci??n a lo siguiente:
                <br>
                <b>Una infecci??n:</b> Esta es la cauda m??s com??n de fiebre. Las infecciones pueden afectar a todo el cuerpo a una parte del cuerpo.
                <br>
                <b>Medicamentos:</b> Incluyen antibi??tico, opioides y muchos otros, cuando tenemos fiebres por medicamentos se le conoce como <em>"Fiebre Medicamentosa"</em>,
                los medicamentos como los antibi??ticos elevan la temperatura corporal directamente.
                <br>
                <b>Traume grave o lesi??n:</b> Esto puede incluir un ataque card??aco, ataque de cerebral, golpe de calor o quemaduras en el cuerpo.
                <br>
                Una fiebre tambi??n puede ser por artritis, hipertiroidismo, e incluso algunos c??nceres, como leucemia y c??ncer de pulm??n.

            </p>
        </section>     

        <br>

        <section>
            <p>
                <h3>??Qu?? es la hipotermia?</h3>
                <br>
                La hipotermia es la disminuci??n de la temperatura del cuerpo por debajo de lo normal.
                por otra parte la temperatura baja corporal (<em>Hipotermia</em>) ocurre con otros s??ntomas como escalofr??os, temblores problemas 
                respiratorios o confusi??n, esto puede ser una se??al de una enfermedad m??s grave.
                <br>
                La temperatura corporal baja suele ocurrir como consecuencia de la esposici??n al fr??o. Pero tambi??n puede ser causada por el consumo de drogas o 
                determinados transtornos como la diabetes i el hipertiroidismo.
                <br>


            </p>
        </section>
        <br>
        <section>

            <h1>Como tomar la temperatura corporal</h1>

            Para tomar la temperatura tenemos 2 opciones, tomarla con un <b>term??metro digital</b> o un <b>term??metro de mercurio</b>.
            <br>
            En la actualidad ya es m??s sencillo tomarla ya que con un term??metro digital tenemos que seguir los siguientes pasos:
            <br>
            <br>
            <img src="./IMG/Temperatura.jpeg" alt="Term??metro" class="termometro">
            <br>
            <br>
            <b>Term??metro Digital:</b>
            <br>
            1.- Pulsa el bot??n de encendido del term??metro digital con pantalla LCD.
            <br>
            2.- Debes de esperar a que la numeraci??n se ponga en cero.
            <br>
            3.- Coloca el term??metro en la zona recomendada (axila, boca, odio <em>Mecionado anteiormente</em>)
            <br>
            4.- Espera a que suene un peque??o <b>!bip-bip-bip??</b> esto indicar?? el final de la medici??n.
            <br>
            5.- En la pantalla se indicar?? la temperatura de la persona.
            <br>
            <br>
            <br>
            <img src="./IMG/Mercurio.jpeg" alt="" class="img_mercury">
            <br>
            <br>
            
            <b>Term??metro de Mercurio</b>
            <br>
            1.- Desinfectar el termometro con algod??n y alcohol.
            <br>
            2.- Agitarlo bien el term??metro antes de ponerlo, asi parte de una temperatura 
            ambiental y con el mercurio en su nivel m??s bajo.
            <br>
            3.- Coloca el term??metro en la zona del cuerpo en la que te midas la temperatura
            comunmente es en la axila.
            <br>
            4.- Tienes que esperar al rededor de 3 minutos. Controla el  tiempo para no retirarlo 
            antes de que el mercurio se haya dilatado.
            <br>
            5.- Posteriormente retira el termometro y comprueba hasta donde llega el mercurio en la escala de 
            grados. Si supera los 37??C entonces tienes fiebre.

            

    
        </section>

    



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
