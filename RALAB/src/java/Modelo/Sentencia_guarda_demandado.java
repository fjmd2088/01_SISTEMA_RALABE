
package Modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Sentencia_guarda_demandado {
      public boolean registrar(String id_demandado, Integer id_tipo_demandado, Integer id_defensa, String nombre_sindicato, String reg_asoc_sindicato, Integer id_tipo_sindicato, String preg_sind_pert_org_obr, Integer id_org_obr, Integer cant_trab_invol_h, Integer cant_trab_invol_m, Integer cant_trab_invol_ni, Integer trab_invol_tot, Integer id_tipo_patron, String rfc, String razon_social, String calle, String num_exterior, String num_interior, String colonia, String cp, String id_ent_mpio, Double latitud, Double longitud, String comentarios)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TR_DEMANDADO (id_demandado, id_tipo_demandado, id_defensa, nombre_sindicato,  reg_asoc_sindicato, id_tipo_sindicato, preg_sind_pert_org_obr, id_org_obr, cant_trab_invol_h, cant_trab_invol_m, cant_trab_invol_ni, trab_invol_tot, id_tipo_patron, rfc, razon_social, calle, num_exterior, num_interior, colonia, cp, id_ent_mpio,  latitud,  longitud, comentarios)"
                                                                                         + " VALUES ('"+id_demandado+"', "+id_tipo_demandado+", "+id_defensa+", '"+nombre_sindicato+"','"+reg_asoc_sindicato+"',"+id_tipo_sindicato+",'"+preg_sind_pert_org_obr+"',"+id_org_obr+","+cant_trab_invol_h+","+cant_trab_invol_m+","+cant_trab_invol_ni+","+trab_invol_tot+", "+id_tipo_patron+",'"+rfc+"', '"+razon_social+"','"+calle+"', '"+num_exterior+"', '"+num_interior+"', '"+colonia+"', '"+cp+"', '"+id_ent_mpio+"', "+latitud+", "+longitud+", '"+comentarios+"')");
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
      
       public boolean registrarDemandanteExpediente(Integer idActor, Integer idExpediente)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TR_EXP_ACTOR (actores_id, id_expediente) VALUES ('"+idActor+"', "+idExpediente+")");
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
      
       public int indiceSindicato() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_tipo_sindicato) FROM TC_SINDICATO";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     }
    
    public boolean registrarSindicato(Integer id, String sindicato)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_SINDICATO (id_tipo_sindicato, descripcion) VALUES ("+id+", '"+sindicato+"')");
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
    
     public int indiceOrganizacion() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_org_obr) FROM TC_ORG_OBR";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     }
    
    public boolean registrarOrganizacion(Integer id, String organizacion)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_ORG_OBR (id_org_obr, descripcion)"
                                                                                         + " VALUES ("+id+", '"+organizacion+"')");
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
