/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Combos.SQL_Generales;
import Modelo.Organo;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "tablaOrgano", urlPatterns = {"/tablaOrgano"})
public class tablaOrgano extends HttpServlet 
{
    SQL_Generales g=new SQL_Generales();
    Organo o=new Organo();
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException
   {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
          

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet muestraRegistro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet muestraRegistro at " + request.getContextPath () + "</h1>");
            out.println("<h2> Este es el Servlet muestraRegistro.java</h2>");
            out.println("<h3> A continuación se muestran los parámetros recibidos </h3>");
           // out.println(actor);
            out.println("</body>");
            out.println("</html>");
        } 
        finally 
        {
            out.close();
    }
}  
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
    {
       String accion=request.getParameter("accion");
       switch(accion)
       {
           case "Listar":
           
          //List<String>datos = g.listar();
           
             //datos = g.listar();
          
              //request.setAttribute("datos", datos);
               request.getRequestDispatcher("tablaO.jsp").forward(request, response);
               break;

           default:
               throw new AssertionError();
       }
    }
}

 

