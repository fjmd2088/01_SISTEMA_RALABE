/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author octavio.lozano
 */
import java.sql.*;
public class Sentencia_guardar_generales 
{
    public boolean registrar(int id_g, String id_org, int juezIndH, int juezIndM, int juezColH, int juezColM, int juezMixH, int juezMixM, int juezSubH, int juezSubM, int total, int ord, int ind, int col, int huelga, int cne, int pv, int ter, int cred, int eje)
    {
        Connection conn;
        Statement stm;

        ConectaBD obj=new ConectaBD();
        int resultUpdate = 0;
       
        try
        {
            conn = obj.conectar();
            stm = conn.createStatement();
            resultUpdate = stm.executeUpdate("insert into TR_GENERAL (id_general, id_organoj, juez_individua_h, juez_individual_m, juez_colectivo_h, juez_colectivo_m, juez_mixto_h, juez_mixtos_m, subtotal_juez_h, subtotal_juez_m, total_jueces, total_ordinario, total_individual, total_colectivo, total_huelga, total_col_nat_econ, total_paraprocesal, total_tercerias, total_pref_cred, total_ejecucion) "
                    + "                                                                         VALUES ("+id_g+", '"+id_org+"', "+juezIndH+", "+juezIndM+", "+juezColH+", "+juezColM+", "+juezMixH+", "+juezMixM+", "+juezSubH+", "+juezSubM+", "+total+", "+ord+", "+ind+", "+col+", "+huelga+", "+cne+", "+pv+", "+ter+", "+cred+", "+eje+")");
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
