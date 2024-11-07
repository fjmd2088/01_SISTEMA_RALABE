$(document).ready(function () {
//    if($('#clave').val() !== '' ){
//        alert('hicimos submit');
//        $('.label-02').css('pointer-events', 'all');
//    };

    //   $('#sector').change(function () {
    //       var sec = $('#sector').val();
//
//        $.ajax({
//            type: 'post',
//            url: 'ObtenSectores',
//            data: {
//                sec: sec
//            },
    //         success: function (response) {
//                console.log("Respuesta del servidor al borrar: ", response);
//                $('#subsector').html(response);
//                console.log(response);
//            },
//            error: function (response) {
//                console.log("Respuesta del servidor error al borrar: ", response);
//                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
    //         }
//        });
});

//    $('#entidad').change(function () {
//        var enti = $('#entidad').val();
//
//        $.ajax({
//            type: 'post',
//            url: 'ObtenMunicipios',
//            data: {
//                enti: enti
//            },
//            success: function (response) {
//                console.log("Respuesta del servidor al borrar: ", response);
//                $('#municipio').html(response);
//                console.log('response');
//            },
//            error: function (response) {
//                console.log("Respuesta del servidor error al borrar: ", response);
//                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
//            }
//        });
//    });

//validaciones principales de procedimientos
$('#procedimientos').change(function () {
    var proce = $('#procedimientos').val();
    //codigo para desahilitar required las variables

    if (proce === 'Preferencia de Credito') {
        $('#promocion, #fechaPresProm, #fechaAdmProm, \n\
                #promovente, #estExp').prop('required', true);
    } else if (proce === 'Ejecucion') {
        $('#promocion, #fechaPresProm, #fechaAdmProm, \n\
                #promovente, #estExp').prop('required', false);
    }
});




$().ready(function () {
//    $('colores').multiselect();
});
//-----------------------------------------------------------------------------------------------------------------------------------------------


// Lista para almacenar los divs ocultos inicialmente
var divsOcultosInicialmente = [];
 
// Mapeo entre las opciones del select y los ids de los divs
var divsProc = {
    "Ordinario": "divOrdinario",
    "Especial individual": "divIndividual",
    "Especial colectivo": "divColectivo",
    "Huelga": "divHuelga",
    "Colectivo de naturaleza económica": "divColNatEco",
    "Paraprocesal o voluntario": "divParaprocesal",
    "Tercerías": "divTerceria",
    "Preferencia de crédito": "divPrefCred",
    "Ejecución": "divEjecucion"
};
 
// Función para detectar los divs ocultos inicialmente
function detectarDivsOcultos() {
    var todosLosDivs = document.querySelectorAll('div');  // Selecciona todos los divs
    todosLosDivs.forEach(function(div) {
        // Verificar si el div está oculto y no pertenece a divsProc
        if (window.getComputedStyle(div).display === 'none' && !Object.values(divsProc).includes(div.id)) {
            divsOcultosInicialmente.push(div);  // Almacenar los divs ocultos que no están en el mapeo
        }
    });
}
 
// Llamar a esta función al cargar la página (JSP)
window.onload = detectarDivsOcultos;
 
// Función para restablecer los divs ocultos inicialmente
function restablecerDivsOcultos() {
    divsOcultosInicialmente.forEach(function(div) {
        // Verificar si el div contiene selects con Select2
        var elementos = div.querySelectorAll('select');
        
        elementos.forEach(function(el) {
            // Si el select tiene la clase Select2, restablecer su valor con el método de Select2
            if ($(el).hasClass('select2-hidden-accessible')) {
                $(el).val(null).trigger('change'); // Restablece el valor a nulo o al valor por defecto de tu preferencia
            } else {
                el.selectedIndex = 0; // Restablece al primer valor si no usa Select2
            }
        });

        // Oculta el div después de restablecer
        ocultarYRestablecer(div);  // Restablecer el display a 'none'
    });
}

 
// Función para mostrar el div correspondiente al procedimiento seleccionado en el combobox
function mostrarProcedimientos() {
    var seleccion = document.getElementById("procedimientos").value;
 
    // Ocultar todos los divs mapeados
    Object.values(divsProc).forEach(function(divId) {
        var divElement = document.getElementById(divId);
        if (divElement) {
            ocultarYRestablecer(divElement);  // Ocultar y restablecer todos los divs
        }
    });
 
    // Mostrar el div correspondiente a la opción seleccionada
    if (divsProc[seleccion]) {
        document.getElementById(divsProc[seleccion]).style.display = "block";
    }
}



// -------------------------------------------------------VALIDACIONES PARA EL PROCEDIMIENTO ORDINARIO --------------------------------------------------------------------------------------

//Muestra y oculta el 
function mostrarOcultarMotCirConcepPrest() {
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divIndiv");
    var caja = document.getElementsByClassName("nondisplay");

    if (seleccion === "Individual") {
        cajaTexto.style.display = "block";
//               caja.style.display = "block";
        $('.nondisplay').fadeIn('slow');

    } else if (seleccion === "Colectivo") {
         ocultarYRestablecer(cajaTexto);  
//                caja.style.display = "none";
        $('.nondisplay').fadeOut('slow');
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarContrato() {
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divContrato");

    if (seleccion === "Individual") {
        cajaTexto.style.display = "block";

    } else if (seleccion === "Colectivo") {
        ocultarYRestablecer(cajaTexto);  

    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarNat1()
{
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divNat1ORD");
    if(seleccion === "Individual")
    {
        cajaTexto.style.display = "block";
    }
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarNat2()
{
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divNat2ORD");
    if(seleccion === "Colectivo")
    {
        cajaTexto.style.display = "block";
    }
    else {
       ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarMotCol() {
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divMotConfCol");

    if (seleccion === "Individual") {
        ocultarYRestablecer(cajaTexto);  

    } else if (seleccion === "Colectivo") {
        cajaTexto.style.display = "block";

    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarTipoContrato() {
    var seleccion = document.getElementById("contrato").value;
    var cajaTexto = document.getElementById("divTipoContrato");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        ocultarYRestablecer(cajaTexto);  
    } else
    {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEspMotOrd() {
    var div = document.getElementById("divEspMotOrd");
    var checkboxes = document.getElementsByClassName("opcion");
    var mostrar = false;

    if (checkboxes[7].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
       ocultarYRestablecer(div);  
    }
}

function mostrarOcultarCirc() {
    var seleccion = document.getElementById("circuns").value;
    var cajaTexto = document.getElementById("divCirc");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEspCir() {
    var div = document.getElementById("divEspCirc");
    var checkboxes = document.getElementsByClassName("opcion2");
    var mostrar = false;

    if (checkboxes[9].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        ocultarYRestablecer(div);  
    }
}

function mostrarOcultarConceptos() {
    var seleccion = document.getElementById("asunto").value;
    var cajaTexto = document.getElementById("divConcep");

    if (seleccion === "Individual") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Colectivo") {
        ocultarYRestablecer(cajaTexto);  
    } else
    {
       ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEspConc() {
    var div = document.getElementById("divEspConcep");
    var checkboxes = document.getElementsByClassName("opcion3");
    var mostrar = false;

    if (checkboxes[8].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        ocultarYRestablecer(div);  
    }
}

function mostrarOcultarPrest() {
    var div = document.getElementById("divPrest");
    var checkboxes = document.getElementsByClassName("opcion3");
    var mostrar = false;

    if (checkboxes[0].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        ocultarYRestablecer(div);  
    }
}

function mostrarOcultarEspPrest() {
    var div = document.getElementById("divEspPrest");
    var checkboxes = document.getElementsByClassName("opcion4");
    var mostrar = false;

    if (checkboxes[4].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        ocultarYRestablecer(div);  
    }
}

function mostrarOcultarIncompOrd() {
    var seleccion = document.getElementById("incompetenciaOrd").value;
    var cajaTexto = document.getElementById("divIncompetencia");
    var tipo = document.getElementById("incompOrd");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        ocultarYRestablecer(cajaTexto);  
        tipo.value='';
        
    } else
    {
        cajaTexto.style.display = "none";
        tipo.value='';
    }
}

function mostrarOcultarNoIncomp() {
    var seleccion = document.getElementById("incompetenciaOrd").value;
    var cajaTexto = document.getElementById("divNoIncompetencia");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Sí") {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEspIncompOrd() {
    var seleccion = document.getElementById("incompOrd").value;
    var cajaTexto = document.getElementById("divEspIncOrd");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarClaveConsOrd() {
    var seleccion = document.getElementById("constanciaCon").value;
    var cajaTexto = document.getElementById("divConsConcilSi");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarClaveConsOrd2() {
    var seleccion = document.getElementById("constanciaCon").value;
    var cajaTexto = document.getElementById("divConsConcilNo");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Sí") {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarDesahogo() {
    var seleccion = document.getElementById("prevDemand").value;
    var cajaTexto = document.getElementById("divDesahogo");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
       ocultarYRestablecer(cajaTexto);  
    } else {
       ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarCauImpDem() {
    var seleccion = document.getElementById("estatusDemOrd").value;
    var cajaTexto = document.getElementById("divDesechadaOrd");

    if (seleccion === "Desechada" || seleccion === "Archivo" || seleccion === "No se dio trámite al escrito de demanda") {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}
function mostrarOcultarAdmitida() {
    var seleccion = document.getElementById("estatusDemOrd").value;
    var cajaTexto = document.getElementById("divAdmitidaOrd");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarFechaAudPrel() {
    var seleccion = document.getElementById("preliminarOrd").value;
    var cajaTexto = document.getElementById("divFechaAudPrelOrd");

    if (seleccion === "Sí")
    {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No")
    {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarFechaAudJui() {
    var seleccion = document.getElementById("juicioOrd").value;
    var cajaTexto = document.getElementById("divFechaAudJuiOrd");

    if (seleccion === "Sí")
    {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No")
    {
        ocultarYRestablecer(cajaTexto);  
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarUltActProcOrd() {
    var seleccion = document.getElementById("estatusExpOrd").value;
    var cajaTexto = document.getElementById("divUltActProcOrd");

    if (seleccion === "En proceso de resolución")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarSolucionado() {
    var seleccion = document.getElementById("estatusExpOrd").value;
    var cajaTexto = document.getElementById("divSolucionadoOrd");

    if (seleccion === "Solucionado")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEscritaPreliminar() {
    var seleccion = document.getElementById("faseSolOrd").value;
    var cajaTexto = document.getElementById("divEscritaPreliminar");


    if (seleccion === "Fase escrita")
    {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Audiencia preliminar")
    {
        cajaTexto.style.display = "block";
    } else
    {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarMontoOrd() {
    var seleccion = document.getElementById("formaSolOrd").value;
    var cajaTexto = document.getElementById("divConConcOrd");

    if (seleccion === "Convenio conciliatorio")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarEspSolucion() {
    var seleccion = document.getElementById("formaSolOrd").value;
    var cajaTexto = document.getElementById("divEspSolOrd");

    if (seleccion === "Otra forma de solución (especifique)")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarFechaSolForma() {

    var forma = document.getElementById("formaSolOrd");
    var cajaTexto = document.getElementById("divfechaSolOrd");

    if (forma === "Convenio conciliatorio") {
        cajaTexto.style.display = "block";
    }

}

function mostrarOcultarAudJuicio() {
    var seleccion = document.getElementById("faseSolOrd").value;
    var cajaTexto = document.getElementById("divAudJuicio");
    console.log(seleccion); 

    if (seleccion === "Audiencia de juicio")
    {
        cajaTexto.style.display = "block";
    } else
    {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarMontoOrd2() {
    var seleccion = document.getElementById("formaSolOrd2").value;
    var cajaTexto = document.getElementById("divConConcOrd2");
    console.log(seleccion); 

    if (seleccion.trim() === "Convenio conciliatorio")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}


function mostrarOcultarEspSolucion2() {
    var seleccion = document.getElementById("formaSolOrd2").value;
    var cajaTexto = document.getElementById("divEspSolOrd2");

    if (seleccion === "Otra forma de solución (especifique)")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarTipoSent() {
    var seleccion = document.getElementById("formaSolOrd2").value;
    var cajaTexto = document.getElementById("divTipoSentOrd");

    if (seleccion === "Sentencia")
    {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function mostrarOcultarCondMix() {
    var formaSol = document.getElementById("formaSolOrd2").value;
    var seleccion = document.getElementById("tipoSentencia").value;
    var cajaTexto = document.getElementById("divConConcOrd2");

    // Mostrar el div si formaSol es "Sentencia" y seleccion es "Condenatoria" o "Mixta"
    if (formaSol === "Sentencia" && (seleccion === "Condenatoria" || seleccion === "Mixta")) {
        cajaTexto.style.display = "block";
    } else if (formaSol === "Convenio conciliatorio") {
        cajaTexto.style.display = "block";
    } else {
        ocultarYRestablecer(cajaTexto);  
    }
}
// --------------------------------------------------------------------------------------------- INDIVIDUAL  (VALIDACIONES) ----------------------------------------------------------------------------------------------------

function tipoContratoIND() {
    var seleccion = document.getElementById("contratoEscritoIND").value;
    var cajaTexto = document.getElementById("divContratoInd");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "none";
    }
}

function motivosIND() {
    var div = document.getElementById("divEspMotInd");
    var checkboxes = document.getElementsByClassName("opcion5");
    var mostrar = false;

    if (checkboxes[17].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function incompetenciaIND() {
    var seleccion = document.getElementById("incompetenciaInd").value;
    var cajaTexto = document.getElementById("divIncompetenciaInd");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "none";
    }
}

function incompetenciaEspIND() {
    var seleccion = document.getElementById("incompInd").value;
    var cajaTexto = document.getElementById("divEspIncInd");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function noIncompetenciaEspIND() {
    var seleccion = document.getElementById("incompetenciaInd").value;
    var cajaTexto = document.getElementById("divNoIncompetenciaIND");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function constConcil() {
    var seleccion = document.getElementById("conciliacionIND").value;
    var cajaTexto = document.getElementById("divConcIND");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function asuntoConcIND() {
    var seleccion = document.getElementById("conciliacionIND").value;
    var cajaTexto = document.getElementById("divAsuntoConcIND");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function desahogoIND() {
    var seleccion = document.getElementById("formuloPrevIND").value;
    var cajaTexto = document.getElementById("divDesahogoIND");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function causaImpIND() {
    var seleccion = document.getElementById("estDemIND").value;
    var cajaTexto = document.getElementById("divCausasImpIND");

    if (seleccion === "Archivo") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Desechada") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "No se dio trámite el escrito de demanda") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitida() {
    var seleccion = document.getElementById("estDemIND").value;
    var cajaTexto = document.getElementById("divAdmitidaIND");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitida2() {
    var seleccion = document.getElementById("estDemIND").value;
    var cajaTexto = document.getElementById("divEstExpInd");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function tramitacion() {
    var seleccion = document.getElementById("tramitacionIND").value;
    var cajaTexto = document.getElementById("divTramitacionIND");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function preliminar() {
    var seleccion = document.getElementById("audPreliminarIND").value;
    var cajaTexto = document.getElementById("divAudPreliminarIND");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function juicio() {
    var seleccion = document.getElementById("audJuicioIND").value;
    var cajaTexto = document.getElementById("divAudJuicioIND");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function procesoRes() {
    var seleccion = document.getElementById("estatusExpIND").value;
    var cajaTexto = document.getElementById("divProcesoResolucionIND");

    if (seleccion === "En proceso de resolución") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoIND() {
    var seleccion = document.getElementById("estatusExpIND").value;
    var cajaTexto = document.getElementById("divSolucionadoIND");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoIND1() {
    var seleccion = document.getElementById("faseSolIND").value;
    var cajaTexto = document.getElementById("divSolucionIND1");

    if (seleccion === "Tramitación por auto de depuración") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Tramitación sin audiencias") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Audiencia de juicio") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoIND2() {
    var seleccion = document.getElementById("faseSolIND").value;
    var cajaTexto = document.getElementById("divSolucionIND2");

    if (seleccion === "Audiencia preliminar") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function sentenciaIND() {
    var seleccion = document.getElementById("solucionTramIND1").value;
    var cajaTexto = document.getElementById("divTipoSentenciaIND");
    if (seleccion === "Sentencia") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function tipoSentIND() {
    var seleccion = document.getElementById("sentIND").value;
    var cajaTexto = document.getElementById("divMontoIND1");

    if (seleccion === "Condenatoria" || seleccion === "Mixta") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function convConcIND() {
    var seleccion = document.getElementById("solucionTramIND1").value;
    var cajaTexto = document.getElementById("divMontoIND1");
    if (seleccion === "Convenio conciliatorio") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solEspIND() {
    var seleccion = document.getElementById("solucionTramIND1").value;
    var cajaTexto = document.getElementById("divSolEspIND");
    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function convConcIND2() {
    var seleccion = document.getElementById("solucionTramIND2").value;
    var cajaTexto = document.getElementById("divMontoIND1");
    if (seleccion === "Convenio conciliatorio") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solEspIND2() {
    var seleccion = document.getElementById("solucionTramIND2").value;
    var cajaTexto = document.getElementById("divSolEspIND");
    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

//---------------------------------------------------------------------------------------------------------------COLECTIVO------------------------------------------------------------------------------------------------------------------------

function motivosCOL() {
    var div = document.getElementById("divEspMotivosCOL");
    var checkboxes = document.getElementsByClassName("opcion6");
    var mostrar = false;

    if (checkboxes[9].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}


function muestraSuspCOL() {
    var div = document.getElementById("divSupensionesCOL");
    var checkboxes = document.getElementsByClassName("opcion6");
    var mostrar = false;

    if (checkboxes[1].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function muestraTermCOL() {
    var div = document.getElementById("divTerminacionCOL");
    var checkboxes = document.getElementsByClassName("opcion6");
    var mostrar = false;

    if (checkboxes[2].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function muestraViolCOL() {
    var div = document.getElementById("divViolacionesCOL");
    var checkboxes = document.getElementsByClassName("opcion6");
    var mostrar = false;

    if (checkboxes[6].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function violCOL() {
    var div = document.getElementById("divEspVioCOL");
    var checkboxes = document.getElementsByClassName("opcion9");
    var mostrar = false;

    if (checkboxes[3].checked)
    {
        mostrar = true;
    }

    if (mostrar)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function incompCOL() {
    var seleccion = document.getElementById("incompetenciaCOL").value;
    var cajaTexto = document.getElementById("divIncompetenciaCOL");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function espIncompCOL() {
    var seleccion = document.getElementById("incompeCOL").value;
    var cajaTexto = document.getElementById("divEspIncCOL");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function noIncompCOL() {
    var seleccion = document.getElementById("incompetenciaCOL").value;
    var cajaTexto = document.getElementById("divNoIncompetenciaCOL");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function constaConcilCOL() {
    var seleccion = document.getElementById("concilCOL").value;
    var cajaTexto = document.getElementById("divClaveCOL");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function asuntoCOL() {
    var seleccion = document.getElementById("concilCOL").value;
    var cajaTexto = document.getElementById("asuntoVinCOL");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function desahogoCOL() {
    var seleccion = document.getElementById("formuloCOL").value;
    var cajaTexto = document.getElementById("divDesahogoCOL");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitidaCOL() {
    var seleccion = document.getElementById("estatusDemCOL").value;
    var cajaTexto = document.getElementById("divAdmitidaCOL");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitidaCOL2() {
    var seleccion = document.getElementById("estatusDemCOL").value;
    var cajaTexto = document.getElementById("divExpedCOL");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function fDepCOL() {
    var seleccion = document.getElementById("tramitacionDepCOL").value;
    var cajaTexto = document.getElementById("divFechaDepCOL");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function fJuiCOL() {
    var seleccion = document.getElementById("juicioCOL").value;
    var cajaTexto = document.getElementById("divFechaJuicioCOL");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function procesoResolCOL() {
    var seleccion = document.getElementById("estatusExpCOL").value;
    var cajaTexto = document.getElementById("divUltActProCOL");

    if (seleccion === "En proceso de resolución") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoCOL() {
    var seleccion = document.getElementById("estatusExpCOL").value;
    var cajaTexto = document.getElementById("divSolucionadoCOL");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function tipoSentCOL() {
    var seleccion = document.getElementById("formaSolCOL").value;
    var cajaTexto = document.getElementById("divTipoSentCOL");

    if (seleccion === "Sentencia") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function montoCOL() {
    var seleccion = document.getElementById("tipoSentenciaCOL").value;
    var cajaTexto = document.getElementById("divMontoCOL");

    if (seleccion === "Condenatoria" || seleccion === "Mixta") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function monto2COL() {
    var seleccion = document.getElementById("formaSolCOL").value;
    var cajaTexto = document.getElementById("divMontoCOL");

    if (seleccion === "Convenio conciliatorio") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solEspCOL() {
    var seleccion = document.getElementById("formaSolCOL").value;
    var cajaTexto = document.getElementById("divEspSolCOL");

    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

//--------------------------------------------------------------------------------------------------------------HUELGA-------------------------------------------------------------------------------------------------------------------------------

function solEspHUE() {
    var seleccion = document.getElementById("incompetenciaHUE").value;
    var cajaTexto = document.getElementById("divIncompetenciaHUE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function espIncompHUE() {
    var seleccion = document.getElementById("incompeHUE").value;
    var cajaTexto = document.getElementById("divEspIncHUE");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function noIncompHUE() {
    var seleccion = document.getElementById("incompetenciaHUE").value;
    var cajaTexto = document.getElementById("divNoIncompetenciaHUE");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function emplaHue() {
    var seleccion = document.getElementById("empHuelga").value;
    var cajaTexto = document.getElementById("divEmpHUE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function prehuelgaHUE() {
    var seleccion = document.getElementById("prehuelga").value;
    var cajaTexto = document.getElementById("audConcHUE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function concilHUE() {
    var seleccion = document.getElementById("audConHUE").value;
    var cajaTexto = document.getElementById("divFechaAudCon");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function estallaHUE() {
    var seleccion = document.getElementById("huelga").value;
    var cajaTexto = document.getElementById("estallamientoHUE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function ultimoActProcHUE() {
    var seleccion = document.getElementById("estatusExpHUE").value;
    var cajaTexto = document.getElementById("divFechaUltActProc");

    if (seleccion === "En proceso de resolución") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoHUE() {
    var seleccion = document.getElementById("estatusExpHUE").value;
    var cajaTexto = document.getElementById("divSolucionadoHUE");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function formSolHUE() {
    var seleccion = document.getElementById("faseSolHUE").value;
    var cajaTexto = document.getElementById("divEmplaPre");

    if (seleccion === "Emplazamiento a huelga" || seleccion === "Prehuelga") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function salario() {
    var div = document.getElementById("divSalario");
    var checkboxes = document.getElementsByClassName("opcion10");

    if (checkboxes[3].checked)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function motivosHUELGA() {
    var div = document.getElementById("divEspIMotHUEL");
    var checkboxes = document.getElementsByClassName("opcion10");

    if (checkboxes[7].checked)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function espSolH() {
    var seleccion = document.getElementById("formaSolHUE").value;
    var cajaTexto = document.getElementById("divEspSolHUE");

    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function opHuelga() {
    var seleccion = document.getElementById("faseSolHUE").value;
    var cajaTexto = document.getElementById("divHUE");

    if (seleccion === "Huelga") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function sentHuelga() {
    var seleccion = document.getElementById("formaSolHUE2").value;
    var cajaTexto = document.getElementById("divSentenciaHuelga");

    if (seleccion === "Sentencia") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function monPorHuelga() {
    var seleccion = document.getElementById("formaSolHUE2").value;
    var cajaTexto = document.getElementById("divMontoPorcentajeHUE");

    if (seleccion === "Desistimiento") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "block";
    }
}

function espSolH2() {
    var seleccion = document.getElementById("formaSolHUE2").value;
    var cajaTexto = document.getElementById("divEspSolHUE2");

    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}
//------------------------------------------------------------------COLECTIVO DE NATURALEZA ECONOMICA----------------------------------------------------------------

function espeMotCNE() {
    var div = document.getElementById("divEspMotCNE");
    var checkboxes = document.getElementsByClassName("opcion11");

    if (checkboxes[4].checked)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function suspCNE() {
    var div = document.getElementById("divSuspensionCNE");
    var checkboxes = document.getElementsByClassName("opcion11");

    if (checkboxes[2].checked)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}

function incompCNE() {
    var seleccion = document.getElementById("incompetenciaCNE").value;
    var cajaTexto = document.getElementById("divTipoIncompetenciaCNE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function incompEspCNE() {
    var seleccion = document.getElementById("tipoIncompetenciaCNE").value;
    var cajaTexto = document.getElementById("divEspIncCNE");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function noIncompCNE() {
    var seleccion = document.getElementById("incompetenciaCNE").value;
    var cajaTexto = document.getElementById("divNoIncompetenciaCNE");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function asuCNE() {
    var seleccion = document.getElementById("constConc").value;
    var cajaTexto = document.getElementById("divAV");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function claCNE() {
    var seleccion = document.getElementById("constConc").value;
    var cajaTexto = document.getElementById("divConsConcCNE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}


function desahogosCNE() {
    var seleccion = document.getElementById("formuloCNE").value;
    var cajaTexto = document.getElementById("divDesahogoCNE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitidaCNE() {
    var seleccion = document.getElementById("estatusDemandaCNE").value;
    var cajaTexto = document.getElementById("divAdmitidaCNE");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function admitida2CNE() {
    var seleccion = document.getElementById("estatusDemandaCNE").value;
    var cajaTexto = document.getElementById("divEstatusExpCNE");

    if (seleccion === "Admitida") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function fechaAudienciaCNE() {
    var seleccion = document.getElementById("audCNE").value;
    var cajaTexto = document.getElementById("divFechaAudCNE");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function ultActCNE() {
    var seleccion = document.getElementById("estatusExpCNE").value;
    var cajaTexto = document.getElementById("divFechaUltActCNE");

    if (seleccion === "En proceso de resolución") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionadoCNE() {
    var seleccion = document.getElementById("estatusExpCNE").value;
    var cajaTexto = document.getElementById("divSolucionadoCNE");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function solucionEspCNE() {
    var seleccion = document.getElementById("formaSolCNE").value;
    var cajaTexto = document.getElementById("divEspSol");

    if (seleccion === "Otra forma de solución (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function tipoSentCNE() {
    var seleccion = document.getElementById("formaSolCNE").value;
    var cajaTexto = document.getElementById("divTipoSentenciaCNE");

    if (seleccion === "Sentencia") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function efectosCNE() {
    var seleccion = document.getElementById("tipoSentenciaCNE").value;
    var cajaTexto = document.getElementById("divEfectosCNE");

    if (seleccion === "Condenatoria" || seleccion === "Mixta") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function espEfectosCNE() {
    var div = document.getElementById("divEspEfectosCNE");
    var checkboxes = document.getElementsByClassName("opcion13");

    if (checkboxes[8].checked)
    {
        div.style.display = "block";
    } else
    {
        div.style.display = "none";
    }
}
//---------------------------------------------------------------------------------PARAPROCESAL--------------------------------------------------------------------------------------------------------------------------------------------
function motPARA() {
    var seleccion = document.getElementById("motivoPARA").value;
    var cajaTexto = document.getElementById("divEspMotPARA");

    if (seleccion === "Otro motivo de la solicitud o promoción (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function incPARA() {
    var seleccion = document.getElementById("incompPARA").value;
    var cajaTexto = document.getElementById("divTipoIncompetenciaPARA");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function otraIncPARA() {
    var seleccion = document.getElementById("tipoIncompPARA").value;
    var cajaTexto = document.getElementById("divEspIncPARA");

    if (seleccion === "Otro tipo de incompetencia (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function noIncPARA() {
    var seleccion = document.getElementById("incompPARA").value;
    var cajaTexto = document.getElementById("divNoIncompetenciaPARA");

    if (seleccion === "No") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function promPARA() {
    var seleccion = document.getElementById("promoventePARA").value;
    var cajaTexto = document.getElementById("divEspPromPARA");

    if (seleccion === "Otro tipo de promovente (especifique)") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function estatusPARA() {
    var seleccion = document.getElementById("estatusExpPARA").value;
    var cajaTexto = document.getElementById("divFechaConclExp");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}
//------------------------------------------------------------------------------------TERCERÍAS----------------------------------------------------------------------------------------------------------------------------------------------------
function habilitarTER() {
    var seleccion = document.getElementById("procedimientos").value;
    var cajaTexto = document.getElementById("claveExp");

    if (seleccion === "Tercerías") {
        cajaTexto.style.display = "none";
        $('#claveExp').prop("required", false);
    } else {
        cajaTexto.style.display = "block";
        $('#claveExp').prop("required", true);
    }
}

function habilitar2TER() {
    var seleccion = document.getElementById("procedimientos").value;
    var cajaTexto = document.getElementById("fecha");

    if (seleccion === "Tercerías") {
        cajaTexto.style.display = "none"
        $('#fecha').prop("required", false);
    } else {
        cajaTexto.style.display = "block";
        $('#fecha').prop("required", false);
    }
}

function audienciaTER() {
    var seleccion = document.getElementById("audTER").value;
    var cajaTexto = document.getElementById("divAudienciaTER");

    if (seleccion === "Sí") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}

function estatusTER() {
    var seleccion = document.getElementById("estatusExpTER").value;
    var cajaTexto = document.getElementById("divSentTER");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else {
        cajaTexto.style.display = "none";
    }
}
//---------------------------------------------------------------------------------PREFERENCIAS DE CREDITO (VALIDACIONES) --------------------------------------------------------------------------------
function mostrarEstatusFecha() {
    var seleccion = document.getElementById("estExp").value;
    var cajaTexto = document.getElementById("divFechaDicResPC");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "En proceso de resolucion") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "none";
    }
}

function mostrarPromoventeEspecifique() 
{
    var seleccion = document.getElementById("promovente").value;
    var cajaTexto = document.getElementById("divPromoventeEspecifiquePC");

    if (seleccion === "Otro tipo de promovente (especifique)") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "Trabajador") {
        cajaTexto.style.display = "none";
    } else if (seleccion === "Sindicato") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "none";
    }
}

function mostrarEstatusFechaFaseEj() {
    var seleccion = document.getElementById("estExpE").value;
    var cajaTexto = document.getElementById("divFechaFaseEj");

    if (seleccion === "Solucionado") {
        cajaTexto.style.display = "block";
    } else if (seleccion === "En proceso de resolucion") {
        cajaTexto.style.display = "none";
    } else {
        cajaTexto.style.display = "none";
    }
}

function diasRes() {
    var estalla = new Date(document.getElementById("fechaEstalla").value);
    var levanta = new Date(document.getElementById("levantaHuelga").value);

    if (estalla !== '' && levanta !== '') {
        var resta = levanta.getTime() - estalla.getTime();
        document.getElementById("diasHuelga").value = Math.round(resta / (1000 * 60 * 60 * 24));
        alert('resultado: ' + Math.round(resta / (1000 * 60 * 60 * 24)));
    }
}

function entiMunicipio(entidad, municipio) {
    var enti = $('#' + entidad).val();

    $.ajax({
        type: 'post',
        url: 'ObtenMunicipios',
        data: {
            enti: enti
        },
        success: function (response) {
            console.log("Respuesta del servidor al borrar: ", response);
            $('#' + municipio).html(response);
            console.log('response');
        },
        error: function (response) {
            console.log("Respuesta del servidor error al borrar: ", response);
            alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
        }
    });
}

function sectorSubsector(sector, subsector) {
    var sec = $('#' + sector).val();

    $.ajax({
        type: 'post',
        url: 'ObtenSectores',
        data: {
            sec: sec
        },
        success: function (response) {
            console.log("Respuesta del servidor al borrar: ", response);
            $('#' + subsector).html(response);
            console.log(response);
        },
        error: function (response) {
            console.log("Respuesta del servidor error al borrar: ", response);
            alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
        }
    });
}

//----------------------------------------------------------------------------------------------------------------------------------------------------------------

function fechaMax(fecha) {
    let today = new Date();
    let dd = today.getDate();
    let mm = today.getMonth() + 1; //January is 0!
    let yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd
    }
    if (mm < 10) {
        mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + dd;
    if (fecha > today) {
        fecha.max = today;
    }
}



function mayusculas(campo) {
    // Expresión regular para permitir solo letras mayúsculas sin acentos
    const regex = /^[A-Z]+$/;

    // Elimina cualquier carácter que no coincida con la expresión regular
    campo.value = campo.value.replace(/[^A-Z]/g, '');
}

// Valida que las entradas no tengan acentos y las convierte en mayúsculas, permite espacios y comas

function validarYConvertirEspacioComa(input) {
  const regex = /^[A-Z ,]*$/;   // Permite solo letras mayúsculas y espacios
  // Convertir a mayúsculas
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
     
        
      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Sólo se admiten letras y espacios.',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      // Retorna el valor convertido si es válido
    return input.value;
  }
}

function validarYConvertirP(input) {
  const regex = /^[A-Z ]*$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
     
        
      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Sólo se admiten letras y espacios, sin acentos.',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      const textoMayusculas = input.toUpperCase();
      return regex.test(textoMayusculas) ? textoMayusculas : "Texto inválido";
  }
}

//////////////////////////////////////////metodos para edicion////////////////////////////////////

 function filtrarOpciones(sectorId) {
            var input, filter, select, options, i;
            input = document.getElementById(sectorId);  // El select
            filter = input.value.toUpperCase();  // Convertimos el valor ingresado a mayúsculas
            select = document.getElementById(sectorId);  
            options = select.getElementsByTagName("option");

            // Recorremos todas las opciones del select
            for (i = 0; i < options.length; i++) {
                var txtValue = options[i].textContent || options[i].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    options[i].style.display = "";  // Mostrar si coincide
                } else {
                    options[i].style.display = "none";  // Ocultar si no coincide
                }
            }
        }
        
        
        //fUNCIÓN PARA VALIDAR ENTEROS POSITIVOS
 function funcionNeg(inputId) {
    var valor = parseFloat(document.getElementById(inputId).value);

    // Verificar si es entero y positivo
    if (isNaN(valor) || valor < 0 || !Number.isInteger(valor)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor ingrese solo números enteros positivos',
            confirmButtonText: 'Aceptar'
        });
        document.getElementById(inputId).value = "";
    }
}

        //fUNCIÓN PARA VALIDAR NUMEROS
function funcionPesos(inputId) {
    var valor = document.getElementById(inputId).value;

    // Expresión regular para validar el formato 000000.00
    var regex =  /^\d*\.?\d{0,2}$/;

    // Verificar si el valor cumple con el formato requerido
    if (valor !== "" && !regex.test(valor)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor ingrese un monto válido en el formato 000000.00',
            confirmButtonText: 'Aceptar'
        });
        document.getElementById(inputId).value = "";  // Limpiar el campo si no es válido
    }
}


//fUNCIÓN PARA REESTABLECER TODOS LOS VALORES DENTRO DEL DIV A LOS VALORES POR DEFECTO
function ocultarYRestablecer(div) {
    // Ocultar el div
    div.style.display = 'none';

    // Recorrer todos los elementos dentro del div
    var elementos = div.querySelectorAll('input, select, textarea');
    
    elementos.forEach(function(elemento) {
        // Verificar que el elemento no tenga el atributo readonly y que no sea el select "procedimientos"
        if (!elemento.hasAttribute('readonly') && elemento.id !== "procedimientos") {
            // Restablecer los campos de texto, selectores, y textarea
            if (elemento.tagName === 'INPUT' || elemento.tagName === 'TEXTAREA') {
                if (['text', 'number', 'password', 'email'].includes(elemento.type)) {
                    elemento.value = "";  // Restablecer campo de texto, números, etc.
                } else if (elemento.type === 'checkbox' || elemento.type === 'radio') {
                    elemento.checked = false;  // Restablecer checkboxes y radios
                }
            } else if (elemento.tagName === 'SELECT') {
                // Restablecer selectores al primer valor
                elemento.selectedIndex = 0;
                
                // Verificar si el selector está usando Select2
                if ($(elemento).hasClass('select2-hidden-accessible')) {
                    $(elemento).val(null).trigger('change');  // Restablecer el select si usa Select2
                }
            }
        }
    });
}
