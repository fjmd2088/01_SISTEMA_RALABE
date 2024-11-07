package Combos;
import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class LoginUsuario {
     ConectaBD conexion=new ConectaBD();
     
    public boolean usuario(String nombre, String contrasena)
     {
       
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        boolean existeUsuario=false;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT nombre_usuario, contrasena FROM TC_USUARIO where nombre_usuario = '"+nombre+"' and contrasena = '"+contrasena+"' ";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
           if(rs.next())
           {
               existeUsuario=true;
           }
           else
           {
               existeUsuario=false;
           }
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y recursos
            try {
                if (rs != null)rs.close();                
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
         return existeUsuario;
     }
}
