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
          <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
          <%
              out.println(request.getParameter("actualiza"));
              String actualiza = request.getParameter("actualiza");
              if(actualiza !=null)
              {
                   if(actualiza.equals("Si"))
                    {
                         out.println("<SCRIPT>");
                         out.println("Swal.fire({");
                         out.println("  position: 'top-end',"); // Use single quotes for string literals
                         out.println("  icon: 'success',"); // Consistent indentation and single quotes
                         out.println("  title: 'Los datos fueron guardados exitosamente',"); // Clear message
                         out.println("  showConfirmButton: false,"); // Disable confirmation button
                         out.println("  timer: 3000"); // Timer in milliseconds
                         out.println("});");
                         out.println("</SCRIPT>");
                    }
               }
          %>
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
             
                           <form action="Interfaz_main.jsp" method='get'>
                           <input type='submit' value='+ Nuevo'/>
                           </form>
              <filedset class="secuencial">   
                  <legend>Editar expedientes</legend>
              <table>
                  <tr>
                      
                      <td>
                           <form action="Expediente_8_editar.jsp" method='get'>
                                
                                <select name="organo" id="organo" style="width: 600px" onchange="busqueda('organo', 'expEdit', 'valor')" required>
                                  <option value="">---Seleccione órgano jurisdiccional---</option>
                                 <%
                                   SQL_Generales consulta = new SQL_Generales();
                                   List<String> result = consulta.consultaOrganos();
                                   List<String> valores = consulta.consultaOrganos3();
                                   int i=0;
                                   String val;
                                   for (String datos : result) {
                                        val = valores.get(i);
                                        i++;
                                   %>
                                  <option value="<%= val%>"><%= datos%></option>
                                  <%
                                    }
                                  %>
                             </select> 
                               <select name="expEdit" id="expEdit" style="width: 300px" onchange="busqueda('organo', 'expEdit', 'valor')" required>
                                   <option>---Seleccione un procedimiento---</option>
                                   <option >Ordinario</option>
                                   <option >Especial individual</option>
                                   <option >Especial colectivo</option>
                                   <option >Huelga</option>
                                   <option >Colectivo de naturaleza económica</option>
                                   <option >Paraprocesal</option>
                                   <option >Tercerías</option>
                                   <option >Preferencia de crédito</option>
                                   <option >Ejecución</option>
                               </select>
                               <select name="valor" id="valor" style="width: 300px" required>
                                  <option value="">---Seleccione un expediente---</option>
                                 <%
                                   //SQL_Generales consulta = new SQL_Generales();
                                   List<String> resultadosOrg = obj2.listaExpedientes();
                                   for (String datos : resultadosOrg) {
                                       
                                   %>
                                  <option value="<%= datos%>"><%= datos%></option>
                                  <%
                                    }
                                  %>
                             </select> 
                        
                             <input type='submit' value='Editar'/>
                             
                         </form>
                   </td>
                   <td>
                       
                   </td>
                 </tr>
              </table>
                             <center><input type="reset" value="Limpiar"></center>
                             </filedset>      
            <BR>
          
        <table border="1" style="float: center;" width="30%" class="summary_table">
        <tr>
            <th>No. </th>
            <th>Vía de tramitación </th>
            <th>Clave del órgano jurisdiccional </th>
            <th>Clave del expediente </th>
            <th>Incompetencia* </th>
            <th>Estatus del expediente</th> 
        </tr>     
        <tr>
         <%   
            ps=obj.con.prepareStatement("SELECT id_expediente, TC_PROCEDIMIENTO.DESCRIPCION AS tipo_expediente, id_organoj, clave_expediente, " +
    "preg_incompetencia, TC_ESTATUS_EXPEDIENTE.DESCRIPCION AS estatus_exped " +
    "FROM TR_EXPEDIENTE " +
    "LEFT JOIN TC_PROCEDIMIENTO ON TC_PROCEDIMIENTO.id_tipo_procedimiento = TR_EXPEDIENTE.id_tipo_expediente " +
    "LEFT JOIN TC_ESTATUS_EXPEDIENTE ON TC_ESTATUS_EXPEDIENTE.ID_ESTATUS_EXPEDIENTE = TR_EXPEDIENTE.ID_ESTATUS_EXPED");
            rs=ps.executeQuery();
            while (rs.next()) {
        %>
                  <td><center> <%= rs.getString("id_expediente").toUpperCase().trim()%></center></td>
                  <td><center> <%= rs.getString("tipo_expediente").toUpperCase().trim()%></center></td>
                  <td><center> <%= rs.getString("id_organoj").toUpperCase().trim()%></center> </td>
                  <td><center> <%= rs.getString("clave_expediente").toUpperCase().trim()%></center></td>
                  <td><center><%= ("null".equalsIgnoreCase(rs.getString("preg_incompetencia")) || rs.getString("preg_incompetencia").trim().isEmpty()) ? "---" : rs.getString("preg_incompetencia").toUpperCase() %></center></td>
                  <td><center> <%= rs.getString("estatus_exped").toUpperCase().trim()%></center></td>       
        </tr>
          <% } %>
        </table>
        <label style="font-size: 10px;">* Para procedimientos no contenciosos, el valor asignado es "---".</label>
           
            </center>
        </div> 
    </body>
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
            expEdit: expEdit
        
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
document.getElementById("comboBuscart").addEventListener("change", function() {
            var selectedValue = this.value;
            window.location.href = "muestraOrgano.jsp?valorSeleccionado=" + selectedValue;
        });
 
    </script>
</html>
