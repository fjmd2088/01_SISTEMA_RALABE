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

@WebServlet(name = "GuardaActor", urlPatterns = {"/GuardaActor"})
public class GuardaActor extends HttpServlet {
 
Sentencia_guarda_actor objActor=new Sentencia_guarda_actor();    
CargaCombosActores combosAct=new CargaCombosActores();    
String id_actor=null; Integer id_tipo_actor=null; Integer id_defensa=null; Integer id_sexo=null; String edad=null; Integer id_ocupacion=null; String nss=null; String curp=null; String rfc=null; Integer id_jornada=null;
String nombre_sindicato=null; String registro_aso_sindical=null; Integer id_tipo_sindicato=null; String preg_sind_pert_org_o=null; Integer id_org_obr=null; Integer cant_trab_invol_h=null;
Integer cant_trab_invol_m=null; Integer cant_trab_invol_ni=null; Integer total_trab_invol=null; Integer id_tipo_patron=null; String razon_social=null; String calle=null; String num_exterior=null; 
String num_interior=null; String colonia=null; String cp=null; String id_ent_mpio; Double latitud=null; Double longitud=null; String comentarios=null;

String especifiqueSindicato=null;
String especifiqueOrganizacion=null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String procedimiento = request.getParameter("procedimientosACT");
            int proc=combosAct.indiceProcedimiento(procedimiento);
            id_actor = request.getParameter("claveOrgACT")+"_"+proc+"_"+ request.getParameter("comboExpedientes") + "_" + request.getParameter("idActor");
            id_defensa = combosAct.indiceDefensa(request.getParameter("defensa")); 
            
            if(procedimiento.equals("Ordinario"))//ORDINARIO##############################################
            {
                id_tipo_actor =  combosAct.indiceActor(request.getParameter("comboActor"));            
              
                if(id_tipo_actor == 1)//trabajador
                {
                    id_sexo = combosAct.indiceSexo(request.getParameter("sexoAct"));
                    edad = request.getParameter("edadAct");
                    
                    id_ocupacion = combosAct.indiceOcupacion(request.getParameter("ocupacion"));
                    nss = request.getParameter("nssTra");
                    curp = request.getParameter("curpTra");
                    rfc = request.getParameter("rfcTra");
                    id_jornada = combosAct.indiceJornada(request.getParameter("comboJornada"));
                }
                else if (id_tipo_actor == 3)//sindicato
                {
                    nombre_sindicato = request.getParameter("nombreSindicato");
                    registro_aso_sindical = request.getParameter("asociacionSindical");
                    id_tipo_sindicato = combosAct.indiceSindicato(request.getParameter("tipoSindicato"));
                    if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSindicatoORD");
                    }
                    preg_sind_pert_org_o = request.getParameter("sindictaOrgObr");
                    if(preg_sind_pert_org_o.equals("Sí"))
                    {
                        id_org_obr = combosAct.indiceOrganizacionObrera(request.getParameter("nombreOrgObr"));
                        if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgObrORD");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresTra"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresTra"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("noInvalido"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalTrabajadores"));     
                }  
                else if (id_tipo_actor == 4 )//coalicion de trabajadores
                {
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresTra"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresTra"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("noInvalido"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalTrabajadores")); 
                }
            }
            else if(procedimiento.equals("Especial individual"))//INDIVIDUAL############################################
            {
                id_tipo_actor =  combosAct.indiceActor(request.getParameter("comboActor2"));
                 if(id_tipo_actor == 1)//trabajador
                {
                    id_sexo = combosAct.indiceSexo(request.getParameter("sexoActIND"));
                    edad = (request.getParameter("edadActIND"));
                    id_ocupacion = combosAct.indiceOcupacion(request.getParameter("ocupacionActIND"));
                    nss = request.getParameter("nssActIND");
                    curp = request.getParameter("curpActIND");
                    rfc = request.getParameter("rfcActIND");
                    id_jornada = combosAct.indiceJornada(request.getParameter("jornadaActIND"));
                }
            }
            else if(procedimiento.equals("Especial colectivo"))//COLECTIVO############################################
            {
                id_tipo_actor =  combosAct.indiceActor(request.getParameter("comboActor3"));
                
                if (id_tipo_actor == 3)//sindicato
                {
                    nombre_sindicato = request.getParameter("nombreSindicatoActCOL");
                    registro_aso_sindical = request.getParameter("asociacionSindicalActCOL");
                    id_tipo_sindicato = combosAct.indiceSindicato(request.getParameter("tipoSindicato2"));
                     if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSinCOL");
                    }
                    preg_sind_pert_org_o = request.getParameter("sindictaOrgObr2");
                    if(preg_sind_pert_org_o.equals("Sí"))
                    {
                        id_org_obr = combosAct.indiceOrganizacionObrera(request.getParameter("nombreOrgObr2"));
                         if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgCOL");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresTra2"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresTra2"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("noInvalido2"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalTrabajadores2"));     
                }
                else if (id_tipo_actor == 2)//patron
                {
                    rfc = request.getParameter("rfcCOL");
                    id_tipo_patron = combosAct.indicePatron(request.getParameter("comboTipo"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialCOL");
                        calle = request.getParameter("calleCOL");
                        num_exterior =(request.getParameter("NExteriorCOL"));
                        num_interior = (request.getParameter("NInteriorCOL"));
                        colonia = request.getParameter("coloniaCOL");
                        cp = (request.getParameter("cpCOL"));
                        id_ent_mpio = ""+combosAct.indiceEntidadMunicipio(request.getParameter("entidadCOLact"), request.getParameter("municipioCOLact"));
                       latitud = Double.parseDouble(request.getParameter("latitudActCOL"));
                       longitud = Double.parseDouble(request.getParameter("longitudActCOL"));                        
                    }
                }                
            }
            else if(procedimiento.equals("Huelga"))//HUELGA#################################################
            {
                id_tipo_actor =  combosAct.indiceActor(request.getParameter("comboActor4"));
                
                 if (id_tipo_actor == 3)//sindicato
                {
                    nombre_sindicato = request.getParameter("nombreSindicatoActHUE");
                    registro_aso_sindical = request.getParameter("asociacionSindicalActHUE");
                    id_tipo_sindicato = combosAct.indiceSindicato(request.getParameter("tipoSindicato3"));
                     if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSinHUE");
                    }
                    preg_sind_pert_org_o = request.getParameter("sindictaOrgObrHue");
                    if(preg_sind_pert_org_o.equals("Sí"))
                    {
                        id_org_obr = combosAct.indiceOrganizacionObrera(request.getParameter("nombreOrgObrHue"));
                         if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgHUE");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresTra3"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresTra3"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("noInvalido3"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalTrabajadores3"));     
                }
                 else if (id_tipo_actor == 5)//mayoria de trabajadores
                {                   
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresTra3"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresTra3"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("noInvalido3"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalTrabajadores3"));     
                }
            }
            else if(procedimiento.equals("Colectivo de naturaleza económica"))//COLECTIVO NATURALEZA ECONOMICA######
            {
                id_tipo_actor =  combosAct.indiceActor(request.getParameter("comboActor5"));
                
                if (id_tipo_actor == 3)//sindicato
                {
                    nombre_sindicato = request.getParameter("nombreSindicatoActCNE");
                    registro_aso_sindical = request.getParameter("asociacionSindicalActCNE");
                    id_tipo_sindicato = combosAct.indiceSindicato(request.getParameter("tipoSindicatoCNE"));
                     if(id_tipo_sindicato == 6)//especifique sindicato
                    {
                        especifiqueSindicato = request.getParameter("espSindCNE");
                    }
                    preg_sind_pert_org_o = request.getParameter("sindictaOrgObrCNE");
                    if(preg_sind_pert_org_o.equals("Sí"))
                    {
                        id_org_obr = combosAct.indiceOrganizacionObrera(request.getParameter("nombreOrgObrCNE"));
                         if(id_org_obr == 8)
                        {
                            especifiqueOrganizacion = request.getParameter("espOrgCNE");
                        }
                    }
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresCNE"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresCNE"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosCNE"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalCNE"));     
                }
                 else if (id_tipo_actor == 4 )//mayoria de trabajadores
                {
                    cant_trab_invol_h = Integer.parseInt(request.getParameter("hombresCNE"));
                    cant_trab_invol_m = Integer.parseInt(request.getParameter("mujeresCNE"));
                    cant_trab_invol_ni = Integer.parseInt(request.getParameter("identificadosCNE"));
                    total_trab_invol = Integer.parseInt(request.getParameter("totalCNE")); 
                }
                 else if (id_tipo_actor == 2)//patron
                {
                    rfc = request.getParameter("rfcCNE");
                    id_tipo_patron = combosAct.indicePatron(request.getParameter("comboTipoCNE"));
                    if(id_tipo_patron == 2)
                    {
                        razon_social = request.getParameter("razonSocialCNE");
                        calle = request.getParameter("calleCNE");
                        num_exterior = (request.getParameter("NExteriorCNE"));
                        num_interior =(request.getParameter("NInteriorCNE"));
                        colonia = request.getParameter("coloniaCNE");
                        cp = (request.getParameter("cpCNE"));
                        id_ent_mpio = ""+combosAct.indiceEntidadMunicipio(request.getParameter("entidadCNEact"), request.getParameter("municipioCNEact"));
                        latitud = Double.parseDouble(request.getParameter("latitudACTcne"));
                        longitud = Double.parseDouble(request.getParameter("longitudACTcne"));                        
                    }
                }    
            }
                   
            //----GUARDAR-----
            if(objActor.registrar(id_actor, id_tipo_actor, id_defensa, id_sexo, edad, id_ocupacion, nss, curp, rfc, id_jornada, nombre_sindicato, registro_aso_sindical, id_tipo_sindicato, preg_sind_pert_org_o, id_org_obr, cant_trab_invol_h, cant_trab_invol_m, cant_trab_invol_ni, total_trab_invol, id_tipo_patron, razon_social, calle, num_exterior, num_interior, colonia, cp, id_ent_mpio, latitud, longitud, comentarios))
            {
                //GUARDA ESPECIFIQUE
                if(especifiqueSindicato!=null)
                {                    
                    Integer idSin = objActor.indiceSindicato()+1;
                    objActor.registrarSindicato(idSin,especifiqueSindicato);
                }
                if(especifiqueOrganizacion!=null)
                {
                    Integer idOrg = objActor.indiceOrganizacion()+1;
                    objActor.registrarOrganizacion(idOrg, especifiqueOrganizacion);
                }                
                //GUARDA TABLAS RELACIONALES
                //objActor.registrarActorExpediente(id_actor, combosAct.indiceExpediente(request.getParameter("claveOrgACT")));
                
                response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
            }
            else
            {   
                request.getRequestDispatcher("/errorEnRegistro.jsp").forward(request, response);
            }
            
            id_actor=null; id_tipo_actor=null; id_defensa=null; id_sexo=null;  edad=null;  id_ocupacion=null;  nss=null;  curp=null;  rfc=null;  id_jornada=null;
            nombre_sindicato=null;  registro_aso_sindical=null;  id_tipo_sindicato=null;  preg_sind_pert_org_o=null;  id_org_obr=null;  cant_trab_invol_h=null;
            cant_trab_invol_m=null;  cant_trab_invol_ni=null;  total_trab_invol=null;  id_tipo_patron=null;  razon_social=null;  calle=null;  num_exterior=null; 
            num_interior=null; colonia=null;  cp=null; id_ent_mpio=null;  latitud=null; longitud=null;  comentarios=null;
       }
        catch(Exception e)
        {
            e.getMessage();
        }
   
      
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(GuardaActor.class.getName()).log(Level.SEVERE, null, ex);
    }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(GuardaActor.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
