package Controlador;

import Combos.LoginUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
LoginUsuario log=new LoginUsuario();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          String usu = request.getParameter("usuario");
          String pas = request.getParameter("pas");
          
          boolean res= log.usuario(usu, pas);
          if (res==true)
          {
              request.getRequestDispatcher("/decision1.jsp").forward(request, response);   
          }
          else {
               request.getRequestDispatcher("/errorEnRegistro.jsp").forward(request, response);
          }
        } 
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
