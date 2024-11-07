
<%@page import="Combos.CargaCombosO"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CargaCombosProcedimientos obj = new CargaCombosProcedimientos();
    CargaCombosO cco = new CargaCombosO();
%>
       <!-- Incluir el CSS de Select2 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/css/select2.min.css" rel="stylesheet" />
<!-- Incluir el JavaScript de Select2 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-rc.0/js/select2.min.js"></script>


<link REL="stylesheet" href="css/notas.css">
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
  


 

 
<div class="tabWrap">
    <input id="tab-02" name="tab" type="radio" />
    <label class="tab label-02" for="tab-02"><span>*</span>Vía de tramitación</label>
    <!-- tabContent 02 -->
    <article class="tabContent">
        <h1>VÍA DE TRAMITACIÓN</h1>
     
        <!--form principal-->
        <form action="GuardaProcedimiento" method="post" id="principal" >
            <center>
                <label >Procedimiento a registrar</label>
                <select name="procedimientos" id="procedimientos" onchange = "mostrarProcedimientos(); habilitarTER(); habilitar2TER(); restablecerDivsOcultos();" required>
                    <option value="">---Seleccione un procedimiento---</option>
                    <%
                                        List<String> pro=obj.listaProcedimientos();
                                        for(String proced: pro){
                                    %>
                                    <option value="<%= proced%>"><%= proced%></option>
                                    <% } %>
                </select>
            </center>
            <br><br>
            <table cellspacing="3" cellpadding="3" border="0" >               
                <tr>
                    <td>
                        <label data-title="">Órgano Jurisdiccional</label></td>
                    <td><input type="text" name="nombre" id="nombre" value="${sessionScope.nomOrg}" style="width: 500px" readonly required></td>
                    <td><label data-title="Esta variable es para la codificación que realizará INEGI, no debe ser llenado por el informante. Su codificación contiene la clave geoestadística del estado, municipio + materia del OJ + número de OJ">Clave del órgano jurisdiccional: </label></td>
                    <td><input  type="text" id="clave" name="clave" value="${sessionScope.clveOrg}" style="width: 150px" readonly required></td>
                </tr>
                <tr>        
                    <td><label>Número / clave del expediente </label></td>   
                    <td><input type="text" id="claveExp" name="claveExp" style="width: 500px" required></td>

                    <!-- FECHA DE APERTURA -->
                    <td><label >Fecha de apertura del expediente: </label> </td>     
                    <td><input type="date" id="fecha"  name="fecha" style="width: 150px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)" required></td></tr>
            </table>
            
        <!--</form>--> 
        <!--termina form principal-->
        
        <!--form secundarios-->
            <div id="divOrdinario" style="display: none">
                 <fieldset class="secuencial">
                    <legend> DATOS DEL EXPEDIENTE</legend>
                     <!-- TIPO DE ASUNTO -->
                    
                    <p>
                            <label>TIPO DE ASUNTO</label>
                            <select name="asunto" id="asunto" style="width: 400px" onchange = "mostrarOcultarMotCirConcepPrest(); mostrarOcultarContrato(); mostrarOcultarMotCol();mostrarOcultarConceptos(); mostrarNat1(); mostrarNat2()">
                                    <option value="">--Seleccione un tipo de asunto--</option>
                                    <%
                                        List<String> asuntos=obj.listaAsuntos();
                                        for(String asunto: asuntos){
                                    %>
                                    <option value="<%= asunto%>"><%= asunto%></option>
                                    <% } %>                                  
                            </select>
                            <div id="nota" class="nota">Esta es la nota que aparece al pasar el cursor sobre el label.</div>
                    </p>
                       
                    <!-- NATURALEZA DEL CONFLICTO -->
                    <div id="divNat1ORD" style="display: none">
                    <p>
                          <label data-title="INEGI: En caso de seleccionar en la fila Tipo de asunto Colectivo solo podrá seleccionar en Naturaleza de conflicto la opción Jurídico">Naturaleza del conflicto </label>
                          <select name="naturaleza" id="naturaleza" style="width: 700px">
                               <option value="">---Seleccione opción---</option>
                               <%
                                   List<String> nat=obj.listaNaturaleza();
                                   for(String natu: nat){
                               %>
                              <option value="<%= natu%>"><%= natu%></option>
                              <% } %>
                         </select>
                    </p>
                    </div>
                    <div id="divNat2ORD" style="display: none">
                        <p>
                        <label data-title="INEGI: En caso de seleccionar en la fila Tipo de asunto Colectivo solo podrá seleccionar en Naturaleza de conflicto la opción Jurídico">Naturaleza del conflicto </label>
                        <input type="text" id="naturaleza2" name="naturaleza2" value="Jurídico" style="width: 300px" readonly>
                        </p>
                    </div>
                     
                        <!-- CONTRATO S/N -->
                        <div id="divContrato"> 
                        <P>         
                        <label data-title="INEGI: Esta fila solo deberá captarse cuando en la fila Tipo de asunto se haya seleccionado individual.">¿El trabajador contó con contrato escrito? </label>    
                        <select name="contrato" id="contrato" style="width: 300px" onchange="mostrarOcultarTipoContrato()">
                               <option value="">--Seleccione una opción--</option>
                              <%
                                  List<String> respuesta = obj.listaRespuestaSimple2();
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                         </select>
                         </P>
                         </div>  
                         
                         <!-- TIPÓ DE CONTRATO -->
                            <div id="divTipoContrato" style = "display: none"> 
                                <p>
                             
                                        <label data-title="INEGI: Tipo de contrato, sólo debe llenarse cuando en la fila  ¿El trabajador contó con contrato escrito? se haya seleccionado Sí.">Tipo de contrato </label>   
                                    
                                        <select name="tipoContrato" id="tipoContrato" style="width: 500px">
                                            <option value="">--Seleccione tipo de contrato--</option>
                                            <%
                                 List<String> asu=obj.listaContrato();
                                  for(String asun: asu){
                              %>
                               <option value="<%= asun%>"><%= asun%></option>
                               <% } %>
                                        </select>
                                </p>
                            </div>

                       

                      <!-- RAMA DE LA INDUSTRIA INVOLUCRADA -->
                        <p>
                                <label>Rama de la industria involucrada </label>                               
                                <input type="text" id="industria" name="industria" oninput="validarYConvertirP(this)" style="width: 400px">
                                <br>

                       <!-- SECTOR DE LA RAMA INVOLUCRADA -->
                        
                                <label>Sector de la rama o materia industrial involucrada </label>     
                          
                                <select id="sector" name="sector" onkeyup="filtrarOpciones('sector');" onchange="sectorSubsector('sector', 'subsector');" style="width: 300px" >
                                    <option value="">---Seleccione sector---</option>
                                    <%
                                        List<String> sectorS = obj.sector();
                                        for (String dato : sectorS) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>

                        <!-- SUBSECTOR DE LA RAMA INVOLUCRADA -->
                        <p>
                                <label>Subsector de la rama o materia industrial involucrada </label>      
                          
                                <select id="subsector" name="subsector" style="width: 420px" >
                                    <option value="">---Seleccione subsector---</option>
                                </select>
                        </p>

                       <!-- ENTIDAD -->
                        <p>
                                <label>Entidad donde se suscitó el conflicto </label>     
                         
                                <select id="entidad" name="entidad" style="width: 420px" onchange="entiMunicipio('entidad', 'municipio') " >
                                    <option value="">---Seleccione entidad---</option>
                                    <%
                                        List<String> entidad = cco.consultaEntidad();
                                        for (String dato : entidad) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                                <br>
                                <label >Municipio donde se suscitó el conflicto</label> 
                                <select id="municipio" name="municipio" style="width: 300px" >
                                    <option value="">---Seleccione Municipio---</option>
                                </select>
                        </p>
                       
                   </fieldset>

               
                <div id="divIndiv" style="display: none">
                    <div id="divMotCirConPres">
                        <fieldset class="secuencial" style="line-break: loose">   
                      <p>
                            <label >¿El conflicto laboral se encuentra vinculado al esquema de subcontratación (outsourcing)? </label> 
                           <select id="outsourcing" name="outsourcing" style="width: 950px">
                                    <option value="">--Seleccione una opción--</option>
                              <%
                                  List<String> rsIden=obj.listaRespuestaSimple();
                                  for(String respSim: rsIden){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                        </p>
                        </fieldset>
                        
                        
                        <fieldset class="secuencial" style="line-break: loose" >
                            <legend data-title="INEGI: Motivo del Conflicto solo deben llenarse cuando en la fila  ''Tipo de asunto'' se haya seleccionado 'individual'. Son opciones que permiten seleccionar más de una opción."'> 
                                MOTIVO DEL CONFLICTO (ASUNTOS INDIVIDUALES)</legend>
                            <!-- TIPO DE ASUNTO -->
                            <!-- MOTIVOS, CIRCUNSTANCIAS, CONCEPTOS -->
                            <!--<fieldset>-->
                            <div class="ch">
                                <table>                                    
                                        <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Despido" />Despido
                                        <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Rescisión de la relación laboral" />Rescisión de la relación laboral</td>
                                        <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Terminación voluntaria de la relación de trabajo" />Terminación voluntaria de la relación de trabajo</td>
                                        <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Violación de contrato" />Violación de contrato     </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Riesgo de trabajo" />Riesgo de trabajo</td>
                                    <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Revisión y firma de contrato" />Revisión y firma de contrato</td>
                                    <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Participación de utilidades" />Participación de utilidades</td>
                                    <td><input type="checkbox" id="check_motivosO" name="check_motivosO" class="opcion" onchange="mostrarOcultarEspMotOrd()" value="Otro motivo del conflicto (especifique)" />Otro motivo del conflicto</td>
                                    </tr>
                                </table>
                            </div>
 
                          
                            <div id="divEspMotOrd" style="display: none">
                                <p>
                                <label data-title="INEGI: En caso de seleccionar ''Otro motivo del conflicto'', deberá de registrar su respuesta en esta fila.">Especifique (otro motivo del conflicto)</label>
                                <input type="text" name ="especMotOrd" id ="especMotOrd" oninput="validarYConvertirEspacioComa(this)" style="width: 900px">
                                </p>
                            </div>
                        </fieldset>

                      
                        
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                             <label data-title="INEGI: En caso de que se haya seleccionado ''No'' en la fila ''¿Aplican circunstancias vinculadas al motivo del conflicto?'', continúe con la siguiente variable">¿Aplican circunstancias vinculadas al motivo del conflicto?</label>
                             <select id="circuns"  name="circuns" style="width: 950px" onchange="mostrarOcultarCirc()">
                                <option>---Seleccione una opcion---</option>
                                <%
                                 List<String> res=obj.listaRespuestaSimple2();
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                            </select> 
                            </p>
                        </fieldset>
                        
                        
                                                    
                    </div><!-- fin del div motivos -->

                 
                    <div id="divCirc" style="display: none" >
                     
                        <fieldset class="secuencial" style="line-break: loose" >
                            <legend data-title="INEGI: ''Circunstancias vinculadas al motivo de conflicto'', solo deben llenarse cuando en la fila  ''Tipo de asunto'' se haya seleccionado ''Individual''. Son opciones que permiten seleccionar más de una opción.">
                                CIRCUNSTANCIAS VINCULADAS AL MOTIVO DE CONFLICTO</legend>
                            <div class="ch">
                                <table>
                                    <tr>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo y ocupación por embarazo" />Discriminación en el empleo y ocupación por embarazo</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por edad" />Discriminación en el empleo por edad</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por género" />Discriminación en el empleo por género</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por orientación sexual" />Discriminación en el empleo por orientación sexual</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por discapacidad" />Discriminación en el empleo por discapacidad</td>
                                    </tr><!-- comment -->
                                    <tr>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por condición social" />Discriminación en el empleo por condición social</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por origen étnico o nacional" />Discriminación en el empleo por origen étnico o nacional</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por religión" />Discriminación en el empleo por religión</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Discriminación en el empleo por condición migratoria" />Discriminación en el empleo por condición migratoria</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Otro tipo de discriminación (especifique)" />Otro tipo de discriminación (especifique)</td>
                                    </tr><!-- comment -->
                                    <tr>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Trata laboral" />Trata laboral</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Trabajo forzoso" />Trabajo forzoso</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Trabajo infantil" />Trabajo infantil</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Hostigamiento" />Hostigamiento</td>
                                        <td><input type="checkbox" id="check_circunstancias" name="check_circunstancias" class="opcion2" onchange="mostrarOcultarEspCir()" value="Acoso sexual" />Acoso sexual</td>
                                </tr>
                                </table>
                            </div>
                            
                            <div id="divEspCirc" style="display: none" >
                                <p>
                                <label data-title="INEGI: En caso de seleccionar ''Otro tipo de discriminación (especifique)'', deberá de registrar su respuesta en esta fila">Especifique (otro tipo de discriminación)</label>
                                    <input type="text" name ="espCirc" id ="espCirc" oninput="validarYConvertirEspacioComa(this)" style="width: 950px">
                                    </p>
                            </div>
                    </div>
                        </fieldset>
                    </div><!-- fin del div Circunstancias -->

                
                    

               
                    <div id="divConcep" style="display: none">
                        <fieldset class="secuencial" style="line-break: loose" >
                            <legend data-title="INEGI: ''Concepto reclamado'', solo deben llenarse cuando en la fila  ''Tipo de asunto'' se haya seleccionado ''individual''. Son opciones que permiten seleccionar más de una opción.">
                                CONCEPTO RECLAMADO (ASUNTOS - INDIVIDUALES)</legend>
                            <div class="ch">
                                <table>
                                    <tr>
                                        <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Pago de prestaciones" />Pago de prestaciones</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Indemnización de ley" />Indemnización de ley</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Reinstalación" />Reinstalación</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Salario retenido" />Salario retenido</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Aumento de salario" />Aumento de salario</td>
                                    </tr>
                                    <tr>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Derecho de ascenso" />Derecho de ascenso</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Derecho de preferencia" />Derecho de preferencia</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Derecho de antigüedad" />Derecho de antigüedad</td>
                             <td><input type="checkbox" id="check_conceptos" name= "check_conceptos" class="opcion3" onchange="mostrarOcultarEspConc(); mostrarOcultarPrest();" value="Otro concepto reclamado (especifique)" />Otro concepto reclamado (especifique)</td><td></td>
</tr>
                                    </table>
                    <div id="divEspConcep" style="display: none">
                        <p><label data-title="INEGI: En caso de seleccionar ''Otro concepto reclamado (especifique)'', deberá de registrar su respuesta en esta fila.">Especifique (otro concepto reclamado)</label></center>
                        <input type="text" name ="espConcep" id ="espConcep" oninput="validarYConvertirEspacioComa(this)" style="width: 950px">
                        </p>
                    </div>
                        </fieldset>
                    </div>

                    

                   
                    <div id="divPrest" style="display: none">
                        
                        <fieldset class="secuencial" style="line-break: loose" >
                            <legend data-title="INEGI: ''Tipo de prestaciones'', solo debe llenarse cuando en la fila  ''Concepto reclamado'' se haya seleccionado ''Sí'' en ''Pago de Prestaciones'', asimismo debe registrar la opción sí o no, dependiendo del tipo de prestación solicitada. Son opciones que permiten seleccionar más de una opción.">
                                TIPO DE PRESTACIONES</legend>
                            <input type="checkbox" id="check_prestaciones" name="check_prestaciones" class="opcion4" onchange = "mostrarOcultarEspPrest()" value="Aguinaldo" />Aguinaldo
                            <input type="checkbox" id="check_prestaciones" name="check_prestaciones" class="opcion4" onchange = "mostrarOcultarEspPrest()" value="Vacaciones" />Vacaciones
                            <input type="checkbox" id="check_prestaciones" name="check_prestaciones" class="opcion4" onchange = "mostrarOcultarEspPrest()" value="Prima vacacional" />Prima vacacional
                            <input type="checkbox" id="check_prestaciones" name="check_prestaciones" class="opcion4" onchange = "mostrarOcultarEspPrest()" value="Prima de antigüedad" />Prima de antigüedad
                            <input type="checkbox" id="check_prestaciones" name="check_prestaciones" class="opcion4" onchange = "mostrarOcultarEspPrest()" value="Otro tipo de prestaciones (especifique)" />Otro tipo de prestaciones (especifique)
                        
                    <div id="divEspPrest" style="display: none">
                        <p>
                        <label data-title="INEGI: En caso de seleccionar en la fila ''Otro tipo de prestaciones (especifique)''  la opción de ''Sí'' deberá de registrar su respuesta en esta fila.">Especifique (otro tipo de prestaciones)</label>
                        <input type="text" name ="espPrest" id ="espPrest" oninput="validarYConvertirEspacioComa(this)" style="width: 950px">
                        </p>
                    </div>
                        </fieldset>
                    </div>

            
                <!-- fin del div Indiv -->

                
                <div id="divMotConfCol" style="display: none">
                      <fieldset class="secuencial" style="line-break: loose">
                          <P>
                    <label data-title="INEGI: solo deben llenarse cuando en la fila ''Tipo de asunto'' se haya seleccionado ''colectivo''." >Motivo del conflicto (asuntos-colectivos)</label>
                    <input type="text" name ="motConfCol" id ="motConfCol" oninput="validarYConvertirEspacioComa(this)" style="width: 950px">
                          </P>
                      </fieldset>
                </div>

           
                <fieldset class="secuencial" style="line-break: loose">
                            <legend>INCOMPETENCIA</legend>
                            <p>          
                             <label >Incompetencia</label>
                <select id="incompetenciaOrd" name="incompetenciaOrd" style="width: 1150px" onchange="mostrarOcultarIncompOrd(); mostrarOcultarNoIncomp();">
                    <option>---Seleccione una opción---</option>
                    <%
                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                </select>
                            </p>
               
                <div id="divIncompetencia" style="display: none" onchange="mostrarOcultarEspIncompOrd()">
                    <p>
                    <label data-title="INEGI: Si en la fila ''Incompetencia'', seleccionan ''Sí'', se deberá llenar la fila ''Tipo de incompetencia'' y terminar con el registro de información.">Tipo de incompetencia</label>
                    <select id="incompOrd" name="incompOrd" style="width: 200%">
                        <option>---Seleccione una incompetencia---</option>
                        <%
                                 List<String> incomp=obj.listaIncompetencia();
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                    </select>
                    </p>
                </div>

                
                <div id="divEspIncOrd" style="display: none">
                    <p>
                    <label data-title="INEGI: En caso de seleccionar en la fila ''Tipo de incompetencia'' la opción de ''Otro tipo de incompetencia (especifique)'' deberá de registrar su respuesta en esta fila.">Especifique (otro tipo de incompetencia)</label>
                    <input type="text" name ="espIncOrd" id ="espIncOrd" oninput="validarYConvertirEspacioComa(this)" style="width: 200%">
                    </p>
                </div>
                            
                </fieldset>
                
               
               
                <div id="divNoIncompetencia" style="display: none">
                    
                   
                    <fieldset class="secuencial" style="line-break: loose">
                        <legend>DEMANDA</legend>
                        <p>    
                    <label >Fecha de presentación de la demanda</label>
                    <input type="date" name ="fPresDemandOrd" id ="fPresDemandOrd" style="width: 60%" onfocus="fechaMax(this)" onkeypress="fechaMax(this)"">

                        
                    

                    <label ">¿Se anexó constancia de no conciliación expedida por el Centro Conciliación?</label>
                    <select id="constanciaCon" name="constanciaCon" style="width: 80%" onchange="mostrarOcultarClaveConsOrd(); mostrarOcultarClaveConsOrd2();">
                        <option>---Seleccione una opción---</option>
                         <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                    </select>
                    </p>
                    
                    <div id="divConsConcilSi" style="display: none">
                        <p>
                        <label data-title="INEGI: Clave/identificador de la constancia, solo debe llenarse cuando se haya seleccionado ''¿Se anexó constancia de no conciliación expedida por el Centro de Conciliación?''">Clave/identificador de la constancia</label>
                        <input type="text" name ="consConcil" id ="consConcil" style="width: 400%">
                        </p>
                    </div>

                    <br>
                    <div id="divConsConcilNo" style="display: none">
                        <p>
                        <label data-title="INEGI Solo debe llenarse cuando no se haya seleccionado ''¿Se anexó constancia de no conciliación expedida por el Centro de Conciliación?''.">¿El asunto se encuentra vinculado a los supuestos de excepción de la conciliación prejudicial?</label>
                        <select id="asuVincPerj" name="asuVincPerj" style="width: 80%">
                            <option>---Seleccione una opción---</option>
                            <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                        </p>
                    </div>
                        
                 
                    <p>
                        <label >¿Se formuló prevención a la demanda?	</label>
                        <select id="prevDemand" name="prevDemand" style="width: 400%" onchange="mostrarOcultarDesahogo()">
                            <option>---Seleccione una opción---</option>
                           <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                    </p>
                    
                    <div id="divDesahogo" style="display: none">
                        <p>
                        <label>¿Se desahogó la prevención de la demanda?</label>
                        <select id="desahogoDemanda" name="desahogoDemanda" style="width: 350%">
                            <option>---Seleccione una opción---</option>
                            <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                        </p>
                    </div>
                    
                    </fieldset>
                   
                    <fieldset class="secuencial" style="line-break: loose">
                        <legend>ESTATUS DE LA DEMANDA</legend>
                        <p>
                        <label data-title="INEGI: En caso de seleccionar las opciones ''Desechada'', ''Archivo'' o ''No se dio trámite al escrito de demanda'', no deberá de continuar con el llenado de información por haberse concluido el expediente.">Estatus de la demanda</label>
                        <select id="estatusDemOrd" name="estatusDemOrd" style="width: 300%" onchange="mostrarOcultarCauImpDem(); mostrarOcultarAdmitida();">
                           <option>---Seleccione un estatus---</option>
                              <%              
                                 List<String> dem=obj.listaEstatusDemanda();
                                 for(String dema: dem){
                              %>
                               <option value="<%= dema%>"><%= dema%></option>
                               <% } %>
                       </select>
                        </p>
                        
                        <div id="divDesechadaOrd" style="display: none">
                        <p>
                        <label>Causas que impiden la admisión de la demanda</label>
                        <select id="causasImpDem" name="causasImpDem" style="width: 950px">
                            <option>---Seleccione un estatus---</option>
                           <%              
                                 List<String> cau=obj.listaCausasDesechada();
                                 for(String causa: cau){
                              %>
                               <option value="<%= causa%>"><%= causa%></option>
                               <% } %>
                        </select>
                        </p>
                        </div>
                        
                    </fieldset>
                    
  
                    <div id="divAdmitidaOrd" style="display: none">
                         <fieldset class="secuencial" style="line-break: loose">
                             <legend>PARTES REGISTRADAS EN EL EXPEDIENTE</legend>
                             <p>
                                <label>Fecha de admisión de la demanda</label>
                                <input type="date" id="fechaAdmDemOrd" name="fechaAdmDemOrd" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                             </p>

                             <p>
                                <label>Cantidad de actores</label>
                                <input type="number" id="actoresOrd" name="actoresOrd" style="width: 950px" min="0" oninput="funcionNeg(this.id)">
                             </p>
                             
                             <p>
                                <label>Cantidad de demandados</label>
                                <input type="number" id="demandadosOrd" name="demandadosOrd" style="width: 950px" min="0" oninput="funcionNeg(this.id)">
                             </p>
                         </fieldset>
                        <fieldset class='secuencial' style="line-break: loose">
                            <legend>DATOS PROCESALES</legend>
                             
                             <p>
                                <label>¿Hubo celebración de audiencia preliminar?</label>
                                <select id="preliminarOrd" name="preliminarOrd" style="width: 950px" onchange="mostrarOcultarFechaAudPrel()">
                                  <option>---Seleccione una opción---</option>
                                   <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                               </select>
                             </p>

                        <div id="divFechaAudPrelOrd" style="display: none">
                            <p>
                            <label data-title="INEGI: Fecha de audiencia preliminar, solo debe llenarse cuando se haya seleccionado ''¿Hubo celebración de audiencia preliminar?''">Fecha de audiencia preliminar</label>
                            <input type="date" id="fechaAudPrel" name="fechaAudPrel" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                        </div>
                        
                             <p>
                                <label>¿Hubo celebración de audiencia de juicio?</label>
                                <select id="juicioOrd" name="juicioOrd" style="width: 950px" onchange="mostrarOcultarFechaAudJui()">
                                   <option>---Seleccione una opción---</option>
                                  <%                        
                                 for(String respSim: res){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                             </p>

                    
                        <div id="divFechaAudJuiOrd" style="display: none">
                            <p>
                               <label data-title="INEGI:  Fecha de audiencia de juicio, solo debe llenarse cuando''¿Hubo celebración de audiencia de juicio?'' se haya seleccionado ''Sí''.">Fecha de audiencia de juicio</label>
                               <input type="date" id="fechaAudJui" name="fechaAudJui" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                        </div>
                        
                             
                        

                          <p>
                        <label>Estatus del expediente</label>
                        <select id="estatusExpOrd" name="estatusExpOrd" style="width: 950px" onchange="mostrarOcultarUltActProcOrd(); mostrarOcultarSolucionado();">
                            <option>---Seleccione un estatus---</option> 
                          <%              
                                 List<String> ee=obj.listaEstatusExpediente();
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                        </select>
                        </p>
                        
                     
                        <div id="divUltActProcOrd" style="display: none">
                            <p>
                            <label data-title="INEGI: Fecha del último acto procesal, solo debe llenarse cuando en ''Estatus del expediente'' se haya seleccionado ''En proceso de resolución''.">Fecha del último acto procesal</label>
                            <input type="date" id="fechaUltActProc" name="fechaUltActProc" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                        </div>
                         
                      
                        <div id="divSolucionadoOrd" style="display: none">
                            <p>
                            <label>Fase en la que se solucionó el expediente</label>
                            <select id="faseSolOrd"  name="faseSolOrd" style="width: 950px" onchange="mostrarOcultarFechaSolForma();mostrarOcultarEspSolucion();mostrarOcultarEscritaPreliminar(); mostrarOcultarAudJuicio();">
                                <option>---Seleccione fase---</option>
                                 <%              
                                 List<String> fase=obj.listaFaseSolucionORD();
                                 for(String fSORD: fase){
                              %>
                               <option value="<%= fSORD%>"><%= fSORD%></option>
                               <% } %>            
                            </select>
                            </p>
                                                   

                 
                            <div id="divEscritaPreliminar" style="display: none">
                                <div>
                                <p>
                                 <label>Forma de solución</label>
                                 <select id="formaSolOrd" name="formaSolOrd" style="width: 950px" onchange="mostrarOcultarMontoOrd();mostrarOcultarEspSolucion();">
                                <option>---Seleccione solución---</option>
                               <%              
                                 List<String> forma=obj.listaFormaSolucionORD();
                                 for(String formaORD: forma){
                              %>
                               <option value="<%= formaORD%>"><%= formaORD%></option>
                               <% } %>            
                            </select>
                                </p>
                                
                             <div id="divEspSoluOrd" style="display: none"> 
                                 <p>
                                <label>Especifique (otra forma de solución)</label>
                                <input type="text" id="espSolOrd" name="espSolOrd" oninput="validarYConvertir(this)" style="width: 950px">
                                 </p>
                            </div>
                                
                                <div id="divEspSolOrd" style="display: none">
                                <p>
                                <label>Especifique (otra forma de solución)</label>
                                <input type="text" id="espSolOrd2" oninput="validarYConvertirEspacioComa(this)" name="espSolOrd2" style="width: 950px">
                                </p>
                            </div> 
                                
                                </div>
                                 
      
                            <p>
                                <label >Fecha en la que se dictó resolución</label>
                                <input type="date" id="fechaResolucionOrd1" name="fechaResolucionOrd1" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p> 
                          
                 
                           <div id="divConConcOrd" style="display: none">
                               <p>
                                <label>Monto estipulado en la forma de solución: &nbsp;&nbsp;&nbsp;&nbsp; $</label>
                                <input type="text" id="montoOrd1" name="montoOrd1" style="width: 950px" 
       pattern="^\d+(\.\d{1,2})?$" title="Ingrese solo dígitos en el formato 000000.00" 
       oninput="funcionPesos('montoOrd1')" />

                               </p>
                            </div>
                            
                            </div>                        
                                               
           
                            
                            
                            <div id="divAudJuicio" style="display: none">
                                
                                <div>
                                <p>
                                <label>Forma de solución</label>
                                <select id="formaSolOrd2" name="formaSolOrd2" style="width: 950px" onchange="mostrarOcultarCondMix();mostrarOcultarEspSolucion2(); mostrarOcultarTipoSent();">
                                <option>---Seleccione solución---</option>
                                <%              
                                 List<String> forma2=obj.listaFormaSolucionORD2();
                                 for(String forma2ORD: forma2){
                              %>
                               <option value="<%= forma2ORD%>"><%= forma2ORD%></option>
                               <% } %>     
                            </select>
                                </p>
                                
                                <div id="divEspSolOrd2" style="display: none">
                                 <p>
                                <label >Especifique (otra forma de solución)</label>
                                <input type="text" id="espSolOrd3" name="espSolOrd3" oninput="validarYConvertirEspacioComa(this)" style="width: 950px">
                                 </p>
                            </div> 
                                </div>
                                
                                <p>
                                 <label>Fecha en la que se dictó resolución</label>
                                <input type="date" id="fechaResolucionOrd2" name="fechaResolucionOrd2" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                            
                            
                            <div id="divTipoSentOrd" style="display: none">
                                <p>
                                <label>Tipo de sentencia</label>
                                <select id="tipoSentencia" name="tipoSentencia" style="width: 950px" onchange="mostrarOcultarCondMix()">
                                    <option>---Seleccione tipo de sentencia---</option>
                                  <%              
                                 List<String> sen=obj.listaTipoSentencia();
                                 for(String sentenciaORD: sen){
                              %>
                               <option value="<%= sentenciaORD%>"><%= sentenciaORD%></option>
                               <% } %>                  
                                </select>
                                </p>
                            </div>
                            
                   
                            <div id="divConConcOrd2" style="display: none">
                                <p>
                                <label>Monto estipulado en la forma de solución: &nbsp;&nbsp;&nbsp;&nbsp; $</label>
                                <input type="text" id="montoOrd2" name="montoOrd2" style="width: 950px" 
       pattern="^\d+(\.\d{1,2})?$" title="Ingrese solo dígitos en el formato 000000.00" 
       oninput="funcionPesos('montoOrd2')" />

                            </div>
                    </div>
                            
                           
                            
                            <div id="divfechaSolOrd" style="display: none">
                                <p>
                                <label>Fecha de solución</label>
                                <input type="date" id="fechaSolOrd" name="fechaSolOrd" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                            </div>
                        </div> <!-- fin del div Solucionado -->
                      </fieldset>             
                    </div><!-- fin delm div Admitida -->
                </div>  <!-- Fin del div No incompetencia -->
            </div><!-- ***************************Fin del div Ordinario *****************************************************-->

            
            
            
            <!-- ******************************FORMULARIO PARA PROCESO INDIVIDUAL******************************** -->
            <div id="divIndividual" style="display: none">
               
                <fieldset class="secuencial" style="line-break: loose">
                      <p>
                           <label>Tipo de asunto</label>
                           <input type="text" id="asuntoInd" name="asuntoInd" value="Individual" style="width: 950px" readonly>
                      </p>
                      
                      <p>
                           <label>Naturaleza del conflicto</label>
                           <select id="naturalezaInd" name="naturalezaInd" style="width: 950px">
                               <option>---Seleccione una opcion---</option>
                               <%
                                
                                   for(String natu: nat){
                               %>
                              <option value="<%= natu%>"><%= natu%></option>
                              <% } %>
                           </select>
                      </p>
                      
                     
                </fieldset>
                
                <fieldset class="secuencial" style="line-break: loose">
                     <div id="divSiNoContrato">
                        <p>
                             <label>¿El trabajador contó con contrato escrito?</label>
                             <select id="contratoEscritoIND" name="contratoEscritoIND" style="width: 950px" onchange="tipoContratoIND()">
                                  <%
                                  List <String> respSimple=obj.listaRespuestaSimple3();
                                   for(String rsim: respSimple){
                               %>
                              <option value="<%= rsim%>"><%= rsim%></option>
                              <% } %>
                             </select>
                        </p>
                         
                        <div id="divContratoInd" style="display: none">
                             <p>
                                 <label>Tipo de contrato</label>
                                 <select id="tipoContratoInd" name="tipoContratoInd" style="width: 950px">
                                    <option>---Seleccione un tipo de contrato---</option>
                                    <%
                             
                                  for(String asun: asu){
                              %>
                               <option value="<%= asun%>"><%= asun%></option>
                               <% } %>
                                 </select>
                            </p>
                       </div>
                        
                        <p>
                            <label>Rama o materia industrial involucrado</label>                        
                            <input type="text" id="ramaInd" name="ramaInd" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                        </p>
                        
                           <p>
                                <label>Sector de la rama o materia industrial involucrada </label>     
                                <select id="sectorIN" name="sectorIN" style="width: 950px" onchange="sectorSubsector('sectorIN', 'subsectorIN');">
                                    <option value="">---Seleccione sector---</option>
                                    <%
                                        List<String> sectorS2 = obj.sector();
                                        for (String dato : sectorS2) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                           </p>

                     
                        <p>
                                <label>Subsector de la rama o materia industrial involucrada </label>                            
                                <select id="subsectorIN" name="subsectorIN" style="width: 950px" >
                                    <option value="">---Seleccione subsector---</option>
                                </select>
                        </p>
                        
                       <p>
                                <label>Entidad donde se sucitó el conflicto </label>     
                                <select id="entidadIN" name="entidadIN" style="width: 950px" onchange="entiMunicipio('entidadIN', 'municipioIN');">
                                    <option value="">---Seleccione entidad---</option>
                                    <%
                                        List<String> entidad2 = cco.consultaEntidad();
                                        for (String dato : entidad2) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>
                        
                        <p>
                                <label >Municipio donde se sucitó el conflicto</label> 
                                <select id="municipioIN" name="municipioIN" style="width: 950px">
                                    <option value="">---Seleccione Municipio---</option>
                                </select>
                        </p>
                        
                         <p>
                            <label >¿El conflicto laboral se encuentra vinculado al esquema de subcontratación (outsourcing)? </label> 
                           <select id="outsourcing2" name="outsourcing2" style="width: 950px">
                                    <option value="">---Seleccione opcion---</option>
                                     <%
                            
                                  for(String respSim: rsIden){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                        </p>
                     </div>
                </fieldset>
                                
                 <fieldset class="secuencial" style="line-break: loose">
                            <legend> MOTIVO DEL CONFLICTO (ASUNTOS ESPECIALES INDIVIDUALES)</legend>
                            <!-- TIPO DE ASUNTO -->
                            <!-- MOTIVOS, CIRCUNSTANCIAS, CONCEPTOS -->
                            <!--<fieldset>-->
                            <div class="ch">
                            <table>
                                <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Jornada inhumana por lo notoriamente excesiva, dada la índole del trabajo" />Jornada inhumana por lo notoriamente excesiva, dada la índole del trabajo</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Contrato de trabajo para  la prestación de los servicios de trabajadores mexicanos fuera de la República" />Contrato de trabajo para  la prestación de los servicios de trabajadores mexicanos fuera de la República</td>
                                </tr>
                                <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Habitación en arrendamiento al trabajador" />Habitación en arrendamiento al trabajador</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Ejercitar acciones individuales y colectivas que deriven de la obligación de capacitación o adiestramiento" />Ejercitar acciones individuales y colectivas que deriven de la obligación de capacitación o adiestramiento</td>
                                </tr><!-- comment -->
                                <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Determinación de la antigüedad de los trabajadores de planta y/o suplentes" />Determinación de la antigüedad de los trabajadores de planta y/o suplentes</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Derecho de prima de antigüedad de trabajadores de planta" />Derecho de prima de antigüedad de trabajadores de planta</td>
                                </tr>
                                <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Obligación especial patronal de repatriar o trasladar al lugar convenido a los trabajadores" />Obligación especial patronal de repatriar o trasladar al lugar convenido a los trabajadores </td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Designación de beneficiarios del trabajador fallecido con independencia de la causa de deceso" />Designación de beneficiarios del trabajador fallecido con independencia de la causa de deceso</td>
                                </tr>
                                <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Designación de beneficiarios del trabajador desaparecido por un acto delincuencial" />Designación de beneficiarios del trabajador desaparecido por un acto delincuencial  </td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Terminación de la relación laboral por perdida por apresamiento o siniestro del buque" />Terminación de la relación laboral por perdida por apresamiento o siniestro del buque</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Convenio de trabajos encaminados a la recuperación de los restos del buque o de la carga" />Convenio de trabajos encaminados a la recuperación de los restos del buque o de la carga</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Obligación especial patronal del pago a los tripulantes por gastos de traslados o  repatriación al lugar de contratación" />Obligación especial patronal del pago a los tripulantes por gastos de traslados o  repatriación al lugar de contratación</td>
                            </tr><!-- comment -->
                            <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Determinación de indemnización por riesgos de trabajo" />Determinación de indemnización por riesgos de trabajo</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Pago de indemnización en los casos de muerte o desaparición derivada de actos delincuenciales o por riesgo de trabajo" />Pago de indemnización en los casos de muerte o desaparición derivada de actos delincuenciales o por riesgo de trabajo</td>
                            </tr><!-- comment -->
                            <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Desacuerdo de la designación de los médicos de la empresa" />Desacuerdo de la designación de los médicos de la empresa</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Cobro de prestaciones que no excedan el importe de 3 meses de salarios" />Cobro de prestaciones que no excedan el importe de 3 meses de salarios</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Conflicto en materia de seguridad social" />Conflicto en materia de seguridad social</td>
                                <td><input type="checkbox" id="check_motivosI" name="check_motivosI" class="opcion5" onchange="motivosIND()" value="Otro motivo del conflicto (especifique)" />Otro motivo del conflicto (especifique)</td>
                            </tr>
                            </table>
            </div>
                            <div id="divEspMotInd" style="display: none">
                                <p>
                                <label>Especifique (otro motivo del conflicto)</label>
                                <input type="text" ooninput="this.value = this.value.toUpperCase()" name ="especMotInd" id ="especMotInd" style="width: 950px">
                                </p>
                            </div>
                        </fieldset>
                
                       <fieldset class="secuencial" style="line-break: loose">
                           <p>
                           <label>Incompetencia</label>
                           <select id="incompetenciaInd" name="incompetenciaInd" style="width: 950px" onchange="incompetenciaIND();noIncompetenciaEspIND();">
                               <option>---Seleccione incompetencia</option>
                               <%
                               
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                           </p>
                           
                            <div id="divIncompetenciaInd" style="display: none">
                            <p>
                               <label >Tipo de incompetencia</label>
                               <select id="incompInd" name="incompInd" style="width: 950px" onchange="incompetenciaEspIND()">
                                 <option>---Seleccione una incompetencia---</option>
                                   <%
                                
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                               </select>
                          </p>
                        </div>

                <div id="divEspIncInd" style="display: none">
                    <p>
                    <label>Especifique (otro tipo de incompetencia)</label>
                    <input type="text" name ="espIncInd" id ="espIncInd" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                </div>
                </fieldset>
                
                
                      <div id="divNoIncompetenciaIND" style="display: none">
                          <fieldset class="secuencial" style="line-break: loose">
                          <p>
                              <label>Fecha de presentación de la demanda</label>            
                              <input type="date" id="fechaPreseDemIND" name="fechaPreseDemIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                          </p>
                          
                          <p>
                              <label>¿Se anexó constancia de no conciliación expedida por el Centro de Conciliación?</label>
                              <select id="conciliacionIND" name="conciliacionIND" style="width: 950px" onchange="asuntoConcIND();constConcil();">
                                  <option>---Seleccione una opción---</option>
                                  <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                              </select>
                          </p>
                          
                          <div id="divConcIND" style="display: none">
                              <P>
                              <label>Clave / Identificador de la constancia</label>
                              <input type="text" id="claveConstIND" name="claveConstIND"  style="width: 950px">
                              </p>
                          </div>
                          
                          <div id="divAsuntoConcIND" style="display: none">
                              <P>
                                  <label>¿El asunto se encuentra vinculado a los supuestos de excepción de la conciliación prejudicial?</label>
                                  <select id="asuntoConci" name="asuntoConci" style="width: 950px">
                                      <option>---Seleccione una opción</option>
                                   <%
                               
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                  </select>
                              </P>
                          </div>
                          
                          <p>
                              <label>¿Se formuló prevención a la demanda?</label>
                              <select id="formuloPrevIND" name="formuloPrevIND" style="width: 950px" onchange="desahogoIND();">
                                   <option>---Seleccione una opción---</option>
                                  <%
                              
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                              </select>
                          </p>
                          
                          <div id="divDesahogoIND" style="display: none">
                              <P>
                              <label>¿Se desahogó la prevención de la demanda?</label>
                              <select id="desahogosIND" name="desahogosIND" style="width: 950px">
                                   <option>---Seleccione una opción---</option>
                                 <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                              </select>
                              </P>
                          </div>
                          </fieldset>
                          
                          <fieldset class="secuencial" style="line-break: loose">
                              <div id="divEstatusDemIND">
                                  <p>
                                  <label>Estatus de la demanda</label>
                                  <select id="estDemIND" name="estDemIND" style="width: 950px" onchange="causaImpIND();admitida();admitida2();">
                                      <option>---Selecione un estatus---</option>
                                      <%              
                                
                                 for(String dema: dem){
                              %>
                               <option value="<%= dema%>"><%= dema%></option>
                               <% } %>
                                  </select>
                                  </p>
                              </div>
                              
                              <div id="divCausasImpIND" style="display: none">
                                  <p>
                                      <label>Causas que impiden la admisión de la demanda</label>
                                      <select id="causasImpIND" name="causasImpIND" style="width: 950px">
                                            <%              
                                
                                 for(String causa: cau){
                              %>
                               <option value="<%= causa%>"><%= causa%></option>
                               <% } %>
                                      </select>
                                  </p>
                              </div>
                              
                              <div id="divAdmitidaIND" style="display: none">
                                  <p>
                                  <label>Fecha de admisión de la demanda</label>
                                  <input type="date" id="fechaPresDemIND" name="fechaPresDemIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>
                                  
                                  <p>
                                      <label>Cantidad de actores</label>
                                      <input type="number" id="actoresIND" name="actoresIND" style="width: 950px">
                                  </p>
                                  
                                  <p>
                                      <label>Cantidad de demandados</label>
                                      <input type="number" id="demandadosIND" name="demandadosIND" style="width: 950px">
                                  </p>
                                  
                                  <p>
                                      <label>¿Hubo tramitación por auto de depuración?</label>
                                      <select id="tramitacionIND" name="tramitacionIND" style="width: 950px" onchange="tramitacion()">
                                          <option>---Seleccione una opción</option>
                                         <%
                               
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                      </select>
                                  </p>
                                  
                                  <div id="divTramitacionIND" style="display: none">
                                  <p>
                                      <label>Fecha de auto de depuración</label>
                                      <input type="date" id="fechaDepurIND" name="fechaDepurIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>
                                  </div>
                                  
                                  <p>
                                      <label>¿Hubo celebración de audiencia preliminar?</label>
                                      <select id="audPreliminarIND" name="audPreliminarIND" style="width: 950px" onchange="preliminar()">
                                          <option>---Seleccione una opción</option>
                                         <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                      </select>
                                  </p>
                                  
                                   <div id="divAudPreliminarIND" style="display: none">
                                  <p>
                                      <label>Fecha de audiencia preliminar</label>
                                      <input type="date" id="fechaPreliminarIND" name="fechaPreliminarIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>
                                  </div>
                                  
                                  <p>
                                      <label>¿Hubo celebración de audiencia de juicio?</label>
                                      <select id="audJuicioIND" name="audJuicioIND" style="width: 950px" onchange="juicio()">
                                          <option>---Seleccione una opción</option>
                                         <%
                              
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                      </select>
                                  </p>
                                  
                                   <div id="divAudJuicioIND" style="display: none">
                                  <p>
                                      <label>Fecha de audiencia preliminar</label>
                                      <input type="date" id="fechaJuicioIND" name="fechaJuicioIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>
                                  </div>
                                  
                              </div>
                          </fieldset>
                               
                          <fieldset class="secuencial" style="line-break: loose">
                              <div id="divEstExpInd" style="display: none">
                                  <p>
                                  <label>Estatus del expediente</label>
                                  <select id="estatusExpIND" name="estatusExpIND" style="width: 950px" onchange="procesoRes();solucionadoIND();">
                                      <option>---Seleccione un estatus---</option>
                                        <%              
                               
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                                  </select>
                                  </p>
                              </div>
                              
                              <div id="divProcesoResolucionIND" style="display: none">
                                  <p>
                                      <label>Fecha del último acto procesal</label>
                                      <input type="date" id="fechaUltiActIND" name="fechaUltiActIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>
                              </div>
                              
                              <div id="divSolucionadoIND" style="display: none">
                                  <p>
                                  <label>Fase en la que se solucionó el expediente</label>
                                  <select id="faseSolIND" name="faseSolIND" style="width: 950px" onchange="solucionadoIND1();solucionadoIND2();">
                                      <option>---Seleccione una fase---</option>
                                       <%              
                                 List<String> faseIND=obj.listaFaseSolucionIND();
                                 for(String fa: faseIND){ 
                              %>
                               <option value="<%= fa%>"><%= fa%></option>
                               <% } %>  
                                  </select>
                                  </p>
                                  
                                  <div id="divSolucionIND1" style="display: none">
                                  <p>
                                      <label>Forma de solución</label>
                                      <select id="solucionTramIND1" name="solucionTramIND1" style="width: 950px" onchange="sentenciaIND(); convConcIND(); solEspIND();">
                                          <option>---Seleccione una solución---</option>
                                          
                               <%              
                                
                                 for(String formaIND: forma2){
                              %>
                               <option value="<%= formaIND%>"><%= formaIND%></option>
                               <% } %>     
                                      </select>
                                  </p>
                                  </div>
                                                              
                                  <div id="divSolucionIND2" style="display: none">
                                  <p>
                                      <label>Forma de solución</label>
                                      <select id="solucionTramIND2" name="solucionTramIND2" style="width: 950px" onchange="convConcIND2(); solEspIND2();">
                                          <option>---Seleccione una solución---</option>
                                          
                               <%              
                                
                                 for(String forma2IND: forma){
                              %>
                               <option value="<%= forma2IND%>"><%= forma2IND%></option>
                               <% } %>     
                                      </select>
                                  </p>
                                  </div>
                                  
                                   <div id="divTipoSentenciaIND" style="display: none">
                                      <p>
                                      <label>Tipo de sentencia</label>
                                      <select id="sentIND" name="sentIND" style="width: 950px" onchange="tipoSentIND()">
                                          <option>---Seleccione un tipo de sentencia---</option>
                                           <%          
                                                 List<String> senInd=obj.listaTipoSentencia2();
                                                 for(String sent2: senInd){
                                           %>
                                           <option value="<%= sent2%>"><%= sent2%></option>
                                           <% } %>    
                                      </select>
                                      </p>
                                  </div>
                                  
                                  <p>
                                      <label>Fecha en la que se dictó resolución</label>
                                      <input type="date" id="fechaResolucionIND" name="fechaResolucionIND" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                  </p>  
                                  
                                  <div id="divMontoIND1" style="display: none">
                                      <p>
                                          <label>Monto estipulado en la forma de solución </label>
                                          <input type="text" id="idMontoIND1" name="idMontoIND1" style="width: 950px" pattern="^[0-9]+$" title="Ingrese solo digitos">
                                      </p>
                                  </div>
                                 
                                  <div id="divSolEspIND" style="display: none">
                                      <p>
                                      <label>Especifique (otra forma de solución)</label>
                                      <input type="text" id="idSolEspIND1" name="idSolEspIND1" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                                      </p>
                                  </div>
                                  
                              </div>              
                          </fieldset>                        
                      </div>                         
            </div><!-- **********************************Fin del div Individual *********************************************** -->
           
            
            
            
            
            <!-- ********************************FORMULARIO PARA PROCESO COLECTIVO ***********************************-->
            <div id="divColectivo" style="display: none">
            
                <fieldset class="secuencial" style="line-break: loose">
                    <p>
                    <label>Tipo de asunto</label>
                    <input type="text" id="tipoAsuntoCOL" name="tipoAsuntoCOL" value="Colectivo" style="width: 950px" readonly>
                    </p>
                    
                    <p>
                        <label>Naturaleza del conflicto</label>
                        <select id="naturalezaCOL" name="naturalezaCOL" style="width: 950px">
                            <option>---Seleccione una opción---</option>
                            <%
                                 
                                   for(String natu: nat){
                               %>
                              <option value="<%= natu%>"><%= natu%></option>
                              <% } %>
                        </select>
                    </p>
                    
                    <P>
                        <label>Rama o materia industrial involucrada</label>
                        <input type="text" id="ramaCOL" name="ramaCOL" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </P>
                    
                    <p>
                        <label>Sector de la rama o materia industrial involucrada </label>     
                                <select id="sectorCOL" name="sectorCOL" style="width: 950px" onchange="sectorSubsector('sectorCOL', 'subsectorCOL');">
                                    <option value="">---Seleccione sector---</option>
                                    <%
                                        List<String> sectorS3 = obj.sector();
                                        for (String dato : sectorS3) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                    </p>
                    
                     <p>
                                <label>Subsector de la rama o materia industrial involucrada </label>                            
                                <select id="subsectorCOL" name="subsectorCOL" style="width: 950px">
                                    <option value="">---Seleccione subsector---</option>
                                </select>
                        </p>
                        
                          <p>
                                <label>Entidad donde se sucitó el conflicto </label>     
                                <select id="entidadCOL" name="entidadCOL" style="width: 950px" onchange="entiMunicipio('entidadCOL', 'municipioCOL');">
                                    <option value="">---Seleccione entidad---</option>
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
                                <select id="municipioCOL" name="municipioCOL" style="width: 950px" >
                                    <option value="">---Seleccione Municipio---</option>
                                </select>
                        </p>
                </fieldset>
                
                <fieldset class="secuencial" style="line-break: loose">
                    <legend>MOTIVO DEL CONFLICTO (ASUNTOS ESPECIALES COLECTIVOS)</legend>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL();" value="Declaración de la pérdida de la mayoría de los trabajadores" />Declaración de la pérdida de la mayoría de los trabajadores</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL();" value="Suspensión temporal de las relaciones de trabajo" />Suspensión temporal de las relaciones de trabajo</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Terminación colectiva de las relaciones de trabajo" />Terminación colectiva de las relaciones de trabajo</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Titularidad de la contratación colectiva" />Titularidad de la contratación colectiva</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Omisiones del reglamento interior de trabajo" />Omisiones del reglamento interior de trabajo</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Reducción de personal por implantación de maquinaria o procedimientos nuevos" />Reducción de personal por implantación de maquinaria o procedimientos nuevos</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Violaciones a derechos fundamentales en materia colectiva" />Violaciones a derechos fundamentales en materia colectiva</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Elección de las directivas sindicales" />Elección de las directivas sindicales</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Sanciones sindicales que limiten el derecho a votar y ser votado" />Sanciones sindicales que limiten el derecho a votar y ser votado</div>
                           <div class="ch"><input type="checkbox" id="check_motivosC" name="check_motivosC" class="opcion6" onchange="motivosCOL(); muestraSuspCOL(); muestraTermCOL(); muestraViolCOL()" value="Otro motivo del conflicto (especifique)" />Otro motivo del conflicto (especifique)</div>
                            
                           <div id="divEspMotivosCOL" style="display: none">
                               <p><center>
                               <label>Especifique (otro motivo del conflicto)</label>
                               <input type="text" id="espMotivosCOL" name="espMotivosCOL" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                               </center></p>
                           </div>
                </fieldset>   
                
             <div id="divSupensionesCOL" style="display: none">                
                <fieldset class="secuencial" style="line-break: loose">
                    <legend>TIPO DE SUSPENSIÓN TEMPORAL DE LAS RELACIONES DE TRABAJO</legend>
                     <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion7" onchange="" value="Por causas de fuerza mayor o caso fortuito no imputable al patrón" />Por causas de fuerza mayor o caso fortuito no imputable al patrón</div>
                     <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion7" onchange="" value="Por incapacidad física o mental o muerte del patrón" />Por incapacidad física o mental o muerte del patrón</div>
                     <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion7" onchange="" value="Por falta de materia prima no imputable al patrón" />Por falta de materia prima no imputable al patrón</div>
                     <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion7" onchange="" value="Por falta de ministración por parte del Estado" />Por falta de ministración por parte del Estado</div>             
                </fieldset>               
             </div>  
             
             <div id="divTerminacionCOL" style="display: none">
                <fieldset class="secuencial" style="line-break: loose">
                      <legend>TIPO DE TERMINACIÓN COLECTIVA DE LAS RELACIONES DE TRABAJO</legend>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion8" onchange="" value="Por causas de fuerza mayor o caso fortuito no imputable al patrón" />Por causas de fuerza mayor o caso fortuito no imputable al patrón</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion8" onchange="" value="Por incapacidad física o mental o muerte del patrón" />Por incapacidad física o mental o muerte del patrón</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion8" onchange="" value="Por concurso o quiebra legalmente declarada" />Por concurso o quiebra legalmente declarada</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion8" onchange="" value="Por agotamiento de la materia objeto de una industria extractiva" />Por agotamiento de la materia objeto de una industria extractiva</div>
                </fieldset>  
             </div>  
                                
             <div id="divViolacionesCOL" style="display: none">
               <fieldset class="secuencial" style="line-break: loose">
                      <legend>TIPO DE VIOLACIONES A DERECHOS FUNDAMENTALES EN MATERIA COLECTIVA</legend>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion9" onchange="violCOL()" value="Libertad de asociación" />Libertad de asociación</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion9" onchange="violCOL()" value="Libertad sindical" />Libertad sindical</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion9" onchange="violCOL()" value="Derecho a la negociación colectiva" />Derecho a la negociación colectiva</div>
                      <div class="ch"><input type="checkbox" id="check_suspension" name="check_suspension" class="opcion9" onchange="violCOL()" value="Otro tipo de violaciones a derechos fundamentales en materia colectiva (especifique)" />Otro tipo de violaciones a derechos fundamentales en materia colectiva (especifique)</div>
                      
                      <div id="divEspVioCOL" style="display: none">
                          <p><center>
                               <label>Otro tipo de violaciones a derechos fundamentales en materia colectiva (especifique)</label>
                               <input type="text" id="espVioCOL" name="espVioCOL" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                          </center></p>
                     </div>
                </fieldset>
             </div>
                    <fieldset class="secuencial" style="line-break: loose">
                           <p>
                           <label>Incompetencia</label>
                          <select id="incompetenciaCOL" name="incompetenciaCOL" style="width: 950px" onchange="incompCOL(); noIncompCOL()">
                               <option>---Seleccione incompetencia</option>
                             <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                           </p>
                           
                            <div id="divIncompetenciaCOL" style="display: none">
                            <p>
                               <label >Tipo de incompetencia</label>
                               <select id="incompeCOL" name="incompeCOL" style="width: 950px" onchange="espIncompCOL()">
                                 <option>---Seleccione una incompetencia---</option>
                                <%
                                
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                               </select>
                          </p>
                        </div>

                <div id="divEspIncCOL" style="display: none">
                    <p>
                         <label>Especifique (otro tipo de incompetencia)</label>
                         <input type="text" name ="espIncCOL" id ="espIncCOL" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                </div>
                </fieldset>      
                                
                <div id="divNoIncompetenciaCOL" style="display: none">
                    <fieldset class="secuencial" style="line-break: loose">
                        
                        <p>
                        <label>Fecha de presentación de la demanda</label>
                        <input type="date" id="fechaPresDemCOL" name="fechaPresDemCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </p>
                        
                        <P>
                            <label>¿Se anexó constancia de no conciliación expedida por el Centro de Conciliación?</label>
                            <select id="concilCOL" name="concilCOL" style="width: 950px" onchange="constaConcilCOL(); asuntoCOL();">
                                <option>---Seleccione una opción---</option>
                               <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                            </select>
                        </P>
                        
                        <div id="divClaveCOL" style="display: none">
                        <P>
                            <label>Clave/identificador de la constancia</label>
                            <input type="text" id="claveConstCOL" name="claveConstCOL"  style="width: 950px">
                        </P>
                        </div>
                        
                        <div id="asuntoVinCOL" style="display: none">
                            <p>
                                <label>¿El asunto se encuentra vinculado a los supuestos de excepción de la conciliación prejudicial?</label>
                                <select id="asunVinCOL" name="asunVinCOL" style="width: 950px">
                                    <option>---Seleccione una opción---</option>
                                   <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                            </p>
                        </div>
                        
                        <p>
                            <label>¿Se formuló prevención a la demanda?</label>
                            <select id="formuloCOL" name="formuloCOL" style="width: 950px" onchange="desahogoCOL()">
                                    <option>---Seleccione una opción---</option>
                                   <%
                                
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                        </p>
                        
                        <div id="divDesahogoCOL" style="display: none">
                            <P>
                                <label>¿Se desahogó la prevención de la demanda?</label>
                                <select id="desahogosCOL" name="desahogosCOL" style="width: 950px">
                                    <option>---Seleccione una opción---</option>
                                   <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                            </P>
                        </div>                        
                    </fieldset>
                    
                    <fieldset class="secuencial" style="line-break: loose">
                        <P>
                            <label>Estatus de la demanda</label>
                            <select id="estatusDemCOL" name="estatusDemCOL" style="width: 950px" onchange="admitidaCOL(); admitidaCOL2();">
                                <option>---Seleccione un estatus---</option>
                                <%              
                                
                                 for(String dema: dem){
                              %>
                               <option value="<%= dema%>"><%= dema%></option>
                               <% } %>
                            </select>
                        </P>
                        
                        <div id="divAdmitidaCOL" style="display: none">
                            <p>
                            <label>Fecha de admisión de la demanda</label>
                            <input type="date" id="fechaAdmDemCOL" name="fechaAdmDemCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                            
                            <p>
                                <label>Cantidad de actores</label>
                                <input type="number" id="actoresCOL" name="actoresCOL" style="width: 950px">
                            </p>
                            
                            <p>
                                <label>Cantidad de demandados</label>
                                <input type="number" id="demandadosCOL" name="demandadosCOL" style="width: 950px">
                            </p>
                            
                            <p>
                                <label>¿Hubo tramitación por auto de depuración?</label>
                                <select id="tramitacionDepCOL" name="tramitacionDepCOL" style="width: 950px" onchange="fDepCOL()">
                                    <option>---Seleccione una opción---</option>
                                    <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                            </p>
                            
                            <div id="divFechaDepCOL" style="display: none">
                                <p>
                                    <label>Fecha de auto de depuración</label>
                                    <input type="date" id="fechaDepCOL" name="fechaDepCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                            </div>
                            
                              <p>
                                <label>¿Hubo celebración de audiencia de juicio?</label>
                                <select id="juicioCOL" name="juicioCOL" style="width: 950px" onchange="fJuiCOL()">
                                    <option>---Seleccione una opción---</option>
                                    <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                            </p>
                            
                            <div id="divFechaJuicioCOL" style="display: none">
                                <p>
                                    <label>Fecha de audiencia de juicio</label>
                                    <input type="date" id="fechaJuicioCOL" name="fechaJuicioCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                            </div>
                            
                        </div>
                    </fieldset>.
                    
                    <div id="divExpedCOL" style="display: none">
                    <fieldset class="secuencial" style="line-break: loose">
                        <P>
                            <label>Estatus del expediente</label>
                            <select id="estatusExpCOL" name="estatusExpCOL" style="width: 950px" onchange="procesoResolCOL(); solucionadoCOL();">
                                <option>---Seleccione un estatus---</option>
                                 <%              
                              
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                            </select>
                        </P>
                        
                        <div id="divUltActProCOL" style="display: none">
                            <p>
                                <label>Fecha del último acto procesal</label>
                                <input type="date" id="fechaUltActProCOL" name="fechaUltActProCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                        </div>
                        
                        <div id="divSolucionadoCOL" style="display: none">
                            <P>
                                <label>Fase en la que se solucionó el expediente</label>
                                <select id="faseSolCOL" name="faseSolCOL" style="width: 950px">
                                    <option>---Seleccione una fase---</option>
                               <%              
                                 List <String> faseCOL=obj.listaFaseSolucionCOL();
                                 for(String fsCOL: faseCOL){
                              %>
                               <option value="<%= fsCOL%>"><%= fsCOL%></option>
                               <% } %>
                                </select>
                            </P>
                            
                            <p>
                            <label>Forma de solución</label>
                            <select id="formaSolCOL" name="formaSolCOL" style="width: 950px" onchange="tipoSentCOL(); solEspCOL(); monto2COL();">
                                 <option>---Seleccione una solución---</option>
                                <%              
                          
                                 for(String forma2ORD: forma2){
                              %>
                               <option value="<%= forma2ORD%>"><%= forma2ORD%></option>
                               <% } %>     
                            </select>
                            </p>
                            
                            <p>
                                <label>Fecha en la que se dictó la resolución</label>
                                <input type="date" id="fechaResolucionCOL" name="fechaResolucionCOL" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                         
                            <div id="divTipoSentCOL" style="display: none">
                                <p>
                                    <label>Tipo de sentencia</label>
                                    <select id="tipoSentenciaCOL" name="tipoSentenciaCOL" style="width: 950px" onchange="montoCOL()">
                                        <option>---Seleccione un tipo de sentencia---</option>
                                          <%              
                               
                                 for(String sentenciaORD: sen){
                              %>
                               <option value="<%= sentenciaORD%>"><%= sentenciaORD%></option>
                               <% } %>      
                                    </select>
                                </p>
                            </div>
                        </div>
                            
                        <div id="divMontoCOL" style="display: none">
                            <p>
                            <label>Monto estipulado en la forma de solución</label>
                            <input type="text" id="montosCOL" name="montosCOL" style="width: 950px" pattern="^[0-9]+$" title="Ingrese solo digitos">
                            </p>
                        </div>
                        
                        <div id="divEspSolCOL" style="display: none">
                            <P>
                                <label>Especifique (otra forma de solución)</label>
                                <input type="text" id="espSolCOL" name="espSolCOL" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                            </P>
                        </div>                       
                    </fieldset>
                    </div>
                </div>
                                
            </div><%-- ******************************** Fin del div Colectiva*********************************************--%>
            
            
            <!-- *******************************FORMULARIO PARA PROCESO HUELGA************************************ -->
            <div id="divHuelga" style="display: none">
                
                <fieldset class="secuencial" style="line-break: loose">
                    
                    <p>
                        <label>Tipo de asunto</label>
                        <input type="text" id="asuntoHue" name="asuntoHue" value="Colectivo" style="width: 950px" readonly>
                    </p>
                      
                    <p>
                        <label>Rama o materia industrial involucrada</label>
                        <input type="text" id="ramaHue" name="ramaHue" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                    
                      <p>
                        <label>Sector de la rama o materia industrial involucrada </label>     
                                <select id="sectorHUE" name="sectorHUE" style="width: 950px" onchange="sectorSubsector('sectorHUE', 'subsectorHUE');">
                                    <option value="">---Seleccione sector---</option>
                                    <%
                                        List<String> sectorS4 = obj.sector();
                                        for (String dato : sectorS4) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                    </p>
                    
                     <p>
                                <label>Subsector de la rama o materia industrial involucrada </label>                            
                                <select id="subsectorHUE" name="subsectorHUE" style="width: 950px">
                                    <option value="">---Seleccione subsector---</option>
                                </select>
                        </p>
                        
                          <p>
                                <label>Entidad donde se sucitó el conflicto </label>     
                                <select id="entidadHUE" name="entidadHUE" style="width: 950px" onchange="entiMunicipio('entidadHUE', 'municipioHUE');" >
                                    <option value="">---Seleccione entidad---</option>
                                    <%
                                        List<String> entidad4 = cco.consultaEntidad();
                                        for (String dato : entidad4) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>
                        
                        <p>
                                <label >Municipio donde se sucitó el conflicto</label> 
                                <select id="municipioHUE" name="municipioHUE" style="width: 950px">
                                    <option value="">---Seleccione Municipio---</option>
                                </select>
                        </p>
                    
                </fieldset>
                
                <fieldset class="secuencial" style="line-break: loose">
                     <legend>MOTIVOS DE LA HUELGA</legend>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Firma de contrato" />Firma de contrato</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Revisión de contrato" />Revisión de contrato</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Incumplimiento de contrato" />Incumplimiento de contrato</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Revisión de salario" />Revisión de salario</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Reparto de utilidades" />Reparto de utilidades</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Apoyo a otra huelga" />Apoyo a otra huelga</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Desequilibrio entre los factores de producción" />Desequilibrio entre los factores de producción</div>
                      <div class="ch"><input type="checkbox" id="check_motivosH" name="check_motivosH" class="opcion10" onchange="salario(); motivosHUELGA();" value="Otro motivo de la huelga (especifique)" />Otro motivo de la huelga (especifique)</div>              
                      
                      <div id="divEspIMotHUEL" style="display: none">
                          <p><center>
                          <label>Especifique (otro tipo de violaciones a derechos fundamentales en materia colectiva)</label>
                          <input type="text" id="espMotivoHue" name="espMotivoHue" oninput="mayusculas(this)" style="width: 950px">
                          </center></p>
                      </div>
                      
                </fieldset>
                  
                 <fieldset class="secuencial" style="line-break: loose">
                           <p>
                           <label>Incompetencia</label>
                          <select id="incompetenciaHUE" name="incompetenciaHUE" style="width: 950px" onchange="solEspHUE(); noIncompHUE();">
                               <option>---Seleccione incompetencia</option>
                               <%
                               
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                           </p>
                           
                            <div id="divIncompetenciaHUE" style="display: none">
                            <p>
                               <label >Tipo de incompetencia</label>
                               <select id="incompeHUE" name="incompeHUE" style="width: 950px" onchange="espIncompHUE()">
                                 <option>---Seleccione una incompetencia---</option>
                                   <%
                              
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                               </select>
                          </p>
                        </div>

                <div id="divEspIncHUE" style="display: none">
                    <p>
                         <label>Especifique (otro tipo de incompetencia)</label>
                         <input type="text" name ="espIncHUE" id ="espIncHUE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                </div>
                </fieldset>    
                
                <div id="divNoIncompetenciaHUE" style="display: none">
                   <fieldset class="secuencial" style="line-break: loose">
                       <p>
                       <label>Fecha de presentación del pliego de peticiones</label>                  
                       <input type="date" id="fechaPliegoPet" name="fechaPliegoPet" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                       </p>
                       <p>
                           <label>Cantidad de actores</label>
                           <input type="number" id="actoresHUE" name="actoresHUE" style="width: 950px">
                       </p>
                        <p>
                           <label>Cantidad de demandados</label>
                           <input type="number" id="actoresHUE" name="demandadosHUE"style="width: 950px">
                       </p>
                       <p>
                           <label>¿Hubo emplazamiento a huelga?</label>
                           <select id="empHuelga" name="empHuelga" style="width: 950px" onchange="emplaHue();">
                               <option>---Seleccione una opción</option>
                             <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                       </p>
                       <div id="divEmpHUE" style="display: none">
                        <p>
                             <label>Fecha del emplazamiento a huelga</label>                  
                             <input type="date" id="fechaEmpHuelga" name="fechaEmpHuelga" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                       </p>
                       
                       </div>
                        <p>
                           <label>¿Hubo prehuelga?</label>
                           <select id="prehuelga" name="prehuelga" style="width: 950px" onchange="prehuelgaHUE();">
                               <option>---Seleccione una opción</option>
                             <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                       </p>
                       <div id="audConcHUE" style="display: none">
                           <P>
                              <label>¿Hubo audiencia de conciliación?</label>
                              <select id="audConHUE" name="audConHUE" style="width: 950px" onchange="concilHUE()">
                                 <option>---Seleccione una opción</option>
                                <%
                            
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                             </select>
                           </P>
                       </div>
                       <div id="divFechaAudCon" style="display: none">
                           <p>
                              <label>Fecha de audiencia de conciliación</label>                  
                              <input type="date" id="fechaConciHUE" name="fechaConciHUE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                           </p>
                       </div>
                        <p>
                           <label>¿Hubo estallamiento de la huelga?</label>
                           <select id="huelga" name="huelga" style="width: 950px" onchange="estallaHUE()">
                               <option>---Seleccione una opción</option>
                              <%                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                           </select>
                       </p>
                       <div id="estallamientoHUE" style="display: none">
                       <p>
                           <label>Declaración de licitud de la huelga</label>
                           <select id="licitud" name="licitud" style="width: 950px">
                               <option>---Seleccione una opción</option>
                              <%    
                                  List<String> lic=obj.listaLicitud();
                                  for(String licitudH: lic){
                              %>
                               <option value="<%= licitudH%>"><%= licitudH%></option>
                               <% } %>
                           </select>
                       </p>
                       <p>
                           <label>Declaración de existencia de la huelga</label>
                           <select id="exisHuelga" name="exisHuelga" style="width: 950px">
                               <option>---Seleccione una opcion---</option>
                               <%    
                                  List<String> ext=obj.listaExistencia();
                                  for(String exist: ext){
                              %>
                               <option value="<%= exist%>"><%= exist%></option>
                               <% } %>
                           </select>
                       </p>
                       </div>
                   </fieldset>
                    
                    <fieldset class="secuencial" style="line-break: loose">
                        <p>
                            <label>Estatus del expediente</label>
                            <select id="estatusExpHUE" name="estatusExpHUE" style="width: 950px" onchange="ultimoActProcHUE(); solucionadoHUE()">
                                <option>---Seleccione un estatus---</option>
                               <%              
                             
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                            </select>
                        </p>
                        <div id="divFechaUltActProc" style="display: none">
                            <p>
                                <label>Fecha del último acto procesal</label>
                                <input type="date" id="fechaUltActProcHUE" name="fechaUltActProcHUE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                            </p>
                        </div>
                        <div id="divSolucionadoHUE" style="display: none">
                            <p>
                            <label>Fase en la que se solucionó el expediente</label>
                            <select id="faseSolHUE" name="faseSolHUE" style="width: 950px" onchange="formSolHUE(); opHuelga();">
                                <option>---Seleccione una fase---</option>
                                <%              
                                 List <String> faseHUE=obj.listaFaseSolucionHUE();
                                 for(String fsHUE: faseHUE){
                              %>
                               <option value="<%= fsHUE%>"><%= fsHUE%></option>
                               <% } %>
                            </select>
                            </p>
                            
                            <div id="divEmplaPre" style="display: none">
                                <p>
                                <label>Forma de solución</label>
                                <select id="formaSolHUE" name="formaSolHUE" style="width: 950px" onchange="espSolH()">
                                    <option>---Seleccione una solucion---</option>
                                     <%              
                                 List<String> formaH1=obj.listaFormaSolucionHUE();
                                 for(String formaHUE: formaH1){
                              %>
                               <option value="<%= formaHUE%>"><%= formaHUE%></option>
                               <% } %>   
                                </select>
                                </p>
                                
                                <div id="divEspSolHUE" style="display: none">
                                    <P>
                                    <label>Especifique (otra forma de solución)</label>
                                    <input type="text" id="espSolHUE" name="espSolHUE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                                    </P>
                                </div>
                                
                                <div id="divSalario" style="display: none">
                                    <fieldset>
                                        <legend>INCREMENTO SALARIAL</legend>
                                    <p>
                                    <label>Porcentaje solicitado</label>
                                    <input type="text" id="solicitado" name="solicitado" value="0" style="width: 950px"> 
                                    </p>
                                     <p>
                                    <label>Porcentaje otorgado</label>
                                    <input type="text" id="otorgado" name="otorgado" style="width: 950px"> 
                                    </p>
                                    </fieldset>
                                </div>
                                
                            </div> 
                             <p> 
                                    <label>Fecha en la que se dictó la resolución</label>
                                    <input type="date" id="fechaDicResHUE" name="fechaDicResHUE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                             </p>
                            <div id="divHUE" style="display: none">
                                 <p>
                                <label>Forma de solución</label>
                                <select id="formaSolHUE2" name="formaSolHUE2" style="width: 950px" onchange="espSolH(); sentHuelga(); espSolH2(); monPorHuelga()">
                                    <option>---Seleccione una solucion---</option>
                             
                                     <%              
                                 List<String> formaH2=obj.listaFormaSolucionHUE2();
                                 for(String formaHUE2: formaH2){
                              %>
                               <option value="<%= formaHUE2%>"><%= formaHUE2%></option>
                               <% } %>   
                                </select>
                                </p>
                              
                                <div id="divEspSolHUE2" style="display: none">
                                    <P>
                                    <label>Especifique (otra forma de solución)</label>
                                    <input type="text" id="espSolHUE2" name="espSolHUE2" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                                    </P>
                                </div>
                                
                                <div id="divSentenciaHuelga" style="display: none">
                                <p>
                                    <label>Tipo de sentencia</label>
                                    <select id="sentenciaHUE" name="sentenciaHUE" style="width: 950px">
                                        <option>---Seleccione un tipo de sentencia---</option>
                                           <%              
                                 
                                 for(String sentenciaORD: sen){
                              %>
                               <option value="<%= sentenciaORD%>"><%= sentenciaORD%></option>
                               <% } %>      
                                    </select>
                                </p>
                                </div>
                                <p>
                                    <label>Fecha de estallamiento de huelga</label>
                                    <input type="date" id="fechaEstalla" name="fechaEstalla" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                                <p>
                                    <label>Fecha de levantamiento de huelga</label>
                                    <input type="date" id="levantaHuelga" name="levantaHuelga" style="width: 950px" onblur="diasRes()" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                                <p>
                                    <label>Días de huelga</label>
                                    <input type="number" id="diasHuelga" name="diasHuelga" style="width: 950px" readonly>
                                </p>
                                <div id="divMontoPorcentajeHUE">
                                <p>
                                    <label>Monto estipulado por salarios caídos en la forma de solución</label>
                                    <input type="text" id="montoSalariosCaidos" name="montoSalariosCaidos" style="width: 950px" pattern="^[0-9]+$" title="Ingrese solo digitos">
                                </p>
                                <p>
                                    <label>Porcentaje de salarios caídos</label>
                                    <input type="text" id="porcentajeSalariosCaidos" name="porcentajeSalariosCaidos" style="width: 950px">      
                                </p>
                                </div>
                              
                            </div>
                            
                            
                        </div>
                    </fieldset>
              </div>    <%-- fin de incompetencia --%>                          
                 
            </div><%-- **********************************Fin de Huelga*************************************************--%>


            <!-- FORMULARIO PARA PROCESO COLECTIVO DE NATURALEZA ECONOMICA -->
            <div id="divColNatEco" style="display: none">
                <fieldset class="secuencial" style="line-break: loose">
                <p>
                    <label>Tipo de asunto</label>
                    <input type="text" id="asuntoCNE" name="asuntoCNE" style="width: 950px" value="Colectivo"readonly>
                </p>
                <p>
                    <label>Naturaleza del conflicto</label>
                    <input type="text" id="naturalezaCNE" name="naturalezaCNE" value="Económico" readonly style="width: 950px">
                </p>
                <p>
                    <label>Rama o materia industrial involucrada</label>
                    <input type="text" id="ramaCNE" name="ramaCNE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                </p>
                <p>
                                <label>Sector de la rama o materia industrial involucrada </label>     
                                <select id="sectorCNE" name="sectorCNE" style="width: 950px" onchange="sectorSubsector('sectorCNE', 'subsectorCNE');">
                                    <option value="">---Seleccione sector---</option>
                                    <%
                                        List<String> sectorS5 = obj.sector();
                                        for (String dato : sectorS5) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                           </p>                   
                        <p>
                                <label>Subsector de la rama o materia industrial involucrada </label>                            
                                <select id="subsectorCNE" name="subsectorCNE" style="width: 950px" >
                                    <option value="">---Seleccione subsector---</option>
                                </select>
                        </p>
                        
                       <p>
                                <label>Entidad donde se sucitó el conflicto </label>     
                                <select id="entidadCNE" name="entidadCNE" style="width: 950px" onchange="entiMunicipio('entidadCNE', 'municipioCNE');">
                                    <option value="">---Seleccione entidad---</option>
                                    <%
                                        List<String> entidad5 = cco.consultaEntidad();
                                        for (String dato : entidad5) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                                </select>
                        </p>
                        
                        <p>
                                <label >Municipio donde se sucitó el conflicto</label> 
                                <select id="municipioCNE" name="municipioCNE" style="width: 950px">
                                    <option value="">---Seleccione Municipio---</option>
                                </select>
                        </p>
                </fieldset>
                
                <fieldset class="secuencial" style="line-break: loose">
                     <legend>MOTIVO DEL CONFLICTO COLECTIVO DE NATURALEZA ECONÓMICA</legend>
                      <div class="ch"><input type="checkbox" id="check_motivosCNE" name="check_motivosCNE" class="opcion11" onchange="espeMotCNE(); suspCNE();" value="Modificación de condiciones de trabajo" />Modificación de condiciones de trabajo</div>
                      <div class="ch"><input type="checkbox" id="check_motivosCNE" name="check_motivosCNE" class="opcion11" onchange="espeMotCNE(); suspCNE();" value="Implantación de nuevas condiciones de trabajo" />Implantación de nuevas condiciones de trabajo</div>
                      <div class="ch"><input type="checkbox" id="check_motivosCNE" name="check_motivosCNE" class="opcion11" onchange="espeMotCNE(); suspCNE();" value="Suspensión temporal de las relaciones colectivas de trabajo" />Suspensión temporal de las relaciones colectivas de trabajo</div>
                      <div class="ch"><input type="checkbox" id="check_motivosCNE" name="check_motivosCNE" class="opcion11" onchange="espeMotCNE(); suspCNE();" value="Terminación colectiva de las relaciones colectivas de trabajo" />Terminación colectiva de las relaciones colectivas de trabajo</div>
                      <div class="ch"><input type="checkbox" id="check_motivosCNE" name="check_motivosCNE" class="opcion11" onchange="espeMotCNE(); suspCNE();" value="Otro motivo del conflicto colectivo de naturaleza económica (especifique)	" />Otro motivo del conflicto colectivo de naturaleza económica (especifique)</div>               
                      <div id="divEspMotCNE" style="display: none">
                          <p>
                          <label>Especifique (otro motivo del conflicto colectivo de naturaleza económica)</label>
                          <input type="text" id="espMotCNE" name="espMotCNE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                          </p>
                      </div>
                </fieldset>
                
                <div id="divSuspensionCNE" style="display: none" >
                    <fieldset class="secuencial" style="line-break: loose">
                         <legend>TIPO DE SUSPENSION TEMPORAL DE LAS RELACIONES DE TRABAJO</legend>
                              <div class="ch"><input type="checkbox" id="check_suspensionCNE" name="check_suspensionCNE" class="opcion12" onchange="" value="Exceso de producción con relación a sus condiciones económica y a las circunstancias del mercado" />Exceso de producción con relación a sus condiciones económica y a las circunstancias del mercado</div>
                              <div class="ch"><input type="checkbox" id="check_suspensionCNE" name="check_suspensionCNE" class="opcion12" onchange="" value="Incosteabilidad de naturaleza temporal, notoria y manifiesta de la explotación" />Incosteabilidad de naturaleza temporal, notoria y manifiesta de la explotación</div>
                              <div class="ch"><input type="checkbox" id="check_suspensionCNE" name="check_suspensionCNE" class="opcion12" onchange="" value="Falta de fondos y la imposibilidad de obtenerlos para la prosecución normal de los trabajos" />Falta de fondos y la imposibilidad de obtenerlos para la prosecución normal de los trabajos</div>
                    </fieldset>
                </div>
                
                    <fieldset class="secuencial" style="line-break: loose">
                        <p>
                        <label>Incompetencia</label>
                        <select id="incompetenciaCNE" name="incompetenciaCNE" style="width: 950px" onchange="incompCNE(); noIncompCNE();">
                            <option>---Seleccione una opción---</option>
                            <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                        </p>
                        <div id="divTipoIncompetenciaCNE" style="display: none">
                            <P>
                            <label>Tipo de incompetencia</label>
                            <select id="tipoIncompetenciaCNE" name="tipoIncompetenciaCNE" style="width: 950px" onchange="incompEspCNE()">
                                <option>---Seleccione un tipo de incompetencia---</option>
                                <%
                         
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                            </select>
                            </p>
                        </div>
                        <div id="divEspIncCNE" style="display: none">
                            <p>
                                <label>Especifique (otro tipo de incompetencia)</label>
                                <input type="text" id="espIncCNE" name="espIncCNE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                            </p>
                        </div>
                    </fieldset>
                    
                    <div id="divNoIncompetenciaCNE" style="display: none"> 
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                               <label>Fecha de la presentación de la demanda</label>
                               <input type="date" id="fechaPreseDemCNE" name="fechaPreseDemCNE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">                            
                            </p>
                            <p>
                                <label>¿Se anexó constancia de no conciliación expedida por el Centro de Conciliación?</label>
                                <select id="constConc" name="constConc" style="width: 950px" onchange="asuCNE(); claCNE();"> 
                                    <option>--- Seleccione una opción ---</option>
                                   <%
                                
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                            </p>
                            <div id="divConsConcCNE" style="display: none">
                                <p>
                                <label>Clave/identificador de la constancia</label>
                                <input type="text" id="claveConstCNE" name="claveConstCNE" style="width: 950px">
                                </p>
                            </div>
                            
                            <div id="divAV" style="display: none">
                                <p>
                                <label>¿El asunto se encuentra vinculado a los supuestos de excepción de la conciliación prejudicial?</label>
                                <select id="asuntVinCNE" name="asuntVinCNE" style="width: 950px">
                                    <option>--- Seleccione una opción ---</option>
                                    <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                                </p>
                            </div>
                            
                            <p>
                               <label>¿Se formuló prevención a la demanda?</label>
                               <select id="formuloCNE" name="formuloCNE" style="width: 950px" onchange="desahogosCNE()">
                                   <option>---Seleccione una opción</option>
                                    <%
                                  
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                               </select>
                            </p>
                            <div id="divDesahogoCNE" style="display: none">
                                <p>
                                <label>¿Se desahogó la prevención de la demanda?</label>
                                <select id="desahogoCNE" name="desahogoCNE" style="width: 950px">
                                    <option>---Seleccione una opción</option>
                                  <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                                </p>
                            </div>
                        </fieldset>
                        
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                            <label>Estatus de la demanda</label>
                            <select id="estatusDemandaCNE" name="estatusDemandaCNE" style="width: 950px" onchange="admitidaCNE(); admitida2CNE()">
                                <option>---Seleccione un estatus---</option>
                                  <%              
                             
                                 for(String dema: dem){
                              %>
                               <option value="<%= dema%>"><%= dema%></option>
                               <% } %>
                            </select>
                            </p>
                            <div id="divAdmitidaCNE" style="display: none">
                                <P>
                                <label>Fecha de admisión de la demanda</label>
                                <input type="date" id="fechaAdmDemCNE" name="fechaAdmDemCNE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </P>
                                
                                <P>
                                <label>Cantidad de actores</label>
                                <input type="number" id="actoresCNE" name="actoresCNE" style="width: 950px">
                                </P>
                                
                                <P>
                                <label>Cantidad de demanddos</label>
                                <input type="number" id="demandadosCNE" name="demandadosCNE" style="width: 950px">
                                </P>
                                
                                <p>
                                <label>¿Hubo celebración de audiencia dentro del procedimiento colectivo de naturaleza económica?</label>
                                <select id="audCNE" name="audCNE" style="width: 950px" onchange="fechaAudienciaCNE()">
                                    <option>---Seleccione una opción</option>
                                    <%
                              
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                                </select>
                                </p>
                                
                                <div id="divFechaAudCNE" style="display: none">
                                <p>
                                    <label>Fecha de audiencia dentro del procedimiento colectivo de naturaleza económica</label>
                                    <input type="date" id="fechaAudCNE" name="fechaAudCNE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                                </div>                        
                        </div>
                        </fieldset> 
                        
                        <div id="divEstatusExpCNE" style="display: none">
                        <fieldset class="secuencial" style="line-break: loose">
                            <p>
                            <label>Estatus del expediente</label>
                            <select id="estatusExpCNE" name="estatusExpCNE" style="width: 950px" onchange="ultActCNE(); solucionadoCNE()">
                                <option>---Seleccione un estatus---</option>
                                <%              
                               
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                            </select>
                            </p>
                            <div id="divFechaUltActCNE" style="display: none">
                                <p>
                                <label>Fecha del último acto procesal</label>
                                <input type="date" id="fechaUltActCNE" name="fechaUltActCNE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                            </div>
                            <div id="divSolucionadoCNE" style="display: none">
                                <p>
                                <label>Fase en la que se solucionó el expediente</label>
                                <input type="text" id="faseSolCNE" name="faseSolCNE" style="width: 950px" value="Audiencia dentro del procedimiento colectivo de naturaleza económica" readonly>
                                </p>
                                <p>
                                    <label>Forma de solución</label>
                                    <select id="formaSolCNE" name="formaSolCNE" style="width: 950px" onchange="solucionEspCNE(); tipoSentCNE();">
                                        <option>---Seleccione una forma de solución---</option>
                                          <%              
                            
                                 for(String forma2ORD: forma2){
                              %>
                               <option value="<%= forma2ORD%>"><%= forma2ORD%></option>
                               <% } %>     
                                    </select>
                                </p>
                                <div id="divEspSol" style="display: none">
                                    <p>
                                    <label>Especifique (otra forma de solución)</label>
                                    <input type="text" id="espSolCNE" name="espSolCNE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                                    </p>
                                </div>
                                <p>
                                    <label>Fecha en la que se dictó la resolución</label>
                                    <input type="date" id="fechaDictoResCNE" name="fechaDictoResCNE" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                                </p>
                                <div id="divTipoSentenciaCNE" style="display: none">
                                    <p>
                                    <label>Tipo de sentencia</label>
                                    <select id="tipoSentenciaCNE" name="tipoSentenciaCNE" style="width: 950px" onchange="efectosCNE();">
                                        <option>---Seleccione un tipo de sentencia---</option>
                                        <%              
                               
                                 for(String sentenciaORD: sen){
                              %>
                               <option value="<%= sentenciaORD%>"><%= sentenciaORD%></option>
                               <% } %>      
                                    </select>
                                    </p>
                                </div>
                            </div>                           
                        </fieldset >
                        </div>
                        
                        <div id="divEfectosCNE" style="display: none">
                            <fieldset class="secuencial" style="line-break: loose">
                                <legend>EFECTOS DE LA SENTENCIA</legend>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Aumento de personal" />Aumento de personal</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Disminución de personal" />Disminución de personal</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Aumento de la jornada laboral" />Aumento de la jornada laboral</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Disminución de la jornada laboral" />Disminución de la jornada laboral</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Aumento de la semana de trabajo" />Aumento de la semana de trabajo</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Disminución de la semana de trabajo" />Disminución de la semana de trabajo</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Aumento de salarios" />Aumento de salarios</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Disminución de salarios" />Disminución de salarios</div>
                                <div class="ch"><input type="checkbox" id="check_efectosCNE" name="check_efectosCNE" class="opcion13" onchange="espEfectosCNE()" value="Otro tipo de efecto (especifique)" />Otro tipo de efecto (especifique)</div>
                                
                                <div id="divEspEfectosCNE" style="display: none">
                                    <p>
                                    <label>Especifique (Otro tipo de efecto)</label>
                                    <input type="text" id="efecCNE" name="efecCNE" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                                    </p>
                                </div>
                            </fieldset>
                        </div>                    
                    </div>              
            </div><%-- Fin de colectivo de naturaleza económica ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
            
            <!-- FORMULARIO PARA PROCESO PARAPROCESAL -->
            <div id="divParaprocesal" style="display: none">
                <fieldset class="secuencial" style="line-break: loose">
                    <p>
                        <label>Rama o materia industrial involucrada</label>
                        <input type="text" id="ramaPARA" name="ramaPARA" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                     <p>
                          <label>Sector de la rama o materia industrial involucrada </label>     
                          <select id="sectorPARA" name="sectorPARA" style="width: 950px"  onchange="sectorSubsector('sectorPARA', 'subsectorPARA');">
                               <option value="">---Seleccione sector---</option>
                                   <%
                                       
                                        for (String dato : sectorS5) {
                                    %>
                                    <option value="<%= dato%>"><%= dato%></option>
                                    <% } %>
                          </select>
                     </p>                   
                     <p>
                          <label>Subsector de la rama o materia industrial involucrada </label>                            
                          <select id="subsectorPARA" name="subsectorPARA" style="width: 950px" >
                               <option value="">---Seleccione subsector---</option>
                          </select>
                     </p>
                     <p>
                         <label>Motivo de la solicitud o promoción</label>
                         <select id="motivoPARA" name="motivoPARA" style="width: 950px" onchange="motPARA()">
                             <option>---Seleccione un motivo---</option>
                           <%
                                       List<String> motivo=obj.listaMotivos();
                                         for (String mot : motivo) {
                                    %>
                                    <option value="<%= mot%>"><%= mot%></option>
                                    <% } %>
                         </select>
                     </p>   
                     <div id="divEspMotPARA" style="display: none">
                         <P>
                         <label>Especifique (otro motivo de la solicitud o promoción)</label>
                         <input type="text" id="espMotPARA" name="espMotPARA" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                         </P>
                     </div>
                </fieldset>
                <fieldset class="secuencial" style="line-break: loose">
                    <P>
                        <label>Incompetencia</label>
                        <select id="incompPARA" name="incompPARA" style="width: 950px" onchange="incPARA();noIncPARA();">
                            <option>---Seleccione una incompetencia---</option>
                           <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                    </P>  
                    <div id="divTipoIncompetenciaPARA" style="display: none">
                        <P>
                        <label>Tipo de incompetencia</label>
                        <select id="tipoIncompPARA" name="tipoIncompPARA" style="width: 950px" onchange="otraIncPARA()">
                            <option>---Seleccione una incompetencia---</option>
                             <%
                                 
                                 for(String inc: incomp){
                              %>
                               <option value="<%= inc%>"><%= inc%></option>
                               <% } %>
                        </select>
                        </P>
                        </div>
                        <div id="divEspIncPARA" style="display: none">
                          <p>
                          <label>Especifique (otro tipo de incompetencia)</label>
                          <input type="text" id="espIncPARA" name="espIncPARA" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                          </p>
                        </div>
                    
                    
                    <div id="divNoIncompetenciaPARA" style="display: none">
                        <p>
                        <label>Fecha de presentación de la solicitud o promoción</label>
                        <input type="date" name="fechaPresPromPARA" id="fechaPresPromPARA" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </p>
                        <P>
                        <label>Fecha de admisión de la solicitud o promoción</label>
                        <input type="date" id="fechaAdmPromPARA" name="fechaAdmPromPARA" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </P>
                        <P>
                        <label>Promovente</label>
                        <select id="promoventePARA" name="promoventePARA" style="width: 950px" onchange="promPARA()" >
                            <option>---Seleccione un tipo de promovente---</option>
                           <%
                                 List<String> prom=obj.listaPromovente();
                                 for(String pr: prom){
                              %>
                               <option value="<%= pr%>"><%= pr%></option>
                               <% } %>
                        </select>
                    </P>
                    <div id="divEspPromPARA" style="display: none">
                        <p>
                            <label>Especifique (otro tipo de promovente)</label>
                            <input type="text" id="espPromPARA" name="espPromPARA" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                        </p>
                    </div>
                    <P>
                        <label>Estatus del expediente</label>
                        <select id="estatusExpPARA" name="estatusExpPARA" style="width: 950px" onchange="estatusPARA()">
                            <option>---Estatus del expediente---</option>
                          <%              
                               
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                        </select>
                    </P>
                    <div id="divFechaConclExp" style="display: none">
                        <p>
                        <label>Fecha en la que se concluyó el expediente</label>
                        <input type="date" id="fechaConclExp" name="fechaConclExp" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </p>
                    </div>
                    </div>
                    
                    
                </fieldset>
            </div>
            
            
            
            <!-- *************************************FORMULARIO PARA PROCESO TERCERÍA************************** -->
            <div id="divTerceria" style="display: none">
                <fieldset class="secuencial" style="line-break: loose" >
                    <p>
                        <label>Número / clave del expediente incidental</label>
                        <input type="text" id="claveExpPrin" name="claveExpPrin" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                    <p>
                        <label>Número / clave del cuaderno incidental</label>
                        <input type="text" id="claveCuaderno" name="claveCuaderno" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                    </p>
                    <p>
                        <label>Fecha de presentación del incidente</label>
                        <input type="date" id="fechaPresIn" name="fechaPresIn" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                    </p>
                    <p>
                        <label>Fecha de apertura del cuaderno incidental</label>
                        <input type="date" id="fechaApertCuaderno" name="fechaApertCuaderno" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                    </p>
                    <p>
                        <label>Tipo de incidente</label>
                        <select id="tipoIncidente" name="tipoIncidente" style="width: 950px">
                            <option>---Seleccione tipo de incidente---</option>
                              <%
                                 List<String> inc=obj.listaIncidente();
                                  for(String inci: inc){
                              %>
                               <option value="<%= inci%>"><%= inci%></option>
                               <% } %>
                        </select>
                    </p>
                    <p>
                        <label>¿Hubo celebración de audiencia?</label>
                        <select id="audTER" name="audTER" style="width: 950px" onchange="audienciaTER()">
                            <option>---Seleccione una opción---</option>
                             <%
                                 
                                  for(String respSim: respuesta){
                              %>
                               <option value="<%= respSim%>"><%= respSim%></option>
                               <% } %>
                        </select>
                    </p>
                    <div id="divAudienciaTER" style="display: none">
                        <p>
                            <label>Fecha de audiencia</label>
                            <input type="date" id="fechaAudTER" name="fechaAudTER" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </p>
                    </div>
                </fieldset>
                
                <fieldset class="secuencial" style="line-break: loose">
                    <p>
                        <label>Estatus del expediente</label>
                        <select id="estatusExpTER" name="estatusExpTER" style="width: 950px"  onchange="estatusTER()">
                            <option>---Seleccione un estatus---</option>
                            <%              
                                
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
                        </select>
                    </p>
                    <div id="divSentTER" style="display: none">
                        <p>
                        <label>Sentencia interlocutoria (incidental)</label>
                        <select id="sentenciaTER" name="sentenciaTER" style="width: 950px">
                             <%              
                                List<String> sent3=obj.listaTipoSentencia3();
                                 for(String s3: sent3){
                              %>
                               <option value="<%= s3%>"><%= s3%></option>
                               <% } %>
                        </select>
                        </p>
                        <p>
                            <label>Fecha en la que se dictó la resolución</label>
                            <input type="date" id="fechaResolucionTER" name="fechaResolucionTER" style="width: 950px"onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                        </p>
                    </div>
                </fieldset>
            </div>

           
            
            
            <!-- *****************************************FORMULARIO PARA PROCESO PREFERENCIA DE CREDITO***************************************** --> 
            <BR><BR>
            <!--form preferencia-->
            <!--<form action="GuardaProcedimiento" method="post" id="preferencia">-->
                 <div id="divPrefCred" style="display: none">
                     <fieldset class="secuencial">
                         <legend>Motivo de la solicitud o promoción</legend>
                                    
                 <div class="ch"><input type="checkbox" id="motivos_PC" name="motivos_PC" class="opcion14" onchange="" value="Aviso a un órgano jurisdiccional para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón" />Aviso a un órgano jurisdiccional para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón</div>
                 <div class="ch"><input type="checkbox" id="motivos_PC" name="motivos_PC" class="opcion14" onchange="" value="Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón" />Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón</div>
                                
                     </fieldset>
               
                <fieldset class="secuencial">
                    <legend>Solicitud o promoción</legend>
                    <p>
                <label>Fecha de presentación de la solicitud o promoción </label>      
                <input type="date" id="fechaPresProm"  name="fechaPresProm" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)"> 
                    </p>

               
                <p>
                <label>Fecha de admisión de la solicitud o promoción </label>      
                <input type="date" id="fechaAdmProm" name="fechaAdmProm" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                </p>
                </fieldset>

                
                <fieldset class="secuencial">
                    <legend>Parte registrada en el expediente</legend>
                    <p>
                <label>Promovente </label>
                <select id="promovente" name="promovente" style="width: 950px" onchange="mostrarPromoventeEspecifique()" >
                    <option value="">---Seleccione promovente---</option>
                    <%
                        List<String> resultadosPromovente = obj.listaPromoventes();
                        for (String dato : resultadosPromovente) {
                    %>
                    <option value="<%= dato%>"><%= dato%></option>
                    <% } %>
                </select>
                    </p>

                
                
                <div id="divPromoventeEspecifiquePC" style="display: none">
                    <p>
                    <label>Especifique (otro tipo de promovente)</label>
                    <input type="text" id="promoventeEspecifique" name="promoventeEspecifique" oninput="this.value = this.value.toUpperCase(); validarYConvertirEspacioComa(this)" style="width: 950px" >
                    </p>
                </div>
                

                </fieldset>
                
                <fieldset class="secuencial">
                    <legend>Datos procesales</legend>
                    <p>
                <label>Estatus del expediente </label>
                <select id="estExp" name="estExp" style="width: 950px" onchange = "mostrarEstatusFecha()">
                    <option value="">--- Seleccione estatus ---</option>
                   
                </select>
                    </p>
                    
                <div id="divFechaDicResPC" style="display: none">
                    <p>
                    <label>Fecha en la que se dictó la resolución </label>      
                    <input type="date" id="fechaDictRes" name="fechaDictRes" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                    </p>
                </div>
                
               </fieldset>

               
            </div><!-- #################################################### -->
           
            <!-- ----------------------------FORMULARIO PARA PROCESO EJECUCION ----------------------------------------------------------------------------------------------------->
            <!--<form  action="GuardaProcedimiento" method="post" id="ejecucion">-->
                 <div id="divEjecucion" style="display: none">
                  <fieldset class="secuencial">
                      <legend>Solicitud de ejecución de sentencia</legend>
                      <p>
                <label  >Motivo de la solicitud o promoción </label> 
               <select   id="promocionE" name="promocionE" style="width: 600px">
              <option value="">---Seleccione motivo---</option>
              <%
                        List<String> resultadosProm2 = obj.listaMotivosPromocionE();
                        for (String dato : resultadosProm2) {
                    %>
              <option value="<%= dato%>"><%= dato%></option>
               <% }%>
             </select>
 
                <br>
            <label >Fecha de presentación de la solicitud de ejecución de sentencia</label>      
            <input type="date" id="fechaEjec" name="fechaEjec" style="width: 200px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)"> 
                      </p>
                  </fieldset>
                
        <fieldset class="secuencial">
        <legend>Datos procesales</legend>
       <p>
        <label >Estatus del expediente </label>
        <select id="estExpE" name="estExpE" style="width: 950px" onchange = "mostrarEstatusFechaFaseEj()" >
        <option value="">--- Seleccione estatus ---</option>
         <%              
                               
                                 for(String esex: ee){
                              %>
                               <option value="<%= esex%>"><%= esex%></option>
                               <% } %>
        </select>
       </p>               
                
        <div id="divFechaFaseEj" style="display: none">
          <p>
        <label >Fecha en la que se concluyó el procedimiento de ejecución</label>      
        <input type="date" id="fechaConEj" name="fechaConEj" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
        <p>                   
    <label >Fase en la que se concluyó el procedimiento de ejecución</label>
    <select id="faseConEj" name="faseConEj" style="width: 950px">
    <option value="">--- Selecione una fase ---</option>
    <%              
              List <String> faseEJE=obj.listaFaseSolucionEJE();
              for(String fsEJE: faseEJE){
   %>
             <option value="<%= fsEJE%>"><%= fsEJE%></option>
   <% } %>
    </select>
    </p>
    </div>
    </fieldset>
  
              </div>
             <fieldset class="secuencial" style="line-break: loose"> 
                 <p>
                    <label>Comentarios</label>
                    <input  type="text" id="comentarios" name="comentarios" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                 </p>
             </fieldset>

            <!--</form>-->
             <!--termina ejecucion-->
            
            
            <center>
                <input type="submit" value="Guardar" id="guardaPro" >
                <input type="button" value="Limpiar" onclick="mostrarProcedimientos();">
            </center>
            </form>
            
    </article>
</div>
