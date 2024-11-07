package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Sentencia_guarda_audiencia {
      public boolean registrar(String id_audiencia, String fecha_celebracion, Integer id_tipo_audiencia, String inicio, String conclusion, Integer id_expediente, String comentarios)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TR_AUDIENCIA (id_audiencia, fecha_celebracion, id_tipo_audiencia, inicio,  conclusion, id_expediente, comentarios)"
                                                                                         + " VALUES ('"+id_audiencia+"', '"+fecha_celebracion+"', "+id_tipo_audiencia+", '"+inicio+"','"+conclusion+"',"+id_expediente+",'"+comentarios+"')");
            if(resultUpdate != 0)
            {
                obj.cerrar();
                return true;
            }
            else
            {
                obj.cerrar();
                return false;
            }
        }
        catch (Exception e) 
        {
            System.out.println("Error en la base de datos.");
            e.printStackTrace();
            return false;
        }
    }
       public int indiceAudiencia() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_tipo_audiencia) FROM TC_TIPO_AUDIENCIA";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     }
        public boolean registrarAudiencia(Integer id, String audiencia)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_TIPO_AUDIENCIA (id_tipo_audiencia, descripcion) VALUES ("+id+", '"+audiencia+"')");
            if(resultUpdate != 0)
            {
                obj.cerrar();
                return true;
            }
            else
            {
                obj.cerrar();
                return false;
            }
        }
        catch (Exception e) 
        {
            System.out.println("Error en la base de datos.");
            e.printStackTrace();
            return false;
        }
    }
    
}
