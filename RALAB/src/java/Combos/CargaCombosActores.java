package Combos;

import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CargaCombosActores {
    ConectaBD conexion=new ConectaBD();
     public List<String> listaExpedientes(String tipo, String cve_organo)
     {
         
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT DISTINCT clave_expediente FROM TR_EXPEDIENTE E, TC_PROCEDIMIENTO P "
                    + "WHERE P.ID_TIPO_PROCEDIMIENTO = ID_TIPO_EXPEDIENTE "
                    + "AND E.ID_ORGANOJ = '"+cve_organo+"'"
                    + "AND P.DESCRIPCION = '" + tipo + "'"
                    + "AND E.PREG_INCOMPETENCIA = 2 "
                    + "AND E.ID_ESTATUS_DEMANDA = 1";
            
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("clave_expediente"); 
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
     
      public int indiceActor(String actor) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_tipo_actor FROM TC_ACTOR where descripcion= '"+actor+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
      
       public int indiceDefensa(String defensa) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_defensa FROM TC_DEFENSA where descripcion= '"+defensa+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
       
       public int indiceSexo(String sexo) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_sexo FROM TC_SEXO where descripcion= '"+sexo+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
       public int indiceOcupacion(String ocupacion) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_ocupacion  FROM TC_OCUPACION where descripcion= '"+ocupacion+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
       
        public int indiceJornada(String jornada) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_jornada  FROM TC_JORNADA where descripcion= '"+jornada+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
        
         public int indiceSindicato(String sindicato) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_tipo_sindicato  FROM TC_SINDICATO where descripcion= '"+sindicato+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
         
          public int indiceOrganizacionObrera(String organizacion) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_org_obr  FROM TC_ORG_OBR where descripcion= '"+organizacion+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
     public int indicePatron(String patron) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_tipo_patron  FROM TC_PATRON where descripcion= '"+patron+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
     
      public List<String> listaOcupaciones()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_OCUPACION ";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
       public List<String> listaDefensa()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_DEFENSA WHERE id_defensa > 0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
         public List<String> listaActor()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion\n" +
"       FROM TC_ACTOR\n" +
"       WHERE id_tipo_actor IN (1, 3, 4, 7) ORDER BY\n" +
"                   CASE \n" +
"                    WHEN id_tipo_actor = 1 THEN 1\n" +
"                    WHEN id_tipo_actor = 3 THEN 2\n" +
"                    WHEN id_tipo_actor = 4 THEN 3 \n" +
"                    WHEN id_tipo_actor = 7 THEN 4				\n" +
"                    END";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
          public List<String> listaActor2()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion\n" +
"       FROM TC_ACTOR\n" +
"       WHERE id_tipo_actor IN (1, 6, 7) ORDER BY\n" +
"                   CASE \n" +
"                    WHEN id_tipo_actor = 1 THEN 1\n" +
"                    WHEN id_tipo_actor = 6 THEN 2\n" +
"                    WHEN id_tipo_actor = 7 THEN 3                    	\n" +
"                    END";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
           public List<String> listaActor3()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion\n" +
"       FROM TC_ACTOR\n" +
"       WHERE id_tipo_actor IN (3, 4, 2, 7) ORDER BY\n" +
"                   CASE \n" +
"                    WHEN id_tipo_actor = 3 THEN 1\n" +
"                    WHEN id_tipo_actor = 4 THEN 2\n" +
"                    WHEN id_tipo_actor = 2 THEN 3 \n" +
"                    WHEN id_tipo_actor = 7 THEN 4				\n" +
"                    END";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
            public List<String> listaActor4()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion\n" +
"       FROM TC_ACTOR\n" +
"       WHERE id_tipo_actor IN (3, 5, 7) ORDER BY\n" +
"                   CASE \n" +
"                    WHEN id_tipo_actor = 3 THEN 1\n" +
"                    WHEN id_tipo_actor = 5 THEN 2\n" +
"                    WHEN id_tipo_actor = 7 THEN 3                   				\n" +
"                    END";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
             public List<String> listaActor5()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion\n" +
"       FROM TC_ACTOR\n" +
"       WHERE id_tipo_actor IN (3, 5, 2, 7) ORDER BY\n" +
"                   CASE \n" +
"                    WHEN id_tipo_actor = 3 THEN 1\n" +
"                    WHEN id_tipo_actor = 5 THEN 2\n" +
"                    WHEN id_tipo_actor = 2 THEN 3 \n" +
"                    WHEN id_tipo_actor = 7 THEN 4				\n" +
"                    END";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
       public List<String> listaSexo()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_SEXO";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
        public List<String> listaJornada()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_JORNADA";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
          public List<String> listaSindicato()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_SINDICATO WHERE id_tipo_sindicato > 0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
           public List<String> listaOrgObr()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_ORG_OBR WHERE id_org_obr > 0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
          public List<String> respuestaSimple()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_RESPUESTA_SIMPLE WHERE id_respuesta > 0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
          public List<String> tipoPatron()
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT descripcion FROM TC_PATRON WHERE id_tipo_patron > 0";
            stmt = conn.prepareStatement(consulta);
            rs = stmt.executeQuery();
            while (rs.next()) {
                String dato = rs.getString("descripcion"); 
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
      //****************************************************************
             
      
        public int indiceEntidadMunicipio(String entidad, String municipio) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_ent_mpio  FROM TC_ENTIDAD_MPIO where entidad = '"+entidad+"' AND municipio = '"+municipio+"'  ";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
        public int indiceExpediente(String expediente) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_expediente FROM public.tr_expediente where clave_expediente = '"+expediente+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }  
         public int indiceProcedimiento(String procedimiento) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_tipo_procedimiento FROM TC_PROCEDIMIENTO where descripcion= '"+procedimiento+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
}

