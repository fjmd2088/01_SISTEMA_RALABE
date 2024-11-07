package Modelo;


import Combos.CargaCombosProcedimientos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Sentencia_guarda_procedimiento 
{  

     public boolean registrarProcedimiento(Integer id_expediente, Integer id_tipo_expediente, String id_organoj, String clave_expediente, String clave_cuaderno_incid, String fecha_present_incidente, String fecha_apert_cuader_incid, Integer id_tipo_incidente, String fecha_apertura_exped, Integer id_tipo_asunto, Integer id_nat_conflicto, String preg_trab_contr_escri, Integer id_tipo_contrato, String rama_involuc, Integer id_sector_sbtor, String fecha_pres_ejecu_sent, Integer id_ent_mpio, String preg_outsourcing, String preg_apl_cir_vin_mot_conf, String preg_prestacion, 
                                                                    String preg_fecha_celebr_audiencia, String fecha_audiencia, String motivo_conf_colectivo, String preg_incompetencia, Integer id_tipo_incompetencia, String fecha_pliego_peticion, String fecha_present_demanda, String fecha_present_promo, String fecha_admision_promo, Integer id_promovente, String preg_const_conciliac, String clave_const_conciliac, String preg_asunto_vinc_concil_p, String preg_formulo_demanda, String preg_desahogo_demanda, Integer id_estatus_demanda, Integer id_causa_imp_adm_demanda, 
                                                                    String fecha_adm_demanda, Integer cant_actores, Integer cant_demandados, String preg_huelga_emplazam, String preg_prehuelga, String preg_audiencia_concil, String fecha_audiencia_concil, String preg_huelga_estalla, Integer id_huelga_licitud, Integer id_huelga_existencia, String preg_auto_depuracion_tram, String fecha_auto_depuracion, String preg_aud_prelim_celebr, String fecha_audiencia_prelim, String preg_celebra_aud_juicio, String fecha_aud_juicio, String preg_audiencia_col_nat_eco,
                                                                    String fecha_audiencia_col_nat_eco, Integer id_estatus_exped, String fecha_concluy_exped, String fecha_ult_act_proc, Integer id_fase_sol_exped, String fecha_concl_ejecu, Integer id_fase_concl_ejec, Integer id_forma_solucion, String fecha_dicto_solucion, String porcent_solicitado, String porcent_otorgado, Integer id_tipo_sentencia, String fecha_huelga_estalla, String fecha_huelga_levantam, Integer huelga_dias, String monto_solucion, String porcent_salarios_caidos, Integer id_sentencia_efecto, String comentarios, 
                                                                    String especifiqueMotivos, String especifiqueCircunstancias, String especifiqueConceptos, String especifiquePrestaciones, String especifiqueIncompetencia, String especifiqueSolucion)
    {
         Connection conn;
         Statement stm;
         ConectaBD obj=new ConectaBD();
         CargaCombosProcedimientos combosPro=new CargaCombosProcedimientos();
         int resultUpdate = 0;
                
         try
        {
             conn = obj.conectar();
             stm = conn.createStatement(); 
        
             resultUpdate = stm.executeUpdate("INSERT INTO TR_EXPEDIENTE  (id_expediente, id_tipo_expediente, id_organoj, clave_expediente, clave_cuaderno_incid,   fecha_present_incidente, fecha_apert_cuader_incid, id_tipo_incidente, fecha_apertura_exped, id_tipo_asunto, id_nat_conflicto, preg_trab_contr_escri, id_tipo_contrato, rama_involuc, id_sector_sbtor,  fecha_pres_ejecu_sent, id_ent_mpio, preg_outsourcing, preg_apl_cir_vin_mot_conf, preg_prestacion,  preg_fecha_celebr_audiencia, fecha_audiencia, motivo_conf_colectivo, preg_incompetencia,  id_tipo_incompetencia, fecha_pliego_peticion, fecha_present_demanda, fecha_present_promo, fecha_admision_promo, id_promovente, preg_const_conciliac, clave_const_conciliac, preg_asunto_vinc_concil_p, preg_formulo_demanda, preg_desahogo_demanda, id_estatus_demanda, id_causa_imp_adm_demanda, fecha_adm_demanda, cant_actores, cant_demandados, preg_huelga_emplazam, preg_prehuelga, preg_audiencia_concil, fecha_audiencia_concil, preg_huelga_estalla, id_huelga_licitud, id_huelga_existencia, preg_auto_depuracion_tram, fecha_auto_depuracion, preg_aud_prelim_celebr, fecha_audiencia_prelim, preg_celebra_aud_juicio, fecha_aud_juicio, preg_audiencia_col_nat_eco, fecha_audiencia_col_nat_eco, id_estatus_exped, fecha_concluy_exped, fecha_ult_act_proc, id_fase_sol_exped, fecha_concl_ejecu, id_fase_concl_ejec, id_forma_solucion, fecha_dicto_solucion, porcent_solicitado, porcent_otorgado, id_tipo_sentencia, fecha_huelga_estalla, fecha_huelga_levantam, huelga_dias, monto_solucion, porcent_salarios_caidos, comentarios) "
                                                                                              + "VALUES ("+id_expediente+","+id_tipo_expediente+",'"+id_organoj+"','"+clave_expediente+"', '"+clave_cuaderno_incid+"', '"+fecha_present_incidente+"','"+fecha_apert_cuader_incid+"',"+id_tipo_incidente+",'"+fecha_apertura_exped+"',"+id_tipo_asunto+","+id_nat_conflicto+",'"+preg_trab_contr_escri+"',"+id_tipo_contrato+",'"+rama_involuc+"',"+id_sector_sbtor+",'"+fecha_pres_ejecu_sent+"',"+id_ent_mpio+", '"+preg_outsourcing+"','"+preg_apl_cir_vin_mot_conf+"','"+preg_prestacion+"','"+preg_fecha_celebr_audiencia+"','"+fecha_audiencia+"', '"+motivo_conf_colectivo+"','"+preg_incompetencia+"',"+id_tipo_incompetencia+",'"+fecha_pliego_peticion+"','"+fecha_present_demanda+"','"+fecha_present_promo+"','"+fecha_admision_promo+"',"+id_promovente+",'"+preg_const_conciliac+"', '"+clave_const_conciliac+"','"+preg_asunto_vinc_concil_p+"','"+preg_formulo_demanda+"','"+preg_desahogo_demanda+"',"+id_estatus_demanda+", "+id_causa_imp_adm_demanda+", '"+fecha_adm_demanda+"', "+cant_actores+", "+cant_demandados+", '"+preg_huelga_emplazam+"', '"+preg_prehuelga+"', '"+preg_audiencia_concil+"', '"+fecha_audiencia_concil+"','"+preg_huelga_estalla+"', "+id_huelga_licitud+", "+id_huelga_existencia+", '"+preg_auto_depuracion_tram+"', '"+fecha_auto_depuracion+"', '"+preg_aud_prelim_celebr+"', '"+fecha_audiencia_prelim+"', '"+preg_celebra_aud_juicio+"', '"+fecha_aud_juicio+"', '"+preg_audiencia_col_nat_eco+"', '"+fecha_audiencia_col_nat_eco+"', "+id_estatus_exped+", '"+fecha_concluy_exped+"', '"+fecha_ult_act_proc+"', "+id_fase_sol_exped+", '"+fecha_concl_ejecu+"', "+id_fase_concl_ejec+", "+id_forma_solucion+", '"+fecha_dicto_solucion+"', "+porcent_solicitado+", "+porcent_otorgado+", "+id_tipo_sentencia+", '"+fecha_huelga_estalla+"', '"+fecha_huelga_levantam+"', "+huelga_dias+", "+monto_solucion+", "+porcent_salarios_caidos+", '"+comentarios+"')");
         
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

   
