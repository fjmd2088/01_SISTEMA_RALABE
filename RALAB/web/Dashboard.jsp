<%-- 
    Document   : Dashboard
    Created on : 17 jul 2024, 13:59:12
    Author     : octavio.lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.jfree.chart.*" %>
<%@ page import="org.jfree.chart.plot.*" %>
<%@ page import="org.jfree.chart.renderer.category.*" %>
<%@ page import="org.jfree.data.category.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>DASHBOARD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link REL="stylesheet" href="css/estiloOrganoJ.css">
    <link REL="stylesheet" href="css/menu.css">
    <link REL="stylesheet" href="css/tabla_resumen.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script defer src="js/fecha.js"></script>
    
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
                <li class="menu-item" title="EXPEDIENTES" >
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
                    <a href="Dashboard.jsp" style="background: darkcyan;"><img src="IMAGENES/tendencia.png" height="30" >ESTADÍSTICAS</a>
                    
                </li>
            </ul>
        </nav>
    </div>
    <br>
    <style>
        .container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: 20px;
            flex: 3;
        }

        .chart-container {
            width: 500px;
            height: 300px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container" style="margin-top:200px;">
       

        <div class="chart-container">
            <canvas id="barChart"></canvas>
        </div>

        <div class="chart-container">
            <canvas id="lineChart"></canvas>
        </div>

        <div class="chart-container">
            <canvas id="pieChart"></canvas>
        </div>
    </div>

    <script>
        // Datos para el gráfico de barras
        const barChartData = {
            labels: ["Categoría 1", "Categoría 2", "Categoría 3"],
            datasets: [{
                label: "Valores",
                data: [10, 20, 30],
                backgroundColor: ["red", "blue", "green"],
                borderColor: ["red", "blue", "green"],
                borderWidth: 1
            }]
        };

        // Crear el gráfico de barras
        const barChart = new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: barChartData,
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'Gráfico de barras'
                }
            }
        });

        // Datos para el gráfico de líneas
        const lineChartData = {
            labels: ["Enero", "Febrero", "Marzo", "Abril"],
            datasets: [{
                label: "Ventas",
                data: [50, 60, 70, 80],
                fill: true,
                backgroundColor: "rgba(225, 0, 0, 0.2)",
                borderColor: "red",
                borderWidth: 2
            }]
        };

        // Crear el gráfico de líneas
        const lineChart = new Chart(document.getElementById('lineChart'), {
            type: 'line',
            data: lineChartData,
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'Gráfico de líneas'
                }
            }
        });

        // Datos para el gráfico de tarta
        const pieChartData = {
            labels: ["Categoría A", "Categoría B", "Categoría C"],
            datasets: [{
                data: [30, 50, 20],
                backgroundColor: ["blue", "green", "yellow"],
                borderColor: ["white", "white", "white"],
                borderWidth: 1
            }]
        };

        // Crear el gráfico de tarta
        const pieChart = new Chart(document.getElementById('pieChart'), {
            type: 'pie',
            data: pieChartData,
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'Gráfico de tarta'
                }
            }
        });
    </script>
    
 
</body>
</html>