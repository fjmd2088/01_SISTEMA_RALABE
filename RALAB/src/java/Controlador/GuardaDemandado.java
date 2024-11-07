package Controlador;


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.*;
import Combos.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "GuardaDemandado", urlPatterns = {"/GuardaDemandado"})
public class GuardaDemandado extends HttpServlet {

CargaCombosDemandado objDem=new CargaCombosDemandado();    
Sentencia_guarda_demandado objGuardar=new Sentencia_guarda_demandado();
String id_demandado=null; Integer id_tipo_demandado=null; Integer id_defensa=null; 
String nombre_sindicato=null; String reg_asoc_sindicato=null; Integer id_tipo_sindicato=null; String preg_sind_pert_org_obr=null; Integer id_org_obr=null; Integer cant_trab_invol_h=null; Integer cant_trab_invol_m=null; Integer cant_trab_invol_ni=null; Integer trab_invol_tot=null; 
Integer id_tipo_patron=null; String rfc=null; String razon_social=null; String calle=null; String num_exterior=null; String num_interior=null; String colonia=null; String cp=null; String id_ent_mpio; Double latitud=null; Double longitud=null; String comentarios=null;
String especifiqueSindicato = null;
String especifiqueOrganizacion = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String procedimiento = request.getParameter("procedimientosDEM");
           int proc=objDem.indiceProcedimiento(procedimiento);
           id_demandado = request.getParameter("claveOrgDEM")+"_"+proc+"_"+ request.getParameter("comboExpedientes2")+ "_"+ request.getParameter("idDem");
           id_defensa = objDem.indiceDefensa(request.getParameter("defensa_DEM"));
           
           if(procedimiento.equals("Ordinario")|| procedimiento.equals("Especial individual"))
           {
               id_tipo_demandado = objDem.indiceDemandado(request.getParameter("comboDemandado")); 
               if(id_tipo_demandado==1)//patron
               {
                    rfc = request.getParameter("rfcOrdDEM");
                    id_tipo_patron = objDem.indicePatron(request.getParameter("comboTipoDemORD"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialOrdDEM");
                        calle = request.getParameter("calleOrdDEM");
                        num_exterior = (request.getParameter("NExteriorOrdDEM"));
                        num_interior = (request.getParameter("NInteriorOrdDEM"));
                        colonia = request.getParameter("coloniaOrdDEM");
                        cp = (request.getParameter("cpOrdDEM"));
                        id_ent_mpio = ""+objDem.indiceEntidadMunicipio(request.getParameter("entidadOrdDEM"), request.getParameter("municipioOrdDEM"));
                       latitud = Double.parseDouble(request.getParameter("latitudOrdDEM"));
                       longitud = Double.parseDouble(request.getParameter("longitudOrdDEM"));                        
                    }
               }
           }
           else if (procedimiento.equals("Especial colectivo"))
           {
                id_tipo_demandado = objDem.indiceDemandado(request.getParameter("comboDemandado2")); 
                if(id_tipo_demandado == 2)//sindicato
                {
                     nombre_sindicato = request.getParameter("nombreSindicatoColDEM");
                    reg_asoc_sindicato = request.getParameter("asociacionSindicalColDEM");
                    id_tipo_sindicato = objDem.indiceSindicato(request.getParameter("tipoSindicatoColDEM"));
                    if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSindColDEM");
                    }
                    preg_sind_pert_org_obr = request.getParameter("sindictaOrgObrColDEM");
                    if(preg_sind_pert_org_obr.equals("Sí"))
                    {
                        id_org_obr = objDem.indiceOrganizacionObrera(request.getParameter("nombreOrgObrColDEM"));
                        if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgColDEM");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresColDEM"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresColDEM"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosColDEM"));
                    trab_invol_tot = Integer.parseInt(request.getParameter("totalColDEM"));     
                }
                if(id_tipo_demandado == 3)//coalicion
                {
                     cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresColDEM"));
                     cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresColDEM"));
                     cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosColDEM"));
                     trab_invol_tot = Integer.parseInt(request.getParameter("totalColDEM"));     
                }
                  if(id_tipo_demandado==1)//patron
                 {
                    rfc = request.getParameter("rfcColDem");
                    id_tipo_patron = objDem.indicePatron(request.getParameter("comboTipoDemCOL"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialColDem");
                        calle = request.getParameter("calleColDem");
                        num_exterior = (request.getParameter("NExteriorColDem"));
                        num_interior =(request.getParameter("NInteriorColDem"));
                        colonia = request.getParameter("coloniaColDem");
                        cp = (request.getParameter("cpColDem"));
                        id_ent_mpio = ""+objDem.indiceEntidadMunicipio(request.getParameter("entidadColDem"), request.getParameter("municipioColDem"));
                       latitud = Double.parseDouble(request.getParameter("latitudColDem"));
                       longitud = Double.parseDouble(request.getParameter("longitudColDem"));                        
                    }
               }
           }
           else if (procedimiento.equals("Huelga"))
           {
                id_tipo_demandado = objDem.indiceDemandado(request.getParameter("comboDemandado3")); 
                if(id_tipo_demandado==1)//patron
                 {
                    rfc = request.getParameter("rfcHueDem");
                    id_tipo_patron = objDem.indicePatron(request.getParameter("comboTipoDemHUE"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialHueDem");
                        calle = request.getParameter("calleHueDem");
                        num_exterior = (request.getParameter("NExteriorHueDem"));
                        num_interior = (request.getParameter("NInteriorHueDem"));
                        colonia = request.getParameter("coloniaHueDem");
                        cp = (request.getParameter("cpHueDem"));
                         id_ent_mpio = ""+objDem.indiceEntidadMunicipio(request.getParameter("entidadHueDem"), request.getParameter("municipioHueDem"));
                       latitud = Double.parseDouble(request.getParameter("latitudHueDem"));
                       longitud = Double.parseDouble(request.getParameter("longitudHueDem"));                        
                    }
               }
           }
           else if (procedimiento.equals("Colectivo de naturaleza económica"))
           {
                id_tipo_demandado = objDem.indiceDemandado(request.getParameter("comboDemandado4")); 
                if(id_tipo_demandado == 2)//sindicato
                {
                     nombre_sindicato = request.getParameter("nombreSindicatoCneDEM");
                    reg_asoc_sindicato = request.getParameter("asociacionSindicalCneDEM");
                    id_tipo_sindicato = objDem.indiceSindicato(request.getParameter("tipoSindicatoCneDEM"));
                    if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSindCneDEM");
                    }
                    preg_sind_pert_org_obr = request.getParameter("sindictaOrgObrCneDEM");
                    if(preg_sind_pert_org_obr.equals("Sí"))
                    {
                        id_org_obr = objDem.indiceOrganizacionObrera(request.getParameter("nombreOrgObrCneDEM"));
                        if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgCneDEM");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresCneDEM"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresCneDEM"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosCneDEM"));
                    trab_invol_tot = Integer.parseInt(request.getParameter("totalCneDEM"));     
                }
                if(id_tipo_demandado == 4)//coalicion
                {
                     cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresCneDEM"));
                     cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresCneDEM"));
                     cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosCneDEM"));
                     trab_invol_tot = Integer.parseInt(request.getParameter("totalCneDEM"));     
                }
                  if(id_tipo_demandado==1)//patron
                 {
                    rfc = request.getParameter("rfcCneDEM");
                    id_tipo_patron = objDem.indicePatron(request.getParameter("comboTipoDemCNE"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialCneDEM");
                        calle = request.getParameter("calleCneDEM");
                        num_exterior =(request.getParameter("NExteriorCneDEM"));
                        num_interior =(request.getParameter("NInteriorCneDEM"));
                        colonia = request.getParameter("coloniaCneDEM");
                        cp = (request.getParameter("cpCneDEM"));
                        id_ent_mpio = ""+objDem.indiceEntidadMunicipio(request.getParameter("entidadCneDEM"), request.getParameter("municipioCneDEM"));
                       latitud = Double.parseDouble(request.getParameter("latitudCneDEM"));
                       longitud = Double.parseDouble(request.getParameter("longitudCneDEM"));                        
                       cant_trab_invol_h = null;
                       cant_trab_invol_m = null;
                       cant_trab_invol_ni = null;
                       trab_invol_tot = null;
                    }
               }
           }
          comentarios=request.getParameter("comentariosDEM");
           
           
           if(objGuardar.registrar(id_demandado, id_tipo_demandado, id_defensa, nombre_sindicato, reg_asoc_sindicato, id_tipo_sindicato, preg_sind_pert_org_obr, id_org_obr, cant_trab_invol_h, cant_trab_invol_m, cant_trab_invol_ni, trab_invol_tot, id_tipo_patron, rfc, razon_social, calle, num_exterior, num_interior, colonia, cp, id_ent_mpio, latitud, longitud, comentarios))
           {
                if(especifiqueSindicato!=null)
                {                    
                    Integer idSin = objGuardar.indiceSindicato()+1;
                    objGuardar.registrarSindicato(idSin,especifiqueSindicato);
                }
                if(especifiqueOrganizacion!=null)
                {
                    Integer idOrg = objGuardar.indiceOrganizacion()+1;
                    objGuardar.registrarOrganizacion(idOrg, especifiqueOrganizacion);
                }
               response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
           }  
          else 
          {
              request.getRequestDispatcher("/errorEnRegistro.jsp").forward(request, response);
          }
            id_demandado=null; id_tipo_demandado=null;  id_defensa=null; 
           nombre_sindicato=null; reg_asoc_sindicato=null; id_tipo_sindicato=null;  preg_sind_pert_org_obr=null; id_org_obr=null;  cant_trab_invol_h=null;  cant_trab_invol_m=null;  cant_trab_invol_ni=null;  trab_invol_tot=null; 
           id_tipo_patron=null; rfc=null; razon_social=null;  calle=null; num_exterior=null;  num_interior=null;  colonia=null;  cp=null; id_ent_mpio=null;  latitud=null; longitud=null;  comentarios=null;
           especifiqueSindicato = null;
           especifiqueOrganizacion = null;
           
        } catch (SQLException ex) {
        Logger.getLogger(GuardaDemandado.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
