<%-- 
    Document   : muestraOrgano
    Created on : 10 abr 2024, 13:03:28
    Author     : octavio.lozano
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link REL="stylesheet" href="css/menu.css">
          <link REL="stylesheet" href="css/estiloOrganoJ.css">
    </head>
    <%   ConectaBD obj=new ConectaBD();
            CargaCombosProcedimientos obj2=new CargaCombosProcedimientos();
    %>
    <body>
        
        <header id="main-header">
   <img src="IMAGENES/INEGI_b.png" width="60" height="60">
    <h1>
        REGISTRO ADMINISTRATIVO EN MATERIA DE JUSTICIA LABORAL (ESTATAL)
        </h1>
   <img src="IMAGENES/ralab.png" height="50">
    </header><!-- / #main-header -->
    <br>
    
    
     <nav>
  <ul class="menu">
    <li><a href="index.jsp"><img src="IMAGENES/home.png" height="30"></a></li>  
  </ul>
</nav>
 
<br>
<br>

<h2>Expediente</h2>
        
        <form>
            <center><select id="claveO" name="claveO"   required>
                            <option value="">---Seleccione órgano jurisdiccional---</option>
                            <%
                                List<String> resultados = obj2.listaOrganos();
                                for (String dato : resultados) {
                            %>
                            <option value="<%= dato%>"><%= dato%></option>
                            <% } %>
         </select>
         <input type="submit" value="Buscar"></center>
        </form>
         <%  %>
        <br><br>
       
        <%
            String valorSeleccionado = request.getParameter("claveO") ;
            PreparedStatement ps;
            ResultSet rs;
            obj.conectar();
            ps=obj.con.prepareStatement("SELECT TR_ORGANOJ.ID_ORGANOJ,tr_organoj.nombre_organoj,TR_ORGANOJ.SEDE_ORGANOJ,TC_ENTIDAD_MPIO.ENTIDAD, TC_ENTIDAD_MPIO.MUNICIPIO, TR_ORGANOJ.COLONIA,TR_ORGANOJ.LONGITUD, TR_ORGANOJ.LATITUD,TC_CIRCUNSCRIPCION.DESCRIPCION AS CIRCUNSCRIPCION, TC_JURISDICCION.DESCRIPCION AS JURISDICCION,TR_ORGANOJ.HR_ATENCION, TR_GENERAL.* FROM TR_ORGANOJ inner join tc_entidad_mpio on tc_entidad_mpio.id_ent_mpio=TR_ORGANOJ.id_ent_mpio inner join tc_circunscripcion on tc_circunscripcion.id_circunscripcion=TR_ORGANOJ.id_circunscripcion inner join tc_jurisdiccion on tc_jurisdiccion.id_jurisdiccion=TR_ORGANOJ.id_jurisdiccion inner join TR_GENERAL on tr_general.id_organoj=TR_ORGANOJ.id_organoj where tr_organoj.nombre_organoj = '"+valorSeleccionado+"'");
            rs=ps.executeQuery();
            while (rs.next()) {
        %>
    <center>
        <table border="1">
            <tr>
                <td>
                     <table>
            <tr>
                <td><label for="clave">Clave del organo jurisdiccional: </label> </td>
                <td><input type="text" name="clave" value="<%=rs.getString("id_organoj") %>" readonly disabled></td>
            </tr>
            <tr>
                <td><label> Nombre del organo jurisdiccional: </label></td>
                <td><input type="text" name="nombre" value="<%=rs.getString("nombre_organoj") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Sede del órgano jursidiccional: </label></td>
                 <td> <input type="text" name="sede" value="<%=rs.getString("sede_organoj") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Entidad:</label></td>
                 <td><input type="text" name="entidad" value="<%=rs.getString("entidad") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Municipio: </label></td>
                 <td><input type="text" name="municipio" value="<%=rs.getString("municipio") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Colonia: </label></td>
                 <td><input type="text" name="colonia" value="<%=rs.getString("colonia") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label> Latitud: </label></td>
                 <td><input type="text" name="latitud" value="<%=rs.getString("latitud") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label> Longitud: </label></td>
                 <td><input type="text" name="longitud" value="<%=rs.getString("longitud") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>  Circunscripcion:</label></td>
                 <td><input type="text" name="circunscripcion" value="<%=rs.getString("circunscripcion") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Jurisdiccion: </label></td>
                 <td> <input type="text" name="jurisdiccion" value="<%=rs.getString("jurisdiccion") %>" readonly disabled></td>
            </tr>
             <tr>
                 <td><label>Horario de atencion:</label></td>
                 <td><input type="text" name="horario" value="<%=rs.getString("hr_atencion") %>" readonly disabled></td>
            </tr>
        </table> 
                </td>
                <td>
                    <table>
                   <tr>
                         <td><label>Jueces Individuales Hombres</label></td>
                         <td><input type="text" value="<%=rs.getString("juez_individua_h") %>" readonly disabled></td>
                   </tr>
                     <tr>
                         <td><label>Jueces Colectivos Hombres</label></td>
                         <td><input type="text" value="<%=rs.getString("juez_colectivo_h") %>" readonly disabled></td>
                   </tr>
                     <tr>
                         <td><label>Jueces Mixtos Hombres</label></td>
                         <td><input type="text" value="<%=rs.getString("juez_mixto_h") %>" readonly disabled></td>
                   </tr>
                     <tr>
                         <td><label>Jueces Individuales Mujeres</label></td>
                         <td><input type="text" value="<%=rs.getString("juez_individual_m") %>" readonly disabled></td>
                   </tr>
                     <tr>
                         <td><label>Jueces Colectivos Mujeres</label></td>
                         <td><input type="text"  value="<%=rs.getString("juez_colectivo_m") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Jueces Mixtos Mujeres</label></td>
                       <td><input type="text"  value="<%=rs.getString("juez_mixtos_m") %>" readonly disabled></td>
                   </tr>
                     <tr>
                         <td><label>Subtotal Jueces Hombres</label></td>
                         <td><input type="text"  value="<%=rs.getString("subtotal_juez_h") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Subtotal Jueces Mujeres</label></td>
                       <td><input type="number" value="<%=rs.getString("subtotal_juez_m") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Total de jueces</label></td>
                       <td><input type="number" value="<%=rs.getString("total_jueces") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       
                   </tr>
                   <tr>
                       <td><label>Ordinario</label></td>
                       <td><input type="number" value="<%=rs.getString("total_ordinario") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Individual</label></td>
                       <td><input type="number" value="<%=rs.getString("total_individual") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Colectivo</label></td>
                       <td><input type="number" value="<%=rs.getString("total_colectivo") %>" readonly disabled></td>
                   </tr>
                   <tr>
                       <td><label>Huelga</label></td>
                       <td><input type="number" value="<%=rs.getString("total_huelga") %>" readonly disabled></td>
                   </tr>
                     <tr>
                       <td><label>Colectivo de Naturaleza Economica</label></td>
                       <td><input type="number" value="<%=rs.getString("total_col_nat_econ") %>" readonly disabled></td>
                   </tr>
                     <tr>
                       <td><label>Paraprocesal</label></td>
                       <td><input type="number" value="<%=rs.getString("total_paraprocesal") %>" readonly disabled></td>
                   </tr>
                     <tr>
                       <td><label>Tercería</label></td>
                       <td><input type="number" value="<%=rs.getString("total_tercerias") %>" readonly disabled></td>
                   </tr>
                     <tr>
                       <td><label>Preferencia de crédito</label></td>
                       <td><input type="number" value="<%=rs.getString("total_pref_cred") %>" readonly disabled></td>
                   </tr>
                     <tr>
                       <td><label>Ejecución</label></td>
                       <td><input type="number" value="<%=rs.getString("total_ejecucion") %>" readonly disabled></td>
                   </tr>
               </table>
                </td>
            </tr>
        </table>
    </center>
         
               <%
                   }
                   rs.close();
                   obj.con.close();
               %>
               <br>
    <center>
                <a href="index.jsp">
                     <button type="button">Regresar <img src="IMAGENES/Go_back.png" height="10"></button>
               </a>
        
               <a href="#">
                     <button type="button">Guardar</button>
               </a>
    </center>
    </body>
    <script>
       function valorV(){
                var valor= document.getElementById("claveO").value;
       }
    </script>
</html>
