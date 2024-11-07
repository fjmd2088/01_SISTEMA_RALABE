$(document).ready(function () {
 $('#procedimientosDEM').change(function () {
        var expediente= $('#procedimientosDEM').val();
        
        $.ajax({
            type: 'post',
            url: 'ObtenExpedientes2',
            data: {
                expediente: expediente
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                $('#comboExpedientes2').html(response);
                console.log('response');
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
});
//---------------------------ORDINARIO---INDIVIDUAL--------------------
function funProcDem() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divDemOrdInd");

    if (seleccion === "Ordinario") { 
        cajaTexto.style.display = "block";
    }  
    else if (seleccion === "Especial individual") {
        cajaTexto.style.display = "block";
    }
    else {
        cajaTexto.style.display = "none";
    }
}

function funOrdDEM() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divOrdinarioIndividual");

    if (seleccion === "Ordinario") { 
        cajaTexto.style.display = "block";
    }  
    else if (seleccion ===  "Especial individual"){
        cajaTexto.style.display = "block";
    }        
    else {
        cajaTexto.style.display = "none";
    }
}

function funPatronOrdDEM() {
    var seleccion = document.getElementById("comboDemandado").value;
    var cajaTexto = document.getElementById("divPatronOrdIndDEM");

    if (seleccion === "Patrón") { 
        cajaTexto.style.display = "block";
    }    
    else {
        cajaTexto.style.display = "none";
    }
}

function funMoralOrdDEM() {
    var seleccion = document.getElementById("comboTipoDemORD").value;
    var cajaTexto = document.getElementById("divMoralOrdDEM");

    if (seleccion === "Persona moral") { 
        cajaTexto.style.display = "block";
    }    
    else {
        cajaTexto.style.display = "none";
    }
}

//---------------------------------------COLECTIVO------------------------------------
function funProcDem2() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divDemCol");

    if (seleccion === "Especial colectivo") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funColDEM() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divColDEM");

    if (seleccion === "Especial colectivo") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funSindColDEM() {
    var seleccion = document.getElementById("comboDemandado2").value;
    var cajaTexto = document.getElementById("divSindicatoColDEM");
    var cajaTexto2 = document.getElementById("divCoalicionTrabajadoresColDEM");

    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else if(seleccion === "Coalición de trabajadores")
    {
         cajaTexto2.style.display = "block";
         cajaTexto.style.display = "none";
    }
    else {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "none";
    }
}

function funTipoSindicatoCOL(){
    var seleccion = document.getElementById("tipoSindicatoColDEM").value;
    var cajaTexto = document.getElementById("divEspSindicatoColDEM");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funOrgObrColDEM(){
    var seleccion = document.getElementById("sindictaOrgObrColDEM").value;
    var cajaTexto = document.getElementById("divOrgObrColDEM");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funEspOrgObrColDEM(){
    var seleccion = document.getElementById("nombreOrgObrColDEM").value;
    var cajaTexto = document.getElementById("divEspOrgObrColDEM");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funPatronColDEM() {
    var seleccion = document.getElementById("comboDemandado2").value;
    var cajaTexto = document.getElementById("divPatronColDEM");

    if (seleccion === "Patrón" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function funMoralColDEM() {
    var seleccion = document.getElementById("comboTipoDemCOL").value;
    var cajaTexto = document.getElementById("divMoralColDem");

    if (seleccion === "Persona moral" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}
//-------------------------------------------------------------------------HUELGA----------------------------------------------------------------------------
function funProcDem3() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divDemHue");

    if (seleccion === "Huelga" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function funHueDem() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divHuelgaDEM");

    if (seleccion === "Huelga" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function funPatronHueDem() {
    var seleccion = document.getElementById("comboDemandado3").value;
    var cajaTexto = document.getElementById("divPatronHuelgaDEM");

    if (seleccion === "Patrón" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function funMoralHueDEM() {
    var seleccion = document.getElementById("comboTipoDemHUE").value;
    var cajaTexto = document.getElementById("divMoralHueDem");

    if (seleccion === "Persona moral" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}
//----------------------------------COLECTIVO NATURALEZA ECONOMICA-----------------------------------------
function funProcDem4() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divDemColNatEco");

    if (seleccion === "Colectivo de naturaleza económica") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funCneDEM() {
    var seleccion = document.getElementById("procedimientosDEM").value;
    var cajaTexto = document.getElementById("divCneDEM");

    if (seleccion === "Colectivo de naturaleza económica") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funSindCneDEM() {
    var seleccion = document.getElementById("comboDemandado4").value;
    var cajaTexto = document.getElementById("divSindicatoCneDEM");
    var cajaTexto2 = document.getElementById("divCoalicionTrabajadoresCneDEM");

    if (seleccion === "Sindicato" ) { 
        cajaTexto.style.display = "block";
        cajaTexto2.style.display = "block";
    }  
    else if(seleccion === "Mayoría de trabajadores")
    {
         cajaTexto2.style.display = "block";
         cajaTexto.style.display = "none";
    }
    else {
        cajaTexto.style.display = "none";
        cajaTexto2.style.display = "none";
    }
}

function funTipoSindicatoCNE(){
    var seleccion = document.getElementById("tipoSindicatoCneDEM").value;
    var cajaTexto = document.getElementById("divEspSindicatoCneDEM");

    if (seleccion === "Otro tipo de sindicato (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funOrgObrCneDEM(){
    var seleccion = document.getElementById("sindictaOrgObrCneDEM").value;
    var cajaTexto = document.getElementById("divOrgObrCneDEM");

    if (seleccion === "Sí") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}

function funEspOrgObrCneDEM(){
    var seleccion = document.getElementById("nombreOrgObrCneDEM").value;
    var cajaTexto = document.getElementById("divEspOrgObrCneDEM");

    if (seleccion === "Otra organización obrera (especifique)") { 
        cajaTexto.style.display = "block";
    }  
    else {
        cajaTexto.style.display = "none";
    }
}
/////
function funPatronCneDEM() {
    var seleccion = document.getElementById("comboDemandado4").value;
    var cajaTexto = document.getElementById("divPatronCneDEM");

    if (seleccion === "Patrón" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function funMoralCneDEM() {
    var seleccion = document.getElementById("comboTipoDemCNE").value;
    var cajaTexto = document.getElementById("divMoralCneDEM");

    if (seleccion === "Persona moral" ) { 
        cajaTexto.style.display = "block";       
    }     
    else {
        cajaTexto.style.display = "none";
      
    }
}

function sumarNumeros() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresColDEM').value;
  const numero2 = document.getElementById('mujeresColDEM').value;
  const numero3 = document.getElementById('identificadosColDEM').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalColDEM');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}
function sumarNumeros2() {
  // Obtener los elementos de los campos de texto por su ID (ajusta los ID según tu HTML)
  const numero1 = document.getElementById('hombresCneDEM').value;
  const numero2 = document.getElementById('mujeresCneDEM').value;
  const numero3 = document.getElementById('identificadosCneDEM').value;

 
  const suma = Number(numero1) + Number(numero2) + Number(numero3);

  // Obtener el elemento del campo de texto donde mostraremos el resultado
  const resultado = document.getElementById('totalCneDEM');

  // Mostrar el resultado en el campo
  resultado.value = suma;
}
function sumarNumeros3() {
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
function sumarNumeros4() {
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
function funcionLatitud4()
{
    var  lat = parseFloat(document.getElementById("latitudOrdDEM").value);
    
    if ( lat < 11 || lat > 33)
    {
        alert("La latitud debe estart entre 11 y 33 con un máximo de 10 decimales");
        document.getElementById("latitudOrdDEM").value = "";
    }
}

function funcionLongitud()
{
    var  lon = parseFloat(document.getElementById("longitudOrdDEM").value);
    
    if ( lon < -123 || lon > -83)
    {
        alert("La longitud debe estar entre -123 a -83 con un máximo de 10 decimales ");
        document.getElementById("longitudOrdDEM").value = "";
    }
}
function funcionLatitud2()
{
    var  lat = parseFloat(document.getElementById("latitudColDem").value);
    
    if ( lat < 11 || lat > 33)
    {
        alert("La latitud debe estart entre 11 y 33 con un máximo de 10 decimales");
        document.getElementById("latitudColDem").value = "";
    }
}

function funcionLongitud2()
{
    var  lon = parseFloat(document.getElementById("longitudColDem").value);
    
    if ( lon < -123 || lon > -83)
    {
        alert("La longitud debe estar entre -123 a -83 con un máximo de 10 decimales ");
        document.getElementById("longitudColDem").value = "";
    }
}

function funcionLatitud3()
{
    var  lat = parseFloat(document.getElementById("latitudHueDem").value);
    
    if ( lat < 11 || lat > 33)
    {
        alert("La latitud debe estart entre 11 y 33 con un máximo de 10 decimales");
        document.getElementById("latitudHueDem").value = "";
    }
}

function funcionLongitud3()
{
    var  lon = parseFloat(document.getElementById("longitudHueDem").value);
    
    if ( lon < -123 || lon > -83)
    {
        alert("La longitud debe estar entre -123 a -83 con un máximo de 10 decimales ");
        document.getElementById("longitudHueDem").value = "";
    }
}
function funcionLatitud4()
{
    var  lat = parseFloat(document.getElementById("latitudCneDEM").value);
    
    if ( lat < 11 || lat > 33)
    {
        alert("La latitud debe estart entre 11 y 33 con un máximo de 10 decimales");
        document.getElementById("latitudCneDEM").value = "";
    }
}

function funcionLongitud4()
{
    var  lon = parseFloat(document.getElementById("longitudCneDEM").value);
    
    if ( lon < -123 || lon > -83)
    {
        alert("La longitud debe estar entre -123 a -83 con un máximo de 10 decimales ");
        document.getElementById("longitudCneDEM").value = "";
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

function Obten_proc_exped2(claveOrgano, procedimiento, claveExpediente) {
    var claveOrg = document.getElementById(claveOrgano).value;
    var proc = document.getElementById(procedimiento).value;
    var claveExp = document.getElementById(claveExpediente).value;

    $.ajax({
        type: 'POST',
        url: 'ObtenIDdemandado',
        data: {
            claveOrg: claveOrg,
            proc: proc,
            claveExp: claveExp
        },
        success: function(response) {
    // Inserta solo la tabla dentro del fieldset sin borrar la leyenda
    document.getElementById("tablaDemandados").innerHTML = `
        <legend>Demandados Registrados</legend> 
        ${response}
    `;
},
        error: function (response) {
            console.log("Error: ", response);
        }
    });
}