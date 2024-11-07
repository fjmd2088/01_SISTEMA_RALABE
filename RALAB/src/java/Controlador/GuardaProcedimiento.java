package Controlador;

import Combos.CargaCombosProcedimientos;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.*;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "GuardaProcedimiento", urlPatterns = {"/GuardaProcedimiento"})
public class GuardaProcedimiento extends HttpServlet {
     
               Sentencia_guarda_procedimiento gestorBD=new Sentencia_guarda_procedimiento();
               CargaCombosProcedimientos combos=new CargaCombosProcedimientos(); 
              
              //Variables principales **************************************************************************************
              Integer id_expediente=null; Integer id_tipo_expediente=null; String id_organoj=null; String clave_expediente=null;       
              String clave_cuaderno_incid=null; String fecha_present_incidente=null; String fecha_apert_cuader_incid=null; Integer id_tipo_incidente=null; String fecha_apertura_exped=null; Integer id_tipo_asunto=null; Integer id_nat_conflicto=null; String preg_trab_contr_escri=null; Integer id_tipo_contrato=null; String rama_involuc=null; Integer id_sector_sbtor=null;
              String fecha_pres_ejecu_sent=null; Integer id_ent_mpio=null; String preg_outsourcing=null; String preg_apl_cir_vin_mot_conf=null; String preg_prestacion=null; String preg_fecha_celebr_audiencia=null; String fecha_audiencia=null; String motivo_conf_colectivo=null; 
              String preg_incompetencia=null; Integer id_tipo_incompetencia=null; String fecha_pliego_peticion=null; String fecha_present_demanda=null; String fecha_present_promo=null; String fecha_admision_promo=null;
              Integer id_promovente=null; String preg_const_conciliac=null; String clave_const_conciliac=null; String preg_asunto_vinc_concil_p=null; String preg_formulo_demanda=null; String preg_desahogo_demanda=null;
              Integer id_estatus_demanda=null; Integer id_causa_imp_adm_demanda=null; String fecha_adm_demanda=null; Integer cant_actores=null; Integer cant_demandados=null; String preg_huelga_emplazam=null; String fecha_huelga_emplazam=null; String preg_prehuelga=null;
              String preg_audiencia_concil=null; String fecha_audiencia_concil=null; String preg_huelga_estalla=null; Integer id_huelga_licitud=null; Integer id_huelga_existencia=null; String preg_auto_depuracion_tram=null; String fecha_auto_depuracion=null; String preg_aud_prelim_celebr=null; String fecha_audiencia_prelim=null; String preg_celebra_aud_juicio=null; String fecha_aud_juicio=null; String preg_audiencia_col_nat_eco=null;
              String fecha_audiencia_col_nat_eco=null; Integer id_estatus_exped=null; String fecha_concluy_exped=null; String fecha_ult_act_proc=null; Integer id_fase_sol_exped=null; String fecha_concl_ejecu=null; Integer id_fase_concl_ejec=null; Integer id_forma_solucion=null; String fecha_dicto_solucion=null; String porcent_solicitado=null; String porcent_otorgado=null; Integer id_tipo_sentencia=null; String fecha_huelga_estalla=null; String fecha_huelga_levantam=null; 
              Integer huelga_dias=null; String monto_solucion=null; String porcent_salarios_caidos=null; Integer id_sentencia_efecto=null; String comentarios=null;
              //********************************************************************************************************
              
              
              //Variables para "otra (especifique)" ***************************************************************************
              String especifiqueMotivos;
              String especifiqueCircusntancias;
              String especifiqueConceptos;
              String especifiquePrestaciones;
              String especifiqueIncompetencia;
              String especifiqueSolucion;
              String especifiqueViolaciones;
             //*********************************************************************************************************
                        
              
               //Arreglos para guardar checkbox ***************************************************************************
               String[] valoresSeleccionados;
               String[] circunstanciasSeleccionadas;
               String[] conceptosReclamadosSeleccionados;
               String[] prestacionesSeleccionadas;
               String[] suspensionesSeleccionadas;
               String[] terminacionesSeleccionadas;
               String[] violacionesSeleccionadas;    
               String[] efectosSentenciaSeleccionadas;
               String[] motivosSolicitudPromoSeleccionados;
               String[] motivosHuelgaSeleccionados;
               //********************************************************************************************************
                                
               
              //Para tablas relacionales (catalogo de combobox)**************************************************************
               Integer motivoPromoEje;
               //********************************************************************************************************
               
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {       
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession se= request.getSession();
        try 
        {
              String procedimiento=request.getParameter("procedimientos");
               id_expediente=combos.consecutivoExpediente()+1; 
               id_organoj=request.getParameter("clave");
               clave_expediente=request.getParameter("claveExp");
               fecha_apertura_exped=request.getParameter("fecha");
              /*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                  EJECUCIÓN
              ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               if(procedimiento.equals("Ejecucion"))
               {
                   id_tipo_expediente=9;
                   motivoPromoEje=combos.indiceMotivoPromo(request.getParameter("promocionE"));
                   fecha_pres_ejecu_sent=request.getParameter("fechaEjec");
                   id_estatus_exped=combos.indiceEstatus(request.getParameter("estExpE"));
                   if(id_estatus_exped==1)
                   {
                        fecha_concl_ejecu=request.getParameter("fechaConEj");
                        id_fase_concl_ejec=combos.indiceFaseConcluyo(request.getParameter("faseConEj"));
                   }                
               }
               /*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                      PREFERENCIA DE CREDITO
               ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Preferencia de Credito"))
               {
                     id_tipo_expediente=8;
                     fecha_present_promo=request.getParameter("fechaPresProm");
                     fecha_admision_promo=request.getParameter("fechaAdmProm");
                     id_promovente=combos.indicePromovente(request.getParameter("promovente"));
                     if(id_promovente==5)
                     {
                         //otroPromovente=request.getParameter("promoventeEspecifique");
                     }
                     id_estatus_exped=combos.indiceEstatus(request.getParameter("estExp"));
                     if(id_estatus_exped==1)
                     {
                         fecha_dicto_solucion=request.getParameter("fechaDictRes");
                     }
                     //obtiene los valores de los checkbox y se guarden en el arreglo
                     motivosSolicitudPromoSeleccionados=request.getParameterValues("motivos_PC");
               }
               /*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                        TERCERÍAS
               ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
                else if(procedimiento.equals("Terceria"))
                {
                   id_tipo_expediente=7;
                   clave_expediente = request.getParameter("claveExpPrin");
                   clave_cuaderno_incid = request.getParameter("claveCuaderno");
                   fecha_present_incidente = request.getParameter("fechaPresIn");
                   fecha_apert_cuader_incid = request.getParameter("fechaApertCuaderno");
                   id_tipo_incidente = combos.indiceIncidente(request.getParameter("tipoIncidente"));
                   preg_fecha_celebr_audiencia = request.getParameter("audTER");
                   if(preg_fecha_celebr_audiencia.equals("Sí"))
                   {
                       fecha_audiencia = request.getParameter("fechaAudTER");
                   }
                   id_estatus_exped = combos.indiceEstatus(request.getParameter("estatusExpTER"));
                   if(id_estatus_exped==1)
                   {
                       id_tipo_sentencia = combos.indiceSentencia(request.getParameter("sentenciaTER"));
                   }
                   fecha_dicto_solucion = request.getParameter("fechaResolucionTER");
               }
               /*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                   PARAPROCESAL
               -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Paraprocesal"))
               {
                    id_tipo_expediente=6;
                    rama_involuc = request.getParameter("ramaPARA");                   
                    id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sectorPARA"), request.getParameter("subsectorPARA"));
                    motivoPromoEje=combos.indiceMotivoPromo(request.getParameter("motivoPARA"));
                    preg_incompetencia = request.getParameter("incompPARA");
                    if(preg_incompetencia.equals("Sí"))
                    {
                        id_tipo_incompetencia = combos.indiceIncompetencia(request.getParameter("tipoIncompPARA"));
                       if(id_tipo_incompetencia == 4)
                       {
                           String incompPARA=request.getParameter("espIncPARA");
                       }
                    }
                    else
                    {
                        fecha_present_promo = request.getParameter("fechaPresPromPARA");
                        fecha_admision_promo = request.getParameter("fechaAdmPromPARA");
                        id_promovente = combos.indicePromovente(request.getParameter("promoventePARA"));
                        if(id_promovente == 5)
                        {
                            String espPromPARA = request.getParameter("espPromPARA");
                        }
                        id_estatus_exped = combos.indiceEstatus(request.getParameter("estatusExpPARA"));
                        if(id_estatus_exped == 1)
                        {
                            fecha_concluy_exped = request.getParameter("fechaConclExp");
                        }
                    }
                    
               }
               /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                             COLECTIVO DE NATURALEZA ECONÓMICA
               ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               
               else if(procedimiento.equals("Colectivo de Naturaleza Economica"))
               {
                    id_tipo_expediente=5;
                    id_tipo_asunto=combos.indiceAsunto(request.getParameter("asuntoCNE"));
                    id_nat_conflicto = combos.indiceNatConflicto(request.getParameter("naturalezaCNE"));
                    rama_involuc = request.getParameter("ramaCNE");
                    id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sectorCNE"), request.getParameter("subsectorCNE"));
                    id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidadCNE"), request.getParameter("municipioCNE"));
           
                    
                    preg_incompetencia = request.getParameter("incompetenciaCNE");
                    if(preg_incompetencia.equals("Sí"))
                    {
                        id_tipo_incompetencia = combos.indiceIncompetencia(request.getParameter("tipoIncompetenciaCNE"));
                        if(id_tipo_incompetencia == 4)
                        {
                             String espIncCNE = request.getParameter("espIncCNE");   
                        }
                    }
                    else
                    {
                        fecha_present_demanda = request.getParameter("fechaPreseDemCNE");
                        preg_const_conciliac = request.getParameter("constConc");
                        if(preg_const_conciliac.equals("Sí"))
                        {
                            clave_const_conciliac = request.getParameter("claveConstCNE");
                        }
                        else if (preg_const_conciliac.equals("No"))
                        {
                            preg_asunto_vinc_concil_p  = request.getParameter("asuntVinCNE");
                        }
                        preg_formulo_demanda = request.getParameter("formuloCNE");
                        if(preg_formulo_demanda.equals("Sí"))
                        {
                            preg_desahogo_demanda = request.getParameter("desahogoCNE");
                        }   
                        
                        id_estatus_demanda = combos.indiceEstatusDemanda(request.getParameter("estatusDemandaCNE"));
                       
                        if(id_estatus_demanda == 1)
                        {
                            fecha_adm_demanda = request.getParameter("fechaAdmDemCNE");
                            cant_actores =  Integer.parseInt(request.getParameter("actoresCNE"));
                            cant_demandados = Integer.parseInt(request.getParameter("demandadosCNE"));
                            preg_audiencia_col_nat_eco = request.getParameter("audCNE");
                            if(preg_audiencia_col_nat_eco.equals("Sí"))
                            {
                                fecha_audiencia_col_nat_eco = request.getParameter("fechaAudCNE");
                            }
                        }                      
                        id_estatus_exped = combos.indiceEstatus(request.getParameter("estatusExpCNE"));
                        if(id_estatus_exped == 1)
                        {
                             id_fase_sol_exped = combos.indiceFaseSolExp(request.getParameter("faseSolCNE"));
                             id_forma_solucion = combos.indiceFormaSolExp(request.getParameter("formaSolCNE"));
                             if(id_forma_solucion == 4)
                             {
                                  id_tipo_sentencia = combos.indiceSentencia(request.getParameter("tipoSentenciaCNE"));
                                  if(id_tipo_sentencia == 2 && id_tipo_sentencia == 3 )
                                  {
                                      efectosSentenciaSeleccionadas = request.getParameterValues("check_efectosCNE"); 
                                  }
                             }
                             else if(id_forma_solucion == 9)
                             {
                                // especifiqueSolucion = request.getParameter("espSolCNE");
                             }
                             fecha_dicto_solucion = request.getParameter("fechaDictoResCNE");
                        }
                        else if (id_estatus_exped == 2)
                        {
                            fecha_ult_act_proc = request.getParameter("fechaUltActCNE");
                        }
                    }  
                    valoresSeleccionados = request.getParameterValues("check_motivosCNE");
                    suspensionesSeleccionadas = request.getParameterValues("check_suspensionCNE");
                    efectosSentenciaSeleccionadas = request.getParameterValues("check_efectosCNE");
               }              
               /*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                              HUELGA
               -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Huelga"))
               {
                    id_tipo_expediente=4;
                    id_tipo_asunto=combos.indiceAsunto(request.getParameter("asuntoHue"));
                    rama_involuc=request.getParameter("ramaHue");
                
                    id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sectorHUE"), request.getParameter("subsectorHUE"));
                   id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidadHUE"), request.getParameter("municipioHUE"));
                   
                    motivosHuelgaSeleccionados = request.getParameterValues("check_motivosH");
                     preg_incompetencia=request.getParameter("incompetenciaHUE");
                     if(preg_incompetencia.equals("Sí"))
                     {
                          id_tipo_incompetencia=combos.indiceIncompetencia(request.getParameter("incompeHUE"));
                          if(id_tipo_incompetencia==4)
                          {
                              String espIncompHUE=request.getParameter("incompeHUE");
                          }       
                     }
                     else
                     {
                         fecha_pliego_peticion = request.getParameter("fechaPliegoPet");
                         cant_actores = Integer.parseInt(request.getParameter("actoresHUE"));       
                         cant_demandados = Integer.parseInt(request.getParameter("demandadosHUE"));
                         preg_huelga_emplazam=request.getParameter("empHuelga");
                         if(preg_huelga_emplazam.equals("Sí"))
                         {
                             fecha_huelga_emplazam = request.getParameter("fechaEmpHuelga");
                         }
                          preg_prehuelga = request.getParameter("prehuelga");
                          if(preg_prehuelga.equals("Sí"))
                          {
                              preg_audiencia_concil = request.getParameter("audConHUE");
                              if(preg_audiencia_concil.equals("Sí"))
                              {
                                  fecha_audiencia_concil = request.getParameter("fechaConciHUE");
                              }
                              preg_huelga_estalla = request.getParameter("huelga");
                              if(preg_huelga_estalla.equals("Sí"))
                              {
                                  id_huelga_licitud = combos.indiceLicitud(request.getParameter("licitud"));
                                  id_huelga_existencia = combos.indiceExistencia(request.getParameter("exisHuelga"));
                              }
                          }
                          
                          id_estatus_exped = combos.indiceEstatus(request.getParameter("estatusExpHUE"));
                          if(id_estatus_exped==2)
                          {
                              fecha_ult_act_proc = request.getParameter("fechaUltActProcHUE");
                          }
                          else if(id_estatus_exped==1)
                          {
                              id_fase_sol_exped = combos.indiceFaseSolExp(request.getParameter("faseSolHUE"));
                              if(id_fase_sol_exped == 5 || id_fase_sol_exped == 6)
                              {
                                  id_forma_solucion = combos.indiceFormaSolExp(request.getParameter("formaSolHUE"));                                 
                              }
                              else if (id_fase_sol_exped == 7)
                              {
                                   id_forma_solucion = combos.indiceFormaSolExp(request.getParameter("formaSolHUE2"));
                                   if(id_forma_solucion == 4)
                                   {
                                         id_tipo_sentencia = combos.indiceSentencia(request.getParameter("sentenciaHUE"));
                                         porcent_solicitado = request.getParameter("solicitado");
                                         porcent_otorgado = request.getParameter("otorgado");
                                   }
                                   fecha_huelga_estalla = request.getParameter("fechaEstalla");
                                   fecha_huelga_levantam = request.getParameter("levantaHuelga");
                                   huelga_dias = Integer.parseInt(request.getParameter("diasHuelga"));
                                   monto_solucion = request.getParameter("montoSalariosCaidos");
                                   porcent_salarios_caidos = request.getParameter("porcentajeSalariosCaidos");                                   
                                  
                              }
                               fecha_dicto_solucion = request.getParameter("fechaDicResHUE");
                          }
                     }
                      motivosHuelgaSeleccionados = request.getParameterValues("check_motivosH");
               }
               /*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                            COLECTIVO
               -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Colectivo"))
               {
                   id_tipo_expediente=3;
                   id_tipo_asunto=combos.indiceAsunto(request.getParameter("tipoAsuntoCOL"));
                   id_nat_conflicto=combos.indiceNatConflicto(request.getParameter("naturalezaCOL"));
                   rama_involuc=request.getParameter("ramaCOL");
                   id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sectorCOL"), request.getParameter("subsectorCOL"));
                   id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidadCOL"), request.getParameter("municipioCOL"));
                   especifiqueMotivos=request.getParameter("espMotivosCOL");
                   especifiqueViolaciones=request.getParameter("espVioCOL");
                   
                   preg_incompetencia=request.getParameter("incompetenciaCOL");
                   if(preg_incompetencia.equals("Sí"))
                   {
                       id_tipo_incompetencia=combos.indiceIncompetencia(request.getParameter("incompeCOL"));
                       if(id_tipo_incompetencia==4)
                       {
                           especifiqueIncompetencia=request.getParameter("espIncCOL");
                       }
                   }
                   else
                   {
                       fecha_present_demanda=request.getParameter("fechaPresDemCOL");
                       preg_const_conciliac=request.getParameter("concilCOL");
                       if(preg_const_conciliac.equals("Sí"))
                       {
                           clave_const_conciliac=request.getParameter("claveConstCOL");
                       }
                       else if(preg_const_conciliac.equals("No"))
                       {
                           preg_asunto_vinc_concil_p=request.getParameter("asunVinCOL");
                       }
                       preg_formulo_demanda=request.getParameter("formuloCOL");
                       if(preg_formulo_demanda.equals("Sí"))
                       {
                           preg_desahogo_demanda=request.getParameter("desahogosCOL");
                       }
                       
                      id_estatus_demanda=combos.indiceEstatusDemanda(request.getParameter("estatusDemCOL"));
                       if(id_estatus_demanda==1)
                       {
                           fecha_adm_demanda=request.getParameter("fechaAdmDemCOL");
                           cant_actores=Integer.parseInt(request.getParameter("actoresCOL"));
                           cant_demandados=Integer.parseInt(request.getParameter("demandadosCOL"));        
                           preg_auto_depuracion_tram=request.getParameter("tramitacionDepCOL");
                           if(preg_auto_depuracion_tram.equals("Sí"))
                           {
                               fecha_auto_depuracion=request.getParameter("fechaDepCOL");
                           }
                           preg_celebra_aud_juicio=request.getParameter("juicioCOL");
                           if(preg_celebra_aud_juicio.equals("Sí"))
                           {
                               fecha_aud_juicio=request.getParameter("fechaJuicioCOL");
                           }
                       }
                       
                       id_estatus_exped=combos.indiceEstatus(request.getParameter("estatusExpCOL"));
                       if(id_estatus_exped==2)
                       {
                           fecha_ult_act_proc=request.getParameter("fechaUltActProCOL");
                       }
                       else if(id_estatus_exped==1)
                       {
                           id_fase_sol_exped=combos.indiceFaseSolExp(request.getParameter("faseSolCOL"));
                           id_forma_solucion=combos.indiceFormaSolExp(request.getParameter("formaSolCOL"));
                           if(id_forma_solucion==4)
                           {
                               fecha_dicto_solucion=request.getParameter("fechaResolucionCOL");
                               id_tipo_sentencia=combos.indiceSentencia(request.getParameter("tipoSentenciaCOL"));
                               if(id_tipo_sentencia==2 || id_tipo_sentencia==3)
                               {
                                   monto_solucion=request.getParameter("montosCOL");
                               }
                           }
                           else if(id_forma_solucion == 1 || id_forma_solucion == 2 || id_forma_solucion == 3)
                           {
                               fecha_dicto_solucion=request.getParameter("fechaResolucionCOL");
                           }
                           else if(id_forma_solucion == 9)
                           {
                               especifiqueSolucion = request.getParameter("espSolCOL");
                           }
                       }
                       
                   }
                   valoresSeleccionados=request.getParameterValues("check_motivosC");
                   suspensionesSeleccionadas = request.getParameterValues("check_motivosC");
                   terminacionesSeleccionadas =request.getParameterValues("check_motivosC");
                   violacionesSeleccionadas=request.getParameterValues("check_motivosC");
               }
              /*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                            INDIVIDUAL
               ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Individual"))
               {
                     id_tipo_expediente=2;
                     id_tipo_asunto=combos.indiceAsunto(request.getParameter("asuntoInd"));
                     id_nat_conflicto=combos.indiceNatConflicto(request.getParameter("naturalezaInd"));
                     
                     preg_trab_contr_escri=request.getParameter("contratoEscritoIND");
                     if(preg_trab_contr_escri.equals("Sí"))
                     {
                         id_tipo_contrato=combos.indiceContrato(request.getParameter("tipoContratoInd"));
                     }
                     rama_involuc=request.getParameter("ramaInd");
                       id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sectorIN"), request.getParameter("subsectorIN"));
                      id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidadIN"), request.getParameter("municipioIN"));
                    
                     preg_outsourcing=request.getParameter("outsourcing2");
                     especifiqueMotivos=request.getParameter("especMotInd");
                     preg_incompetencia=request.getParameter("incompetenciaInd");
                     if(preg_incompetencia.equals("Sí"))
                     {
                         id_tipo_incompetencia=combos.indiceIncompetencia(request.getParameter("incompInd"));
                         if(id_tipo_incompetencia==4)
                         {
                              especifiqueIncompetencia=request.getParameter("espIncInd");
                         }
                     }
                     else if(preg_incompetencia.equals("No"))
                     {
                           fecha_present_demanda=request.getParameter("fechaPreseDemIND");
                           preg_const_conciliac=request.getParameter("conciliacionIND"); 
                           if(preg_const_conciliac.equals("Sí"))
                           {
                               clave_const_conciliac=request.getParameter("claveConstIND");
                           }
                           else if(preg_const_conciliac.equals("No"))
                           {
                               preg_asunto_vinc_concil_p=request.getParameter("asuntoConci");
                           }
                           
                           id_estatus_demanda=combos.indiceEstatusDemanda(request.getParameter("estDemIND"));
                               
                               if(id_estatus_demanda!=1)
                               {
                                    id_causa_imp_adm_demanda=combos.indiceCausaImpDem("causasImpIND");
                               }
                               else
                               {
                                    fecha_adm_demanda=request.getParameter("fechaPresDemIND");
                                    cant_actores=Integer.parseInt(request.getParameter("actoresIND"));
                                    cant_demandados=Integer.parseInt(request.getParameter("demandadosIND"));
                                    preg_auto_depuracion_tram=request.getParameter("tramitacionIND");
                                    if(preg_auto_depuracion_tram.equals("Sí"))
                                    {
                                        fecha_auto_depuracion=request.getParameter("fechaDepurIND");
                                    }                    
                                    preg_aud_prelim_celebr=request.getParameter("audPreliminarIND");
                                    if(preg_aud_prelim_celebr.equals("Sí"))
                                    {
                                        fecha_audiencia_prelim=request.getParameter("fechaPreliminarIND");
                                    }
                                   preg_celebra_aud_juicio=request.getParameter("audJuicioIND");
                                   if(preg_celebra_aud_juicio.equals("Sí"))
                                   {
                                        fecha_aud_juicio=request.getParameter("fechaJuicioIND");
                                   }
                               }
                               
                             id_estatus_exped=combos.indiceEstatus(request.getParameter("estatusExpIND"));
                             
                             if(id_estatus_exped ==2)
                             {
                                    fecha_ult_act_proc=request.getParameter("fechaUltiActIND");
                             }
                             else if (id_estatus_exped ==1)
                             {
                                  id_fase_sol_exped=combos.indiceFaseSolExp(request.getParameter("faseSolIND"));
                                  if(id_fase_sol_exped==2 || id_fase_sol_exped==3 ||id_fase_sol_exped==4)
                                  {
                                        id_forma_solucion=combos.indiceFormaSolExp(request.getParameter("solucionTramIND1"));
                                        if(id_forma_solucion==4)
                                        {
                                              id_tipo_sentencia=combos.indiceSentencia(request.getParameter("sentIND"));
                                              if(id_tipo_sentencia==2||id_tipo_sentencia==3)
                                              {
                                                  monto_solucion=request.getParameter("idMontoIND1");
                                              }
                                        }
                                        else if(id_forma_solucion==1)
                                        {
                                             fecha_dicto_solucion=request.getParameter("fechaResolucionIND");
                                             monto_solucion=request.getParameter("idMontoIND1");
                                        }
                                        else if(id_forma_solucion==2||id_forma_solucion==3)
                                        {
                                             fecha_dicto_solucion=request.getParameter("fechaResolucionIND");
                                        }
                                        else if(id_forma_solucion==9)
                                        {
                                            especifiqueSolucion = request.getParameter("idSolEspIND1");
                                        }
                                  }
                             }        
                     }
                     valoresSeleccionados=request.getParameterValues("check_motivosI");
               }
               /*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                                 ORDINARIO
               ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
               else if(procedimiento.equals("Ordinario"))
               {
                     id_tipo_expediente=1;
                     id_tipo_asunto=combos.indiceAsunto(request.getParameter("asunto"));
                   
                     if(id_tipo_asunto==1) 
                     {
                          id_nat_conflicto=combos.indiceNatConflicto(request.getParameter("naturaleza"));
                            preg_trab_contr_escri=request.getParameter("contrato");
                          if(preg_trab_contr_escri.equals("Sí"))
                          { 
                                id_tipo_contrato=combos.indiceContrato(request.getParameter("tipoContrato"));
                          }
                          rama_involuc=request.getParameter("industria");
                          id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sector"), request.getParameter("subsector"));
                          id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidad"), request.getParameter("municipio"));
                       
                           preg_outsourcing=request.getParameter("outsourcing");
                          
                           especifiqueMotivos=request.getParameter("especMotOrd");
                           especifiqueCircusntancias=request.getParameter("espCirc");
                           especifiqueConceptos=request.getParameter("espConcep");
                           especifiquePrestaciones=request.getParameter("espPrest");
                           preg_apl_cir_vin_mot_conf=request.getParameter("circuns");
                         
                     }
                     else if(id_tipo_asunto==2)
                     {
                          id_nat_conflicto=combos.indiceNatConflicto(request.getParameter("naturaleza2"));
                          rama_involuc=request.getParameter("industria");
                       
                          id_sector_sbtor=combos.idSectorSubsector(request.getParameter("sector"), request.getParameter("subsector"));
                          id_ent_mpio=combos.idEntidadMunicipio(request.getParameter("entidad"), request.getParameter("municipio"));
                          motivo_conf_colectivo=request.getParameter("motConfCol");
                     }
                     
                     preg_incompetencia=request.getParameter("incompetenciaOrd");
                     if(preg_incompetencia.equals("Sí"))
                     {
                          id_tipo_incompetencia=combos.indiceIncompetencia(request.getParameter("incompOrd"));
                          if(id_tipo_incompetencia==4)
                          {
                              especifiqueIncompetencia=request.getParameter("espIncOrd");
                          }
                     }
                     else if(preg_incompetencia.equals("No"))
                     {
                              fecha_present_demanda=request.getParameter("fPresDemandOrd");
                              preg_const_conciliac=request.getParameter("constanciaCon");
                              if(preg_const_conciliac.equals("Sí"))
                              {
                                   clave_const_conciliac=request.getParameter("consConcil");
                              }
                              else
                              {
                                  preg_asunto_vinc_concil_p=request.getParameter("asuVincPerj");
                              }
                              
                              preg_formulo_demanda=request.getParameter("prevDemand");
                              
                              if(preg_formulo_demanda.equals("Sí"))
                              {
                                  preg_desahogo_demanda=request.getParameter("desahogoDemanda");
                              }
                              
                               id_estatus_demanda=combos.indiceEstatusDemanda(request.getParameter("estatusDemOrd"));
                               
                               if(id_estatus_demanda!=1)
                               {
                                    id_causa_imp_adm_demanda=combos.indiceCausaImpDem("causasImpDem");
                               }
                               else
                               {
                                    fecha_adm_demanda=request.getParameter("fechaAdmDemOrd");
                                    cant_actores=Integer.parseInt(request.getParameter("actoresOrd"));
                                    cant_demandados=Integer.parseInt(request.getParameter("demandadosOrd"));
                                    preg_aud_prelim_celebr=request.getParameter("preliminarOrd");
                                    if(preg_aud_prelim_celebr.equals("Sí"))
                                    {
                                        fecha_audiencia_prelim=request.getParameter("fechaAudPrel");
                                    }
                                   preg_celebra_aud_juicio=request.getParameter("juicioOrd");
                                   if(preg_celebra_aud_juicio.equals("Sí"))
                                   {
                                        fecha_aud_juicio=request.getParameter("fechaAudJui");
                                   }
                               }
                               id_estatus_exped=combos.indiceEstatus(request.getParameter("estatusExpOrd"));
                               
                               if(id_estatus_exped==1)
                               {
                                   id_fase_sol_exped=combos.indiceFaseSolExp(request.getParameter("faseSolOrd"));
                                   if(id_fase_sol_exped==9||id_fase_sol_exped==1)
                                   {
                                       id_forma_solucion=combos.indiceFormaSolExp(request.getParameter("formaSolOrd"));
                                       if(id_forma_solucion==1)
                                       {
                                           fecha_dicto_solucion=request.getParameter("fechaResolucionOrd1");
                                           monto_solucion=request.getParameter("montoOrd1");
                                       }
                                       else if(id_forma_solucion==2||id_forma_solucion==3)
                                       {
                                           fecha_dicto_solucion=request.getParameter("fechaResolucionOrd1");
                                       }
                                       else if(id_forma_solucion==9)
                                       {
                                            especifiqueSolucion= request.getParameter("espSolOrd2");
                                            fecha_dicto_solucion=request.getParameter("fechaResolucionOrd1");
                                       }
                                   }
                                   else
                                   {
                                       id_forma_solucion=combos.indiceFormaSolExp(request.getParameter("formaSolOrd2"));
                                        if(id_forma_solucion==4)
                                       {
                                           fecha_dicto_solucion=request.getParameter("fechaResolucionOrd2");                                    
                                           id_tipo_sentencia=combos.indiceSentencia(request.getParameter("tipoSentencia"));
                                           if(id_tipo_sentencia==2||id_tipo_sentencia==3)
                                           {
                                               monto_solucion=request.getParameter("montoOrd2");
                                           }
                                       }
                                        else if(id_forma_solucion==1)
                                        {
                                             fecha_dicto_solucion=request.getParameter("fechaResolucionOrd2");
                                             monto_solucion=request.getParameter("montoOrd2");
                                        }
                                        else if(id_forma_solucion==2||id_forma_solucion==3)
                                       {
                                           fecha_dicto_solucion=request.getParameter("fechaResolucionOrd2");
                                       }   
                                        else if(id_forma_solucion == 9)
                                        {
                                            especifiqueSolucion = request.getParameter("espSolOrd3");
                                        }
                                   }
                               }
                               else
                               {
                                   fecha_ult_act_proc=request.getParameter("fechaUltActProc");
                               }
                     }
                 
                      valoresSeleccionados = request.getParameterValues("check_motivosO");
                      circunstanciasSeleccionadas = request.getParameterValues("check_circunstancias");
                      conceptosReclamadosSeleccionados = request.getParameterValues("check_conceptos");
                      prestacionesSeleccionadas = request.getParameterValues("check_prestaciones");
                
                     
               }
               
                comentarios=request.getParameter("comentarios");
                
                
                
                /* #################################SE REALIZA LA INSERCIÓN #######################################*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            // ----ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------|| 
                if(gestorBD.registrarProcedimiento(id_expediente, id_tipo_expediente, id_organoj, clave_expediente, clave_cuaderno_incid,   fecha_present_incidente, fecha_apert_cuader_incid, id_tipo_incidente, fecha_apertura_exped, id_tipo_asunto, id_nat_conflicto, preg_trab_contr_escri, id_tipo_contrato, rama_involuc, id_sector_sbtor,  fecha_pres_ejecu_sent, id_ent_mpio, preg_outsourcing, preg_apl_cir_vin_mot_conf, preg_prestacion,  preg_fecha_celebr_audiencia, fecha_audiencia, motivo_conf_colectivo, preg_incompetencia,  id_tipo_incompetencia, fecha_pliego_peticion, fecha_present_demanda, fecha_present_promo, fecha_admision_promo, id_promovente, preg_const_conciliac, clave_const_conciliac, preg_asunto_vinc_concil_p, preg_formulo_demanda, preg_desahogo_demanda, id_estatus_demanda, id_causa_imp_adm_demanda, fecha_adm_demanda, cant_actores, cant_demandados, preg_huelga_emplazam, preg_prehuelga, preg_audiencia_concil, fecha_audiencia_concil, preg_huelga_estalla, id_huelga_licitud, id_huelga_existencia, preg_auto_depuracion_tram, fecha_auto_depuracion, preg_aud_prelim_celebr, fecha_audiencia_prelim, preg_celebra_aud_juicio, fecha_aud_juicio, preg_audiencia_col_nat_eco, fecha_audiencia_col_nat_eco, id_estatus_exped, fecha_concluy_exped, fecha_ult_act_proc, id_fase_sol_exped, fecha_concl_ejecu, id_fase_concl_ejec, id_forma_solucion, fecha_dicto_solucion, porcent_solicitado, porcent_otorgado, id_tipo_sentencia, fecha_huelga_estalla, fecha_huelga_levantam, huelga_dias, monto_solucion, porcent_salarios_caidos, id_sentencia_efecto, comentarios, especifiqueMotivos, especifiqueCircusntancias, especifiqueConceptos, especifiquePrestaciones, especifiqueIncompetencia, especifiqueSolucion))
               {
                      if(id_tipo_expediente==9)//----------------------------------*EJECUCION---------------------------------
                      {
                            gestorBD.registraMotivoEje(motivoPromoEje, id_expediente);
                            response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==8) //-----------------------------CREDITO-------------------------------------
                      {
                            if(motivosSolicitudPromoSeleccionados!=null )
                            {
                                int idMotivoCRED;
                                for(int i=0; i<motivosSolicitudPromoSeleccionados.length; i++)
                                {
                                    idMotivoCRED=combos.indiceMotivoPromo(motivosSolicitudPromoSeleccionados[i]);
                                    gestorBD.registraMotivoEje(idMotivoCRED, id_expediente);
                                }
                               
                            }                           
                            response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");       
                      }
                      else if(id_tipo_expediente==7)//---------------------------------------------------------------------TERCERIAS--------------------------------------------------------------------------------
                      {
                          response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==6)//--------------------------------------------------------------PARAPROCESAL---------------------------------------------------------------------------
                      {
                          gestorBD.registraMotivoEje(motivoPromoEje, id_expediente);
                          response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==5)//-------------------------------------COLECTIVO NATURALEZA ECONOMICA---------------------------------------------------
                      {
                          if(valoresSeleccionados != null)
                          {
                              int idMotivoCNE;
                              for(int i=0; i<valoresSeleccionados.length;i++)
                              {
                                  idMotivoCNE = combos.indiceMotivoConflicto(valoresSeleccionados[i]);
                                  gestorBD.registraMotivosOrd(id_nat_conflicto, id_expediente);
                              }
                          }
                          if(suspensionesSeleccionadas!=null)
                          {
                              int idSuspensionCNE;
                              for(int i = 0; i<suspensionesSeleccionadas.length; i++)
                              {
                                  idSuspensionCNE = combos.indiceSuspensiones(suspensionesSeleccionadas[i]);
                                  gestorBD.registraSuspension(idSuspensionCNE, id_expediente);
                              }
                          }
                          response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==4)//---------------------------------------------------------------------HUELGA-------------------------------------------------------------------------------------
                      {
                          response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==3)//---------------------------COLECTIVO-----------------------------------
                      {
                          //----------------------insertando especifique--------------------
                           if(especifiqueMotivos!=null)
                            {
                               int idMot = gestorBD.indiceMotivosC()+1;
                               gestorBD.registrarEspecifiqueMotivosC(idMot, especifiqueMotivos);
                            }
                           if(especifiqueViolaciones!=null )
                           {
                               int idViol =gestorBD.indiceViol()+1;
                               gestorBD.registrarEspecifiqueViol(idViol, especifiqueViolaciones);
                           }
                             if(especifiqueIncompetencia!=null)
                            {
                                int idInc = gestorBD.indiceIncompetencia()+1;
                                gestorBD.registrarEspecifiqueIncompetencia(idInc, especifiqueIncompetencia);
                            }
                              if(especifiqueSolucion!=null)
                            {
                                int indSol = gestorBD.indiceSolucion()+1;
                                gestorBD.registrarEspecifiqueSolucion(indSol, especifiqueSolucion);
                            }
                          //----------------insertando los checkbox seleccionados--------------------
                           if(valoresSeleccionados != null) //->motivos
                          {
                               int idMotivoCOL;
                                for(int i=0; i<valoresSeleccionados.length;i++)
                                {
                                     idMotivoCOL=combos.indiceMotivoConflicto(valoresSeleccionados[i]);
                                     gestorBD.registraMotivosOrd(idMotivoCOL, id_expediente);
                                }
                          }
                           if(suspensionesSeleccionadas!=null)
                           {
                               int idSus;
                               for(int i=0; i<suspensionesSeleccionadas.length; i++)
                               {
                                 //  idSus=combos.indiceSuspensiones(comentarios)
                               }
                           }
                           
                            response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==2)//-----------------------------INDIVIDUAL-------------------------------
                      {
                          //--------------insertando especifique--------------------
                           if(especifiqueMotivos!=null)
                            {
                               int idMotIND = gestorBD.indiceMotivosC()+1;
                               gestorBD.registrarEspecifiqueMotivosC(idMotIND, especifiqueMotivos);
                            }
                            if(especifiqueIncompetencia!=null)
                            {
                                int idInc = gestorBD.indiceIncompetencia()+1;
                                gestorBD.registrarEspecifiqueIncompetencia(idInc, especifiqueIncompetencia);
                            }
                             if(especifiqueSolucion!=null)
                            {
                                int indSol = gestorBD.indiceSolucion()+1;
                                gestorBD.registrarEspecifiqueSolucion(indSol, especifiqueSolucion);
                            }
                           //---------------insertando checkbox seleccionado-------------------------
                          if(valoresSeleccionados != null) //->motivos
                          {
                               int idMotivo;
                                for(int i=0; i<valoresSeleccionados.length;i++)
                                {
                                     idMotivo=combos.indiceMotivoConflicto(valoresSeleccionados[i]);
                                     gestorBD.registraMotivosOrd(idMotivo, id_expediente);
                                }
                          }
                            response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
                      }
                      else if(id_tipo_expediente==1)//-----------------------------------------------------------------------ORDINARIO----------------------------------------------------------------------------
                      {
                          //---------------Insertando los especifique-----------
                            if(especifiqueMotivos!=null)
                            {
                               int idMot = gestorBD.indiceMotivosC()+1;
                               gestorBD.registrarEspecifiqueMotivosC(idMot, especifiqueMotivos);
                            }
                            if(especifiqueCircusntancias!=null)
                            {
                                int idCirc = gestorBD.indiceCircunstancias()+1;
                                gestorBD.registrarEspecifiqueCircunstancias(idCirc, especifiqueCircusntancias);
                            }
                            if(especifiqueConceptos!=null)
                            {
                                int idConc = gestorBD.indiceConceptosR()+1;
                                gestorBD.registrarEspecifiqueConceptosR(idConc, especifiqueConceptos);
                            }
                            if(especifiquePrestaciones!=null)
                            {
                                int idPres = gestorBD.indicePrestaciones()+1;
                                gestorBD.registrarEspecifiquePrestacion(idPres, especifiquePrestaciones);
                            }
                            if(especifiqueIncompetencia!=null)
                            {
                                int idInc = gestorBD.indiceIncompetencia()+1;
                                gestorBD.registrarEspecifiqueIncompetencia(idInc, especifiqueIncompetencia);
                            }
                            if(especifiqueSolucion!=null)
                            {
                                int indSol = gestorBD.indiceSolucion()+1;
                                gestorBD.registrarEspecifiqueSolucion(indSol, especifiqueSolucion);
                            }
                            //----------------insertando los checkbox seleccionados--------------                           
                            if(id_tipo_asunto==1)
                            {
                                if (valoresSeleccionados != null) //--> motivos
                               {
                                int idMotivo;
                                for(int i=0; i<valoresSeleccionados.length;i++)
                                {
                                     idMotivo=combos.indiceMotivoConflicto(valoresSeleccionados[i]);
                                     gestorBD.registraMotivosOrd(idMotivo, id_expediente);
                                }
                            }
                            
                           
                                if(circunstanciasSeleccionadas!=null)
                                {
                                     int idCircunstancia;
                                     for(int i=0; i<circunstanciasSeleccionadas.length;i++)
                                     {
                                          idCircunstancia=combos.indiceCircunstancias(circunstanciasSeleccionadas[i]);
                                          gestorBD.registraCircunstancias(idCircunstancia, id_expediente);
                                     }
                                }
                                                        
                            if(conceptosReclamadosSeleccionados!=null)
                            {
                                int idConcepto;
                                for(int i=0; i<conceptosReclamadosSeleccionados.length; i++)
                                {
                                    idConcepto=combos.indiceConceptos(conceptosReclamadosSeleccionados[i]);
                                    gestorBD.registraConceptos(idConcepto, id_expediente);
                                }
                            }
                            
                            if(prestacionesSeleccionadas!=null)
                            {
                                int idPrestacion;
                                for(int i=0; i<prestacionesSeleccionadas.length;i++)
                                {
                                     idPrestacion=combos.indicePrestaciones(prestacionesSeleccionadas[i]);
                                     gestorBD.registraPrestacion(idPrestacion, id_expediente);
                                }
                            }
                        }                          
                      response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp?completado=si"); 
                      }
               }
              //reiniciando las variabkles
              id_expediente=null; id_tipo_expediente=null; id_organoj=null;  clave_expediente=null;       
              clave_cuaderno_incid=null; fecha_present_incidente=null; fecha_apert_cuader_incid=null;  id_tipo_incidente=null; fecha_apertura_exped=null; id_tipo_asunto=null; id_nat_conflicto=null; preg_trab_contr_escri=null; id_tipo_contrato=null; rama_involuc=null; id_sector_sbtor=null;
              fecha_pres_ejecu_sent=null;  id_ent_mpio=null; preg_outsourcing=null; preg_apl_cir_vin_mot_conf=null; preg_prestacion=null; preg_fecha_celebr_audiencia=null; fecha_audiencia=null; motivo_conf_colectivo=null; 
              preg_incompetencia=null; id_tipo_incompetencia=null; fecha_pliego_peticion=null; fecha_present_demanda=null; fecha_present_promo=null;  fecha_admision_promo=null;
              id_promovente=null; preg_const_conciliac=null; clave_const_conciliac=null; preg_asunto_vinc_concil_p=null; preg_formulo_demanda=null; preg_desahogo_demanda=null;
              id_estatus_demanda=null; id_causa_imp_adm_demanda=null; fecha_adm_demanda=null; cant_actores=null; cant_demandados=null;  preg_huelga_emplazam=null;  preg_prehuelga=null;
              preg_audiencia_concil=null; fecha_audiencia_concil=null; preg_huelga_estalla=null; id_huelga_licitud=null; id_huelga_existencia=null; preg_auto_depuracion_tram=null;  fecha_auto_depuracion=null; preg_aud_prelim_celebr=null; fecha_audiencia_prelim=null; preg_celebra_aud_juicio=null; fecha_aud_juicio=null; preg_audiencia_col_nat_eco=null;
              fecha_audiencia_col_nat_eco=null; id_estatus_exped=null; fecha_concluy_exped=null; fecha_ult_act_proc=null; id_fase_sol_exped=null; fecha_concl_ejecu=null; id_fase_concl_ejec=null; id_forma_solucion=null; fecha_dicto_solucion=null; porcent_solicitado=null; porcent_otorgado=null;  id_tipo_sentencia=null; fecha_huelga_estalla=null; fecha_huelga_levantam=null; 
              huelga_dias=null; monto_solucion=null; porcent_salarios_caidos=null; id_sentencia_efecto=null; comentarios=null;
                /*###############################################################################################*/
        }
         catch(Exception e)
        {
            e.getMessage();
        }
         finally 
        {
            out.close();
        }               
    }


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                  try {
                      processRequest(request, response);
                  } catch (SQLException ex) {
                      Logger.getLogger(GuardaProcedimiento.class.getName()).log(Level.SEVERE, null, ex);
                  }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                  try {
                      processRequest(request, response);
                  } catch (SQLException ex) {
                      Logger.getLogger(GuardaProcedimiento.class.getName()).log(Level.SEVERE, null, ex);
                  }
     }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
