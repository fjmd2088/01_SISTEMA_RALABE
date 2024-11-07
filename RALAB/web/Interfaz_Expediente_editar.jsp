<%-- 
    Document   : index
    Created on : 13 mar 2024, 15:29:27
    Author     : octavio.lozano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Modelo.ConectaBD"%>
<%@ page import="Combos.CargaCombosO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Expediente</title>
 <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <!-- <script src="js/ValidacionesGenerales.js" type="text/javascript"></script> -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link REL="stylesheet" href="css/estiloOrganoJ.css">
  <link REL="stylesheet" href="css/menu.css">
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

    <%
         ConectaBD obj=new ConectaBD();
                  PreparedStatement ps;
                  ResultSet rs;
                  obj.conectar();
                  
                  String clave_org = (String) session.getAttribute("id");
                  ps=obj.con.prepareStatement("SELECT juez_individua_h, juez_individual_m, juez_colectivo_h, juez_colectivo_m, juez_mixto_h, juez_mixtos_m, subtotal_juez_h, subtotal_juez_m, total_jueces, total_ordinario, total_individual, total_colectivo, total_huelga, total_col_nat_econ, total_paraprocesal, total_tercerias, total_pref_cred, total_ejecucion FROM TR_GENERAL where id_organoj = '"+clave_org+"' ");
                 // ps.setString(1, valor);
                  rs=ps.executeQuery();
                  
                  if(rs.next())
                  {
                        String juez_individua_h = rs.getString("juez_individua_h");
                        String juez_individual_m = rs.getString("juez_individual_m");
                        String juez_colectivo_h = rs.getString("juez_colectivo_h");
                        String juez_colectivo_m = rs.getString("juez_colectivo_m");
                        String juez_mixto_h = rs.getString("juez_mixto_h");
                        String juez_mixtos_m = rs.getString("juez_mixtos_m");
                        String subtotal_juez_h = rs.getString("subtotal_juez_h");
                        String subtotal_juez_m = rs.getString("subtotal_juez_m");
                        String total_jueces = rs.getString("total_jueces");
                        String total_ordinario = rs.getString("total_ordinario");
                        String total_individual = rs.getString("total_individual");
                        String total_colectivo = rs.getString("total_colectivo");
                        String total_huelga = rs.getString("total_huelga");
                        String total_col_nat_econ = rs.getString("total_col_nat_econ");
                        String total_paraprocesal = rs.getString("total_paraprocesal");
                        String total_tercerias = rs.getString("total_tercerias");
                        String total_pref_cred = rs.getString("total_pref_cred");
                        String total_ejecucion = rs.getString("total_ejecucion");
                

                // Guardar en el request
                request.setAttribute("juez_individua_h", juez_individua_h);
                request.setAttribute("juez_individual_m", juez_individual_m);
                request.setAttribute("juez_colectivo_h", juez_colectivo_h);
                request.setAttribute("juez_colectivo_m", juez_colectivo_m);
                request.setAttribute("juez_mixto_h", juez_mixto_h);
                request.setAttribute("juez_mixtos_m", juez_mixtos_m);
                request.setAttribute("subtotal_juez_h", subtotal_juez_h);
                request.setAttribute("subtotal_juez_m", subtotal_juez_m);
                request.setAttribute("total_jueces", total_jueces);
                request.setAttribute("total_ordinario", total_ordinario);
                request.setAttribute("total_individual", total_individual);
                request.setAttribute("total_colectivo", total_colectivo);
                request.setAttribute("total_huelga", total_huelga);
                request.setAttribute("total_col_nat_econ", total_col_nat_econ);
                request.setAttribute("total_paraprocesal", total_paraprocesal);
                request.setAttribute("total_tercerias", total_tercerias);
                request.setAttribute("total_pref_cred", total_pref_cred);
                request.setAttribute("total_ejecucion", total_ejecucion);
              
                  }
    
    %>
    
<form action="Actualiza_generales" method="post">
    
  <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="id_org" class="out">CLAVE DEL ÓRGANO JURISDICCIONAL  </label></td>
        <td><input type="text" name="cve_org" id="cve_org" value="${sessionScope.id}" readonly class="out"> </td></table>
        <fieldset data-title="HOLA">
            <legend>Jueces(zas) adscritos(as) al órgano jurisdiccional</legend>
        <table cellspacing="3" cellpadding="3" border="0" > 
        <tr>
            <td><label for="jih">Jueces individuales<span class="req">*</label></td>
            <td><input type="number" id="jih" name="jih" oninput="validarEntero(this)" value="${juez_individua_h}" onkeyup="sumarValores()" onchange="funcionNegA()" required min="0" oninput="validarNumeroPositivo(this)"></td>
             <td><label for="jim">Juezas individuales <span class="req">*</label></td>
            <td><input type="number" id="jim" name="jim" oninput="validarEntero(this)" value="${juez_individual_m}" onkeyup="sumarValores()" onchange="funcionNegB()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
          
        </tr>
           
         <tr>
             <td><label for="jch">Jueces colectivos<span class="req">*</label></td>
            <td><input type="number" id="jch" name="jch" oninput="validarEntero(this)" value="${juez_colectivo_h}" onkeyup="sumarValores()" onchange="funcionNegC()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
            <td><label for="jcm">Juezas colectivas<span class="req">*</label></td>
            <td><input type="number" id="jcm" name="jcm" oninput="validarEntero(this)" value="${juez_colectivo_m}" onkeyup="sumarValores()" onchange="funcionNegD()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
        </tr>
        
         <tr>
            <td><label for="jmh">Jueces mixtos (hombres)<span class="req">*</label></td>
            <td><input type="number" id="jmh" name="jmh" oninput="validarEntero(this)" value="${juez_mixto_h}" onkeyup="sumarValores()" onchange="funcionNegE()"   onblur="sumarValores()"  required min="0" oninput="validarNumeroPositivo(this)"></td>
             <td><label for="jmm">Juezas mixtas (mujeres) <span class="req">*</label></td>
             <td><input type="number" id="jmm" name="jmm" oninput="validarEntero(this)" value="${juez_mixtos_m}" onkeyup="sumarValores()" onchange="funcionNegF()"  onblur="sumarValores()" required min="0" oninput="validarNumeroPositivo(this)"></td>
        </tr>          
        
         <tr>
           <td><label for="sjh">Subtotal jueces</label></td>
            <td><input type="number" id="sjh" name="sjh" value="${subtotal_juez_h}" readonly ></td>
             <td><label for="sjm">Subtotal juezas</label></td>
            <td><input type="number" id="sjm" name="sjm" value="${subtotal_juez_m}" readonly></td>
        </tr>
    </table>
            
            
       <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="tj" class="out">Total de jueces y juezas</label></td>
           <td><input type="number" id="tj" name="tj" value="${total_jueces}" readonly class="out"></td>
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
                <li> Valor numérico "-2": es equivalente a "No aplica", debe utilizarse cuando el órgano jurisdiccional en materia 
                laboral no tenga jurisdicción para conocer o dar trámite a los expedientes por cierto tipo de procedimiento.</li>
            </ol>    
        </div>
    </div>
            
            
          <table cellspacing="3" cellpadding="3" border="0" >
        <tr>
           <td><label for="ord">Ordinario <span class="req">*</label></td>
           <td><input type="number" id="ord" name="ord" value="${total_ordinario}" required min="-2"  onblur="sumarExpedientes()" onchange="funcionNeg1()" oninput="validarNumeroPositivo(this); validarEntero(this)"></td>
            <td><label for="ind">Individual <span class="req">*</label></td>
            <td><input type="number" id="ind" name="ind" value="${total_individual}" required min="-2" onchange="funcionNeg2()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
        </tr>
       
         <tr>
           <td><label for="col">Colectivo <span class="req">*</label></td>
            <td><input type="number" id="col" name="col" value="${total_colectivo}" required min="-2" onchange="funcionNeg3()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
             <td><label for="huelga">Huelga <span class="req">*</label></td>
            <td><input type="number" id="huelga"name="huelga" value="${total_huelga}" required min="-2" onchange="funcionNeg4()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
        </tr>
       
         <tr>
           <td><label for="cne">Colectivo de naturaleza económica<span class="req">*</label></td>
            <td><input type="number" id="cne" name="cne" value="${total_col_nat_econ}" required min="-2" onchange="funcionNeg5()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
            <td><label for="pv">Paraprocesal o voluntario <span class="req">*</label></td>
            <td><input type="number" id="pv" name="pv" value="${total_paraprocesal}" required min="-2" onchange="funcionNeg6()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
        </tr>
         <tr>
           
        </tr>
         <tr>
           <td><label for="ter">Tercerías <span class="req">*</label></td>
            <td><input type="number" id="ter" name="ter" value="${total_tercerias}" required min="-2" onchange="funcionNeg7()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
            <td><label for="cred">Preferencia de crédito <span class="req">*</label></td>
            <td><input type="number" id="cred" name="cred" value="${total_pref_cred}" required min="-2" onchange="funcionNeg8()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
        </tr>
            <tr>
           <td><label for="eje">Ejecución <span class="req">*</label></td>
            <td><input type="number" id="eje" name="eje" value="${total_ejecucion}" required min="-2" onchange="funcionNeg9()" onblur="sumarExpedientes()" oninput="validarNumeroPositivo(this)"></td>
        </tr>
    </table> 
              <table cellspacing="3" cellpadding="3" border="0" class="out" >
      <td><label for="tj" class="out">Total de expedientes</label></td>
           <td><input type="number" id="totalExp" name="totalExp"  readonly class="out"></td>
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
        function sumarValores() {
            var jih = parseInt(document.getElementById("jih").value);
            var jch = parseInt(document.getElementById("jch").value);
            var jmh = parseInt(document.getElementById("jmh").value);
            var subH = jih + jch + jmh;
            
            var jim = parseInt(document.getElementById("jim").value);
            var jcm = parseInt(document.getElementById("jcm").value);
            var jmm = parseInt(document.getElementById("jmm").value);
            var subM = jim + jcm + jmm;
            
            document.getElementById("sjh").value = subH;
            document.getElementById("sjm").value = subM;
            document.getElementById("tj").value = subH+subM;
            
            
        }
             function sumarExpedientes()
            {
                 let num1 = parseInt(document.getElementById('ord').value);
                 let num2 = parseInt(document.getElementById('ind').value);
                  let num3 = parseInt(document.getElementById('col').value);
                 let num4 = parseInt(document.getElementById('huelga').value);
                  let num5 = parseInt(document.getElementById('cne').value);
                 let num6 = parseInt(document.getElementById('pv').value);
                  let num7 = parseInt(document.getElementById('ter').value);
                 let num8 = parseInt(document.getElementById('cred').value);
                  let num9 = parseInt(document.getElementById('eje').value);
           
                 
 
                 let resultado=0;
                 
                 if(num1>=0)
                      resultado+=num1;
                if(num2>=0)
                      resultado+=num2;
                if(num3>=0)
                      resultado+=num3;
                if(num4>=0)
                      resultado+=num4;
                if(num5>=0)
                      resultado+=num5;
                if(num6>=0)
                      resultado+=num6;
                if(num7>=0)
                      resultado+=num7;
                if(num8>=0)
                      resultado+=num8;
                if(num9>=0)
                      resultado+=num9            


                 document.getElementById('totalExp').value = resultado;
            }
            function funcionNeg1()
            {
                var  lat = parseFloat(document.getElementById("ord").value);
                 
            
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ord").value = "";
                  }
            }
             function funcionNeg2()
            {
                var  lat = parseFloat(document.getElementById("ind").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ind").value = "";
                  }
            }
             function funcionNeg3()
            {
                var  lat = parseFloat(document.getElementById("col").value);
    
                   if ( lat < -2)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("col").value = "";
                  }
            }
             function funcionNeg4()
            {
                var  lat = parseFloat(document.getElementById("huelga").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("huelga").value = "";
                  }
            }
             function funcionNeg5()
            {
                var  lat = parseFloat(document.getElementById("cne").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("cne").value = "";
                  }
            }
             function funcionNeg6()
            {
                var  lat = parseFloat(document.getElementById("pv").value);
    
                   if ( lat < -2)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("pv").value = "";
                  }
            }
             function funcionNeg7()
            {
                var  lat = parseFloat(document.getElementById("ter").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ter").value = "";
                  }
            }
             function funcionNeg8()
            {
                var  lat = parseFloat(document.getElementById("cred").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("cred").value = "";
                  }
            }
             function funcionNeg9()
            {
                var  lat = parseFloat(document.getElementById("eje").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ord").value = "";
                  }
            }
            
            /////////////////////////
             function funcionNegA()
            {
                var  lat = parseFloat(document.getElementById("jih").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jih").value = "";
                  }
            }
             function funcionNegB()
            {
                var  lat = parseFloat(document.getElementById("jim").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jim").value = "";
                  }
            }
             function funcionNegC()
            {
                var  lat = parseFloat(document.getElementById("jch").value);
    
                  if ( lat < 0)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jch").value = "";
                  }
            }
             function funcionNegD()
            {
                var  lat = parseFloat(document.getElementById("jcm").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jcm").value = "";
                  }
            }
             function funcionNegE()
            {
                var  lat = parseFloat(document.getElementById("jmh").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jmh").value = "";
                  }
            }
             function funcionNegF()
            {
                var  lat = parseFloat(document.getElementById("jmm").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                     // alert("No se admiten numeros negativo");
                      document.getElementById("jmm").value = "";
                  }
            }
            
            function validarEntero(input) 
            {
                const valor = input.value;
                if (!/^-?\d+$/.test(valor)) 
               {
                      input.value = valor.slice(0, -1); // Elimina el último carácter no válido
                }
            }
            
        // Función para abrir la ventana modal
        function openModal() {
            document.getElementById('myModal').style.display = 'block';
        }

        // Función para cerrar la ventana modal
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        // Cerrar el modal si se hace clic fuera del contenido
        window.onclick = function(event) {
            if (event.target === document.getElementById('myModal')) {
                closeModal();
            }
        };
            
            
    </script> 
</html>