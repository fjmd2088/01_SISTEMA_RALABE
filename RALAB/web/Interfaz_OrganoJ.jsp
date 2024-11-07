<%-- 
   Document   : OrganoJurisdiccional
   Created on : 29 feb 2024, 10:18:28
   Author     : octavio.lozano
--%>
<%@ page import="java.util.List" %>
<%@ page import="Combos.CargaCombosO" %>
<%@ page import="java.sql.*"%>
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
    <a id="logo-header" href="index.jsp"><img src="IMAGENES/LOGO RALAB blanco.png" height="100"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
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
       
        <%CargaCombosO consulta = new CargaCombosO();%>
        <form id="form" action="Guarda_organo" method="post">
            <br>
            <div style="display: none">
                <input type="text" id="campoFechaHora" name="campoFechaHora" readonly>
            </div>
              <fieldset>
                <legend>Datos del órgano jurisdiccional</legend>
            <table cellspacing="3" cellpadding="3" border="0" >               
                <tr>
                    <td><label for="nombre">Nombre del órgano jurisdiccional <span class="req">* </label></td>
                    <td><input type="text" id="nombre" name="nombre" oninput="validarYConvertir(this)" required></td>
                    <td><label for="sede">Sede del órgano jurisdiccional <span class="req">*</label></td>
                    <td><input type="text" id="sede" name="sede" oninput="validarYConvertirSEDE(this)" required ></td>
                </tr>
            </table>
             </fieldset>
            
                <!-----------#############- MUESTRA EL COMBOBOX DE ENTIDAD -#############----------->
                   <fieldset>
                <legend>Ubicación del órgano jurisdiccional</legend>
                <table cellspacing="3" cellpadding="3" border="0" >      
                <tr>
                    <td><label for="E">Entidad <span class="req">*</label></td>
                    <td> <select id="E" name="E"  required>
                            <option value="">---Seleccione Entidad---</option>
                            <%
                                List<String> resultadosEnt = consulta.consultaEntidad();
                                for (String dato : resultadosEnt) {
                            %>
                            <option value="<%= dato%>"><%= dato%></option>
                            <% } %>
                        </select>
                    </td>
                    
                     <td><label for="mun">Municipio <span class="req">*</label></td>
                    <td>
                        <select id="M" name="M" required>
                            <option value="">---Seleccione Municipio---</option>
                        </select>
                    </td>
                    
                     <td><label for="colonia">Colonia <span class="req">* </label></td>
                    <td><input type="text" name="colonia" oninput="validarYConvertirTextNum(this)" required focusVisible="true"></td>
                </tr>
                <tr>
                     <td><label for="latitud">Latitud </label></td>
                     <td><input type="text" id="latitud" pattern="^-?\d*\.?\d+$" name="latitud" onblur="funcionLatitud(this)"> </td>
                    <td><label for="longitud">Longitud </label></td>
                    <td><input type="text" id="longitud" pattern="^-?\d*\.?\d+$" name="longitud"  onblur="funcionLongitud(this)" ></td>
                    <td></td>
<!--                    <td><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3811821.5591925285!2d-99.7520803486136!3d21.093341805310025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2smx!4v1712094975426!5m2!1ses-419!2smx" 
                                 width="200" height="200" style="border:0;" allowfullscreen="busca Long y Lat" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></td>-->
                </tr>
                </table>
                   </fieldset>
                        
                 <fieldset>
                <legend>Circunscripción y Jurisdicción del OJ</legend>        
                <table cellspacing="3" cellpadding="3" border="0" >  
                <tr>
                    <td><label for="circunscripcion">Circunscripción <span class="req">*</label></td>
                    <td><select name="C" id="C" onchange="habilitar()" required>
                             <option value="">---Seleccione Circunscripción---</option>
                            <%
                                List<String> resultadosCir = consulta.consultaCircunscripcion();
                                for (String datos : resultadosCir) {
                            %>
                            <option value="<%= datos%>"><%= datos%></option>
                            <% } %>
                        </select>  </td> 
                    
                     <td><label for="OtraCir" >Especifique</td></label></td>
                    <td><input type="text" id="OtraCir" name="OtraCir" oninput="validarYConvertir(this)" disabled>
                     <td><label for="jurisdiccion">Jurisdicción <span class="req">* </label></td>
                    <td><select name="J" required>
                             <option value="">---Seleccione Jurisdicción---</option>
                            <%
                                List<String> resultadosJur = consulta.consultaJurisdiccion();
                                for (String datos : resultadosJur) {
                            %>
                            <option value="<%= datos%>"><%= datos%></option>
                            <% }%>
                        </select> </td>
                </tr></table>
                        
                        <fieldset style="display:flex;">
                            <legend>Horario de atención</legend>
                 <table style="width:49%;"><tr> 
                     <caption style="color: var(--colorLabel); background: var(--colorMeanTrans);">Días de atención</caption>
                         <td><label>Día inicio:</label> </td>           
                            <td>
                                <select id="diaUno" name="diaUno">
                                    <option>---Día inicio---</option>
                                    <option>Lunes</option>
                                    <option>Martes</option>
                                    <option>Miércoles</option>
                                    <option>Jueves</option>
                                    <option>Viernes</option>
                                    <option>Sábado</option>
                                    <option>Domingo</option>                        
                                </select></td>
                     </tr>
                     <tr>
                            <td><label>Día fin:</label> </td>                               
                                <td>
                                 <select id="diaDos" name="diaDos">
                                    <option>---Día fin---</option>
                                    <option>Lunes</option>
                                    <option>Martes</option>
                                    <option>Miércoles</option>
                                    <option>Jueves</option>
                                    <option>Viernes</option>
                                    <option>Sábado</option>
                                    <option>Domingo</option>  
                        
                                </select>
                            </td></table>
                        
                        <table style="width:49%;"><tr>
                                <caption style="color: var(--colorLabel); background: var(--colorMeanTrans);">Horario de atención</caption>
                            <td><label>Hora inicio:</label></td>
                            <td><input type="time" name="horario1"></td>
                            <tr>
                            <td><label>Hora fin:</label></td>
                            <td><input type="time" name="horario2" compararHoras()></td>
                </tr>
               </table>
                        </fieldset>
                        </fieldset>
  <br>
            <center>   <input type="submit" id="Guardar" value="Guardar" >
            <input type="reset" value="Limpiar"></center>

        </form>
                        
                        <script>
    const formulario = document.getElementById('form');
    const guardar = document.getElementById('Guardar');

    formulario.addEventListener('input', () => {
        guardar.style.backgroundColor = 'blue';
    });
</script>
    </body>
</html>
