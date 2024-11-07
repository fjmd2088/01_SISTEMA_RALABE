<%-- 
    Document   : InterfazOrdinario
    Created on : 25 mar 2024, 16:19:58
    Author     : octavio.lozano
--%>

<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procedimiento Ordinario</title>
         <link REL="stylesheet" href="css/estiloProcedimiento.css">
          <link REL="stylesheet" href="css/menu.css">
          <link REL="stylesheet" href="css/estiloOrganoJ.css">
          <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
          <script src="js/ValidacionesProcedimientos.js" type="text/javascript"></script>
    </head>
    <body>
        <<header id="main-header">
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
    <center><h2>Procedimiento ordinario</h2></center>
        <br>
         <%CargaCombosProcedimientos obj=new CargaCombosProcedimientos();%>
        <form >
            Selecciona un organo jurisdiccional:
            <select name="listaOrganos" id="listaOrganos">
             <option value=""> </option>
            <%
                List<String> organos=obj.listaOrganos();
                for(String dato : organos){
            %>
            <option value="<%= dato%>"><%= dato%></option><%}%>
            </select>

            <label>Clave del organo jurisdiccional: </label>
            <input type="text" id="clave" readonly>
            <br><br> 
           <label>Fecha de apertura del expediente </label>      
           <input type="date" id="fecha" >
           <br><br> 
           
          
           <label>Tipo de asunto</label>
           <select name="asunto" id="asunto" onchange = "mostrarOcultarContrato()">
               <option value="">--Seleccione un tipo de asunto--</option>
               <option value="Individual">Individual</option>
               <option value="Colectivo">Colectivo</option>
           </select>
           <br><br> 
           
            <label>Naturaleza del conflicto </label>      
           <input type="text" id="naturaleza" value="Jurídico" readonly >
           <br><br>
           
  
           <div id="divContrato">
           <label>¿El trabajador contó con contrato escrito? </label>
           <select name="contrato" id="contrato" onchange="mostrarOcultarTipoContrato()">
               <option value="">--Seleccione una opción--</option>
               <option value="Sí">Sí</option>
               <option value="No">No</option>
           </select>
        
           <br><br>
           
           <div id="divTipoContrato">
            <label>Tipo de contrato </label>
            <select name="tipoContrato" id="tipoContrato" >
               <option value="">--Seleccione tipo de contrato--</option>
               <option value="Sí">Individual</option>
               <option value="No">Colectivo</option>
           </select>
           </div>
           </div>
    
           <br><br> 
           
             <label>Rama de la industria involucrada </label>      
           <input type="text" id="industria" >
           <br><br>
           
           
            
            
        </form>
        
    </body>
</html>
