<%-- 
    Document   : mod2_rcp
    Created on : 7/06/2021, 09:53:49 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MAlumno"%>
<%@page import="Modelo.MCurso"%>
<%@page import="Modelo.Vistacue"%>
<%@page import="Modelo.Vistarac"%>
<%@page import="Modelo.MUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
    MUsuario usuario = new MUsuario();
    Vistarac vis_rac = new Vistarac();
    Vistacue vis_cue = new Vistacue();
    MCurso cur = new MCurso();
    MCurso con_cur = new MCurso();
    MAlumno alu = new MAlumno();
    String nombre="", nombre_curso = "";
    int id_modulo = 0, id_curso = 0;
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
        alu = (MAlumno)sesionusu.getAttribute("alumno");
        nombre = usuario.getNom_usu();
        nombre_curso = "RCP";
        id_modulo = 15;
        cur = con_cur.Datos_curso(nombre_curso, id_modulo);
        id_curso = cur.getId_cur();
        sesionusu.setAttribute("id_curso", id_curso);
        if(!vis_rac.saberRac(nombre_curso, id_modulo, usuario.getId_usu())){
            %>
    
    <jsp:forward page="menu_rcp.jsp">
        <jsp:param name="error" value="Debe de primero ingresar al curso o terminar el modulo 1" />
        
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow:wght@400;700&display=swap" rel="stylesheet">
    <script src="JS/validacion_cuestionario.js"></script>
    <title>Curso RCP 2</title>
</head>
<body>
    <nav>
        <a href="MenuUsuario.jsp" class="logo"><img class="imglogo" src="IMG/Logo_Auxinet.png"></a>
        <ul class="nav_links">
            <li><a href="MenuUsuario.jsp">INICIO</a></li>
            <li><a href="actualizar.jsp"><%=nombre%></a></li>
            <li><a href="cursos.jsp">CURSOS</a></li>
            <li><a href="cerrarSesion">CERRAR SESION</a></li>
        </ul>
    </nav>

    <table>
        <tr>
            <td class="nav2">
                <div>
                    <a href="menu_rcp.jsp"><i class="far fa-arrow-alt-circle-left fa-2x"></i></a>
                    <img src="IMG/rcp_curso.png">
                    <br>
                    <br>
                    <ul>
                        <li class="lista">
                            <a href="mod1_rcp.jsp" class="boton">Introducci??n</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <li class="lista">
                            <a href="" class="botonseleccionado">Causas y Consecuencias</a>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <%
                            if(vis_rac.saberRac(nombre_curso, id_modulo + 10, usuario.getId_usu())){
                        %>
                        <li class="lista">
                            <a href="mod3_rcp.jsp" class="boton">Pasos por hacer</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </td>
            <td>
                <div class="tema">
                    <ul>
                        <li class="lista">
                            <h3 class="titulo">Causas y Consecuencias</h3>
                        </li>
                        <hr>
                        <br>
                        <br>
                        <br>
                        <li class="lista">

                            <img src="./IMG/img_rcp_2.jpeg" class="img_rcp_2">
                            
                            La Reanimaci??n CardioPulmonar (RCP) es un procedimiento de emergencia para salvar vidas. 
                            
                            que se utiliza cuando una persona ha dejado de respirar y el coraz??n ha cesado de latir. Esto
                             puede suceder despu??s de una descarga el??ctrica, un ataque card??aco, ahogamiento o cualquier otra 
                             circunstancia que interrumpa la actividad card??aca.
                            Es mucho mejor hacer algo que no hacer nada en absoluto si temes que tus conocimientos o 
                            habilidades no est??n al 100 por ciento. Recuerda que la diferencia entre hacer algo y no hacer
                             nada podr??a salvarle la vida a alguien.
                            Se recomienda , que si no se tiene la capacitaci??n en RCP, se practique la reanimaci??n 
                            cardiopulmonar con las manos. Esto significa hacer compresiones de pecho sin interrupci??n de 100 
                            a 120 por minuto hasta que lleguen los socorristas. No es necesario proporcionar respiraci??n de rescate
                            La Reanimaci??n CardioPulmonar (RCP) puede mantener el flujo de sangre oxigenada al cerebro y
                             otros ??rganos vitales hasta que un tratamiento m??dico m??s definitivo pueda restablecer el ritmo 
                             card??aco normal.
                            Cuando el coraz??n se detiene, la falta de sangre oxigenada puede causar da??o cerebral en 
                            solo unos minutos. Una persona puede morir en 8 o 10 minutos.
                            <br>
                            <br>

                           <b>LAS CAUSAS Y LAS CONSECUENCIAS </b> 
                           
                            <br>
                            <br>

                            <b>CAUSAS</b>
                            <br>
                            <br>
                            Generalmente, los paros card??acos repentinos son ocasionados por un problema en el 
                            sistema el??ctrico del coraz??n, que puede ser consecuencia de una artropat??a coronaria, un 
                            infarto de miocardio u otros problemas card??acos.
                            <br>
                            Personas de cualquier edad, sexo, raza pueden sufrir un PCR, incluso aquellas que 
                            parecen gozar de un buen estado de salud. Posiblemente recuerde a un atleta profesional de 
                            nivel mundial en la cima de la aptitud f??sica que falleci?? de manera repentina durante un evento 
                            deportivo. 
                            <br>
                            Con frecuencia, esto es consecuencia de un paro card??aco repentino.
                            <br>
                            Por lo general, un paro card??aco repentino es ocasionado por un problema en el 
                            sistema el??ctrico del coraz??n. Si las se??ales el??ctricas del coraz??n son anormales, esto 
                            puede crear un ritmo card??aco irregular denominado arritmia.

                            <br>
                            <br>

                            <b>LOS FACTORES QUE INCREMENTAN EL RIESGO DE PCR INCLUYEN:</b> 
                            <br>
                            Antecedentes familiares de arteriopat??a coronaria.
                            <br>
                            Presi??n arterial elevada.
                            <br>
                            Colesterol alto.
                            <br>
                            Obesidad.
                            <br>
                            Diabetes.
                            <br>
                            Estilo de vida sedentario.
                            <br>
                            Tabaquismo.
                            <br>
                            Consumo excesivo de alcohol.
                            <br>
                            Edad.
                            <br>
                            <br>

                            <b>OTROS FACTORES QUE AUMENTAN EL RIESGO DE RCP INCLUYEN:</b>
                            <br>
                            <br>
                            Antecedentes personales o familiares de arritmias.
                            <br>
                            Antecedentes personales o familiares de PCR.
                            <br>
                            Infarto de miocardio previo.
                            <br>
                            Insuficiencia card??aca previa.
                            <br>
                            Abuso de drogas.
                            <br>
                            <br>

                            <b>CONSECUENCIAS</b>
                            <br>
                            <br>
                            La falta de ox??geno durante 5 minutos puede da??ar irreversiblemente algunos ??rganos vitales, en especial el cerebro. Esto casi siempre es seguido de un paro cardiaco a menos que se restaure r??pidamente la funci??n respiratoria. Sin embargo, una ventilaci??n intensiva puede tener consecuencias hemodin??micas negativas, en particular en el per??odo cercano al paro y en otras circunstancias en las que el gasto card??aco es bajo. En la mayor??a de los casos, el objetivo final es restaurar la ventilaci??n y la oxigenaci??n adecuadas sin comprometer la situaci??n cardiovascular.
                            Una persona que est?? sufriendo un paro respiratorio, posee poco tiempo para ser salvado, por lo que los m??dicos, enfermeros u otros testigos, deben comprender que cada minuto que pasa es de vital importancia para la v??ctima y que cualquier demora, puede ser fatal. Mientras m??s r??pido sea atendido, menor puede ser el da??o causado al cerebro por la falta de ox??geno.
                            Por esta raz??n, es que la reanimaci??n que se le aplique a la v??ctima debe estar controlada paso a paso, con tal de que no ocurra mayor tiempo entre cada una de las maniobras que deba aplicar el especialista o quien haga uso de un DEA. Es de suma importancia poder hacerlo lo m??s r??pido posible y reactivar el ritmo card??aco para que la falta de ox??geno no conlleve a consecuencias desfavorables para la persona.



                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <br>
    <br>
    <br>
    <%
    if(!vis_cue.saberRac(id_curso, alu.getId_alu())){
    %>
    <div class="wrapper fadeInDown">
        <div id="formContent">
          <h2 class="titulocuestionario"> Cuestionario M??dulo 2 </h2>
            <hr>

            <form action="Cuestionarios" method="GET" name="RCPmod2" onsubmit="return rcpmod2(this)">
                <br>
                <label for="p1" class="pregunta">??Por qu?? da un paro cardiorrespiratorio?</label> 
                <br>
                <br>
                <input type="radio" name="p1" value="1" class="fadeIn second">Problema en el sistema el??ctrico del coraz??n.
                <br>
                <input type="radio" name="p1" value="2" class="fadeIn second" checked>Arteriopat??a coronaria. 
                <br>
                <input type="radio" name="p1" value="3" class="fadeIn second">Todas las anteriores. 
                <br>
                <br>
                <label for="p2" class="pregunta">??Qu?? factores aumentan el riesgo de sufrir un paro cardiorrespiratorio?</label>
                <br>
                <br>
                <input type="radio" name="p2" value="1" class="fadeIn second" checked>Obesidad.
                <br>
                <input type="radio" name="p2" value="2" class="fadeIn second">Tabaquismo. 
                <br>
                <input type="radio" name="p2" value="3" class="fadeIn second">Todas las anteriores. 
                <br>
                <br>
                <label for="p3" class="pregunta">??Qu?? pasa si falta el oxigeno durante 5 min?</label>
                <br>
                <br>
                <input type="radio" name="p3" value="1" class="fadeIn third">Causa da??os irreversibles en el cerebro y otros ??rganos.  
                <br>
                <input type="radio" name="p3" value="2" class="fadeIn third">Todas los ??rganos colapsan. 
                <br>
                <input type="radio" name="p3" value="3" class="fadeIn third" checked>Ninguna de las anteriores.
                <br>
                <br>
                <label for="p4" class="pregunta">??Por que es importante el RCP?</label>
                <br>
                <br>
                <input type="radio" name="p4" value="1" class="fadeIn third">Puede ser la diferencia entre la vida y la muerte. 
                <br>
                <input type="radio" name="p4" value="2" class="fadeIn third" checked>Da m??s eperanza al paciente de sobrevivir. 
                <br>
                <input type="radio" name="p4" value="3" class="fadeIn third">Todas la anteriores.
                <br>
                <br>
                <label for="p5" class="pregunta">??Qu?? es RCP?</label>
                <br>
                <br>
                <input type="radio" name="p5" value="1" class="fadeIn fourth" checked>Un procedimiento de emergencias para salvar vidas.
                <br>
                <input type="radio" name="p5" value="2" class="fadeIn fourth">Las siglas de una afecci??n cardiaca.  
                <br>
                <input type="radio" name="p5" value="3" class="fadeIn fourth">Proceco en que se genera compresiones en pecho y la respiracion boca. boca 
                <br>
                <br>
                <br>
                <input type="hidden" name="curso" value="RCP">
                <input type="hidden" name="modulo" value="2">
                <input type="submit" class="fadeIn fourth" value="Enviar">
            </form>

            


        </div>
    </div>
    <%
    }
    %>
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
                    <li><a href="MenuUsuario.jsp">INICIO</a></li>
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
</body>
</html>
