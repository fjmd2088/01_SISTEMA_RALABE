<%-- 
    Document   : registroGuardado
    Created on : 13 mar 2024, 15:30:24
    Author     : octavio.lozano
--%>

<%@page import="Modelo.ConectaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registro guardado exitosamente</h1>
      
       <CENTER>CLAVE DEL ORGANO JURISDICCIONAL: <input type="text" name="cajaTexto" value="${requestScope.id}" /></center>
       <BR><BR>
        <a href="Interfaz_Expediente.jsp?valor=${id}">CONTINUAR</a>
      
        
        <br><br>
        
       
    </body>
</html>
