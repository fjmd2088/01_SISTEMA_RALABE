
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.ConectaBD;
        
        

@WebServlet(urlPatterns = {"/ObtenIDdemandado"})
public class ObtenIDdemandado extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String claveOrg = request.getParameter("claveOrg");
        String proc = request.getParameter("proc");
        String claveExp = request.getParameter("claveExp");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        ConectaBD obj1 = new ConectaBD();
        PreparedStatement ps;
        ResultSet rs;
        obj1.conectar();

        String query = "SELECT split_part(tr_demandado.id_demandado, '_', array_length(string_to_array(tr_demandado.id_demandado, '_'), 1)) as consecutivo, " +
                       "tc_demandado.descripcion as tipo_demandado, " +
                       "tc_defensa.descripcion as defensa " +
                       "FROM tr_demandado " +
                       "LEFT JOIN tc_demandado ON tc_demandado.id_tipo_demandado = tr_demandado.id_tipo_demandado " +
                       "LEFT JOIN tc_defensa ON tc_defensa.id_defensa = tr_demandado.id_defensa " +
                       "LEFT JOIN tc_procedimiento ON tc_procedimiento.id_tipo_procedimiento = split_part(tr_demandado.id_demandado, '_', 2)::INTEGER " +
                       "WHERE tc_procedimiento.descripcion = ? " +
                       "AND tr_demandado.id_demandado LIKE ?;";

        try {
            ps = obj1.con.prepareStatement(query);
            ps.setString(1, proc);
            ps.setString(2, claveOrg + "_%_" + claveExp + "_%");
            rs = ps.executeQuery();

            // Verificar si hay al menos un registro
            if (!rs.isBeforeFirst()) {
                // Si no hay registros
                out.print("<center><label>Aún no se han registrado demandados para el expediente "+claveExp+".</label></center>");
            } else {
                StringBuilder tableBuilder = new StringBuilder();
                tableBuilder.append("<table border='1' style='float: center;width: auto;'>");
                tableBuilder.append("<tr><th>ID_demandado</th><th>Tipo de demandado</th><th>Defensa</th></tr>");

                while (rs.next()) {
                    tableBuilder.append("<tr>")
                        .append("<td>").append(rs.getString("consecutivo")).append("</td>")
                        .append("<td>").append(rs.getString("tipo_demandado")).append("</td>")
                        .append("<td>").append(rs.getString("defensa")).append("</td>")
                        .append("</tr>");
                }
                tableBuilder.append("</table>");

                // Si hay registros, devolvemos la tabla
                out.print(tableBuilder.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.print("Error: " + e.getMessage());
        } finally {
            obj1.cerrar();
        }
    }
}


