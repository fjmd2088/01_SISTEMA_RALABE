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
<link REL="stylesheet" href="css/postit.css">
 <script defer src="js/fecha.js"></script>
</head>
<body>
    
<header id="main-header1">
    <a id="logo-header"><img src="IMAGENES/LOGO RALAB largo blanco.png" height="110"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
    <nav> 
        <ul>
            <li><a href="index.jsp"><img src="IMAGENES/home.png" height="40"></a></li>
            <li><a href="tablaO_1.jsp"><img src="IMAGENES/contacto.png" height="40">&nbsp;&nbsp; Contacto</a></li>
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
<li class="menu-item" title="ÓRGANOS JURISDICCIONALES">
<a href="tablaO.jsp"><img src="IMAGENES/banco.png" height="30">ÓRGANOS JURISDICCIONALES</a>
<div class="submenu">
<p>Agrega, edita, consulta o elimina los Órganos Jurisdiccionales almacenados en la base de datos.</p>
</div>
</li>
<li class="menu-item" title="EXPEDIENTES">
<a href="tablaP.jsp"><img src="IMAGENES/expediente.png" height="30">EXPEDIENTES</a>
<div class="submenu">
<p>Agrega, edita, consulta o elimina expedientes asociados a un órgano jurisdiccional, por vía de tramitación.</p>
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


<BR><BR>
<%
    ConectaBD obj = new ConectaBD();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    int cantExp = 0;
    int cantSolucionado = 0;
    int cantTramite = 0;
    int cantIncompetencia=0;

    try {
        obj.conectar();

        // Primera consulta
        ps = obj.con.prepareStatement("SELECT COUNT(*) AS cant_exp FROM TR_EXPEDIENTE");
        rs = ps.executeQuery();
        if (rs.next()) {
            cantExp = rs.getInt("cant_exp");
        }
        rs.close();
        ps.close();

        // Segunda consulta
        ps = obj.con.prepareStatement("SELECT COUNT(*) AS cant_solucionado FROM TR_EXPEDIENTE WHERE ID_ESTATUS_EXPED = 1");
        rs = ps.executeQuery();
        if (rs.next()) {
            cantSolucionado = rs.getInt("cant_solucionado");
        }
        rs.close();
        ps.close();

        // Tercera consulta
        ps = obj.con.prepareStatement("SELECT COUNT(*) AS cant_tramite FROM TR_EXPEDIENTE WHERE ID_ESTATUS_EXPED = 2");
        rs = ps.executeQuery();
        if (rs.next()) {
            cantTramite = rs.getInt("cant_tramite");
        }
          // Segunda consulta
        ps = obj.con.prepareStatement("SELECT COUNT(*) AS cant_incompetencia FROM TR_EXPEDIENTE WHERE PREG_INCOMPETENCIA = 'Sí' ");
        rs = ps.executeQuery();
        if (rs.next()) {
            cantIncompetencia = rs.getInt("cant_incompetencia");
        }
        rs.close();
        ps.close();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (obj.con != null) try { obj.con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<br><br>

<div class="post-it-container">
    
        <fieldset class="post-it">
             <h1><%= cantTramite %></h1>
            <p>EXPEDIENTES EN TRÁMITE</p>
        </fieldset>
        <fieldset class="post-it">
             <h1><%= cantSolucionado %></h1>
            <p>EXPEDIENTES SOLUCIONADOS</p>
        </fieldset>
        <fieldset class="post-it" style="background-color: rgba(16, 9, 77, 0.4);">
             <h1><%= cantIncompetencia %></h1>
            <p>EXPEDIENTES INCOMPETENCIA</p>
        </fieldset>
        <fieldset class="post-it" style="background-color: rgba(16, 9, 77, 0.85);">
            <h1><%= cantExp %></h1>
            <p>TOTAL DE EXPEDIENTES</p>
        </fieldset>
    </div>

</body>
</html>
