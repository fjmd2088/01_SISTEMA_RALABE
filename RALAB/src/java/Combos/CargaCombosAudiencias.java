package Combos;

import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CargaCombosAudiencias {
    public int indiceAudiencia(String audiencia) throws SQLException
     {
         ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT id_tipo_audiencia FROM TC_TIPO_AUDIENCIA where descripcion= '"+audiencia+"'";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }
            return valor;        
     }
    //*****************************************************************************************************
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
    
    public List<String> listaExpedientes3(String tipo, String cve_organo)
     {
        ConectaBD c=new ConectaBD(); 
        List<String> resultados=new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String consulta;
        try
        {
            conn=c.conectar();
            consulta="SELECT DISTINCT clave_expediente FROM TR_EXPEDIENTE E, TC_PROCEDIMIENTO P "
                    + "WHERE P.ID_TIPO_PROCEDIMIENTO = ID_TIPO_EXPEDIENTE "
                    + "AND E.ID_ORGANOJ = '"+cve_organo+"'"
                    + "AND P.DESCRIPCION = '" + tipo + "'";
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
}

