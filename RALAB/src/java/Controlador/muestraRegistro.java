/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "muestraRegistro", urlPatterns = {"/muestraRegistro"})
public class muestraRegistro extends HttpServlet 
{
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
        processRequest(request, response);
    }
}
 

