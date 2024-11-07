/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Combos.SQL_Generales;
import Modelo.Sentencia_actualizar_generales;
import Modelo.Sentencia_guardar_generales;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Actualiza_generales", urlPatterns = {"/Actualiza_generales"})
public class Actualiza_generales extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try 
        {
            SQL_Generales obj=new SQL_Generales();
            //int id_g = obj.consecutivoG()+1;
            String id_organoj = request.getParameter("cve_org");
            int juezIndH = Integer.parseInt(request.getParameter("jih"));
            int juezIndM = Integer.parseInt(request.getParameter("jim"));
            int juezColH = Integer.parseInt(request.getParameter("jch"));
            int juezColM = Integer.parseInt(request.getParameter("jcm"));
            int juezMixH = Integer.parseInt(request.getParameter("jmh"));
            int juezMixM = Integer.parseInt(request.getParameter("jmm"));
            int juezSubH = Integer.parseInt(request.getParameter("sjh"));
            int juezSubM = Integer.parseInt(request.getParameter("sjm"));
            int juezTotal = Integer.parseInt(request.getParameter("tj"));
            
            int ord = Integer.parseInt(request.getParameter("ord"));
            int ind = Integer.parseInt(request.getParameter("ind"));
            int col = Integer.parseInt(request.getParameter("col"));
            int huelga = Integer.parseInt(request.getParameter("huelga"));
            int cne = Integer.parseInt(request.getParameter("cne"));
            int pv = Integer.parseInt(request.getParameter("pv"));
            int ter = Integer.parseInt(request.getParameter("ter"));
            int cred = Integer.parseInt(request.getParameter("cred"));
            int eje = Integer.parseInt(request.getParameter("eje"));
            
            
            Sentencia_actualizar_generales gestorBD = new Sentencia_actualizar_generales();
            
            if (gestorBD.registrar(id_organoj, juezIndH, juezIndM, juezColH, juezColM, juezMixH, juezMixM, juezSubH, juezSubM, juezTotal, ord, ind, col, huelga, cne, pv, ter, cred, eje))
            {
                 response.sendRedirect("/Proyecto_RALAB/tablaO.jsp");
                //request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            else
            {                
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
