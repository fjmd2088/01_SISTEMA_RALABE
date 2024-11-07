<%-- 
    Document   : Expediente_actores
    Created on : 3 ago 2024, 07:19:09
    Author     : octavio.lozano
--%>
<%@page import="Combos.CargaCombosO"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page import="Combos.CargaCombosActores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    CargaCombosProcedimientos obj = new CargaCombosProcedimientos();
    CargaCombosO cco = new CargaCombosO();
%>
<link REL="stylesheet" href="css/notas.css">
 <script src="js/jNotas.js" type="text/javascript"></script>
  