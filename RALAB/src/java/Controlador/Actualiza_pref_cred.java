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


@WebServlet(name = "Actualiza_pref_cred", urlPatterns = {"/Actualiza_pref_cred"})
public class Actualiza_pref_cred extends HttpServlet {
     
               Sentencia_actualiza_prefCred gestorBD=new Sentencia_actualiza_prefCred();
               CargaCombosProcedimientos combos=new CargaCombosProcedimientos(); 
              
              //Variables principales **************************************************************************************
              Integer id_expediente=null; Integer id_tipo_expediente=null; String id_organoj=null; String clave_expediente=null;       
              String fecha_apertura_exped=null; String fecha_present_promo=null; String fecha_admision_promo=null;
              Integer id_promovente=null; Integer id_estatus_exped=null;  String fecha_dicto_solucion=null; String comentarios=null;
                String[] motivosSolicitudPromoSeleccionados;
              //********************************************************************************************************
               
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException 
    {       
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession se= request.getSession();
        try 
        {
              //String procedimiento=request.getParameter("procedimientos");
              
               id_organoj=request.getParameter("clave");
               clave_expediente=request.getParameter("claveExp");
               fecha_apertura_exped=request.getParameter("fecha");
               id_expediente=gestorBD.actualizaMotivos(clave_expediente);
              
             
               /*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                                      PREFERENCIA DE CREDITO
               ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
             
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
                 motivosSolicitudPromoSeleccionados=request.getParameterValues("motivos_PC");
                comentarios=request.getParameter("comentarios");
         
                /* #################################SE REALIZA LA INSERCIÓN #######################################*/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            // ----ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------ORDINARIO---------|| 
                if(gestorBD.registrarProcedimiento(id_tipo_expediente, clave_expediente, fecha_apertura_exped, fecha_present_promo, fecha_admision_promo, id_promovente, id_estatus_exped,  fecha_dicto_solucion, comentarios))
               {                   
                   gestorBD.borrarMotivos(id_expediente);                   
                   if(motivosSolicitudPromoSeleccionados!=null )
                            {
                                int idMotivoCRED;
                                for(int i=0; i<motivosSolicitudPromoSeleccionados.length; i++)
                                {
                                    idMotivoCRED=combos.indiceMotivoPromo(motivosSolicitudPromoSeleccionados[i]);
                                    gestorBD.registraMotivoEje(idMotivoCRED, id_expediente);
                                }                               
                            } 
                    response.sendRedirect("/Proyecto_RALAB/tablaP.jsp?actualiza=Si");       
               }
              //reiniciando las variabkles
              id_expediente=null; id_tipo_expediente=null; id_organoj=null;  clave_expediente=null; fecha_apertura_exped=null;      
               fecha_present_promo=null;  fecha_admision_promo=null; id_promovente=null; id_estatus_exped=null;   fecha_dicto_solucion=null; 
               comentarios=null;
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
                      Logger.getLogger(Actualiza_pref_cred.class.getName()).log(Level.SEVERE, null, ex);
                  }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                  try {
                      processRequest(request, response);
                  } catch (SQLException ex) {
                      Logger.getLogger(Actualiza_pref_cred.class.getName()).log(Level.SEVERE, null, ex);
                  }
     }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
