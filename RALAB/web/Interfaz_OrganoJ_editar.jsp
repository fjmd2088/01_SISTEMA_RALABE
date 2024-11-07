<%-- 
   Document   : OrganoJurisdiccional
   Created on : 29 feb 2024, 10:18:28
   Author     : octavio.lozano
--%>
<%@ page import="java.util.List" %>
<%@ page import="Combos.CargaCombosO" %>
<%@ page import="java.sql.*"%>
<%@ page import="Modelo.ConectaBD"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">
        <title>RALAB</title>
        <link REL="stylesheet" href="css/estiloOrganoJ.css">
        <link REL="stylesheet" href="css/menu.css">
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/fnPrincipal.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
       
    </head>
    <body>
     <header id="main-header1">
    <a id="logo-header"><img src="IMAGENES/LOGO RALAB blanco.png" height="100"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
    <nav> 
        <ul>
            <li><a href="index.jsp"><img src="IMAGENES/home.png" height="40"></a></li>
            <li><a href="index.jsp"><img src="IMAGENES/contacto.png" height="40">&nbsp;&nbsp; Contacto</a></li>
        </ul>
    </nav>
</header><!-- /#main-header -->
    <br>
 
    <br>
    <br>
    <br>
    <h2 style="background: var(--colorMean); padding: 20px;">Órgano Jurisdiccional</h2>
       
        <%CargaCombosO consulta = new CargaCombosO();
                  ConectaBD obj=new ConectaBD();
                  PreparedStatement ps;
                  ResultSet rs;
                  obj.conectar();
                  
                  
                  String expedienteSeleccionado = request.getParameter("valor");
                  
                   ps=obj.con.prepareStatement("SELECT TR_ORGANOJ.ID_ORGANOJ,tr_organoj.nombre_organoj,TR_ORGANOJ.SEDE_ORGANOJ,TC_ENTIDAD_MPIO.ENTIDAD,TC_ENTIDAD_MPIO.MUNICIPIO, TR_ORGANOJ.COLONIA,TR_ORGANOJ.LONGITUD, TR_ORGANOJ.LATITUD,TC_CIRCUNSCRIPCION.DESCRIPCION AS CIRCUNSCRIPCION,TC_JURISDICCION.DESCRIPCION AS JURISDICCION,TR_ORGANOJ.HR_ATENCION FROM TR_ORGANOJ inner join tc_entidad_mpio on tc_entidad_mpio.id_ent_mpio=TR_ORGANOJ.id_ent_mpio inner join tc_circunscripcion on tc_circunscripcion.id_circunscripcion=TR_ORGANOJ.id_circunscripcion inner join tc_jurisdiccion on tc_jurisdiccion.id_jurisdiccion=TR_ORGANOJ.id_jurisdiccion where tr_organoj.id_organoj=?" );
                  ps.setString(1, expedienteSeleccionado);
                   rs=ps.executeQuery();
          
                if (rs.next()) {
                String nombre_organoj = rs.getString("nombre_organoj");
                String sede_organoj = rs.getString("sede_organoj");
                String entidad = rs.getString("entidad");
                String municipio = rs.getString("municipio");
                String colonia = rs.getString("colonia");
                String latitud = rs.getString("latitud");
                String longitud = rs.getString("longitud");
                String circunscripcion = rs.getString("circunscripcion");
                String jurisdiccion = rs.getString("jurisdiccion");
                String hr_atencion = rs.getString("hr_atencion");

                // Guardar en el request
                request.setAttribute("nombre_organoj", nombre_organoj);
                request.setAttribute("sede_organoj", sede_organoj);
                request.setAttribute("entidad", entidad);
                request.setAttribute("municipio", municipio);
                request.setAttribute("colonia", colonia);
                request.setAttribute("latitud", latitud);
                request.setAttribute("longitud", longitud);
                request.setAttribute("circunscripcion", circunscripcion);
                request.setAttribute("jurisdiccion", jurisdiccion);
                request.setAttribute("hr_atencion", hr_atencion);
                
            }
        %>
        
       
        <form id="form" action="Actualiza_organo" method="post">
            <br>
             <div style="display: none">
                <input type="text" id="campoFechaHora" name="campoFechaHora" readonly>
            </div>
            
                <table>
                    <tr>
                        <td> <label>Clave del órgano jurisdiccional:</label></td>
                        <td> <input type="text" style="width: 150px" id="cve" name="cve" value="<%= expedienteSeleccionado %>" readonly></td>
                    </tr>
                </table>
                 
                 

           
         
              <fieldset>
                <legend>Datos del órgano jurisdiccional</legend>
                
            <table cellspacing="3" cellpadding="3" border="0" >               
                <tr>
                    <td><label for="nombre">Nombre del órgano jurisdiccional <span class="req">* </label></td>
                    <td><input type="text" id="nombre" name="nombre"  value= "${nombre_organoj}" required></td>
                    <td><label for="sede">Sede del órgano jurisdiccional <span class="req">*</label></td>
                    <td><input type="text" id="sede" name="sede" required value="${sede_organoj}"></td>
                </tr>
            </table>
             </fieldset>
            
                <!-----------#############- MUESTRA EL COMBOBOX DE ENTIDAD -#############----------->
                   <fieldset>
                <legend>Ubicación del órgano jurisdiccional</legend>
                <table cellspacing="3" cellpadding="3"  border="0" >      
                <tr>
                    <td><label for="E">Entidad <span class="req">*</label></td>
                    <td> 
                        <input type="text" id="E1" name="E1" value="${entidad}" readonly>
                            <!--
                                <select  id="E" name="E"  >
                            
                            <%
                             //    String entidadSeleccionada = (String) request.getAttribute("entidad");
                               // List<String> resultadosEnt = consulta.consultaEntidad();
                                //for (String dato : resultadosEnt) {
                            %>
                            <option <%//= dato.equals(entidadSeleccionada) ? "value='"+entidadSeleccionada+"' selected" : "" %>><%//= dato %></option>

                            <%// } %>
                            
                        </select>
                            -->
                    </td>
                    
                     <td><label for="mun">Municipio <span class="req">*</label></td>
                    <td>
                        <input type="text" id="M1" name="M1" value="${municipio}" readonly>
                        <!--
                            <select id="M" name="M" >
                            <option value="$//{municipio}" selected>$//{municipio}</option>
                            
                        </select>
                         -->
                        
                    </td>
                    
                     <td><label for="colonia">Colonia <span class="req">* </label></td>
                    <td><input type="text" name="colonia" required focusVisible="true" value="${colonia}" ></td>
                </tr>
                <tr>
                     <td><label for="latitud">Latitud </label></td>
                     <td><input type="text" id="latitud" name="latitud"  onchange="funcionLatitud()" value="${latitud}"> </td>
                    <td><label for="longitud">Longitud </label></td>
                    <td><input type="text" id="longitud" name="longitud" onchange="funcionLongitud()" value="${longitud}"></td>
                    <td></td>
<!--                    <td><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3811821.5591925285!2d-99.7520803486136!3d21.093341805310025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2smx!4v1712094975426!5m2!1ses-419!2smx" 
                                 width="200" height="200" style="border:0;" allowfullscreen="busca Long y Lat" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>-->
                </tr>
                </table>
                   </fieldset>
                        
                 <fieldset>
                <legend>Circunscripción</legend>        
                <table cellspacing="3" cellpadding="3" border="0" >  
                <tr>
                    <td><label for="circunscripcion">Circunscripción <span class="req">*</label></td>
                    <td><select name="C" id="C" onchange="habilitar()" required>
                            
                            <%
                                String circunscripcion = (String) request.getAttribute("circunscripcion");
                                List<String> resultadosCir = consulta.consultaCircunscripcion();
                                for (String datos : resultadosCir) {
                            %>
                            <option value="<%= datos%>" <%= datos.equals(circunscripcion) ? "selected" : "" %>><%= datos%></option>
                            <% } %>
                        </select>  </td> 
                    
                     <td><label for="OtraCir" >Especifique</td></label></td>
                    <td><input type="text" id="OtraCir" name="OtraCir"  disabled>
                     <td><label for="jurisdiccion">Jurisdicción <span class="req">* </label></td>
                    <td><select name="J" required>
                             <option value="">---Seleccione Jurisdicción---</option>
                            <%
                                String jurisdiccion = (String) request.getAttribute("jurisdiccion");
                                List<String> resultadosJur = consulta.consultaJurisdiccion();
                                for (String datos : resultadosJur) {
                            %>
                            <option value="<%= datos%>"  <%= datos.equals(jurisdiccion) ? "selected" : "" %> ><%= datos%></option>
                            <% }%>
                        </select> </td>
                </tr></table>
                       
                        <%
                                String horario = (String) request.getAttribute("hr_atencion");

// Valores por defecto
String diaInicio = "";
String diaFin = "";
String horaInicio = "";
String horaFin = "";

// Verifica si el horario no está vacío
if (horario != null && !horario.trim().isEmpty()) {
    // Verifica si el horario contiene las palabras " de " y " a "
    if (horario.contains(" de ") && horario.contains(" a ")) {
        // Dividimos primero por la palabra " de "
        String[] partes = horario.split(" de ");

        // La primera parte contiene los días (si existe)
        if (partes.length > 0) {
            String dias = partes[0].trim(); // Ejemplo: "lunes a viernes"

            // Dividimos los días por la palabra " a "
            if (!dias.isEmpty() && dias.contains(" a ")) {
                String[] diasPartes = dias.split(" a ");
                diaInicio = diasPartes.length > 0 ? diasPartes[0].trim() : "";
                diaFin = diasPartes.length > 1 ? diasPartes[1].trim() : "";
            }
        }

        // La segunda parte contiene las horas (si existe)
        if (partes.length > 1) {
            String horas = partes[1].trim(); // Ejemplo: "10:00 a 14:00"

            // Dividimos las horas por la palabra " a "
            if (!horas.isEmpty() && horas.contains(" a ")) {
                String[] horasPartes = horas.split(" a ");
                horaInicio = horasPartes.length > 0 ? horasPartes[0].trim() : "";
                horaFin = horasPartes.length > 1 ? horasPartes[1].trim() : "";
            }
        }
    }
}

request.setAttribute("diaInicio", diaInicio);
request.setAttribute("diaFin", diaFin);
request.setAttribute("horaInicio", horaInicio);
request.setAttribute("horaFin", horaFin);
                                
                        %>
                        
                        <fieldset style="display:flex;">
                            <legend>Horario de atención</legend>
                            
                            
                            
                 <table style="width:49%;"><tr>  
                     <caption>Días de atención</caption>
                         <td><label>Inicio:</label> </td>           
                            <td>
 
    <select id="diaUno" name="diaUno">
    <option value="${diaInicio}" selected>${diaInicio}</option>
    <% 
        String[] dias = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
        for(String dia : dias) {
            if(!dia.equals(diaInicio)) {
                out.println("<option value=\"" + dia + "\">" + dia + "</option>");
            }
        }
    %>
</select>
                     </tr>
                     <tr>
                            <td><label>Fin:</label> </td>                               
                                <td>
                                <select id="diaDos" name="diaDos">
    <option value="${diaFin}" selected>${diaFin}</option>
    <% 
        
        for(String dia : dias) {
            if(!dia.equals(diaFin)) {
                out.println("<option value=\"" + dia + "\">" + dia + "</option>");
            }
        }
    %>
</select>
                            </td></table>
                        
                        <table style="width:49%;"><tr>
                            <caption>Horario</caption>
                            <td><label>Inicio:</label></td>
                            <td><input type="time" name="horario1" value="${horaInicio}"></td></tr>
                            <tr>
                            <td><label>Fin:</label></td>
                            <td><input type="time" name="horario2" compararHoras() value="${horaFin}" ></td>
                </tr>
               </table>
                        </fieldset>
           
                        </fieldset>
  <br>
                        <center>   <input type="submit" id="Actualizar" value="Siguiente">
            <input type="reset" value="Restaurar"></center>

        </form>
                 
    </body>
    
<script>
    const formulario = document.getElementById('form');
    const guardarBtn = document.getElementById('Actualizar');
    const colorCambio = '#3085d6'; // Color azul cuando hay cambios
    let haCambiado = false; // Variable para detectar cambios

    // Guardar el estado inicial de los inputs como un atributo data-original-value
    function guardarEstadoInicial() {
        const inputs = formulario.querySelectorAll('input, select, textarea');
        inputs.forEach(input => {
            input.setAttribute('data-original-value', input.value.trim());
        });
    }

    // Cambia el color del botón al detectar cambios en los inputs
    formulario.addEventListener('input', () => {
        haCambiado = true; // Cambiamos la variable a true
        guardarBtn.style.backgroundColor = colorCambio; // Cambiar a azul si hay cambios
    });

    // Restablecer el color del botón al usar el botón reset
    formulario.addEventListener('reset', () => {
        setTimeout(() => {
            guardarBtn.style.backgroundColor = ''; // Color original
            guardarEstadoInicial(); // Actualizar el estado inicial
        }, 0);
    });

    // Mostrar la ventana emergente antes de enviar el formulario
    formulario.addEventListener('submit', function(event) {
        // Evitar el envío automático del formulario
        event.preventDefault();

        // Solo muestra la advertencia si se han realizado cambios
        if (haCambiado) {
            // Mostrar la ventana de confirmación con SweetAlert2
            Swal.fire({
                title: '¿Desea aplicar los cambios?',
                text: "Esta acción almacenará los cambios de manera permanente.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: colorCambio,
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, actualizar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    formulario.submit(); // Enviar el formulario si se confirma
                }
            });
        }
    });

    // Inicializar guardando el estado inicial del formulario
    guardarEstadoInicial();
</script>

    
    <script>
        function mostrarFechaHora() {
           const fecha = new Date();
            const campoTexto = document.getElementById("campoFechaHora");
            campoTexto.value = fecha.toLocaleString();
        }
      
        setInterval(mostrarFechaHora,1000);
    </script>
</html>
