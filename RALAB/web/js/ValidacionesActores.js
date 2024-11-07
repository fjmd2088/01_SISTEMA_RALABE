 $(document).ready(function () {
 $('#procedimientosACT').change(function () {
        var expediente= $('#procedimientosACT').val();
        var cve_organo= $('#claveOrgACT').val();
        
        $.ajax({
            type: 'post',
            url: 'ObtenExpedientes',
            data: {
                expediente: expediente,
                cve_organo:cve_organo
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                $('#comboExpedientes').html(response);
                console.log('response');
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
});

var divsOcultosInicialmenteA = []; // Almacena los divs ocultos inicialmente

function detectarDivsOcultosA() {
    // Selecciona solo divs dentro del formulario
    var todosLosDivs = document.querySelectorAll('form div');

    todosLosDivs.forEach(function(div) {
        // Guarda divs ocultos al cargar la página
        if (window.getComputedStyle(div).display === 'none') {
            divsOcultosInicialmenteA.push(div);
        }
    });
    console.log("Divs ocultos almacenados inicialmente:", divsOcultosInicialmenteA);
}

// Llamar a esta función al cargar la página
window.onload = detectarDivsOcultosA;

function restablecerDivsOcultosA() {
    // Iterar sobre todos los divs dentro del formulario
    var todosLosDivs = document.querySelectorAll('form div');

    todosLosDivs.forEach(function(div) {
        // Llamar a la función ocultarYRestablecer para cada div
        ocultarYRestablecer(div);
        
        // Si el div estaba oculto por defecto, mantenerlo oculto
        if (divsOcultosInicialmenteA.includes(div)) {
            div.style.display = 'none';
        } else {
            div.style.display = ''; // Mostrar divs que estaban visibles por defecto
        }
    });
}


//-------------------------------------------------------------------

function funcionID(inputId) {
    var valor = parseFloat(document.getElementById(inputId).value);

    // Verificar si el valor es un número entero positivo dentro del rango permitido
    if (isNaN(valor) || valor < 1 || !Number.isInteger(valor)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor ingrese solo números enteros positivos mayores que 0, de acuerdo al consecutivo que le corresponde.',
            confirmButtonText: 'Aceptar'
        });
        document.getElementById(inputId).value = "";  // Limpiar el campo
    }
}



function funProcedimiento() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divOrdinarioACT");
    var cajaTexto2 = document.getElementById("divActOrd");
    if (seleccion === "Ordinario") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);
    }
}


function funMenuACT1() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divActOrd");

    if (seleccion === "Ordinario") { 
        cajaTexto.style.display = "block";
    }  
    else {
       ocultarYRestablecer(cajaTexto);
    }
}

function funTrabajador() {
    var seleccion = document.getElementById("comboActor").value;
    var cajaTexto = document.getElementById("divTrabajadorORD");

    if (seleccion === "Trabajador") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);
    }
}

function funSindicato() {
    var seleccion = document.getElementById("comboActor").value;
    var cajaTexto = document.getElementById("divSindicatoACT");

    if (seleccion === "Sindicato") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funTipoSindicato() {
    var seleccion = document.getElementById("tipoSindicato").value;
    var cajaTexto = document.getElementById("divEspSindicato");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funOrgObr() {
    var seleccion = document.getElementById("sindictaOrgObr").value;
    var cajaTexto = document.getElementById("divOrgObr");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funEspOrgObr() {
    var seleccion = document.getElementById("nombreOrgObr").value;
    var cajaTexto = document.getElementById("divEspOrgObr");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funCantidadTrabajadores() {
    var seleccion = document.getElementById("comboActor").value;
    var cajaTexto = document.getElementById("divCantidadTrabajadores");

    if (seleccion === "Sindicato" || seleccion === "Coalición de trabajadores") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
 //--------------------------------------------INDIVIDUAL-----------------------------------------------------------------------
 
function funProcedimiento2() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divIndividualACT");
    var cajaTexto2 = document.getElementById("divActInd");
    if (seleccion === "Especial individual") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);  
    }
}

 function funTrabajador2() {
    var seleccion = document.getElementById("comboActor2").value;
    var cajaTexto = document.getElementById("divTrabajadorIND");

    if (seleccion === "Trabajador") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
//--------------------------------------COLECTIVO-----------------------------------------------------------------
 function funProcedimiento3() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divColectivoACT");
    var cajaTexto2 = document.getElementById("divActCol");
    if (seleccion === "Especial colectivo") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);  
    }
}

 function funSindicato2() {
    var seleccion = document.getElementById("comboActor3").value;
    var cajaTexto = document.getElementById("divSindicatoACT2");

    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

 function funCantidadTrabajadores2() {
    var seleccion = document.getElementById("comboActor3").value;
    var cajaTexto = document.getElementById("divCantidadTrabajadores2");

    if (seleccion === "Coalición de trabajadores" || seleccion === "Sindicato") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funPatron() {
    var seleccion = document.getElementById("comboActor3").value;
    var cajaTexto = document.getElementById("divPatronCOL");

    if (seleccion === "Patrón" ) { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funTipo() {
    var seleccion = document.getElementById("comboTipo").value;
    var cajaTexto = document.getElementById("divMoralCOL");

    if (seleccion === "Persona moral" ) { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funOrgObr2() {
    var seleccion = document.getElementById("sindictaOrgObr2").value;
    var cajaTexto = document.getElementById("divOrgObr2");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
function funEspOrgObr2() {
    var seleccion = document.getElementById("nombreOrgObr2").value;
    var cajaTexto = document.getElementById("divEspOrgObr2");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
function funTipoSindicato2() {
    var seleccion = document.getElementById("tipoSindicato2").value;
    var cajaTexto = document.getElementById("divEspSindicato2");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
//----------------------------------HUELGA--------------------------------------------------------------------------
function funProcedimiento4() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divHuelgaACT");
    var cajaTexto2 = document.getElementById("divActHue");
    if (seleccion === "Huelga") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);  
    }
}

function funSindicato3() {
    var seleccion = document.getElementById("comboActor4").value;
    var cajaTexto = document.getElementById("divSindicatoHue");
 
    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
      
    }  
    
    else {
        ocultarYRestablecer(cajaTexto);  
       
    }
}

function funTrabajadorHue() {
    var seleccion = document.getElementById("comboActor4").value;
    var cajaTexto = document.getElementById("divCantidadTrabajadoresHue");

    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
    }  
    else if (seleccion === "Mayoría de trabajadores"){
        cajaTexto.style.display = "block";
    }
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funOrgObrHUE() {
    var seleccion = document.getElementById("sindictaOrgObrHue").value;
    var cajaTexto = document.getElementById("divOrgObrHUE");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
function funEspOrgObr2HUE() {
    var seleccion = document.getElementById("nombreOrgObrHue").value;
    var cajaTexto = document.getElementById("divEspOrgObrHUE");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funTipoSindicato3() {
    var seleccion = document.getElementById("tipoSindicato3").value;
    var cajaTexto = document.getElementById("divEspSindicato3");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}
//------------------------------COLECTIVO NATURALEZA ECONOMICA-------------------
function funProcedimiento5() {
    var seleccion = document.getElementById("procedimientosACT").value;
    var cajaTexto = document.getElementById("divColNatEcoACT");
    var cajaTexto2 = document.getElementById("divActColNatEco");
    if (seleccion === "Colectivo de naturaleza económica") { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);  
    }
}

function funSindicatoCNE() {
    var seleccion = document.getElementById("comboActor5").value;
    var cajaTexto = document.getElementById("divSindicatoCNE");
    var cajaTexto2 = document.getElementById("divMayoriaTrabajadoresCNE");
    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    } 
    else {
        ocultarYRestablecer(cajaTexto);  
        ocultarYRestablecer(cajaTexto2);  
    }
}

function funMayoriaTrabajadoresCNE() {
    var seleccion = document.getElementById("comboActor5").value;
    var cajaTexto = document.getElementById("divMayoriaTrabajadoresCNE");

    if (seleccion === "Mayoría de trabajadores") { 
        cajaTexto.style.display = "block";
    }  
    else if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";   
    } 
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funPatronCNE() {
    var seleccion = document.getElementById("comboActor5").value;
    var cajaTexto = document.getElementById("divPatronCNE");

    if (seleccion === "Patrón") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funOrgObrCNE() {
    var seleccion = document.getElementById("sindictaOrgObrCNE").value;
    var cajaTexto = document.getElementById("divOrgObrCNE");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funEspOrgObrCNE() {
    var seleccion = document.getElementById("nombreOrgObrCNE").value;
    var cajaTexto = document.getElementById("divEspOrgObrCNE");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funTipoSindicatoCNE() {
    var seleccion = document.getElementById("tipoSindicatoCNE").value;
    var cajaTexto = document.getElementById("divEspSindicatoCNE");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funMoralCNE() {
    var seleccion = document.getElementById("comboTipoCNE").value;
    var cajaTexto = document.getElementById("divMoralCNE");

    if (seleccion === "Persona moral") { 
        cajaTexto.style.display = "block";
    }  
    else {
        ocultarYRestablecer(cajaTexto);  
    }
}

function funcionLatitudACT()
{
    var  lat = parseFloat(document.getElementById("latitudActCOL").value);
        const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
       
        input.value = '';
    }
    else
    {
         if ( lat < 11 || lat > 33)
        {
             Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de 11 a 33 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
            
            document.getElementById("latitud").value = "";
        }
    }   
}

function funcionLongitudACT()
{
    var  lon = parseFloat(document.getElementById("longitudActCOL").value);
    const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
        input.value = '';
    }
    else
    {
         if ( lon < -123 || lon > -83)
         {
              Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de -123 a -83 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
             
              document.getElementById("longitud").value = "";
         }
    }   
}

function funcionLatitud2ACT()
{
    var  lat = parseFloat(document.getElementById("latitudACTcne").value);
    const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
       
        input.value = '';
    }
    else
    {
         if ( lat < 11 || lat > 33)
        {
             Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de 11 a 33 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
            
            document.getElementById("latitud").value = "";
        }
    }   
}

function funcionLongitud2ACT()
{
    var  lon = parseFloat(document.getElementById("longitudACTcne").value);
    const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
        input.value = '';
    }
    else
    {
         if ( lon < -123 || lon > -83)
         {
              Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de -123 a -83 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
             
              document.getElementById("longitud").value = "";
         }
    }   
}


function sumarNumeros() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresTra').value;
  const numero2 = document.getElementById('mujeresTra').value;
  const numero3 = document.getElementById('noInvalido').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalTrabajadores');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}

function sumarNumeros2() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresTra2').value;
  const numero2 = document.getElementById('mujeresTra2').value;
  const numero3 = document.getElementById('noInvalido2').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalTrabajadores2');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}

function sumarNumeros3() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresTra3').value;
  const numero2 = document.getElementById('mujeresTra3').value;
  const numero3 = document.getElementById('noInvalido3').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalTrabajadores3');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}

function sumarNumeros4() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresCNE').value;
  const numero2 = document.getElementById('mujeresCNE').value;
  const numero3 = document.getElementById('identificadosCNE').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalCNE');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}

function Obten_proc_exped(claveOrgano, procedimiento, claveExpediente) {
    var claveOrg = document.getElementById(claveOrgano).value;
    var proc = document.getElementById(procedimiento).value;
    var claveExp = document.getElementById(claveExpediente).value;
 
    $.ajax({
        type: 'POST',
        url: 'ObtenIDactor',
        data: {
            claveOrg: claveOrg,
            proc: proc,
            claveExp: claveExp
        },
        success: function(response) {
    // Inserta solo la tabla dentro del fieldset sin borrar la leyenda
    document.getElementById("tablaActores").innerHTML = `
<legend>Actores Registrados</legend> 
        ${response}
    `;
},
        error: function (response) {
            console.log("Error: ", response);
        }
    });
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

function validarYConvertir(input) {
  const regex = /^[a-zA-Z0-9]+$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
     
        
      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Sólo se admiten letras sin acentos y números.',
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

function validarYConvertirNSS(input) {
    // Convierte automáticamente a mayúsculas
    input.value = input.value.toUpperCase();

    // Expresión regular que permite letras mayúsculas, números y espacios
    const regex = /^[A-Z0-9 ]*$/; 

    // Verificar si el valor contiene caracteres no permitidos
    if (!regex.test(input.value)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Solo se admiten letras sin acentos, números o la frase "NO IDENTIFICADO".',
            confirmButtonText: 'Aceptar'
        });

        // Elimina el último carácter ingresado no permitido
        input.value = input.value.slice(0, -1);
    }
}

 function noIdentificado(input) {
        input.value = input.value.replace(/\s{2,}/g, ' ').trim(); // Reemplaza múltiples espacios consecutivos por uno solo

        // Evitar que el input tenga más de un espacio consecutivo
        if (input.value.includes("NO IDENTIFICADO") === false) {
            input.value = input.value.replace(/[^A-Z0-9]/g, ''); // Eliminar cualquier carácter no permitido
        }
 }
function funcionNegA(inputId) {
    var valor = parseFloat(document.getElementById(inputId).value);

    // Verificar si el valor es un número entero positivo dentro del rango permitido
    if (isNaN(valor) || valor < 0 || valor > 99 || !Number.isInteger(valor)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor ingrese solo números enteros positivos entre 0 y 99',
            confirmButtonText: 'Aceptar'
        });
        document.getElementById(inputId).value = "";  // Limpiar el campo
    }
}



function validarYMayusculas(input) {
    const regex = /^[A-Z0-9 ]+$/; // Permite solo letras mayúsculas y espacios
    input.value = input.value.toUpperCase(); // Convierte el valor a mayúsculas

    if (!regex.test(input.value)) {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Sólo se admiten letras sin acentos y números.',
            confirmButtonText: 'Aceptar'
        });
        
        // Elimina el último carácter ingresado
        input.value = input.value.slice(0, -1);
    } else {
        // Esta parte se puede omitir ya que el valor ya fue convertido a mayúsculas
        return input.value; // Devuelve el valor en mayúsculas
    }
}

 
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