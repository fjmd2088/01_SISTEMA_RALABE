package Modelo;

import Combos.CargaCombosProcedimientos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Sentencia_actualiza_prefCred { 
    
     public boolean registrarProcedimiento(Integer id_tipo_expediente, String clave_expediente, String fecha_apertura_exped, String fecha_present_promo, String fecha_admision_promo, Integer id_promovente, Integer id_estatus_exped,  String fecha_dicto_solucion, String comentarios) {
         Connection conn;
          PreparedStatement stm = null;
         
         ConectaBD obj=new ConectaBD();
         CargaCombosProcedimientos combosPro=new CargaCombosProcedimientos();
         int resultUpdate = 0;
                
         try {
             conn = obj.conectar();
            conn.setAutoCommit(false); // Inicia una transacción
           System.out.println("Valores:");
            System.out.println("Clave: " + clave_expediente );
            System.out.println("Procedimiento: " + id_tipo_expediente);
            System.out.println("Fecha de apertura: " + fecha_apertura_exped);
            System.out.println("Fecha presentacion promocion: " + fecha_present_promo);
            System.out.println("Fecha admision promocion: " + fecha_admision_promo);
            System.out.println("Promovente: " + id_promovente);
            System.out.println("Estatus expediemte: " + id_estatus_exped);
            System.out.println("Fecha solucion: " + fecha_dicto_solucion);
            System.out.println("Comentarios: " + comentarios);
            
           String sqlOrganoj = "UPDATE TR_EXPEDIENTE SET  fecha_apertura_exped = ?, fecha_present_promo = ?, fecha_admision_promo = ?, id_promovente = ?, id_estatus_exped = ?, fecha_dicto_solucion = ?, comentarios = ? WHERE  clave_expediente = ? ";
           stm = conn.prepareStatement(sqlOrganoj);
//stm.setInt(1, id_tipo_expediente);
//stm.setString(2, clave_expediente);
            stm.setString(1, fecha_apertura_exped);
            stm.setString(2, fecha_present_promo);
            stm.setString(3, fecha_admision_promo);
            stm.setInt(4, id_promovente);
            stm.setInt(5, id_estatus_exped);
            stm.setString(6, fecha_dicto_solucion);
            stm.setString(7, comentarios);
            stm.setString(8, clave_expediente); 
            System.out.println("Valores:" + stm.toString());
       
            resultUpdate = stm.executeUpdate();
                       
            if(resultUpdate != 0)
           {
                conn.commit();
               // obj.cerrar();
                return true;
           }
           else
          {
              conn.rollback();
              // obj.cerrar();
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
     
      public int actualizaMotivos(String clave_expediente) throws SQLException
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
     
      public void borrarMotivos(int id_expediente) throws SQLException
      {
                 ConectaBD c=new ConectaBD();
                 c.conectar();
                 int valor = 0;
                 // Consulta SQL para obtener los datos
                 String sql = "DELETE FROM tr_exp_motivo_solic WHERE id_expediente = "+id_expediente+"";
                 System.out.println(sql);
                 Statement stmt = c.con.createStatement();
                  stmt.executeUpdate(sql);
                  
//                 if(rs.next())
//                {
//                    valor=rs.getInt(1);
//                 }      
      }
     
     
     
     
     //----------------------------------------------------------------------------------pref credito y ejecucion-----------------------------
     public boolean registraMotivoEje(Integer id_motivo_sol_promo, Integer id_expediente)
     {
          Connection conn;
          Statement stm;
          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;                
          try
         {
               conn = obj.conectar();
               stm = conn.createStatement(); 
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_MOTIVO_SOLIC  (id_motivo_sol_promo, id_expediente) "
                                                                                                             + "VALUES ("+id_motivo_sol_promo+","+id_expediente+")");        
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
     
      
     
     
     //**************************************************ORDINARIO**************************************************
     
     // -                         motivos del conflicto
     
      
     
      public boolean registraMotivosOrd(Integer id_motivo_conflicto, Integer id_expediente)
     {
          Connection conn;
          Statement stm;

          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;
                
           try
          {
               conn = obj.conectar();
               stm = conn.createStatement();          
             
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_MOTIVO_CONF  (id_motivo_conflicto, id_expediente) "
                                                                                                         + "VALUES ("+id_motivo_conflicto+","+id_expediente+")");
         
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
      
    
      
      
      
      //                         circunstancias vinculadas
         public boolean registraCircunstancias(Integer id_circuns_mot_conf, Integer id_expediente)
     {
          Connection conn;
          Statement stm;

          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;
                
           try
          {
               conn = obj.conectar();
               stm = conn.createStatement();                
                           
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_CIRCUNST  (id_circuns_mot_conf, id_expediente) "
                                                                                                         + "VALUES ("+id_circuns_mot_conf+","+id_expediente+")");
         
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
     
         //               conceptos reclamados
         public boolean registraConceptos(Integer id_concepto_reclam, Integer id_expediente)
     {
          Connection conn;
          Statement stm;

          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;
                
           try
          {
               conn = obj.conectar();
               stm = conn.createStatement();                
                            
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_CONCEPTO_RECLAM  (id_concepto_reclam, id_expediente) "
                                                                                                         + "VALUES ("+id_concepto_reclam+","+id_expediente+")");
         
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
         
         //                        prestaciones
           public boolean registraPrestacion(Integer id_prestacion, Integer id_expediente)
     {
          Connection conn;
          Statement stm;

          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;
                
           try
          {
               conn = obj.conectar();
               stm = conn.createStatement(); 
               
         
               
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_PRESTACION  (id_prestacion, id_expediente) "
                                                                                                         + "VALUES ("+id_prestacion+","+id_expediente+")");
         
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
           public boolean registraSuspension(Integer id_suspension, Integer id_expediente)
     {
          Connection conn;
          Statement stm;

          ConectaBD obj=new ConectaBD();
          int resultUpdate = 0;
                
           try
          {
               conn = obj.conectar();
               stm = conn.createStatement(); 
               
             
               
               resultUpdate = stm.executeUpdate("INSERT INTO TR_EXP_PRESTACION  (id_suspension, id_expediente) "
                                                                                                         + "VALUES ("+id_suspension+","+id_expediente+")");
         
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
           
           /////////////////////////////////////////GUARDAR ESPECIFIQUES///////////////////////////////
           public int indiceMotivosC() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_motivo_conflicto) FROM TC_MOTIVO_CONFLICTO";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
           public int indiceCircunstancias() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_circuns_mot_conf) FROM TC_MOTIVO_CONFLICTO_CIRCUNST";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
            public int indiceConceptosR() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_concepto_reclam) FROM TC_CONCEPTO_RECLAMADO";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
             public int indicePrestaciones() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_prestacion) FROM TC_PRESTACION";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
             public int indiceIncompetencia() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_tipo_incompetencia) FROM TC_INCOMPETENCIA";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
             public int indiceSolucion() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_forma_solucion) FROM TC_FORMA_SOLUCION";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
              public int indiceViol() throws SQLException
     {
        ConectaBD c=new ConectaBD();
        c.conectar();
        int valor = 0;
            // Consulta SQL para obtener los datos
            String sql = "SELECT MAX (id_tipo_viol_dh) FROM TC_VIOLACION_DH";
            Statement stmt = c.con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if(rs.next())
            {
                valor=rs.getInt(1);
            }          
            return valor;        
     } 
           
      public boolean registrarEspecifiqueMotivosC(Integer id, String sindicato)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_MOTIVO_CONFLICTO (id_motivo_conflicto, descripcion) VALUES ("+id+", '"+sindicato+"')");
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
      public boolean registrarEspecifiqueCircunstancias(Integer id, String circunstancia)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_MOTIVO_CONFLICTO_CIRCUNST (id_circuns_mot_conf, descripcion) VALUES ("+id+", '"+circunstancia+"')");
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
      public boolean registrarEspecifiqueConceptosR(Integer id, String concepto)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_CONCEPTO_RECLAMADO(id_concepto_reclam, descripcion) VALUES ("+id+", '"+concepto+"')");
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
      public boolean registrarEspecifiquePrestacion(Integer id, String prestacion)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_PRESTACION (id_prestacion, descripcion) VALUES ("+id+", '"+prestacion+"')");
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
      
      public boolean registrarEspecifiqueIncompetencia(Integer id, String incompetencia)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_INCOMPETENCIA (id_tipo_incompetencia, descripcion) VALUES ("+id+", '"+incompetencia+"')");
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
      
      public boolean registrarEspecifiqueSolucion(Integer id, String solucion)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_FORMA_SOLUCION (id_forma_solucion, descripcion) VALUES ("+id+", '"+solucion+"')");
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
         public boolean registrarEspecifiqueViol(Integer id, String violacion)
    {
        Connection conn;
        Statement stm;
        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;               
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TC_VIOLACION_DH (id_tipo_viol_dh, descripcion) VALUES ("+id+", '"+violacion+"')");
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

   
