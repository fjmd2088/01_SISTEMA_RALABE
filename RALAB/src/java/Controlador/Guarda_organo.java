package Controlador;

import Combos.CargaCombosO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.*;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Guarda_organo", urlPatterns = {"/Guarda_organo"})
public class Guarda_organo extends HttpServlet 
{
    
     
    protected void processRequest(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession se= request.getSession();
        try 
        {
            CargaCombosO obj=new CargaCombosO();
            
            //Obtiene el nombre del organo jurisdiccional}
            String nombre = request.getParameter("nombre").trim();
            
            //Obtiene la sede del organo jurisdiccional
            String sede = request.getParameter("sede").trim();     
            
            //Obtiene la colonia del organo jurisdcional
            String colonia = request.getParameter("colonia").trim();
            
            //Obtiene la latitud del organo jurisdiciconal
            String latitud = request.getParameter("latitud").trim();
            if(latitud.equals(""))
            {
                latitud="0.0";
            }
            
            //Obtiene la longitud del organo jurisdiccional
            String longitud = request.getParameter("longitud");
            if(longitud.equals("")){
                longitud="0.0";
            }
            //Obtiene la circunscripcion del organo jurisdicional
            int circunscripcion=obj.indiceCir(request.getParameter("C"));
            
            //Obtiene la jurisdiccion del organo jurisdiccional
            int jurisdiccion=obj.indiceJuris(request.getParameter("J"));
            
            //Obtiene el horario del organo jurisdiccional
            String horario = request.getParameter("diaUno")+ " a "+ request.getParameter("diaDos")+ " de "+ request.getParameter("horario1")+" a "+request.getParameter("horario2");
            
            //Obtiene el consecutivo concatenando las claves de la entidad, el municipio y el consecutivo
            String entidad = request.getParameter("E");
            String E=request.getParameter("E");
            String municipio= request.getParameter("M");
            
            int consecutivo=obj.consecutivoOrgano(entidad, municipio)+1;
            String cons=""+consecutivo;
            
            if(cons.length()==1)
            {
                cons="0"+cons;
            }
            String id = ""+obj.indiceMun(municipio);
          if(id.length()==4)
          {
              id="0"+id+cons;
          }
          else
          {
              id += cons;
          }
          
            //Obtiene el valor de otra circunscripcion en caso de ser seleccionada dicha opcion
            String OtraCir=request.getParameter("OtraCir").trim();
            String fechaG = request.getParameter("campoFechaHora");
           
          
            //Obtiene el id interno de la entidad municipio en el catalog
            int idEM=obj.idEntidadMunicipio(entidad, municipio);
            
           se.setAttribute("id", id);
            
            //Crea objeto de la clase "Sentencia_guardar_organo"
            Sentencia_guardar_organo gestorBD = new Sentencia_guardar_organo();
            
            
            //Se invoca al metodo que realiza el registro en la BD
            if (gestorBD.registrar(id, nombre, sede, idEM, colonia, latitud, longitud, circunscripcion, jurisdiccion, horario, OtraCir, fechaG))
            {
                 
                response.sendRedirect("/Proyecto_RALAB/Interfaz_Expediente.jsp");
              
            }
            else
            {   
                //Si la sentencia no se ejecuta, muestra el mensaje de que no se guardó el registro
            
                request.getRequestDispatcher("/errorEnRegistro.jsp").forward(request, response);
            }
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
       
       
    }
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
    {
        processRequest(request, response);
    }
}

