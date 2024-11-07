<%-- 
    Document   : newjsp
    Created on : 19 mar 2024, 12:59:18
    Author     : octavio.lozano00000
--%>
<%@page import="Modelo.ConectaBD"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RALAB</title>
<link REL="stylesheet" href="css/estiloOrganoJ.css">
<link REL="stylesheet" href="css/menu.css">
<link REL="stylesheet" href="css/tabla_resumen.css">
</head>
<body>
    
<section id="main-header" class="main-header">
    <div><img src="IMAGENES/INEGI_b.png" height="60"></div>
    <div>
    <h1>
        REGISTRO ADMINISTRATIVO EN MATERIA DE JUSTICIA LABORAL (ESTATAL)
        </h1></div>
    <div><img src="IMAGENES/ralab.png" height="60"></div>
    </section><!-- / #main-header -->
    <br>

 <nav>
  <ul class="menu">
      <li title="PÁGINA PRINCIPAL"><a href="index.jsp"><img src="IMAGENES/hogar.png" height="30"></a></li>
      <li title="ÓRGANOS JURISDICCIONALES"><a href="tablaO.jsp"><img src="IMAGENES/edificio.png" height="30"></a></li>
      <li title="EXPEDIENTES"><a href="Interfaz_main.jsp"><img src="IMAGENES/expediente.png" height="30"></a>
      <li title="EXPORTAR"><a href="Exportar.jsp"><img src="IMAGENES/exportar.png" height="30"></a></li>
      <li title="IMPORTAR"><a href="Importar.jsp"><img src="IMAGENES/importar.png" height="30"></a></li>
      <li title="DASHBOARD"><a href="Dashboard.jsp"><img src="IMAGENES/supervision.png" height="30"></a></li>
  </ul>
</nav>
    


<BR><BR>
<%
    ConectaBD obj=new ConectaBD();
    PreparedStatement ps;
    ResultSet rs;
    obj.conectar();
    ps=obj.con.prepareStatement("select tr_expediente.id_organoj, nombre_organoj, entidad, clave_expediente, tc_procedimiento.descripcion as procedimiento, tc_estatus_expediente.descripcion as estatus from TR_EXPEDIENTE join tc_procedimiento on tc_procedimiento.id_tipo_procedimiento =tr_expediente.id_tipo_expediente left join tc_estatus_expediente on tc_estatus_expediente.id_estatus_expediente=tr_expediente.id_estatus_exped join tr_organoj on tr_organoj.id_organoj=tr_expediente.id_organoj join tc_entidad_mpio on tc_entidad_mpio.id_ent_mpio=tr_organoj.id_ent_mpio order by id_organoj, id_tipo_expediente, clave_expediente");
    rs=null;
    rs=ps.executeQuery();
    
%>
<br><br>
<div>
    <center>
        
        <form action="Interfaz_main.jsp" method='get'>
            <input type='submit' value='Agregar'/>
        </form>
        <form action="Interfaz_main.jsp">
    <table border="1" class="summary_table">
        <caption>
        RESUMEN
        </caption>
        <thead>
            <tr><th class="summary_th">Clave del órgano jurisdiccional</th>
                <th class="summary_th">Nombre órgano</th>   
                <th class="summary_th">Entidad</th>   
                <th class="summary_th">Clave del expediente</th>    
            <th class="summary_th">Tipo de procedimiento </th> 
              <th class="summary_th">Estatus del expediente</th> 
             <th class="summary_th">Acciones </th>
             </tr>
             </thead>
        <%
            while(rs.next()){
        %> 
        
        <tr>
            <td><center><%= rs.getString("id_organoj")%></center></td>
            <td><center><%= rs.getString("nombre_organoj")%></center></td>
            <td><center><%= rs.getString("entidad")%></center></td>
            <td><center><%=rs.getString("clave_expediente") %></center></td>
            <td><center><%= rs.getString("procedimiento")%></center></td>
        <td><center> <%= rs.getString("estatus")%></center></td>              
            <td>
                
            <center> <input type="submit" value="Editar"></center>
               
            </td>
        </tr>
        
        <%
            }
        %>
    </table>
</center></form>
</div>

    <table>
        <tr>
            
        </tr>
    </table>
    
</body>
</html>
