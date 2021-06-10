/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function val_actualizar(actualiza){
    var val_pass = /^(\w|@|\.|-)+$/;
    var new_pass = actualiza.password_new.value;
    var confirmacion = actualiza.conf_password.value;
    var longitud = new_pass.length;
    if(longitud < 5){
        alert("La contraseña debe de ser mayor o igual a 5 caracteres");
        actualiza.password_new.focus();
        return false;
    }
    if(longitud > 30){
        alert("La contraseña debe de ser menor o igual a 30 caracteres");
        actualiza.password_new.focus();
        return false;
    }
    if(!val_pass.test(password)){
        alert("Los caracteres validos para la contraseña son letras , guion , guion bajo , arroba y punto");
        actualiza.password_new.focus();
        return false;
    }
    if(confirmacion != new_pass){
        alert("Las contraseñas no coinciden");
        actualiza.conf_password.focus();
        return false;
    }
    return true;
}

function val_registro(registroUsuario){
    var numeros = /^[0-9]+$/;
    var val_name = /^[A-Za-z]{1}\w+$/;
    var val_pass = /^(\w|@|\.|-)+$/;
    var name = registroUsuario.nom.value;
    var password = registroUsuario.pass.value;
    var confirmar = registroUsuario.conf_pass.value;
    var edad = registroUsuario.edad.value;
    var longitud = name.length;
    if(longitud < 5){
        alert("El nombre debe de ser mayor o igual a 5 caracteres");
        registroUsuario.nom.focus();
        return false;
    }
    if(longitud > 30){
        alert("El nombre de usuario debe de ser menor o igual a 30 caracteres");
        registroUsuario.nom.focus();
        return false;
    }
    if(!val_name.test(name)){
        alert("Los caracteres validos para el nombre de usuario son las letras, numeros y guion bajo, tambien debe de iniciar con una letra el nombre de usuario");
        registroUsuario.nom.focus();
        return false;
    }
    longitud = password.length;
    if(longitud < 5){
        alert("La contraseña debe de ser mayor o igual a 5 caracteres");
        registroUsuario.pass.focus();
        return false;
    }
    if(longitud > 30){
        alert("La contraseña debe de ser menor o igual a 30 caracteres");
        registroUsuario.pass.focus();
        return false;
    }
    if(!val_pass.test(password)){
        alert("Los caracteres validos para la contraseña son letras , guion , guion bajo , arroba y punto");
        registroUsuario.pass.focus();
        return false;
    }
    if(password != confirmar){
        alert("Las contraseñas no coinciden");
        registroUsuario.conf_pass.focus();
        return false;
    }
    if(!numeros.test(edad)){
        alert("La edad del usuario solo debe de contener numeros");
        registroUsuario.edad.focus();
        return false;
    }
    edad = parseInt(edad);
    if(edad < 15){
        alert("La edad del usuario debe ser mayor o igual a 15");
        registroUsuario.edad.focus();
        return false;
    }
    if(edad > 99){
        alert("La edad del usuario debe ser menor o igual a 99");
        registroUsuario.edad.focus();
        return false;
    }
    
    return true;
}
