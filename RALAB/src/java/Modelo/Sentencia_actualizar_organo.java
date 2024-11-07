package Modelo;

import Combos.CargaCombosO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class Sentencia_actualizar_organo {
    public boolean registrar(String id, String nombre, String sede, int idEM, String colonia, String latitud, String longitud, int circunscripcion, int jurisdiccion, String horario, String esp, String fechaMod) {
        Connection conn = null;
        PreparedStatement stm = null;

        ConectaBD obj = new ConectaBD();
        int resultUpdate = 0;

        try {
            conn = obj.conectar();
            conn.setAutoCommit(false); // Inicia una transacción
            System.out.println("Valores:");
            System.out.println("ID: " + id);
            System.out.println("Nombre: " + nombre);
            System.out.println("Sede: " + sede);
            System.out.println("idEM: " + idEM);
            System.out.println("Colonia: " + colonia);
            System.out.println("Latitud: " + latitud);
            System.out.println("Longitud: " + longitud);
            System.out.println("Circunscripción: " + circunscripcion);
            System.out.println("Jurisdicción: " + jurisdiccion);
            System.out.println("Horario: " + horario);
            System.out.println("Descripción especial: " + esp);
            System.out.println("Fecha de modificacion: "+ fechaMod);

            if (circunscripcion == 4) {
                CargaCombosO cargar = new CargaCombosO();
                int id_cir = cargar.consecutivoCircunscripcion();
                String sqlCircunscripcion = "UPDATE TC_CIRCUNSCRIPCION SET id_circunscripcion = ?, descripcion = ?";
                stm = conn.prepareStatement(sqlCircunscripcion);
                stm.setInt(1, id_cir);
                stm.setString(2, esp);
                resultUpdate = stm.executeUpdate();
                circunscripcion = id_cir;
            }

            String sqlOrganoj = "UPDATE TR_ORGANOJ SET nombre_organoj = ?, sede_organoj = ?, id_ent_mpio = ?, colonia = ?, latitud = ?, longitud = ?, id_circunscripcion = ?, id_jurisdiccion = ?, hr_atencion = ?, fecha_modificacion = ?  WHERE id_organoj = '"+id+"' ";
            stm = conn.prepareStatement(sqlOrganoj);
            stm.setString(1, nombre);
            stm.setString(2, sede);
            stm.setInt(3, idEM);
            stm.setString(4, colonia);
            stm.setDouble(5, Double.parseDouble(latitud));
            stm.setDouble(6, Double.parseDouble(longitud));
            stm.setInt(7, circunscripcion);
            stm.setInt(8, jurisdiccion);
            stm.setString(9, horario);
            stm.setString(10, fechaMod);
            //stm.setString(10, id); // Suponiendo que `id_organoj` es la clave primaria
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
