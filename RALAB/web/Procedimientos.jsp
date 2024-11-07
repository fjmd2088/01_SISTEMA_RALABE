<%-- 
    Document   : Procedimientos
    Created on : 29 abr 2024, 12:54:16
    Author     : octavio.lozano
--%>

<%@page import="Combos.CargaCombosO"%>
<%@page import="Modelo.ConectaBD"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Combos.CargaCombosProcedimientos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CargaCombosProcedimientos obj = new CargaCombosProcedimientos();
    CargaCombosO cco = new CargaCombosO();
%>

<div class="tabWrap">
    <input id="tab-02" name="tab" type="radio" />
    <label class="tab label-02" for="tab-02"><span>2</span></label>
    <!-- tabContent 02 -->
    <article class="tabContent">
        <h1>Procedimientos</h1>
       
         <center>
                <label>Procedimiento a registrar</label>
                <select name="procedimientos" id="procedimientos" onchange = "mostrarProcedimientos()">
                    <option value="">---Seleccione un procedimiento---</option>
                    <option value="Ordinario">Ordinario</option>
                    <option value="Individual">Individual</option>
                    <option value="Colectivo">Colectivo</option>
                    <option value="Huelga">Huelga</option>
                    <option value="Colectivo de Naturaleza Economica">Colectivo de Naturaleza Económica</option>
                    <option value="Paraprocesal">Paraprocesal</option>
                    <option value="Terceria">Terceria</option>
                    <option value="Preferencia de Credito">Preferencia de Credito</option>
                    <option value="Ejecucion">Ejecucion</option>
                </select>
            </center>
        
        <!-- ññññññññññññññññññññññññññññññññññññ -->   
        <form id="f" action="GuardaProcedimiento" method="post">
            <div>
                <input type="text" name="caja">
            </div>
            <input type="submit" value="Guardar">
        </form>
    </article>
</div>
