<%-- 
    Document   : InterfazOrdinario
    Created on : 25 mar 2024, 16:19:58
    Author     : octavio.lozano
--%>

<%@page import="Combos.CargaCombosO"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page import="Combos.CargaCombosActores"%>
<%@page import="Combos.CargaCombosDemandado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIA DE TRAMITACIÓN</title>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Incluir el CSS de Select2 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/css/select2.min.css" rel="stylesheet" />

<!-- Incluir el JavaScript de Select2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/js/select2.min.js"></script>

<style>
/* Ocultar los select normales por defecto */
select {
    visibility: hidden;
}

/* Mostrar el select cuando se aplique Select2 */
.select2-container {
    visibility: visible;
}
</style>
  
        
        
        <link REL="stylesheet" href="css/estiloProcedimiento.css">
        <link REL="stylesheet" href="css/menu.css">
        <link REL="stylesheet" href="css/estiloOrganoJ.css">
        <link REL="stylesheet" href="css/pestanas.css">
        <link REL="stylesheet" href="css/notas.css">
  
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/ValidacionesProcedimientos.js" type="text/javascript"></script>
        <script src="js/ValidacionesActores.js" type="text/javascript"></script>
        <script src="js/ValidacionesDemandados.js" type="text/javascript"></script>
        <script src="js/ValidacionesAudiencias.js" type="text/javascript"></script>
        <script defer src="js/fecha.js"></script>
       

        
    
    
    </head>

    <%
        CargaCombosProcedimientos obj = new CargaCombosProcedimientos();
        CargaCombosO cco = new CargaCombosO();
        CargaCombosActores cca = new CargaCombosActores();
        CargaCombosDemandado ccd = new CargaCombosDemandado();
        

    %>
    <script>
$(document).ready(function() {
    // Aplica Select2 a todos los select y personaliza el mensaje "No results found"
    $('select').select2({
        language: {
            noResults: function() {
                return "No hay opciones que coincidan con tu búsqueda"; // Texto personalizado
            }
        },
        placeholder: "Selecciona una opción",
        allowClear: true
    });
    // Limpia la selección de cada select para que se muestren vacíos al inicio
    $('select').each(function() {
        $(this).val(null).trigger('change'); // Deja el select sin selección
    });
});
</script>
    <body>

        <header id="main-header1">
    <a id="logo-header" href="index.jsp"><img src="IMAGENES/LOGO RALAB blanco.png" height="110"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
    <nav> 
        <ul>
            <li><a href="index.jsp"><img src="IMAGENES/home.png" height="40"></a></li>
            <li><a href="index.jsp"><img src="IMAGENES/contacto.png" height="40">&nbsp;&nbsp; Contacto</a></li>
        </ul>
    </nav>
</header><!-- /#main-header -->

    <br>
    
  <div class="date-container">
        <p id="current-date"></p>
    </div>  

    <div style="margin-bottom: 30px;">
        <nav class="menu">
            <ul class="menu">
                <li class="menu-item" title="ÓRGANOS JURISDICCIONALES" >
                    <a href="tablaO.jsp"><img src="IMAGENES/banco.png" height="30">ÓRGANOS JURISDICCIONALES</a>
                    <div class="submenu">
                        <p>Agrega, edita, consulta o elimina los Órganos Jurisdiccionales almacenados en la base de datos.</p>
                    </div>
                </li>
                <li class="menu-item" title="EXPEDIENTES" style="background: darkcyan;">
                    <a href="tablaP.jsp"><img src="IMAGENES/expediente.png" height="30">EXPEDIENTES</a>
                </li>
                <li class="menu-item" title="EXPORTAR">
                    <a href="Exportar.jsp"><img src="IMAGENES/base_datos.png" height="30">BASE DE DATOS</a>
                    <div class="submenu">
                        <p>Descarga la información almacenada en la base de datos.</p>
                    </div>
                </li>
                <li class="menu-item" title="DASHBOARD">
                    <a href="Dashboard.jsp"><img src="IMAGENES/tendencia.png" height="30">ESTADÍSTICAS</a>
                    <div class="submenu">
                    <p>Gráficas e indicadores de interés.</p>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
    <br>

    <div id="tabBox" style="margin-top:200px;">

            <!------------------------------------------- PESTAÑA 1 ---------------------------------------->      
            <jsp:include page="Expediente_organo.jsp"></jsp:include>

            <!------------------------------------------- PESTAÑA 2 ----------------------------------------------------------------------------------------------------------------------------->                       
            <jsp:include page="Expediente_procedimientos.jsp"></jsp:include>                        

            <!-------------------------------------------- PESTAÑA 3 ----------------------------------------------------------------->                    
              <script>
    function enviarDatos() {
    var procedimiento = document.getElementById("procedimientosACT").value;
    var claveExpediente = document.getElementById("comboExpedientes").value;

    document.getElementById("hiddenProcedimiento").value = procedimiento;
    document.getElementById("hiddenClaveExpediente").value = claveExpediente;
}

</script>



         <div class="tabWrap">
                <input id="tab-03" name="tab" type="radio" />
                <label class="tab label-03" for="tab-03"><span>*</span>Actores</label>
              
                <article class="tabContent">
                    <h1>ACTORES</h1>
                    <form action="GuardaActor" method="post" id="principal">
                        <div name="datosActExp", id="datosActExp">
                        
                         <table cellspacing="3" cellpadding="3" border="0" >               
                           <tr>
                              <td><label for="listaOrganos">Órgano Jurisdiccional: </label></td>
                              <td><input type="text" name="nombreACT" id="nombreACT" style="width: 700PX" value="${sessionScope.nomOrg}" readonly required></td>
                           </tr>
                           <TR>
                              <td><label>Clave del organo jurisdiccional: </label></td>
                              <td><input type="text" id="claveOrgACT" name="claveOrgACT" value="${sessionScope.clveOrg}" readonly required ></td>
                          
                          </tr>
                          <tr>
                              <td> <label >Procedimiento</label></td>
                              <td> <select name="procedimientosACT" id="procedimientosACT" onchange = "funProcedimiento(); funProcedimiento2(); funProcedimiento3(); funProcedimiento4(); funProcedimiento5(); funMenuACT1();" required>                                        
                                <option value="Ordinario">Ordinario</option>
                                <option value="Especial individual">Especial individual</option>
                                <option value="Especial colectivo">Especial colectivo</option>
                                <option value="Huelga">Huelga</option>
                                <option value="Colectivo de naturaleza económica">Colectivo de naturaleza económica</option>                  
                                  </select></td>
                          </tr>
                          <tr>     
                               <td><label>Número / clave del expediente</label></td>
                               <td>
                                   <select id="comboExpedientes" name="comboExpedientes" onchange="Obten_proc_exped('claveOrgACT','procedimientosACT','comboExpedientes' )">
                                      
                                  </select>
                                </td>
                          </tr>  
                        </table>
                              
                              <br>
                    </div>
                              <div>

                                  <fieldset class="secuencial" style="line-break: loose" id="tablaActores">
                                      <legend>Actores Registrados</legend></fieldset>
                              </div>
 

                        <fieldset class="secuencial" style="line-break: loose">
                            <div name="dividAct" id="dividAct">
                            
                             <p>            
                               <label >ID_ Actor: </label>   
                               <input type="number" id="idActor"  name="idActor"  required min="1", step="1" onblur="funcionID('idActor')">
                            </p>
                            </div>
                            <p>
                            <div id="divActOrd" style="display: none">
                                 <p>
                               <label>Actor</label>                              
                               <select id="comboActor"  name="comboActor"   onchange="funTrabajador(); funSindicato(); funCantidadTrabajadores(); funTrabajador2(); funSindicato2()">                   
                                 <%
                                        List<String> actor1 = cca.listaActor();
                                        for(String a1: actor1){
                                    %>
                                    <option value="<%= a1%>"><%= a1%></option>
                                    <% } %>
                                </select>
                             
                                </p>       
                            </div>
                            
                            <div id="divActInd" style="display: none">
                                <p>
                                 <label>Actor</label>                              
                                 <select id="comboActor2" name="comboActor2"  onchange="funTrabajador(); funSindicato(); funCantidadTrabajadores(); funTrabajador2(); funSindicato2()">                       
                                 <%
                                        List<String> actor2 = cca.listaActor2();
                                        for(String a2: actor2){
                                    %>
                                    <option value="<%= a2%>"><%= a2%></option>
                                    <% } %>
                                </select> 
                                </p>    
                            </div>
                               
                            <div id="divActCol" style="display: none">
                                 <p>
                                 <label>Actor</label>                              
                                 <select id="comboActor3" name="comboActor3"  onchange="funCantidadTrabajadores2(); funSindicato2(); funPatron()">
                                  
                                  <%
                                        List<String> actor3 = cca.listaActor3();
                                        for(String a3: actor3){
                                    %>
                                    <option value="<%= a3%>"><%= a3%></option>
                                    <% } %>
                                </select> 
                                </p> 
                            </div>
                            
                            <div id="divActHue" style="display: none">
                                 <p>
                                 <label>Actor</label>                              
                                 <select id="comboActor4" name="comboActor4"  onchange="funSindicato3(); funTrabajadorHue()">
                                  
                                   <%
                                        List<String> actor4 = cca.listaActor4();
                                        for(String a4: actor4){
                                    %>
                                    <option value="<%= a4%>"><%= a4%></option>
                                    <% } %>
                                </select> 
                                </p> 
                            </div>
                            
                             <div id="divActColNatEco" style="display: none">
                                 <p>
                                 <label>Actor</label>                              
                                 <select id="comboActor5" name="comboActor5"  onchange="funSindicatoCNE(); funMayoriaTrabajadoresCNE();funPatronCNE();">
                                 
                                  <%
                                        List<String> actor5 = cca.listaActor5();
                                        for(String a5: actor5){
                                    %>
                                    <option value="<%= a5%>"><%= a5%></option>
                                    <% } %>
                                </select> 
                                </p> 
                            </div>
                            
                                <div id="defensaAct" name="defensaAct">                     
                            <p>
                             <label>Defensa</label>
                             <select id="defensa" name="defensa" style="width: 350px " required>  
                                
                                  <%
                                        List<String> defen = cca.listaDefensa();
                                        for(String def: defen){
                                    %>
                                    <option value="<%= def%>"><%= def%></option>
                                    <% } %>
                            </select>
                          </p>
                            </div>
                        </fieldset>
                                                        
                                     
                         <div id="divOrdinarioACT" style="display: none">
                            <fieldset class="secuencial" style="line-break: loose">
                                <legend>Registro de Actor</legend>
                                <div id="divTrabajadorORD" style="display: none">
                                     <P>
                                     <label>Sexo</label>
                                     <select id="sexoAct" name="sexoAct" >
                                        
                                        <%
                                        List<String> sexo = cca.listaSexo();
                                        for(String sex: sexo){
                                    %>
                                    <option value="<%= sex%>"><%= sex%></option>
                                    <% } %>
                                     </select>
                                     </p>
                                     <p>
                                      <label>Edad</label>
                                      <input type="number" id="edadAct" name="edadAct" min='0' max='99' step="1" onblur="funcionNegA('edadAct')">
                                   </p>
                                  <p>
                                <label>Ocupación</label>     
                          
                                <select id="ocupacion" name="ocupacion" >
                                    
                                    <%
                                        List<String> ocupaciones = cca.listaOcupaciones();
                                        for (String dato : ocupaciones) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>
                                   <p>
                                       <label>Numero de seguridad social (NSS)</label>
                                       <input type="text" id="nssTra" name="nssTra" oninput="validarYConvertirNSS(this)" onblur="noIdentificado(this)">
                                   </p>
                                   <p>
                                       <label>Clave única de registro de población (CURP)</label>
                                       <input type="text" id="curpTra" name="curpTra" oninput="validarYConvertirNSS(this)" onblur="noIdentificado(this)">
                                   </p>
                                   <p>
                                       <label>Registro federal de contribuyentes (RFC)</label>
                                       <input type="text" id="rfcTra" name="rfcTra" oninput="validarYConvertirNSS(this)" onblur="noIdentificado(this)">
                                   </p>
                                   <p>
                                       <label>Jornada</label>
                                       <select id="comboJornada" name="comboJornada">
                                           
                                              <%
                                        List<String> jorna = cca.listaJornada();
                                        for(String jor: jorna){
                                    %>
                                    <option value="<%= jor%>"><%= jor%></option>
                                    <% } %>
                                       </select>
                                   </p>
                                </div>
                                
                                <div id="divSindicatoACT" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input type="text" id="nombreSindicato" name="nombreSindicato" oninput="validarYMayusculas(this)">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input type="text" id="asociacionSindical" name="asociacionSindical" oninput="validarYMayusculas(this)">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicato" name="tipoSindicato" onchange="funTipoSindicato()">
                                            
                                           <%
                                        List<String> sindic = cca.listaSindicato();
                                        for(String sin: sindic){
                                    %>
                                    <option value="<%= sin%>"><%= sin%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicato" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSindicatoORD" name="espSindicatoORD" type="text" oninput="validarYMayusculas(this)">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObr" name="sindictaOrgObr" onchange="funOrgObr()">
                                            
                                           <%
                                        List<String> respSim = cca.respuestaSimple();
                                        for(String rsim: respSim){
                                    %>
                                    <option value="<%= rsim%>"><%= rsim%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObr" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObr" name="nombreOrgObr"onchange="funEspOrgObr()">
                                                
                                               <%
                                       List<String> organizacion = cca.listaOrgObr();
                                        for(String org: organizacion){
                                    %>
                                    <option value="<%= org%>"><%= org%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObr" style="display: none">
                                            <p>
                                               <label>Especifique (otra organización obrera)</label>
                                               <input type="text" id="espOrgObrORD" name="espOrgObrORD" oninput="validarYMayusculas(this)">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                                <div id="divCantidadTrabajadores" style="display: none">   
                                    <center>
                                         <p>
                                           <label>Hombres</label>
                                           <input type="number" id="hombresTra" name="hombresTra" min=0 step="1" oninput="sumarNumeros3()" onblur="funcionNegA('hombresTra')">
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input type="number" id="mujeresTra" name="mujeresTra" min=0 step="1" oninput="sumarNumeros3()" onblur="funcionNegA('mujeresTra')">
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input type="number" id="noInvalido" name="noInvalido" min=0 step="1" oninput="sumarNumeros3()" onblur="funcionNegA('noInvalido')">
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input type="number" id="totalTrabajadores" name="totalTrabajadores" readonly>
                                        </p>                               
                                </div>
                            </fieldset> 
                       </div>  <%-- fin de Act Ordinario ----------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                       
                       
                      
                       
                       <div id="divIndividualACT" style="display: none">
                            <fieldset class="secuencial" style="line-break: loose">
                                  <div id="divTrabajadorIND" style="display: none">
                                     <P>
                                     <label>Sexo</label>
                                     <select id="sexoActIND" name="sexoActIND">
                                        
                                     <%
                                     
                                        for(String sex: sexo){
                                    %>
                                    <option value="<%= sex%>"><%= sex%></option>
                                    <% } %>
                                     </select>
                                   </P>
                                   <p>
                                      <label>Edad</label>
                                      <input id= "edadActIND" name="edadActIND" type="number" >
                                   </p>
                                   <p>
                                <label>Ocupación</label>                
                                <select id="ocupacionActIND" name="ocupacionActIND" >
                                   
                                    <%
                                        List<String> ocupaciones2 = cca.listaOcupaciones();
                                        for (String dato : ocupaciones2) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>
                                   <p>
                                       <label>Numero de seguridad social (NSS)</label>
                                       <input id="nssActIND" name="nssActIND" type="text">
                                   </p>
                                   <p>
                                       <label>Clave única de registro de población (CURP)</label>
                                       <input id="curpActIND" name="curpActIND" type="text">
                                   </p>
                                   <p>
                                       <label>Registro federal de contribuyentes (RFC)</label>
                                       <input id="rfcActIND" name="rfcActIND" type="text">
                                   </p>
                                   <p>
                                       <label>Jornada</label>
                                       <select id="jornadaActIND" name="jornadaActIND">
                                           
                                            <%
                                    
                                        for(String jor: jorna){
                                    %>
                                    <option value="<%= jor%>"><%= jor%></option>
                                    <% } %>
                                       </select>
                                   </p>
                                </div>
                            </fieldset>            
                       </div> <%-- fin de Act Individual -------------------------------------------------------------------------------------------------------------------------------------------------------------------- --%>
                                  
                      <div id="divColectivoACT" style="display: none">
                            <fieldset class="secuencial" style="line-break: loose">
                                <div id="divSindicatoACT2" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input id="nombreSindicatoActCOL" name="nombreSindicatoActCOL"type="text">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input id="asociacionSindicalActCOL" name="asociacionSindicalActCOL"type="text">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicato2" name="tipoSindicato2" onchange="funTipoSindicato2()">
                                            
                                             <%
                                       
                                        for(String sin: sindic){
                                    %>
                                    <option value="<%= sin%>"><%= sin%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicato2" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSinCOL"name="espSinCOL" type="text">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObr2" name="sindictaOrgObr2" onchange="funOrgObr2(); funEspOrgObr2()">
                                           
                                              <%
                                        
                                        for(String rsim: respSim){
                                    %>
                                    <option value="<%= rsim%>"><%= rsim%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObr2" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObr2" name="nombreOrgObr2" onchange="funEspOrgObr2();">
                                               
                                                <%
                                      
                                        for(String org: organizacion){
                                    %>
                                    <option value="<%= org%>"><%= org%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObr2" style="display: none">
                                            <p>
                                               <label>Especifique (otra organización obrera)</label>
                                               <input id="espOrgCOL" name="espOrgCOL"type="text">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                                 <div id="divCantidadTrabajadores2" style="display: none">                         
                                         <p>
                                           <label>Hombres</label>
                                           <input id="hombresTra2" name="hombresTra2" type="number" onblur="sumarNumeros4()" >
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input id="mujeresTra2" name="mujeresTra2"type="number" onblur="sumarNumeros4()" >
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input id="noInvalido2" name="noInvalido2" type="number" onblur="sumarNumeros4()" >
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input id="totalTrabajadores2" name="totalTrabajadores2" type="number" readonly>
                                        </p>                               
                                </div>
                                
                                <div id="divPatronCOL" style="display: none">
                                    <p>
                                        <label>Tipo</label>
                                        <select id="comboTipo" name="comboTipo" onchange="funTipo()">
                                           
                                            <%
                                        List<String> patron = cca.tipoPatron();
                                        for(String pat: patron){
                                    %>
                                    <option value="<%= pat%>"><%= pat%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <p>
                                        <label>Registro federal de contribuyentes (RFC)</label>
                                        <input type="text" id="rfcCOL" name="rfcCOL">
                                    </p>
                                    <div id="divMoralCOL" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialCOL" name="razonSocialCOL">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input id="calleCOL" name="calleCOL"type="text">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input id="NExteriorCOL" name="NExteriorCOL" type="text">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input id="NInteriorCOL" name="NInteriorCOL" type="text">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input id="coloniaCOL" name="coloniaCOL" type="text">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input id="cpCOL" name="cpCOL" type="text">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadCOLact" name="entidadCOLact" style="width: 950px" onchange="entiMunicipio('entidadCOLact', 'municipioCOLact');">
                                              
                                              <%
                                                List<String> entidad3 = cco.consultaEntidad();
                                                for (String dato : entidad3) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioCOLact" name="municipioCOLact" style="width: 950px" >
                                              
                                             </select>
                                            </p>  
                        <p>
                        <label for="latitud">Latitud2 </label>
                        <input type="text" id="latitudActCOL" name="latitudActCOL" onchange="funcionLatitudACT()" >
                        </p>
                        <p>
                        <label for="longitud">Longitud </label>
                        <input type="text" id="longitudActCOL" name="longitudActCOL" onchange="funcionLongitudACT()" >
                        </p>            
                                    </div>
                                      
                                </div>
                            </fieldset>            
                      </div> <%-- fin de Act Colectivo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --%>   
                              
                      <div id="divHuelgaACT" style="display: none">
                           <fieldset class="secuencial" style="line-break: loose">
                               <div id="divSindicatoHue" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input id="nombreSindicatoActHUE" name="nombreSindicatoActHUE" type="text">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input id="asociacionSindicalActHUE" name="asociacionSindicalActHUE" type="text">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicato3" name="tipoSindicato3" onchange="funTipoSindicato3()">
                                            
                                           <%
                                       
                                        for(String sin: sindic){
                                    %>
                                    <option value="<%= sin%>"><%= sin%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicato3" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSinHUE" name="espSinHUE" type="text">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObrHue" name="sindictaOrgObrHue" onchange="funOrgObrHUE()">
                                            
                                            <%
                                      
                                        for(String rsim: respSim){
                                    %>
                                    <option value="<%= rsim%>"><%= rsim%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObrHUE" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObrHue" name="nombreOrgObrHue"onchange="funEspOrgObr2HUE()">
                                                
                                               <%
                                      
                                        for(String org: organizacion){
                                    %>
                                    <option value="<%= org%>"><%= org%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObrHUE" style="display: none">
                                            <p>
                                               <label>Especifique (otra organización obrera)</label>
                                               <input id="espOrgHUE" name="espOrgHUE" type="text">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                                <div id="divCantidadTrabajadoresHue" style="display: none">                         
                                         <p>
                                           <label>Hombres</label>
                                           <input id="hombresTra3" name="hombresTra3" type="number" onblur="sumarNumeros3()">
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input id="mujeresTra3" name="mujeresTra3" type="number" onblur="sumarNumeros3()">
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input id="noInvalido3" name="noInvalido3" type="number" onblur="sumarNumeros3()">
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input id="totalTrabajadores3" name="totalTrabajadores3" type="number" readonly>
                                        </p>                               
                                </div>
                                
                           </fieldset>             
                      </div> <%-- fin de Huelga ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --%>
                        
                     <div id="divColNatEcoACT" style="display: none">
                          <fieldset class="secuencial" style="line-break: loose">
                              <div id="divSindicatoCNE" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input id="nombreSindicatoActCNE" name="nombreSindicatoActCNE" type="text">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input id="asociacionSindicalActCNE" name="asociacionSindicalActCNE"type="text">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicatoCNE" name="tipoSindicatoCNE" onchange="funTipoSindicatoCNE()">
                                           
                                             <%
                                       
                                        for(String sin: sindic){
                                    %>
                                    <option value="<%= sin%>"><%= sin%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicatoCNE" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSindCNE" name="espSindCNE" type="text">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObrCNE" name="sindictaOrgObrCNE" onchange="funOrgObrCNE()">
                                           
                                           <%
                                      
                                        for(String rsim: respSim){
                                    %>
                                    <option value="<%= rsim%>"><%= rsim%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObrCNE" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObrCNE" name="nombreOrgObrCNE"onchange="funEspOrgObrCNE()">
                                               
                                              <%
                                      
                                        for(String org: organizacion){
                                    %>
                                    <option value="<%= org%>"><%= org%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObrCNE" style="display: none">
                                            <p>
                                               <label>Especifique (otra organización obrera)</label>
                                               <input id="espOrgCNE" name="espOrgCNE" type="text">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                               <div id="divMayoriaTrabajadoresCNE" style="display: none">                         
                                         <p>
                                           <label>Hombres</label>
                                           <input id="hombresCNE" name="hombresCNE" type="number" onblur="sumarNumeros4()">
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input id="mujeresCNE" name="mujeresCNE"type="number" onblur="sumarNumeros4()">
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input id="identificadosCNE" name="identificadosCNE" type="number" onblur="sumarNumeros4()">
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input id="totalCNE" name="totalCNE" type="number" readonly>
                                        </p>                               
                                </div>
                               <div id="divPatronCNE" style="display: none">
                                    <p>
                                        <label>Tipo</label>
                                        <select id="comboTipoCNE" name="comboTipoCNE" onchange="funMoralCNE()">
                                            
                                           <%                                   
                                        for(String pat: patron){
                                    %>
                                    <option value="<%= pat%>"><%= pat%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <p>
                                        <label>Registro federal de contribuyentes (RFC)</label>
                                        <input type="text" id="rfcCNE" name="rfcCNE">
                                    </p>
                                    <div id="divMoralCNE" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialCNE" name="razonSocialCNE">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input type="text" id="calleCNE" name="calleCNE">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input type="text" ID="NExteriorCNE" name="NExteriorCNE">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input type="text" id="NInteriorCNE" name="NInteriorCNE">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input type="text" id="coloniaCNE" name="coloniaCNE">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input type="text" id="cpCNE" name="cpCNE">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadCNEact" name="entidadCNEact" style="width: 950px" onchange="entiMunicipio('entidadCNEact', 'municipioCNEact');">
                                             
                                              <%
                                                List<String> entidad4 = cco.consultaEntidad();
                                                for (String dato : entidad3) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioCNEact" name="municipioCNEact" style="width: 950px" >
                                             
                                             </select>
                                            </p>
                    
                        <p>
                        <label for="latitud">Latitud </label>
                        <input type="text" id="latitudACTcne" name="latitudACTcne"  onchange="funcionLatitud2ACT()">
                        </p>
                        <p>
                        <label for="longitud">Longitud </label>
                        <input type="text" id="longitudACTcne" name="longitudACTcne" onchange="funcionLongitud2ACT()" >
                        </p>            
                        </div>                                     
                      </div>
                               
                              
                          </fieldset>             
                      </div> <%-- fin de Colectivp de Naturaleza Ecómico ------------------------------------------------------------------------------------------------------------------------------- --%>            
                                  
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                                <label>Comentarios</label>
                                <input type="text" id="comentariosACT" name="comentariosACT" style="width: 950px">
                            </p>
                         </fieldset>   
                         <center>
                             <input type="submit" value="Guardar" id="guardaPro" >
                             <input type="button" value="Limpiar" onclick="restablecerDivsOcultosA()">
                         </center>
                    </form>                     
                </article>       
            </div><%-- fin de ACTORES --%>
           <!--###########################################################################
        #############################################################################
        #############################################################################
        --!>
            <!-- ----------------------------------------- PESTAÑA 4 ------------------------------------------------------------------>    
            
            <div class="tabWrap">
                <input id="tab-04" name="tab" type="radio" />
                <label class="tab label-03" for="tab-04"><span>*</span>Demandados</label>
                <!-- tabContent 02 -->
                <article class="tabContent">
                    <h1>Demandados</h1>
                    <form action="GuardaDemandado" method="post">
                        <div name="datosExpDem" id="datosExpDem"
                      <table cellspacing="3" cellpadding="3" border="0" >               
                           <tr>
                              <td><label for="listaOrganos">Órgano Jurisdiccional: </label></td>
                              <td><input type="text" name="nombreDEM" id="nombreDEM" style="width: 700PX" value="${sessionScope.nomOrg}" readonly required></td>
                           </tr>
                           <TR>
                              <td><label>Clave del órgano jurisdiccional: </label></td>
                              <td><input type="text" id="claveOrgDEM" name="claveOrgDEM" value="${sessionScope.clveOrg}" readonly required></td>
                          
                          </tr>
                          <tr>
                              <td> <label >Procedimiento</label></td>
                              <td> <select name="procedimientosDEM" id="procedimientosDEM" onchange = "funProcDem();funOrdDEM();funProcDem2(); funColDEM();funProcDem3();funHueDem();funProcDem4();funCneDEM();">                                        
                                <option value="Ordinario">Ordinario</option>
                                <option value="Especial individual">Especial individual</option>
                                <option value="Especial colectivo">Especial colectivo</option>
                                <option value="Huelga">Huelga</option>
                                <option value="Colectivo de naturaleza económica">Colectivo de naturaleza económica</option>                  
                                  </select></td>
                          </tr>
                          <tr>     
                               <td><label>Número / clave del expediente</label></td>
                               <td>
                                  <select id="comboExpedientes2" name="comboExpedientes2" onchange="Obten_proc_exped2('claveOrgDEM','procedimientosDEM','comboExpedientes2' )">
                                     
                                      
                                  </select>
                                </td>
                          </tr>  
                        </table>
                    </div>
                              
                              <br>
                              <div>

                                  <fieldset class="secuencial" style="line-break: loose" id="tablaDemandados">
                                      <legend>Demandados Registrados</legend></fieldset>
                              </div>
                    
                      <fieldset class="secuencial" style="line-break: loose">
                          <div name="dividDem" id=""dividAct>
                           <p>            
                               <label >ID_Demandado </label>   
                               <input type="number" id="idDem"  name="idDem" min="1" required>
                            </p>
                            </div>
                            <div id="divDemOrdInd" style="display: none">
                                 <p>
                               <label>Demandado</label>                              
                               <select id="comboDemandado" name="comboDemandado"  onchange="funPatronOrdDEM();">
                                                      
                                  <%
                                        List<String> demanda = ccd.listaDemandado12();
                                        for (String dema : demanda) {
                                    %>
                                    <option value="<%= dema%>"><%= dema%></option>
                                    <% } %>
                                </select>                              
                                </p>       
                            </div>
                            
                            <div id="divDemCol" style="display: none">
                                 <p>
                                 <label>Demandado</label>                              
                                 <select id="comboDemandado2" name="comboDemandado2"  onchange="funSindColDEM(); funPatronColDEM();">
                                  
                                    <%
                                        List<String> demanda3 = ccd.listaDemandado3();
                                        for (String dema : demanda3) {
                                    %>
                                    <option value="<%= dema%>"><%= dema%></option>
                                    <% } %>
                                </select> 
                                </p> 
                            </div>
                            
                            <div id="divDemHue" style="display: none">
                                 <p>
                                 <label>Demandado</label>                              
                                 <select id="comboDemandado3" name="comboDemandado3"  onchange="funPatronHueDem();">
                                  
                                 <%
                                        List<String> demanda4 = ccd.listaDemandado4();
                                        for (String dema : demanda4) {
                                    %>
                                    <option value="<%= dema%>"><%= dema%></option>
                                    <% } %>                             
                                </select> 
                                </p> 
                            </div>
                            
                             <div id="divDemColNatEco" style="display: none">
                                 <p>
                                 <label>Demandado</label>                              
                                 <select id="comboDemandado4" name="comboDemandado4"  onchange="funSindCneDEM(); funPatronCneDEM();">
                                 
                                 <%
                                        List<String> demanda5 = ccd.listaDemandado5();
                                        for (String dema : demanda5) {
                                    %>
                                    <option value="<%= dema%>"><%= dema%></option>
                                    <% } %>
                                </select> 
                                </p> 
                            </div>
                                           
                           
                            <p>
                             <label>Defensa</label>
                             <select id="defensa_DEM" name="defensa_DEM" style="width: 350px ">  
                               
                               <%
                                        List<String> defDem = ccd.listaDefensa();
                                        for (String df : defDem) {
                                    %>
                                    <option value="<%= df%>"><%= df%></option>
                                    <% } %>
                            </select>
                          </p>

                        </fieldset>    
                      
                              <div id="divOrdinarioIndividual" style="display: none">
                                <fieldset class="secuencial" style="line-break: loose">                                 
                                    <div id="divPatronOrdIndDEM" style="display: none">
                                        <p>
                                        <label>Tipo</label>
                                        <select id="comboTipoDemORD" name="comboTipoDemORD" onchange="funMoralOrdDEM()">
                                          
                                             <%
                                        List<String> patro = ccd.tipoPatron();
                                        for (String pt : patro) {
                                    %>
                                    <option value="<%= pt%>"><%= pt%></option>
                                    <% } %>
                                        </select>
                                        </p>
                                        <p>
                                           <label>Registro federal de contribuyentes (RFC)</label>
                                           <input type="text" id="rfcOrdDEM" name="rfcOrdDEM">
                                        </p>
                                        <div id="divMoralOrdDEM" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialOrdDEM" name="razonSocialOrdDEM">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input type="text" id="calleOrdDEM" name="calleOrdDEM">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input type="text" ID="NExteriorOrdDEM" name="NExteriorOrdDEM">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input type="text" id="NInteriorOrdDEM" name="NInteriorOrdDEM">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input type="text" id="coloniaOrdDEM" name="coloniaOrdDEM">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input type="text" id="cpOrdDEM" name="cpOrdDEM">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadOrdDEM" name="entidadOrdDEM" style="width: 950px" onchange="entiMunicipio('entidadOrdDEM', 'municipioOrdDEM');">
                                              
                                              <%
                                                List<String> entidadORD = cco.consultaEntidad();
                                                for (String dato : entidadORD) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioOrdDEM" name="municipioOrdDEM" style="width: 950px" >
                                              
                                             </select>
                                            </p>
                    
                                            <p>
                                                <label for="latitud">Latitud </label>
                                                <input type="text" id="latitudOrdDEM" name="latitudOrdDEM"  onchange="funcionLatitud()">
                                            </p>
                                            <p>
                                                <label for="longitud">Longitud </label>
                                                <input type="text" id="longitudOrdDEM" name="longitudOrdDEM" onchange="funcionLongitud()" >
                                            </p>            
                                       </div>                                     
                                     </div>                              
                                </fieldset>
                            </div> 
                             
                            <div id="divColDEM" style="display: none">
                                 <fieldset class="secuencial" style="line-break: loose">
                                   <div id="divSindicatoColDEM" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input id="nombreSindicatoColDEM" name="nombreSindicatoColDEM" type="text">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input id="asociacionSindicalColDEM" name="asociacionSindicalColDEM"type="text">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicatoColDEM" name="tipoSindicatoColDEM" onchange="funTipoSindicatoCOL()">
                                            
                                           <%
                                        List<String> sindicatoDEM = ccd.listaSindicato();
                                        for (String snDEM: sindicatoDEM) {
                                    %>
                                    <option value="<%= snDEM%>"><%= snDEM%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicatoColDEM" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSindColDEM" name="espSindColDEM" type="text">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObrColDEM" name="sindictaOrgObrColDEM" onchange="funOrgObrColDEM()">
                                           
                                         <%
                                        List<String> rsdem = ccd.respuestaSimple();
                                        for (String rs2 : rsdem) {
                                    %>
                                    <option value="<%= rs2%>"><%= rs2%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObrColDEM" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObrColDEM" name="nombreOrgObrColDEM"onchange="funEspOrgObrColDEM()">
                                                <option>--- Seleccione un nombre ---</option>
                                               <%
                                        List<String> orgObr = ccd.listaOrgObr();
                                        for (String ob: orgObr) {
                                    %>
                                    <option value="<%= ob%>"><%= ob%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObrColDEM" style="display: none">
                                            <p>
                                              
                                               <input id="espOrgColDEM" name="espOrgColDEM" type="text">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                               <div id="divCoalicionTrabajadoresColDEM" style="display: none">                         
                                         <p>
                                           <label>Hombres</label>
                                           <input id="hombresColDEM" name="hombresColDEM" type="number" onblur="sumarNumeros()">
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input id="mujeresColDEM" name="mujeresColDEM"type="number" onblur="sumarNumeros()">
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input id="identificadosColDEM" name="identificadosColDEM" type="number" onblur="sumarNumeros()">
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input id="totalColDEM" name="totalColDEM" type="number" readonly>
                                        </p>                               
                                </div>  
                                      <div id="divPatronColDEM" style="display: none">
                                        <p>
                                        <label>Tipo</label>
                                        <select id="comboTipoDemCOL" name="comboTipoDemCOL" onchange="funMoralColDEM()">
                                            
                                            <%
                                     
                                        for (String pt : patro) {
                                    %>
                                    <option value="<%= pt%>"><%= pt%></option>
                                    <% } %>
                                        </select>
                                        </p>
                                        <p>
                                           <label>Registro federal de contribuyentes (RFC)</label>
                                           <input type="text" id="rfcColDem" name="rfcColDem">
                                        </p>
                                        <div id="divMoralColDem" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialColDem" name="razonSocialColDem">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input type="text" id="calleColDem" name="calleColDem">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input type="text" ID="NExteriorColDem" name="NExteriorColDem">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input type="text" id="NInteriorColDem" name="NInteriorColDem">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input type="text" id="coloniaColDem" name="coloniaColDem">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input type="text" id="cpColDem" name="cpColDem">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadColDem" name="entidadColDem" style="width: 950px" onchange="entiMunicipio('entidadColDem', 'municipioColDem');">
                                              
                                              <%
                                                List<String> entidadCOL = cco.consultaEntidad();
                                                for (String dato : entidadCOL) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioColDem" name="municipioColDem" style="width: 950px" >
                                              
                                             </select>
                                            </p>
                    
                                            <p>
                                                <label for="latitud">Latitud </label>
                                                <input type="text" id="latitudColDem" name="latitudColDem"  onchange="funcionLatitud2()">
                                            </p>
                                            <p>
                                                <label for="longitud">Longitud </label>
                                                <input type="text" id="longitudColDem" name="longitudColDem" onchange="funcionLongitud2()" >
                                            </p>            
                                       </div>                                     
                                     </div>
                              </fieldset>
                            </div> -
                                           
                              <div id="divHuelgaDEM" style="display: none">
                                <fieldset class="secuencial" style="line-break: loose">
                                    <div id="divPatronHuelgaDEM" style="display: none">
                                        <p>
                                        <label>Tipo</label>
                                        <select id="comboTipoDemHUE" name="comboTipoDemHUE" onchange="funMoralHueDEM()()">
                                           
                                             <%
                                     
                                        for (String pt : patro) {
                                    %>
                                    <option value="<%= pt%>"><%= pt%></option>
                                    <% } %>
                                        </select>
                                        </p>
                                        <p>
                                           <label>Registro federal de contribuyentes (RFC)</label>
                                           <input type="text" id="rfcHueDem" name="rfcHueDem">
                                        </p>
                                        <div id="divMoralHueDem" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialHueDem" name="razonSocialHueDem">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input type="text" id="calleHueDem" name="calleHueDem">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input type="text" ID="NExteriorHueDem" name="NExteriorHueDem">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input type="text" id="NInteriorHueDem" name="NInteriorHueDem">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input type="text" id="coloniaHueDem" name="coloniaHueDem">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input type="text" id="cpHueDem" name="cpHueDem">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadHueDem" name="entidadHueDem" style="width: 950px" onchange="entiMunicipio('entidadHueDem', 'municipioHueDem');">
                                              
                                              <%
                                                List<String> entidadHUE = cco.consultaEntidad();
                                                for (String dato : entidadHUE) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioHueDem" name="municipioHueDem" style="width: 950px" >
                                              
                                             </select>
                                            </p>
                    
                                            <p>
                                                <label for="latitud">Latitud </label>
                                                <input type="text" id="latitudHueDem" name="latitudHueDem"  onchange="funcionLatitud3()">
                                            </p>
                                            <p>
                                                <label for="longitud">Longitud </label>
                                                <input type="text" id="longitudHueDem" name="longitudHueDem" onchange="funcionLongitud3()" >
                                            </p>            
                                       </div>                                     
                                     </div>
                                </fieldset>                                                  
                            </div>
                                           
                           <div id="divCneDEM" style="display: none">
                                 <fieldset class="secuencial" style="line-break: loose">
                                   <div id="divSindicatoCneDEM" style="display: none">
                                    <P>
                                        <label>Nombre del sindicato</label>
                                        <input id="nombreSindicatoCneDEM" name="nombreSindicatoCneDEM" type="text">
                                    </P>
                                    <p>
                                        <label>Registro de asociación sindical</label>
                                        <input id="asociacionSindicalCneDEM" name="asociacionSindicalCneDEM"type="text">
                                    </p>
                                    <p>
                                        <label>Tipo de sindicato</label>
                                        <select id="tipoSindicatoCneDEM" name="tipoSindicatoCneDEM" onchange="funTipoSindicatoCNE()">
                                            
                                           <%
                                      
                                        for (String snDEM: sindicatoDEM) {
                                    %>
                                    <option value="<%= snDEM%>"><%= snDEM%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divEspSindicatoCneDEM" style="display: none">
                                        <p>
                                            <label>Especifique (otro tipo de sindicato)</label>
                                            <input id="espSindCneDEM" name="espSindCneDEM" type="text">
                                        </p>
                                    </div>
                                    <p>
                                        <label>¿El sindicato pertenece a alguna organización obrera?</label>
                                        <select id="sindictaOrgObrCneDEM" name="sindictaOrgObrCneDEM" onchange="funOrgObrCneDEM()">
                                            
                                            <%                                    
                                        for (String rs2 : rsdem) {
                                    %>
                                    <option value="<%= rs2%>"><%= rs2%></option>
                                    <% } %>
                                        </select>
                                    </p>
                                    <div id="divOrgObrCneDEM" style="display: none">
                                        <p>
                                            <label>Nombre de la organización obrera</label>
                                            <select id="nombreOrgObrCneDEM" name="nombreOrgObrCneDEM"onchange="funEspOrgObrCneDEM()">
                                                
                                              <%                                     
                                                   for (String ob: orgObr) {
                                             %>
                                    <option value="<%= ob%>"><%= ob%></option>
                                    <% } %>
                                            </select>
                                        </p>
                                        <div id="divEspOrgObrCneDEM" style="display: none">
                                            <p>
                                               <label>Especifique (otra organización obrera)</label>
                                               <input id="espOrgCneDEM" name="espOrgCneDEM" type="text">
                                            </p>
                                        </div>
                                    </div>                                                           
                                </div>
                               <div id="divCoalicionTrabajadoresCneDEM" style="display: none">                         
                                         <p>
                                           <label>Hombres</label>
                                           <input id="hombresCneDEM" name="hombresCneDEM" type="number" onblur="sumarNumeros2()">
                                        </p>
                                        <p>
                                           <label>Mujeres</label>
                                           <input id="mujeresCneDEM" name="mujeresCneDEM"type="number" onblur="sumarNumeros2()">
                                        </p>
                                        <p>
                                           <label>No identificado</label>
                                           <input id="identificadosCneDEM" name="identificadosCneDEM" type="number" onblur="sumarNumeros2()">
                                        </p>
                                        <p>
                                           <label>Cantidad de trabajadores involucrados</label>
                                           <input id="totalCneDEM" name="totalCneDEM" type="number" readonly>
                                        </p>                               
                                </div>  
                                      <div id="divPatronCneDEM" style="display: none">
                                        <p>
                                        <label>Tipo</label>
                                        <select id="comboTipoDemCNE" name="comboTipoDemCNE" onchange="funMoralCneDEM()">
                                            
                                            <%                                     
                                        for (String pt : patro) {
                                    %>
                                    <option value="<%= pt%>"><%= pt%></option>
                                    <% } %>
                                        </select>
                                        </p>
                                        <p>
                                           <label>Registro federal de contribuyentes (RFC)</label>
                                           <input type="text" id="rfcCneDEM" name="rfcCneDEM">
                                        </p>
                                        <div id="divMoralCneDEM" style="display: none">
                                        <p>
                                           <label>Denominación o razón social de la empresa o establecimiento</label>
                                           <input type="text" id="razonSocialCneDEM" name="razonSocialCneDEM">
                                        </p>
                                        <p>
                                            <label>Calle</label>
                                            <input type="text" id="calleCneDEM" name="calleCneDEM">
                                        </p>
                                        <p>
                                            <label>N. Exterior</label>
                                            <input type="text" ID="NExteriorCneDEM" name="NExteriorCneDEM">
                                        </p>
                                        <p>
                                            <label>N. Interior</label>
                                            <input type="text" id="NInteriorCneDEM" name="NInteriorCneDEM">
                                        </p>
                                        <p>
                                            <label>Colonia</label>
                                            <input type="text" id="coloniaCneDEM" name="coloniaCneDEM">
                                        </p>
                                        <p>
                                            <label>Código postal</label>
                                            <input type="text" id="cpCneDEM" name="cpCneDEM">
                                        </p>
                                       
                                         <p>
                                           <label>Entidad donde se sucitó el conflicto </label>     
                                           <select id="entidadCneDEM" name="entidadCneDEM" style="width: 950px" onchange="entiMunicipio('entidadCneDEM', 'municipioCneDEM');">
                                              
                                              <%
                                                List<String> entidadCNE = cco.consultaEntidad();
                                                for (String dato : entidadCNE) {
                                             %>
                                              <option value="<%= dato%>"><%= dato%></option>
                                              <% } %>
                                           </select>
                                           </p>
                        
                                            <p>
                                              <label >Municipio donde se sucitó el conflicto</label> 
                                            <select id="municipioCneDEM" name="municipioCneDEM" style="width: 950px" >
                                              
                                             </select>
                                            </p>
                    
                                            <p>
                                                <label for="latitud">Latitud </label>
                                                <input type="text" id="latitudCneDEM" name="latitudCneDEM"  onchange="funcionLatitud4()">
                                            </p>
                                            <p>
                                                <label for="longitud">Longitud </label>
                                                <input type="text" id="longitudCneDEM" name="longitudCneDEM" onchange="funcionLongitud4()" >
                                            </p>            
                                       </div>                                     
                                     </div>
                              </fieldset>
                            </div>        
                            <fieldset class="secuencial" style="line-break: loose">
                            <p>
                                <label>Comentarios</label>
                                <input type="text" id="comentariosDEM" name="comentariosDEM" style="width: 950px">
                            </p>
                         </fieldset>   
                         <center>
                             <input type="submit" value="Guardar" id="guardaPro" >
                             <input type="reset" value="Limpiar" >
                         </center>          
                </form>    
                </article>
            </div>
        <!--###########################################################################
        #############################################################################
        #############################################################################
        --!>
            <!-- ---------------------------------------------PESTAÑA 5 --------------------------------------------------------------- -->
            
            <div class="tabWrap">
                <input id="tab-05" name="tab" type="radio" />
                <label class="tab label-05" for="tab-05"><span>*</span>Audiencias</label>
                <!-- tabContent 02 -->
                <article class="tabContent">
                    <h1>AUDIENCIAS</h1>
                    <form action="GuardaAudiencia" method="post">
                        <table cellspacing="3" cellpadding="3" border="0" >               
                           <tr>
                              <td><label for="listaOrganos">Órgano Jurisdiccional: </label></td>
                              <td><input type="text" name="nombreAUD" id="nombreAUD" style="width: 700PX" value="${sessionScope.nomOrg}" readonly required></td>
                           </tr>
                           <TR>
                              <td><label>Clave del organo jurisdiccional: </label></td>
                              <td><input type="text" id="claveOrgAUD" name="claveOrgAUD" value="${sessionScope.clveOrg}" readonly required></td>
                          
                          </tr>
                          <tr>
                              <td> <label >Tipo de procedimiento</label></td>
                              <td> <select name="procedimientosAUD" id="procedimientosAUD" onchange = "funTipoAudiencias()">                                        
                                <option value="">---Seleccione un procedimiento---</option>
                                <option value="Ordinario">Ordinario</option>
                                <option value="Especial individual">Especial individual</option>
                                <option value="Especial colectivo">Especial colectivo</option>
                                <option value="Huelga">Huelga</option>
                                <option value="Colectivo de naturaleza económica">Colectivo de naturaleza económica</option>                  
                                  </select></td>
                          </tr>
                          <tr>     
                               <td><label>Número / clave del expediente</label></td>
                               <td>
                                  <select id="comboExpedientes3" name="comboExpedientes3" onchange="Obten_proc_exped3('claveOrgAUD','procedimientosAUD','comboExpedientes3' )">
                                      <option>--- Seleccione un expediente ---</option>
                                      
                                  </select>
                                </td>
                          </tr>  
                        </table>
                              
                              <br>
                              <div>
                                  <fieldset class="secuencial" style="line-break: loose" id="tablaAudiencia">
                                      <legend>Audiencias Registradas</legend></fieldset>
                              </div>
                        <fieldset class="secuencial" style="line-break: loose">   
                            
                            <p>
                            <label>ID_Audiencia</label>
                            <input type="number" id="idAudiencia" name="idAudiencia" min="1">
                            </p>
                            <div id="divOrdIndAUD" style="display: none">
                            <P>
                            <label>Tipo de audiencia</label>
                            <select id="listaOrdInd" name="listaOrdInd" onchange="funEspAudiencias()">
                                <option>---Seleccione una audiencia---</option>
                                 <%
                                        List<String> aud1 = ccd.listaAudiencia12();
                                        for (String a1: aud1) {
                                    %>
                                    <option value="<%= a1%>"><%= a1%></option>
                                    <% } %>
                            </select>
                            </p>
                        </div>
                        <div id="divColAUD" style="display: none">
                            <P>
                            <label>Tipo de audiencia</label>
                            <select id="listaCol" name="listaCol" onchange="funEspAudiencias2()">
                                <option>---Seleccione una audiencia---</option>                              
                              <%
                                        List<String> aud3 = ccd.listaAudiencia3();
                                        for (String a3: aud3) {
                                    %>
                                    <option value="<%= a3%>"><%= a3%></option>
                                    <% } %>
                            </select>
                            </p>
                        </div>
                         <div id="divHueAUD" style="display: none">
                            <P>
                            <label>Tipo de audiencia</label>
                            <select id="listaHuelga" name="listaHuelga" onchange="funEspAudiencias3()">
                                <option>---Seleccione una audiencia---</option>
                              <%
                                        List<String> aud4 = ccd.listaAudiencia4();
                                        for (String a4: aud4) {
                                    %>
                                    <option value="<%= a4%>"><%= a4%></option>
                                    <% } %>
                            </select>
                            </p>
                        </div>
                        <div id="divCneAUD" style="display: none">
                            <P>
                            <label>Tipo de audiencia</label>
                            <select id="listaCne" name="listaCne" onchange="funEspAudiencias4()">
                                <option>---Seleccione una audiencia---</option>                              
                              <%
                                        List<String> aud5 = ccd.listaAudiencia5();
                                        for (String a5: aud5) {
                                    %>
                                    <option value="<%= a5%>"><%= a5%></option>
                                    <% } %>                               
                            </select>
                            </p>
                        </div>
                        <div id="otraAud" style="display: none">
                            <p>
                            <label>Especifique (Otro tipo de audiencia)</label>    
                            <input type="text" id="espOtraAud" name="espOtraAud">
                            </p>
                        </div>                               
                            <p>
                                <label>Fecha de celebración</label>    
                                <input type="date" id="fechaCelebAud" name="fechaCelebAud">
                            </p>
                            <br>
                            <P>
                                <label>Duración de la audiencia: </label>
                            </P>
                            <p>
                                <label>Hora de inicio</label>
                                <input type="time" id="hInicio" name="hInicio">
                                <label>Hora de conclusión</label>
                                <input type="time" id="hConclusion" name="hConclusion">
                            </p>
                        </fieldset>
                        
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                                <label>Comentarios</label>
                                <input type="text" id="comentariosAUD" name="comentariosAUD" style="width: 950px">
                            </p>
                         </fieldset>   
                         <center>
                             <input type="submit" value="Guardar" id="guardaPro" >
                             <input type="reset" value="Limpiar">
                         </center>   
                    </form>
                </article>
            </div>
            
        </div>
           
        <script>
        function nextTab(tabNumber) {
            document.getElementById('tab-0' + tabNumber).checked = true;
        }
        const combo = document.getElementById('procedimientosACT');
    const campoTexto = document.getElementById('aux');

    combo.addEventListener('change', function() {
      const valorSeleccionado = combo.value;
      campoTexto.value = valorSeleccionado;
      campoTexto.style.display="block";
    });
    </script>
    </body>
    


 
</html>
