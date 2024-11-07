package Combos;

import Modelo.ConectaBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CargaCombosProcedimientos {
    ConectaBD conexion = new ConectaBD();

    public ResultSet claveOrgano(String nombre) {
        String consulta = "SELECT id_organoj FROM TR_ORGANOJ WHERE nombre_organoj = ?";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta)) {
            stmt.setString(1, nombre);
            return stmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<String> listaOrganos() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT nombre_organoj FROM TR_ORGANOJ";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("nombre_organoj"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaProcedimientos() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_PROCEDIMIENTO WHERE id_tipo_procedimiento > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaExpedientes() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT clave_expediente FROM TR_EXPEDIENTE";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("clave_expediente"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaAsuntos() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_ASUNTO WHERE id_tipo_asunto > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaNaturaleza() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_NAT_CONFLICTO WHERE id_nat_conflicto > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaRespuestaSimple() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_RESPUESTA_SIMPLE WHERE id_respuesta <> -2";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaRespuestaSimple2() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_RESPUESTA_SIMPLE WHERE id_respuesta > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaRespuestaSimple3() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_RESPUESTA_SIMPLE WHERE id_respuesta <> -1";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaContrato() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_CONTRATO WHERE id_tipo_contrato > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaEstatusDemanda() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_ESTATUS_DEMANDA WHERE id_estatus_demanda > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaCausasDesechada() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_CAUSAS_IMPEDIM_DEMANDA WHERE id_causas_imp_dem > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaEstatusExpediente() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_ESTATUS_EXPEDIENTE WHERE id_estatus_expediente > 0";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaFaseSolucionORD() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_FASE_SOLUCION_EXP WHERE id_fase_solucion IN (9, 1, 2) " +
                "ORDER BY CASE WHEN id_fase_solucion = 9 THEN 1 WHEN id_fase_solucion = 1 THEN 2 WHEN id_fase_solucion = 2 THEN 3 END";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaFaseSolucionIND() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_FASE_SOLUCION_EXP WHERE id_fase_solucion IN (3, 4, 1, 2) " +
                "ORDER BY CASE WHEN id_fase_solucion = 3 THEN 1 WHEN id_fase_solucion = 4 THEN 2 " +
                "WHEN id_fase_solucion = 1 THEN 3 WHEN id_fase_solucion = 2 THEN 4 END";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

       public List<String> listaFaseSolucionCOL() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_FASE_SOLUCION_EXP WHERE id_fase_solucion IN (3, 2) " +
                "ORDER BY CASE WHEN id_fase_solucion = 3 THEN 1 WHEN id_fase_solucion = 2 THEN 2 END";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }

    public List<String> listaFaseSolucionHUE() {
        List<String> resultados = new ArrayList<>();
        String consulta = "SELECT descripcion FROM TC_FASE_SOLUCION_EXP WHERE id_fase_solucion IN (5, 6, 7) " +
                "ORDER BY CASE WHEN id_fase_solucion = 5 THEN 1 WHEN id_fase_solucion = 6 THEN 2 WHEN id_fase_solucion = 7 THEN 3 END";
        try (Connection conn = conexion.conectar();
             PreparedStatement stmt = conn.prepareStatement(consulta);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("descripcion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultados;
    }





//*************************************************************   
public List<String> listaFaseSolucionEJE() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_FASE_CONCLUSION_EJECU WHERE id_fase_concl_ejec > 0";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaFormaSolucionORD() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_FORMA_SOLUCION WHERE id_forma_solucion IN (1, 2, 3, 9) " +
            "ORDER BY CASE WHEN id_forma_solucion = 1 THEN 1 WHEN id_forma_solucion = 2 THEN 2 " +
            "WHEN id_forma_solucion = 3 THEN 3 WHEN id_forma_solucion = 9 THEN 4 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaFormaSolucionORD2() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_FORMA_SOLUCION WHERE id_forma_solucion IN (4, 1, 2, 3, 9) " +
            "ORDER BY CASE WHEN id_forma_solucion = 4 THEN 1 WHEN id_forma_solucion = 1 THEN 2 " +
            "WHEN id_forma_solucion = 2 THEN 3 WHEN id_forma_solucion = 3 THEN 4 WHEN id_forma_solucion = 9 THEN 5 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaFormaSolucionHUE() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_FORMA_SOLUCION WHERE id_forma_solucion IN (5, 6, 7, 8, 1, 2, 9) " +
            "ORDER BY CASE WHEN id_forma_solucion = 5 THEN 1 WHEN id_forma_solucion = 6 THEN 2 " +
            "WHEN id_forma_solucion = 7 THEN 3 WHEN id_forma_solucion = 8 THEN 4 " +
            "WHEN id_forma_solucion = 1 THEN 5 WHEN id_forma_solucion = 2 THEN 6 WHEN id_forma_solucion = 9 THEN 7 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

//*************************************************************  
  public List<String> listaFormaSolucionHUE2() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_FORMA_SOLUCION WHERE id_forma_solucion IN (1, 7, 4, 2, 9) " +
            "ORDER BY CASE WHEN id_forma_solucion = 1 THEN 1 WHEN id_forma_solucion = 7 THEN 2 " +
            "WHEN id_forma_solucion = 4 THEN 3 WHEN id_forma_solucion = 2 THEN 4 WHEN id_forma_solucion = 9 THEN 5 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaTipoSentencia() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_SENTENCIA WHERE id_tipo_sentencia IN (1, 2, 3) " +
            "ORDER BY CASE WHEN id_tipo_sentencia = 1 THEN 1 WHEN id_tipo_sentencia = 2 THEN 2 " +
            "WHEN id_tipo_sentencia = 3 THEN 3 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaTipoSentencia2() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_SENTENCIA WHERE id_tipo_sentencia IN (1, 2, 3, 4) " +
            "ORDER BY CASE WHEN id_tipo_sentencia = 1 THEN 1 WHEN id_tipo_sentencia = 2 THEN 2 " +
            "WHEN id_tipo_sentencia = 3 THEN 3 WHEN id_tipo_sentencia = 4 THEN 4 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaTipoSentencia3() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_SENTENCIA WHERE id_tipo_sentencia IN (5, 6, 7) " +
            "ORDER BY CASE WHEN id_tipo_sentencia = 5 THEN 1 WHEN id_tipo_sentencia = 6 THEN 2 " +
            "WHEN id_tipo_sentencia = 7 THEN 3 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaMotivos() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_MOTIVO_SOLIC_PROM WHERE id_motivo_sol_promo IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 14) " +
            "ORDER BY CASE WHEN id_motivo_sol_promo = 1 THEN 1 WHEN id_motivo_sol_promo = 2 THEN 2 " +
            "WHEN id_motivo_sol_promo = 3 THEN 3 WHEN id_motivo_sol_promo = 4 THEN 4 " +
            "WHEN id_motivo_sol_promo = 5 THEN 5 WHEN id_motivo_sol_promo = 6 THEN 6 " +
            "WHEN id_motivo_sol_promo = 7 THEN 7 WHEN id_motivo_sol_promo = 8 THEN 8 " +
            "WHEN id_motivo_sol_promo = 9 THEN 9 WHEN id_motivo_sol_promo = 10 THEN 10 " +
            "WHEN id_motivo_sol_promo = 11 THEN 11 WHEN id_motivo_sol_promo = 14 THEN 12 END";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaLicitud() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_HUELGA_LICITUD WHERE id_huelga_licitud > 0";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

//*************************************************************   
 public List<String> listaPromovente() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_PROMOVENTE WHERE id_promovente > 0";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaExistencia() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_HUELGA_EXISTENCIA WHERE id_huelga_exist > 0";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();  // Aquí está la corrección
    }
    return resultados;
}


public List<String> listaIncidente() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_INCIDENTE WHERE id_tipo_incidente_ > 0";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> sector() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT distinct sector FROM TC_SECTOR_SBSTOR ORDER BY sector";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("sector"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> subsector(String sector) {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT distinct subsector FROM TC_SECTOR_SBSTOR WHERE sector = ? ORDER BY subsector";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta)) {
        stmt.setString(1, sector);
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                resultados.add(rs.getString("subsector"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaIncompetencia() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_INCOMPETENCIA WHERE id_tipo_incompetencia > 0 ORDER BY id_tipo_incompetencia ASC";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

//*************************************************************    
  public List<String> listaMotivosPromocion() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_MOTIVO_SOLIC_PROM WHERE id_motivo_sol_promo in (12, 13)";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaPromoventes() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_PROMOVENTE WHERE id_promovente in (1, 2, 5)";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

public List<String> listaMotivosPromocionE() {
    List<String> resultados = new ArrayList<>();
    String consulta = "SELECT descripcion FROM TC_MOTIVO_SOLIC_PROM WHERE id_motivo_sol_promo in (15, 16, 17, 18, 19)";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(consulta);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            resultados.add(rs.getString("descripcion"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return resultados;
}

     //---------------------------------------------------------------------ORDINARIO------------------------------------------------------------------
            
 public int indiceAsunto(String asunto) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_asunto FROM TC_ASUNTO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, asunto);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceNatConflicto(String conflicto) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_nat_conflicto FROM TC_NAT_CONFLICTO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, conflicto);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceContrato(String contrato) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_contrato FROM TC_CONTRATO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, contrato);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceSectorSubsector(String sector, String subsector) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_sector_sbstor FROM TC_SECTOR_SBSTOR WHERE sector = ? AND subsector = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, sector);
        stmt.setString(2, subsector);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int idEntidadMunicipio(String entidad, String municipio) throws SQLException {
    int entmun = 0;
    String sql = "SELECT id_ent_mpio FROM TC_ENTIDAD_MPIO WHERE entidad = ? AND municipio = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, entidad);
        stmt.setString(2, municipio);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                entmun = rs.getInt(1);
            }
        }
    }
    return entmun;
}
public int idSectorSubsector(String sector, String subsector) throws SQLException {
    int secsub = 0;
    String sql = "SELECT id_sector_sbstor FROM TC_SECTOR_SBSTOR WHERE sector = ? AND subsector = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, sector);
        stmt.setString(2, subsector);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                secsub = rs.getInt(1);
            }
        }
    }
    return secsub;
}

public int indiceIncompetencia(String incompetencia) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_incompetencia FROM TC_INCOMPETENCIA WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, incompetencia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceEstatusDemanda(String estatusDemanda) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_estatus_demanda FROM TC_ESTATUS_DEMANDA WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, estatusDemanda);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceCausaImpDem(String causa) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_estatus_demanda FROM TC_CAUSAS_IMPEDIM_DEMANDA WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, causa);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceFaseSolExp(String fase) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_fase_solucion FROM TC_FASE_SOLUCION_EXP WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, fase);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceFormaSolExp(String forma) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_forma_solucion FROM TC_FORMA_SOLUCION WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, forma);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceSentencia(String sentencia) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_sentencia FROM TC_SENTENCIA WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, sentencia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceEfectoSentencia(String sentencia) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_efecto_sentencia FROM TC_SENTENCIA_EFECTO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, sentencia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceMotivoConflicto(String motivo) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_motivo_conflicto FROM TC_MOTIVO_CONFLICTO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, motivo);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}
public int indiceCircunstancias(String circunstancia) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_circuns_mot_conf FROM TC_MOTIVO_CONFLICTO_CIRCUNST WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, circunstancia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceConceptos(String concepto) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_concepto_reclam FROM TC_CONCEPTO_RECLAMADO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, concepto);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indicePrestaciones(String prestacion) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_prestacion FROM TC_PRESTACION WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, prestacion);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

     
 public int indiceSuspensiones(String suspencion) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_suspension FROM TC_SUSP_TEMP WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, suspencion);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int consecutivoMotivos() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_MOTIVO_CONFLICTO";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int consecutivoCircunstancias() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_MOTIVO_CONFLICTO_CIRCUNST";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int consecutivoConceptos() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_CONCEPTO_RECLAMADO";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int consecutivoPrestaciones() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_PRESTACION";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int consecutivoIncompetencia() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_INCOMPETENCIA";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int consecutivoSolucion() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT COUNT(*) FROM TC_FORMA_SOLUCION";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

     //-----------------------------------------------------------------------HUELGA---------------------------------------------------------------------------
          
            public int indiceLicitud(String licitud) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_huelga_licitud FROM TC_HUELGA_LICITUD WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, licitud);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceExistencia(String existencia) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_huelga_exist FROM TC_HUELGA_EXISTENCIA WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, existencia);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceIncidente(String incidente) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_incidente_ FROM TC_INCIDENTE WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, incidente);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

     //----------------------------------------------------------PREFRENCIA DE CREDITO----------------------------------------------------
     
     public int indicePromovente(String promovente) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_promovente FROM TC_PROMOVENTE WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, promovente);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int consecutivoExpediente() throws SQLException {
    int consecutivo = 0;
    String sql = "SELECT MAX(id_expediente) FROM TR_EXPEDIENTE";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        if (rs.next()) {
            consecutivo = rs.getInt(1);
        }
    }
    return consecutivo;
}

public int indiceEstatus(String estatus) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_estatus_expediente FROM TC_ESTATUS_EXPEDIENTE WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, estatus);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceFaseConcluyo(String fase) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_fase_concl_ejec FROM TC_FASE_CONCLUSION_EJECU WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, fase);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceMotivoPromo(String motivo) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_motivo_sol_promo FROM TC_MOTIVO_SOLIC_PROM WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, motivo);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}

public int indiceProcedimiento(String proced) throws SQLException {
    int valor = 0;
    String sql = "SELECT id_tipo_procedimiento FROM TC_PROCEDIMIENTO WHERE descripcion = ?";
    try (Connection conn = conexion.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, proced);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                valor = rs.getInt(1);
            }
        }
    }
    return valor;
}
}

//////////

 

