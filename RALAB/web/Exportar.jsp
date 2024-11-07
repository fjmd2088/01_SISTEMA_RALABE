<%-- 
    Document   : Exportar
    Created on : 17 jul 2024, 13:59:00
    Author     : octavio.lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EXPORTAR</title>
        <link REL="stylesheet" href="css/estiloOrganoJ.css">
<link REL="stylesheet" href="css/menu.css">
<link REL="stylesheet" href="css/tabla_resumen.css">
<script defer src="js/fecha.js"></script>
    </head>
    <body>
     
        <header id="main-header1">
    <a id="logo-header" href="index.jsp"><img src="IMAGENES/LOGO RALAB largo blanco.png" height="110"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
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
                    <a href="Exportar.jsp" style="background: darkcyan;"><img src="IMAGENES/base_datos.png" height="30">BASE DE DATOS</a>
                    
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
    <center> <img src="IMAGENES/obras.jpg" alt="Mi imagen"  width="700" height="500" style="margin-top:200px;"></h2></center>
        
    </body>
</html>
