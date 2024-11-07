<%-- 
    Document   : Redireccionar
    Created on : 2 abr 2024, 16:18:38
    Author     : octavio.lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redireccionando...</title>
    </head>
    <body><% 
    String option = request.getParameter("option");
    if(option != null && !option.isEmpty()) {
        response.sendRedirect(option);
    } else {
        out.println("No se seleccionó ninguna opción.");
    }
%>

    </body>
</html>
