package Controlador;

import Combos.CargaCombosAudiencias;
import Modelo.Sentencia_guarda_audiencia;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "GuardaAudiencia", urlPatterns = {"/GuardaAudienciar"})
public class GuardaAudiencia extends HttpServlet {

    CargaCombosAudiencias objAud = new CargaCombosAudiencias();
    Sentencia_guarda_audiencia sentAud = new Sentencia_guarda_audiencia();
    String id_audiencia = null;
    String fecha_celebracion = null;
    Integer id_tipo_audiencia = null;
    String inicio = null;
    String conclusion = null;
    Integer id_expediente = null;
    String comentarios = null;
    String especifiqueAudiencia=null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String procedimiento = request.getParameter("procedimientosAUD");
            id_audiencia = request.getParameter("claveOrgAUD")+"_"+ request.getParameter("comboExpedientes3")+"_"+ request.getParameter("idAudiencia");
            if (procedimiento.equals("Ordinario") || procedimiento.equals("Especial individual")) {
                id_tipo_audiencia = objAud.indiceAudiencia(request.getParameter("listaOrdInd"));
            } else if (procedimiento.equals("Especial colectivo")) {
                id_tipo_audiencia = objAud.indiceAudiencia(request.getParameter("listaCol"));
            } else if (procedimiento.equals("Huelga")) {
                id_tipo_audiencia = objAud.indiceAudiencia(request.getParameter("listaHuelga"));
            } else if (procedimiento.equals("Colectivo de naturaleza económica")) {
                id_tipo_audiencia = objAud.indiceAudiencia(request.getParameter("listaCne"));
            }
            
            if(id_tipo_audiencia == 3)
            {
                especifiqueAudiencia = request.getParameter("espOtraAud");
            }
            fecha_celebracion = request.getParameter("fechaCelebAud");
            inicio = request.getParameter("hInicio");
            conclusion = request.getParameter("hConclusion");
            id_expediente = objAud.indiceExpediente(request.getParameter("comboExpedientes3"));
           
            comentarios = request.getParameter("comentariosAUD");
            if (sentAud.registrar(id_audiencia, fecha_celebracion, id_tipo_audiencia, inicio, conclusion, id_expediente, comentarios)) 
            {
                if(especifiqueAudiencia != null)
                {
                     Integer idAud = sentAud.indiceAudiencia()+1;
                     sentAud.registrarAudiencia(idAud, especifiqueAudiencia);
                }
                response.sendRedirect("/Proyecto_RALAB/Interfaz_main.jsp");
            } 
            else 
            {
                request.getRequestDispatcher("/errorEnRegistro.jsp").forward(request, response);
            }
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(GuardaAudiencia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
