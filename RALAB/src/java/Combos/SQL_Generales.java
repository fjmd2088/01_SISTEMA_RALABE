 
package Combos;

import Modelo.ConectaBD;
import Modelo.Organo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;



public class SQL_Generales {
       ConectaBD conexion=new ConectaBD();
       PreparedStatement ps;
       Connection con ;
       ResultSet rs;
       
       public int consecutivoG() throws SQLException
       {
           conexion.conectar();
            int consecutivo=0;

            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX(id_general) FROM TR_GENERAL";
            Statement stmt = conexion.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                consecutivo=rs.getInt(1);
            }
          return consecutivo;
       }
       
   /////////////////////////////////////////////////////////////////////
       
       /*public List listar() 
       {
           ConectaBD conex=new ConectaBD();
           List<String>lista=new ArrayList<>();
           String sql = "SELECT * FROM TR_ORGANOJ";
         
           try
           {
              conex.conectar();
    
             Statement stmt=conex.con.createStatement();
              rs=stmt.executeQuery(sql);
        
               while(rs.next())
               {
                   String dats =rs.getString(1);
                   
                   Organo o=new Organo();
                   o.setClave(rs.getString(1));
                   System.out.print(rs.getString(1));
                   o.setNombre(rs.getString(2));
                   o.setSede(rs.getString(3));
                   o.setEntidad(Integer.parseInt(rs.getString(4)));
                   o.setColonia(rs.getString(5));
                   o.setLatitud(rs.getString(6));
                   o.setLongitud(rs.getString(7));
                   o.setCirunscripcion(Integer.parseInt(rs.getString(8)));
                   o.setOtraC(rs.getString(9));
                   o.setJurisdiccion(Integer.parseInt(rs.getString(10)));
                   o.setHorario(rs.getString(11));
                   lista.add(dats);
               }
           }
           catch(Exception e)
           {
               
           }
           return lista;
       }*/

  /////////////////////////////////////////////////////////////////////
       
       
   
       public List<String> consultaOrganos()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT id_organoj, nombre_organoj FROM TR_ORGANOJ";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("id_organoj");
                String dato2 =rs.getString("nombre_organoj");// Cambia "columna" al nombre de tu columna en la tabla
                resultados.add(dato + " --- "+ dato2);
   
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
         return resultados;
     }
        public List<String> consultaOrganos2()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT nombre_organoj FROM TR_ORGANOJ";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("nombre_organoj"); // Cambia "columna" al nombre de tu columna en la tabla
                resultados.add(dato);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
         return resultados;
     } 
         public List<String> consultaOrganos3()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT id_organoj FROM TR_ORGANOJ";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("id_organoj"); // Cambia "columna" al nombre de tu columna en la tabla
                resultados.add(dato);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar las conexiones y recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
         return resultados;
     } 
}
       
       
       

