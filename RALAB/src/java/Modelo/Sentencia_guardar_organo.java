package Modelo;

import Combos.CargaCombosO;
import java.sql.Connection;
import java.sql.Statement;

public class Sentencia_guardar_organo 
{
    public boolean registrar(String id, String nombre, String sede, int idEM, String colonia, String latitud, String longitud, int circunscripcion, int jurisdiccion, String horario, String esp, String fecha_creacion)
    {
    Connection conn;
    Statement stm;

    ConectaBD obj=new ConectaBD();
    int resultUpdate = 0;
                
    try
    {
        conn = obj.conectar();
        stm = conn.createStatement();
         if(circunscripcion==4)
        {
            CargaCombosO cargar=new CargaCombosO();
            int id_cir = cargar.consecutivoCircunscripcion();
            stm = conn.createStatement();
           resultUpdate=stm.executeUpdate("insert into TC_CIRCUNSCRIPCION (id_circunscripcion, descripcion)"
                                                                                                       +" VALUES ("+id_cir+", '"+esp+"')");
           circunscripcion=id_cir;
        }
        resultUpdate = stm.executeUpdate("insert into TR_ORGANOJ (id_organoj, nombre_organoj, sede_organoj, id_ent_mpio, colonia, latitud, longitud, id_circunscripcion, id_jurisdiccion, hr_atencion, fecha_creacion) "
                                                      + " VALUES ('"+id+"', '"+nombre+"', '"+sede+"', "+idEM+", '"+colonia+"', '"+latitud+"', '"+longitud+"', "+circunscripcion+", "+jurisdiccion+", '"+horario+"', '"+fecha_creacion+"')");
       
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
