function funTipoAudiencias() {
    var seleccion = document.getElementById("procedimientosAUD").value;
    var cajaTexto = document.getElementById("divOrdIndAUD");
    var cajaTexto2 = document.getElementById("divColAUD");
    var cajaTexto3 = document.getElementById("divHueAUD");
    var cajaTexto4 = document.getElementById("divCneAUD");

    if (seleccion === "Ordinario"||seleccion === "Especial individual") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "none";
        cajaTexto3.style.display = "none";
        cajaTexto4.style.display = "none";
    }  
    else if (seleccion === "Especial colectivo") {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "block";
        cajaTexto3.style.display = "none";
        cajaTexto4.style.display = "none";
    }
    else if (seleccion === "Huelga") {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "none";
        cajaTexto3.style.display = "block";
        cajaTexto4.style.display = "none";
    }
    else if (seleccion === "Colectivo de naturaleza económica")
    {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "none";
        cajaTexto3.style.display = "none";
        cajaTexto4.style.display = "block";
    }      
    else {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "none";
        cajaTexto3.style.display = "none";
        cajaTexto4.style.display = "none";
    }
}

function funEspAudiencias() {
     var seleccion = document.getElementById("listaOrdInd").value;
     var cajaTexto = document.getElementById("otraAud");
     
     if(seleccion === "Otro tipo de audiencia (especifique)") {
          cajaTexto.style.display = "block";   
     }    
     else {
         cajaTexto.style.display = "none";
     }
}

function funEspAudiencias2() {
     var seleccion = document.getElementById("listaCol").value;
     var cajaTexto = document.getElementById("otraAud");
     
     if(seleccion === "Otro tipo de audiencia (especifique)") {
          cajaTexto.style.display = "block";   
     }    
     else {
         cajaTexto.style.display = "none";
     }
}

function funEspAudiencias3() {
     var seleccion = document.getElementById("listaHuelga").value;
     var cajaTexto = document.getElementById("otraAud");
     
     if(seleccion === "Otro tipo de audiencia (especifique)") {
          cajaTexto.style.display = "block";   
     }    
     else {
         cajaTexto.style.display = "none";
     }
}

function funEspAudiencias4() {
     var seleccion = document.getElementById("listaCne").value;
     var cajaTexto = document.getElementById("otraAud");
     
     if(seleccion === "Otro tipo de audiencia (especifique)") {
          cajaTexto.style.display = "block";   
     }    
     else {
         cajaTexto.style.display = "none";
     }
}

$(document).ready(function () {
 $('#procedimientosAUD').change(function () {
        var expediente= $('#procedimientosAUD').val();
        
        $.ajax({
            type: 'post',
            url: 'ObtenExpediente3',
            data: {
                expediente: expediente
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                $('#comboExpedientes3').html(response);
                console.log('response');
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
});

function Obten_proc_exped3(claveOrgano, procedimiento, claveExpediente) {
    var claveOrg = document.getElementById(claveOrgano).value;
    var proc = document.getElementById(procedimiento).value;
    var claveExp = document.getElementById(claveExpediente).value;

    $.ajax({
        type: 'POST',
        url: 'ObtenIDaudiencia',
        data: {
            claveOrg: claveOrg,
            proc: proc,
            claveExp: claveExp
        },
        success: function(response) {
    // Inserta solo la tabla dentro del fieldset sin borrar la leyenda
    document.getElementById("tablaAudiencia").innerHTML = `
        <legend>Audiencias Registradas</legend> 
        ${response}
    `;
},
        error: function (response) {
            console.log("Error: ", response);
        }
    });
}



 