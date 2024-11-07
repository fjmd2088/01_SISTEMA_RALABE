package Combos;

import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class CargaCombosO 
{       
     ConectaBD conexion=new ConectaBD();
     
     /* =======================SENTENCIA QUE OBTIENE LAS ENTIDADES DE LA BASE DE DATOS ====================*/
     public List<String> consultaEntidad()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT entidad\n" +
"FROM (\n" +
"    SELECT DISTINCT ON (entidad) entidad, id_ent_mpio, clave_entidad -- Especificar las columnas que necesitas\n" +
"    FROM public.tc_entidad_mpio\n" +
") AS distinct_entidad\n" +
"WHERE id_ent_mpio IS NOT NULL -- Reemplazar 'LIKE null' por 'IS NOT NULL'\n" +
"  AND clave_entidad <> '-1'\n" +
"ORDER BY \n" +
"    CASE \n" +
"        WHEN entidad = 'No identificado' THEN 1\n" +
"        ELSE 0\n" +
"    END,\n" +
"    entidad;";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("entidad"); // Cambia "columna" al nombre de tu columna en la tabla
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
     
      /* ==== SENTENCIA QUE OBTIENE LOS MUNICIPIOS DE LA BASE DE DATOS, EN FUNCION DEL PARAMETRO RECIBIDO ====*/
      public List<String> consultaMunicipio(String entidad)
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
       
        try
        {
            conn=conexion.conectar();
            consulta="SELECT municipio\n" +
"FROM (\n" +
"    SELECT DISTINCT ON (municipio) *\n" +
"    FROM public.tc_entidad_mpio\n" +
"	where entidad = '"+entidad+"' and id_ent_mpio not like 'null'\n" +
") AS distinct_municipio\n" +
"ORDER BY \n" +
"    CASE \n" +
"        WHEN municipio = 'No identificado' THEN 1\n" +
"        WHEN municipio = 'Otro' THEN 2\n" +                
"        ELSE 0\n" +
"    END,\n" +
"    municipio";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("municipio"); // Cambia "columna" al nombre de tu columna en la tabla
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
    
 /* ========================== SENTENCIA QUE OBTIENE LAS CIRCUNSCRIPCIONES DE LA BASE DE DATOS=================== */
        public List<String> consultaCircunscripcion()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
       
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_CIRCUNSCRIPCION where id_circunscripcion<5 and id_circunscripcion>0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); // Cambia "columna" al nombre de tu columna en la tabla
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
    /* ========================== SENTENCIA QUE OBTIENE LAS JURIDICCIONES DE LA BASE DE DATOS=================== */    
        public List<String> consultaJurisdiccion()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
       
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_JURISDICCION";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); // Cambia "columna" al nombre de tu columna en la tabla
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
            consulta="SELECT distinct id_organoj FROM TR_EXPEDIENTE";
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
        
         public int indiceEnt(String entidad) throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT clave_entidad FROM TC_ENTIDAD_MPIO where entidad= '"+entidad+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
           
            return valor;        
     }
    
     public int indiceMun(String municipio) throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT clave_municipio FROM TC_ENTIDAD_MPIO where municipio= '"+municipio+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
     /* -=========================OBTIENE EL ID DE LA CIRCUNSCRIPCION ELEGIDA EN COMBOBOX===================*/   
        public int indiceCir(String circunscripcion) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_circunscripcion FROM TC_CIRCUNSCRIPCION where descripcion= '"+circunscripcion+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
        
       /* -=========================OBTIENE EL ID DE LA JURISDICCION ELEGIDA EN COMBOBOX===================*/     
         public int indiceJuris(String jurisdiccion) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_jurisdiccion FROM TC_JURISDICCION where descripcion= '"+jurisdiccion+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
         
      /*==OBTIENE LA CANTIDAD DE REGISTROS EN LA TABLA "ORGANO JURISDICIONAL" PARA GENERAR UN CONSECUTIVO==*/
         public int consecutivoOrgano(String ent, String mun) throws SQLException
      {
          int consecutivo=0;
          
          ConectaBD c=new ConectaBD();
        c.conectar();
        
            // Consulta SQL para obtener los datos
          
           String sql = "SELECT COUNT(*) FROM TR_ORGANOJ A, tc_entidad_mpio B WHERE A.ID_ENT_MPIO = B.ID_ENT_MPIO AND B.ENTIDAD='"+ent+"' And B.MUNICIPIO='"+mun+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                consecutivo=rs.getInt(1);
            }
          return consecutivo;
      }
         
          /*==OBTIENE LA CANTIDAD DE REGISTROS EN LA TABLA "TC_CIRCUNSCRIPCION" PARA GENERAR UN CONSECUTIVO==*/
         public int consecutivoCircunscripcion() throws SQLException
      {
          int consecutivo=0;
          
          ConectaBD c=new ConectaBD();
           c.conectar();
        
            // Consulta SQL para obtener los datos
            String sql = "SELECT COUNT(*) FROM TC_CIRCUNSCRIPCION";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                consecutivo=rs.getInt(1);
            }
          return consecutivo;
      }
         
         public int idEntidadMunicipio(String entidad, String municipio) throws SQLException
      {
          int entmun=0;
          ConectaBD c=new ConectaBD();
        c.conectar();
        
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_ent_mpio FROM TC_ENTIDAD_MPIO where entidad = '"+entidad+"' and municipio = '"+municipio+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                entmun=rs.getInt(1);
            }
          return entmun;
      }
}


 
