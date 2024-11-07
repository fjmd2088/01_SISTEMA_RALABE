<%-- 
    Document   : tablaO
    Created on : 4 abr 2024, 12:00:53
    Author     : octavio.lozano
--%>

<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="Combos.CargaCombosO"%>
<%@page import="Combos.SQL_Generales"%>
<%@page import= "java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Órganos Jurisdiccionales</title>
        <link REL="stylesheet" href="css/estiloOrganoJ.css">
        <link REL="stylesheet" href="css/menu.css">
        <link REL="stylesheet" href="css/tabla_resumen.css">
        <link REL="stylesheet" href="css/postit.css">
        <script defer src="js/fecha.js"></script>
    </head>
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
                <li class="menu-item" title="ÓRGANOS JURISDICCIONALES"  style="background: darkcyan;">
                    <a href="tablaO.jsp"><img src="IMAGENES/banco.png" height="30">ÓRGANOS JURISDICCIONALES</a>
                   
                </li>
                <li class="menu-item" title="EXPEDIENTES">
                    <a href="tablaP.jsp"><img src="IMAGENES/expediente.png" height="30">EXPEDIENTES</a>
                    <div class="submenu">
                        <p>Agrega, edita, consulta o elimina los Órganos Jurisdiccionales almacenados en la base de datos.</p>
                    </div>
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
    <%-----------------------------------------------------------------------------------------------------------------------------------------------------------------%>
        <div style="background: rgba(1, 49, 79,.7);margin-top:150px; padding: 20px 5px;">
            <center>
            <BR>
              <%CargaCombosProcedimientos obj2=new CargaCombosProcedimientos();
                  ConectaBD obj=new ConectaBD();
                  PreparedStatement ps;
                  ResultSet rs;
                  obj.conectar();
              %>
             
              <table>
                  <tr>
                      <td>
                           <form action="Interfaz_OrganoJ.jsp" method='get'>
                           <input type='submit' value='+ Nuevo'/>
                           </form>
                      </td>
                      <td>
                           <form action="Interfaz_OrganoJ_editar.jsp" method='get'>
                               <select name="valor" id="valor" style="width: 600px" required>
                                  <option value="">---Seleccione organo---</option>
                                 <%
                                   SQL_Generales consulta = new SQL_Generales();
                                   List<String> resultadosOrg = consulta.consultaOrganos();
                                   List<String> valores = consulta.consultaOrganos3();
                                   int i=0;
                                   String val;
                                   for (String datos : resultadosOrg) {
                                        val = valores.get(i);
                                        i++;
                                   %>
                                  <option value="<%= val%>"><%= datos%></option>
                                  <%
                                    }
                                  %>
                             </select> 
                 
                             <input type='submit' value='Editar'/>
                         </form>
                   </td>
                 </tr>
              </table>
       
             
       
            <BR>
             <%
             %>
              
             
        
            
        <table border="1" style="float: center;" width="30%" class="summary_table">
        <tr>
            <th>Clave </th>
            <th>Nombre </th>
            <th>Sede </th>
            <th>Entidad </th>
            <th>Municipio </th>
            <th>Colonia </th>
            <th>Latitud </th>
            <th>Longitud</th>
            <th>Circunscripción </th>
            <th>Jurisdicción </th>
            <th>Horario de atención </th>
         
            </tr>     
            <tr>
                  <%
           
            ps=obj.con.prepareStatement("SELECT TR_ORGANOJ.ID_ORGANOJ,tr_organoj.nombre_organoj,TR_ORGANOJ.SEDE_ORGANOJ,TC_ENTIDAD_MPIO.ENTIDAD,TC_ENTIDAD_MPIO.MUNICIPIO, TR_ORGANOJ.COLONIA,TR_ORGANOJ.LONGITUD, TR_ORGANOJ.LATITUD,TC_CIRCUNSCRIPCION.DESCRIPCION AS CIRCUNSCRIPCION,TC_JURISDICCION.DESCRIPCION AS JURISDICCION,TR_ORGANOJ.HR_ATENCION FROM TR_ORGANOJ inner join tc_entidad_mpio on tc_entidad_mpio.id_ent_mpio=TR_ORGANOJ.id_ent_mpio inner join tc_circunscripcion on tc_circunscripcion.id_circunscripcion=TR_ORGANOJ.id_circunscripcion inner join tc_jurisdiccion on tc_jurisdiccion.id_jurisdiccion=TR_ORGANOJ.id_jurisdiccion ");
            rs=ps.executeQuery();
            while (rs.next()) {
        %>
                  <td> <%= rs.getString("id_organoj")%></td>
                  <td> <%= rs.getString("nombre_organoj")%></td>
                  <td> <%= rs.getString("sede_organoj")%></td>
                  <td> <%= rs.getString("entidad")%></td>
                  <td> <%= rs.getString("municipio")%></td>
                  <td> <%= rs.getString("colonia")%></td>
                  <td> <%= rs.getString("latitud")%></td>
                  <td> <%= rs.getString("longitud")%></td>
                  <td> <%= rs.getString("circunscripcion")%></td>
                  <td> <%= rs.getString("jurisdiccion")%></td>
                  <td> <%= rs.getString("hr_atencion")%></td>
                 
                
                </tr>
          <% } %>
        </table>
             
            </center>
        </div>
         
        <div>
            
             
        </div>
        
    </body>
    <script>
        document.getElementById("comboBuscart").addEventListener("change", function() {
            var selectedValue = this.value;
            window.location.href = "muestraOrgano.jsp?valorSeleccionado=" + selectedValue;
        });
    </script>
</html>
