
<%@page import="Combos.CargaCombosO"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page import="Combos.CargaCombosChecks"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link REL="stylesheet" href="css/estiloProcedimiento.css">        
        <link REL="stylesheet" href="css/estiloOrganoJ.css">          
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
 <header id="main-header1">
    <a id="logo-header" href="index.jsp"><img src="IMAGENES/LOGO RALAB blanco.png" height="110"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
    <nav> 
        <ul>           
            <li><a href="index.jsp"><img src="IMAGENES/home.png" height="40"></a></li>
            <li><a href="index.jsp"><img src="IMAGENES/contacto.png" height="40">&nbsp;&nbsp; Contacto</a></li>
            
        </ul>
    </nav>
</header>
<%ConectaBD conexion=new ConectaBD();
    CargaCombosProcedimientos obj = new CargaCombosProcedimientos();
    
    CargaCombosChecks checks=new CargaCombosChecks();
    
    CargaCombosO cco = new CargaCombosO();
    PreparedStatement ps;
                  ResultSet rs;
                  conexion.conectar();
                  
                  String organoSeleccionado = request.getParameter("organo");
                  int procedimientoSeleccionado = obj.indiceProcedimiento(request.getParameter("expEdit"));//Tipo de procedimiento
                  String expedienteSeleccionado = request.getParameter("valor"); //Clave del expediente
               
                  List<String> motivos = checks.listaMotivos(expedienteSeleccionado);
                 System.out.println("valores:"+motivos.size());
                                 
    
                  
                ps=conexion.con.prepareStatement(
                        "SELECT  "
                                //tabla tr_organo
                            + "TR_ORGANOJ.id_organoj, "
                            + "TR_ORGANOJ.nombre_organoj, "
                                //tabla tr_expediente
                            + "TR_EXPEDIENTE.clave_expediente, "
                            + "TR_EXPEDIENTE.fecha_apertura_exped, "
                            + "TR_EXPEDIENTE.fecha_present_promo, "
                            + "TR_EXPEDIENTE.fecha_admision_promo, "
                            + "TR_EXPEDIENTE.fecha_dicto_solucion,  "
                            + "TR_EXPEDIENTE.comentarios, "
                                //otras tablas con alias
                            + "TC_PROMOVENTE.descripcion AS promovente, "
                            + "TC_ESTATUS_EXPEDIENTE.descripcion AS estatus_expediente "
                        + "FROM TR_EXPEDIENTE "
                        + "LEFT JOIN TC_PROMOVENTE ON TR_EXPEDIENTE.id_promovente = TC_PROMOVENTE.id_promovente "
                        + "LEFT JOIN TC_ESTATUS_EXPEDIENTE ON TR_EXPEDIENTE.id_estatus_exped = TC_ESTATUS_EXPEDIENTE.id_estatus_expediente "
                        + "LEFT JOIN TR_ORGANOJ ON TR_EXPEDIENTE.id_organoj = TR_ORGANOJ.id_organoj "
                        + "WHERE TR_EXPEDIENTE.id_tipo_expediente = ? "
                            + "AND TR_EXPEDIENTE.clave_expediente = ? "
                            + "AND TR_EXPEDIENTE.id_organoj = ?");
                ps.setInt(1, procedimientoSeleccionado);
                ps.setString(2, expedienteSeleccionado);
                ps.setString(3, organoSeleccionado);
                rs=ps.executeQuery();
          
                if (rs.next()) {
                String clave_expediente = rs.getString("clave_expediente");
                String fecha_apertura_exped = rs.getString("fecha_apertura_exped");
                String fecha_present_promo = rs.getString("fecha_present_promo");
                String fecha_admision_promo = rs.getString("fecha_admision_promo");
                String promovente = rs.getString("promovente");
                String estatus_expediente = rs.getString("estatus_expediente");
                String fecha_dicto_solucion = rs.getString("fecha_dicto_solucion");
                String comentarios = rs.getString("comentarios");
                String id_organoj = rs.getString("id_organoj");
                String nombre_organoj = rs.getString("nombre_organoj");
               

                // Guardar en el request
                request.setAttribute("clave_expediente", clave_expediente);
                request.setAttribute("fecha_apertura_exped", fecha_apertura_exped);
                request.setAttribute("fecha_present_promo", fecha_present_promo);
                request.setAttribute("fecha_admision_promo", fecha_admision_promo);
                request.setAttribute("promovente", promovente);
                request.setAttribute("estatus_expediente", estatus_expediente);
                request.setAttribute("fecha_dicto_solucion", fecha_dicto_solucion);
                request.setAttribute("comentarios", comentarios);
                request.setAttribute("id_organoj", id_organoj);
                request.setAttribute("nombre_organoj", nombre_organoj);           
                
            }
%>

 
<div class="tabWrap">
   
    <article class="tabContent">
        <CENTER><h1>PREFERENCIA DE CRÉDITO</h1></center>
     
        <!--form principal-->
        <form action="Actualiza_pref_cred" method="post" id="principal" >
           
            <br><br>
            <table cellspacing="3" cellpadding="3" border="0" >               
                <tr>
                    <td>
                        <label data-title="">Órgano Jurisdiccional</label></td>
                    <td><input type="text" name="nombre" id="nombre" value="${nombre_organoj}" style="width: 500px" readonly required></td>
                    <td><label data-title="Esta variable es para la codificación que realizará INEGI, no debe ser llenado por el informante. Su codificación contiene la clave geoestadística del estado, municipio + materia del OJ + número de OJ">Clave del organo jurisdiccional: </label></td>
                    <td><input  type="text" id="clave" name="clave" value="${id_organoj}" style="width: 150px" readonly required></td>
                </tr>
                <tr>        
                    <td><label>Número / clave del expediente </label></td>   
                    <td><input type="text" id="claveExp" name="claveExp" value="${clave_expediente}" style="width: 500px" required></td>

                    <!-- FECHA DE APERTURA -->
                    <td><label >Fecha de apertura del expediente: </label> </td>     
                    <td><input type="date" id="fecha"  name="fecha" value="${fecha_apertura_exped}" style="width: 150px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)" required></td></tr>
            </table>
            
        
            
            <!-- *****************************************FORMULARIO PARA PROCESO PREFERENCIA DE CREDITO***************************************** --> 
            <BR><BR>
            <!--form preferencia-->
            <!--<form action="GuardaProcedimiento" method="post" id="preferencia">-->
                 <div id="divPrefCred">
                     <fieldset class="secuencial">
                         <legend>Motivo de la solicitud o promoción</legend>
                                    
                         
                 <div class="ch"><input type="checkbox" id="motivos_PC" name="motivos_PC" class="opcion14" onchange="" value="Aviso a un órgano jurisdiccional para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón"  />Aviso a un órgano jurisdiccional para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón</div>
                 <div class="ch"><input type="checkbox" id="motivos_PC" name="motivos_PC" class="opcion14" onchange="" value="Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón" />Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón</div>
                               
                     </fieldset>
               
                <fieldset class="secuencial">
                    <legend>Solicitud o promoción</legend>
                    <p>
                <label>Fecha de presentación de la solicitud o promoción </label>      
                <input type="date" id="fechaPresProm" value="${fecha_present_promo}" name="fechaPresProm" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)"> 
                    </p>

               
                <p>
                <label>Fecha de admisión de la solicitud o promoción </label>      
                <input type="date" id="fechaAdmProm" value="${fecha_admision_promo}" name="fechaAdmProm" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                </p>
                </fieldset>

                
                <fieldset class="secuencial">
                    <legend>Parte registrada en el expediente</legend>
                    <p>
                <label>Promovente </label>
                <select id="promovente" name="promovente" style="width: 950px"  onchange="mostrarPromoventeEspecifique()" >
                    <option value="">---Seleccione promovente---</option>
                    <%
                        String promovente = (String) request.getAttribute("promovente");
                        List<String> resultadosPromovente = obj.listaPromoventes();
                        for (String dato : resultadosPromovente) {
                    %>
                    <option value="<%= dato%>" <%= dato.equals(promovente) ? "selected" : ""%>><%= dato%></option>
                    <% } %>
                </select>
                    </p>
                <div id="divPromoventeEspecifiquePC" style="display: none">
                    <p>
                    <label>Especifique (otro tipo de promovente)</label>
                    <input type="text" id="promoventeEspecifique" name="promoventeEspecifique" oninput="this.value = this.value.toUpperCase()" style="width: 950px" >
                    </p>
                </div>
                

                </fieldset>
                
                <fieldset class="secuencial">
                    <legend>Datos procesales</legend>
                    <p>
                <label>Estatus del expediente </label>
               <select id="estExp" name="estExp" style="width: 950px" onchange="mostrarEstatusFecha()">
               <option value="">--- Seleccione estatus ---</option>

               <%
                  String estatus_expediente = (String) request.getAttribute("estatus_expediente");
              %>

              <option value="Solucionado" <%= "Solucionado".equals(estatus_expediente) ? "selected" : "" %>>Solucionado</option>
              <option value="En proceso de resolución" <%= "En proceso de resolución".equals(estatus_expediente) ? "selected" : "" %>>En proceso de resolución</option>
              </select>
                    </p>
                    
                <div id="divFechaDicResPC" style="display: none">
                    <p>
                    <label>Fecha en la que se dictó la resolución </label>      
                    <input type="date" id="fechaDictRes" value="${fecha_dicto_solucion}" name="fechaDictRes" style="width: 950px" onfocus="fechaMax(this)" onkeypress="fechaMax(this)">
                    </p>
                </div>
                
               </fieldset>

               
            </div><!-- #################################################### -->
           
           
             <fieldset class="secuencial" style="line-break: loose"> 
                 <p>
                    <label>Comentarios</label>
                    <input  type="text" id="comentarios" name="comentarios" oninput="this.value = this.value.toUpperCase()" style="width: 950px">
                 </p>
             </fieldset>

            <!--</form>-->
             <!--termina ejecucion-->
            
            
            <center>
                <input type="submit" value="Actualizar" id="guardaPro" >
               
            </center>
            </form>
            
    </article>
</div>                   
                        <%
                           
                            out.println("<SCRIPT>");
                            out.println("const checkboxs = document.querySelectorAll('input[name=motivos_PC]');");

                            out.print("const opcionesMarcadas = [");
                            for (int i = 0; i < motivos.size(); i++) {
                                 out.print("'" + motivos.get(i) + "'");
                                 if (i < motivos.size() - 1) {
                                     out.print(", ");
                                 }
                            }
                            out.println("];");
                            out.println("checkboxs.forEach((checkbox) => {");
                            out.println("if (opcionesMarcadas.includes(checkbox.value)) {");
                            out.println("checkbox.checked = true;");
                            out.println("}");
                            out.println("});");
                            out.println("</SCRIPT>");
                        %>
                        
                        
                        <script>
                            
        function busqueda(org, exp, valor ) {
            var organo = $('#' + org).val();
            var expEdit = $('#' + exp).val();
             
             if(organo==='')
             {
                 alert("FAVOR DE CAPTURAR ORGANO");
                 return false;
             }

       $.ajax({
        type: 'post',
        url: 'ObtenValoresBusqueda',
        data: {
            organo: organo,
            expEdit: expEdit,
        
        },
        success: function (response) {
            console.log("Respuesta del servidor al buscar: ", response);
            $('#' + valor).html(response);
            console.log('response');
        },
        error: function (response) {
            console.log("Respuesta del servidor error al borrar: ", response);
            alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
        }
    });
}

                            
                            
    function mostrarEstatusFecha() {
        var seleccion = document.getElementById("estExp").value;
        var cajaTexto = document.getElementById("divFechaDicResPC");

        // Mostrar solo si la selección es "Solucionado", de lo contrario ocultar
        cajaTexto.style.display = (seleccion === "Solucionado") ? "block" : "none";
    }

    function mostrarPromoventeEspecifique() {
        var seleccion = document.getElementById("promovente").value;
        var cajaTexto = document.getElementById("divPromoventeEspecifiquePC");

        // Mostrar solo si la selección es "Otro tipo de promovente (especifique)", de lo contrario ocultar
        cajaTexto.style.display = (seleccion === "Otro tipo de promovente (especifique)") ? "block" : "none";
    }

    // Ejecutar las funciones inmediatamente al cargar la página
    window.onload = function() {
        const clave = document.getElementById("claveExp").value
        Swal.fire("El expediente "+clave+" fue encontrado");
      //  alert("El expediente fue encontrado");
        mostrarEstatusFecha();
        mostrarPromoventeEspecifique();
    };
</script>
<!--                        // Arreglo con las opciones que deben estar marcadas
                              const opcionesMarcadas = ['Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón'];;
        //                  Obtener todos los checkbox del grupo
                             const checkboxs = document.querySelectorAll('input[name="motivos_PC"]');

                             // Marcar los checkboxes que están en el arreglo
                              checkboxs.forEach((checkbox) => {
                              if (opcionesMarcadas.includes(checkbox.value)) {
                                    checkbox.checked = true;
                            }
                            });-->
                   
                    