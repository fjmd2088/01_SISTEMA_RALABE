
package Modelo;

import Combos.CargaCombosO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Sentencia_actualizar_generales {
     public boolean registrar(String id_org, int juezIndH, int juezIndM, int juezColH, int juezColM, int juezMixH, int juezMixM, int juezSubH, int juezSubM, int total, int ord, int ind, int col, int huelga, int cne, int pv, int ter, int cred, int eje) {
        Connection conn = null;
        PreparedStatement stm = null;

        ConectaBD obj = new ConectaBD();
        int resultUpdate = 0;

        try {
            conn = obj.conectar();
            conn.setAutoCommit(false); // Inicia una transacción
            System.out.println("Valores:");
            System.out.println("Cve Organo "+ id_org);
            System.out.println("Jueces Individuales: " + juezIndH);
            System.out.println("Juezas Individuales: " + juezIndM);
            System.out.println("Jueces Colectivos: " + juezColH);
            System.out.println("Juezas Colectivos: " + juezColM);
            System.out.println("Jueces Mixtos:" + juezMixH);
            System.out.println("Juezas Mixtos" + juezMixM);
            System.out.println("Subtotal jueces" + juezSubH);
            System.out.println("Subtotal juezas" + juezSubM);
            System.out.println("Total de jueces y juezas: " + total);
            System.out.println("Ordinario: " + ord);
            System.out.println("Individual " + ind);
            System.out.println("Colectivo " + col);
            System.out.println("Huelga " + huelga);
            System.out.println("Colectivo Naturaleza Economica " + cne);
            System.out.println("Paraprocesal " + pv);
            System.out.println("Tercerías " + ter);
            System.out.println("Preferencia de credito " + cred);
            System.out.println("Ejecución " + eje);

           
            String sqlOrganoj = "UPDATE TR_GENERAL SET id_organoj=?, juez_individua_h = ?,juez_individual_m = ?,  juez_colectivo_h = ?, juez_colectivo_m = ?, juez_mixto_h = ?, juez_mixtos_m = ?, subtotal_juez_h = ?, subtotal_juez_m = ?, total_jueces= ?, total_ordinario = ?, total_individual = ?, total_colectivo = ?, total_huelga = ?, total_col_nat_econ = ?, total_paraprocesal = ?, total_tercerias = ?, total_pref_cred = ?, total_ejecucion = ? WHERE id_organoj = ? ";
            stm = conn.prepareStatement(sqlOrganoj);
            stm.setString(1,  id_org);
            stm.setInt(2,  juezIndH);
            stm.setInt(3,  juezIndM);
            stm.setInt(4,  juezColH);
            stm.setInt(5, juezColM);
            stm.setInt(6, juezMixH);
            stm.setInt(7, juezMixM);
            stm.setInt(8, juezSubH);
            stm.setInt(9, juezSubM);
            stm.setInt(10, total);
            stm.setInt(11, ord);
            stm.setInt(12, ind);
            stm.setInt(13, col);
            stm.setInt(14, huelga);
            stm.setInt(15, cne);
            stm.setInt(16, pv);
            stm.setInt(17, ter);
            stm.setInt(18, cred);
            stm.setInt(19, eje);
            stm.setString(20, id_org); // Suponiendo que `id_organoj` es la clave primaria
            resultUpdate = stm.executeUpdate();

            if (resultUpdate != 0) {
                conn.commit(); // Finaliza la transacción exitosamente
                return true;
            } else {
                conn.rollback(); // Revierte la transacción en caso de error
                return false;
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback(); // Revierte la transacción en caso de error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            System.out.println("Error en la base de datos.");
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stm != null) stm.close();
                if (conn != null) obj.cerrar();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
