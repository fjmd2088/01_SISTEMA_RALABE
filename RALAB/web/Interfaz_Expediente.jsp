<%-- 
    Document   : index
    Created on : 13 mar 2024, 15:29:27
    Author     : octavio.lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Expediente</title>
 <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="js/ValidacionesExpedientes.js" type="text/javascript"></script>


 <!-- <script src="js/ValidacionesGenerales.js" type="text/javascript"></script> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link REL="stylesheet" href="css/estiloOrganoJ.css">
  <link REL="stylesheet" href="css/menu.css">
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
    <a id="logo-header" href="index.jsp"><img src="IMAGENES/LOGO RALAB blanco.png" height="100"> &nbsp;&nbsp;&nbsp; ESTATAL</a>
    <nav> 
        <ul>
            <li><a href="index.jsp"><img src="IMAGENES/home.png" height="40"></a></li>
            <li><a href="index.jsp"><img src="IMAGENES/contacto.png" height="40">&nbsp;&nbsp; Contacto</a></li>
        </ul>
    </nav>
</header><!-- /#main-header -->
    <br>
 
    <br>
    <br>
    <br>
    <h2 style="background: var(--colorMean); padding: 20px;">Órgano Jurisdiccional</h2>

<form action="Guarda_generales" method="post">
    
  <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="id_org" class="out">Clave del órgano jurisdiccional  </label></td>
        <td><input type="text" name="cajaTexto" value="${sessionScope.id}" readonly class="out"> </td></table>
        <fieldset data-title="HOLA">
            <legend>Jueces(zas) adscritos(as) al órgano jurisdiccional</legend>
            <p style="color: white;">* La variable hace referencia al tipo de conflicto que atienden los jueces y juezas. </p>
        <table cellspacing="3" cellpadding="3" border="0" > 
        <tr>
            <td><label for="jih">Jueces individuales * <span class="req">*</label></td>
            <td><input type="number" id="jih" name="jih" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegA()" required min="0" oninput="validarNumeroPositivo(this)"></td>
             <td><label for="jim">Juezas individuales * <span class="req">*</label></td>
            <td><input type="number" id="jim" name="jim" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegB()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
          
        </tr>
           
         <tr>
             <td><label for="jch">Jueces colectivos * <span class="req">*</label></td>
            <td><input type="number" id="jch" name="jch" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegC()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
            <td><label for="jcm">Juezas colectivas * <span class="req">*</label></td>
            <td><input type="number" id="jcm" name="jcm" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegD()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
        </tr>
        
         <tr>
            <td><label for="jmh">Jueces mixtos * <span class="req">*</label></td>
            <td><input type="number" id="jmh" name="jmh" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegE()"   onblur="sumarValores()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
             <td><label for="jmm">Juezas mixtas * <span class="req">*</label></td>
             <td><input type="number" id="jmm" name="jmm" oninput="validarEntero(this)" onblur="sumarValores()" onchange="funcionNegF()"  onblur="sumarValores()" required min="0" oninput="validarNumeroPositivo(this)"></td>
        </tr>          
        
         <tr>
           <td><label for="sjh">Subtotal (jueces)</label></td>
            <td><input type="number" id="sjh" name="sjh" readonly ></td>
             <td><label for="sjm">Subtotal (juezas)</label></td>
            <td><input type="number" id="sjm" name="sjm" readonly></td>
        </tr>
    </table>
            
            
            
            
       <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="tj" class="out">Total de jueces y juezas</label></td>
           <td><input type="number" id="tj" name="tj"  readonly class="out"></td>
           </table>
                
            </fieldset>
        
        <fieldset>
            <legend>Cantidad de expedientes abiertos, según procedimiento</legend>
            
            <button class="round-button" type="button" onclick="openModal()">?</button>
            <div id="myModal" class="modal">
        <div class="modal-content" style="text-align: justify;">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 style="color: var(--colorMean);">Instrucciones</h2>
            <ol> 
                <li>Valor numérico “0”: este valor debe utilizarse cuando el órgano jurisdiccional en materia laboral tiene jurisdicción para dar trámite a los expedientes 
                según el tipo de procedimiento, sin embargo, no tiene registro de expedientes tramitados por esa vía.</li>
                <br>
                <li> Valor "NA": es equivalente a "No aplica", debe utilizarse cuando el órgano jurisdiccional en materia 
                laboral no tenga jurisdicción para conocer o dar trámite a los expedientes por cierto tipo de procedimiento.</li>
            </ol>    
        </div>
    </div>
            
            
          <table cellspacing="3" cellpadding="3" border="0" >
        <tr>
            <td><label for="ord">Ordinario <span class="req">*</span></label></td>
           <td><input type="text" id="ord" name="ord" onchange="funcionNeg1()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
            <td><label for="ind">Especial Individual <span class="req">*</label></td>
            <td><input type="text" id="ind" name="ind" onchange="funcionNeg2()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
        </tr>
       
         <tr>
           <td><label for="col">Especial Colectivo <span class="req">*</label></td>
            <td><input type="text" id="col" name="col" required min="-2" onchange="funcionNeg3()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
             <td><label for="huelga">Huelga <span class="req">*</label></td>
            <td><input type="text" id="huelga"name="huelga" required min="-2" onchange="funcionNeg4()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
        </tr>
       
         <tr>
           <td><label for="cne">Colectivo de naturaleza económica<span class="req">*</label></td>
            <td><input type="text" id="cne" name="cne" required min="-2" onchange="funcionNeg5()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
            <td><label for="pv">Paraprocesal o voluntario <span class="req">*</label></td>
            <td><input type="text" id="pv" name="pv" required min="-2" onchange="funcionNeg6()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
        </tr>
         <tr>
           
        </tr>
         <tr>
           <td><label for="ter">Tercerías <span class="req">*</label></td>
            <td><input type="text" id="ter" name="ter" required min="-2" onchange="funcionNeg7()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
            <td><label for="cred">Preferencia de crédito <span class="req">*</label></td>
            <td><input type="text" id="cred" name="cred" required min="-2" onchange="funcionNeg8()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
        </tr>
            <tr>
           <td><label for="eje">Ejecución <span class="req">*</label></td>
            <td><input type="text" id="eje" name="eje" required min="-2" onchange="funcionNeg9()" onblur="sumarExpedientes()" oninput="validarPositivoNA(this)"></td>
        </tr>
    </table> 
              <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="tj" class="out">Total de expedientes</label></td>
           <td><input type="text" id="totalExp" name="totalExp"  readonly class="out"></td>
           </table>
            </fieldset>
     <br>
     <center>
     <input type="submit" value="Guardar">
      <input type="reset" value="Limpiar"></center>
     </center>
</form>
</body>
 <script>
        
    </script> 
</html>