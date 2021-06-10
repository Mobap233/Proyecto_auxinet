/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function rcpmod1(RCPmod1){
    var res1 = RCPmod1.p1.value;
    var bandera = true;
    var res2 = RCPmod1.p2.value;
    var res3 = RCPmod1.p3.value;
    var res4 = RCPmod1.p4.value;
    var res5 = RCPmod1.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "3" || res3 != "2" || res4 != "3" || res5 != "3"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function rcpmod2(RCPmod2){
    var res1 = RCPmod2.p1.value;
    var bandera = true;
    var res2 = RCPmod2.p2.value;
    var res3 = RCPmod2.p3.value;
    var res4 = RCPmod2.p4.value;
    var res5 = RCPmod2.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "3" || res2 != "3" || res3 != "1" || res4 != "3" || res5 != "3"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function rcpmod3(RCPmod3){
    var res1 = RCPmod3.p1.value;
    var bandera = true;
    var res2 = RCPmod3.p2.value;
    var res3 = RCPmod3.p3.value;
    var res4 = RCPmod3.p4.value;
    var res5 = RCPmod3.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "3" || res2 != "1" || res3 != "1" || res4 != "3" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario y has terminado el curso de RCP Felicidades");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function asfmod1(ASFmod1){
    var res1 = ASFmod1.p1.value;
    var bandera = true;
    var res2 = ASFmod1.p2.value;
    var res3 = ASFmod1.p3.value;
    var res4 = ASFmod1.p4.value;
    var res5 = ASFmod1.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "3" || res3 != "2" || res4 != "3" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function asfmod2(ASFmod2){
    var res1 = ASFmod2.p1.value;
    var bandera = true;
    var res2 = ASFmod2.p2.value;
    var res3 = ASFmod2.p3.value;
    var res4 = ASFmod2.p4.value;
    var res5 = ASFmod2.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "2" || res3 != "1" || res4 != "1" || res5 != "1"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function asfmod3(ASFmod3){
    var res1 = ASFmod3.p1.value;
    var bandera = true;
    var res2 = ASFmod3.p2.value;
    var res3 = ASFmod3.p3.value;
    var res4 = ASFmod3.p4.value;
    var res5 = ASFmod3.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "2" || res3 != "3" || res4 != "1" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario y has terminado el curso de Asfixia Felicidades");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function epimod1(EPImod1){
    var res1 = EPImod1.p1.value;
    var bandera = true;
    var res2 = EPImod1.p2.value;
    var res3 = EPImod1.p3.value;
    var res4 = EPImod1.p4.value;
    var res5 = EPImod1.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "2" || res2 != "3" || res3 != "1" || res4 != "1" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function epimod2(EPImod2){
    var res1 = EPImod2.p1.value;
    var bandera = true;
    var res2 = EPImod2.p2.value;
    var res3 = EPImod2.p3.value;
    var res4 = EPImod2.p4.value;
    var res5 = EPImod2.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "1" || res3 != "3" || res4 != "1" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function epimod3(EPImod3){
    var res1 = EPImod3.p1.value;
    var bandera = true;
    var res2 = EPImod3.p2.value;
    var res3 = EPImod3.p3.value;
    var res4 = EPImod3.p4.value;
    var res5 = EPImod3.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "3" || res2 != "1" || res3 != "1" || res4 != "2" || res5 != "3"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario y has terminado el curso de Epilepsia Felicidades");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function botmod1(BOTmod1){
    var res1 = BOTmod1.p1.value;
    var bandera = true;
    var res2 = BOTmod1.p2.value;
    var res3 = BOTmod1.p3.value;
    var res4 = BOTmod1.p4.value;
    var res5 = BOTmod1.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "3" || res3 != "2" || res4 != "3" || res5 != "2"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function botmod2(BOTmod2){
    var res1 = BOTmod2.p1.value;
    var bandera = true;
    var res2 = BOTmod2.p2.value;
    var res3 = BOTmod2.p3.value;
    var res4 = BOTmod2.p4.value;
    var res5 = BOTmod2.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "1" || res2 != "3" || res3 != "2" || res4 != "3" || res5 != "3"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}

function botmod3(BOTmod3){
    var res1 = BOTmod3.p1.value;
    var bandera = true;
    var res2 = BOTmod3.p2.value;
    var res3 = BOTmod3.p3.value;
    var res4 = BOTmod3.p4.value;
    var res5 = BOTmod3.p5.value;
    if(res1 == "" || res2 == "" || res3 == "" || res4 == "" || res5 == ""){
        alert("Debes de responder todas las preguntas");
        return false;
    }
    if(res1 != "2" || res2 != "2" || res3 != "2" || res4 != "2" || res5 != "1"){
        bandera = false;
    }
    if(bandera){
        alert("Felicidades has contestado bien el cuestionario y has terminado el curso de Botiquin Felicidades");
    }
    else{
        alert("Tienes 1 o mas preguntas mal, vuelve a leer la informacion");
    }
    return true;
}



