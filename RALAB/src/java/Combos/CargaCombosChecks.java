
package Combos;

import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CargaCombosChecks {
    ConectaBD conexion=new ConectaBD();
    
    public List<String> listaMotivos(String expediente)
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        String [] motivos=null;
        try
        {
            conn=conexion.conectar();
            consulta="SELECT c.descripcion "
                        + "FROM tr_exp_motivo_solic t "
                        + "INNER JOIN tc_motivo_solic_prom c "
                        + "ON t.id_motivo_sol_promo = c.id_motivo_sol_promo "
                        + "INNER JOIN tr_expediente e ON t.id_expediente = e.id_expediente "
                        + "WHERE e.clave_expediente = '" +expediente+ "'";
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
    
     public List<String> listaExpedientes(String organo, String procedimiento)
     {
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        
        try
        {
            conn=conexion.conectar();
            consulta="SELECT te.clave_expediente "
                    + "FROM tr_expediente te "
                    + "INNER JOIN tr_organoj tr ON te.id_organoj = tr.id_organoj "
                    + "INNER JOIN tc_procedimiento tp ON te.id_tipo_expediente = tp.id_tipo_procedimiento "
                    + "WHERE tr.id_organoj = '"+organo+"' "
                    + "AND tp.descripcion = '"+procedimiento+"'";
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
     
     
    /////////////////////////////////////////////////////////////////
     
    public int indiceExpediente(String clave_expediente) throws SQLException
            {
                 ConectaBD c=new ConectaBD();
                 c.conectar();
                 int valor = 0;
                 // Consulta SQL para obtener los datos
                 String sql = "SELECT id_expediente FROM TR_EXPEDIENTE where clave_expediente= '"+clave_expediente+"'";
                 Statement stmt = c.con.createStatement();
                 ResultSet rs = stmt.executeQuery(sql);
                 if(rs.next())
                {
                    valor=rs.getInt(1);
                 }
                 return valor;        
            }
    
     public int borrar(String clave_expediente) throws SQLException
            {
                 ConectaBD c=new ConectaBD();
                 c.conectar();
                 int valor = 0;
                 // Consulta SQL para obtener los datos
                 String sql = "SELECT id_expediente FROM TR_EXPEDIENTE where clave_expediente= '"+clave_expediente+"'";
                 Statement stmt = c.con.createStatement();
                 ResultSet rs = stmt.executeQuery(sql);
                 if(rs.next())
                {
                    valor=rs.getInt(1);
                 }
                 return valor;        
            }
}


