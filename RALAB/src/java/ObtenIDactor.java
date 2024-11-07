
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
        
        

@WebServlet(urlPatterns = {"/ObtenIDactor"})
public class ObtenIDactor extends HttpServlet {
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

        String query = "SELECT split_part(tr_actor.id_actor, '_', array_length(string_to_array(tr_actor.id_actor, '_'), 1)) as consecutivo, " +
                       "tc_actor.descripcion as tipo_actor, " +
                       "tc_defensa.descripcion as defensa " +
                       "FROM tr_actor " +
                       "LEFT JOIN tc_actor ON tc_actor.id_tipo_actor = tr_actor.id_tipo_actor " +
                       "LEFT JOIN tc_defensa ON tc_defensa.id_defensa = tr_actor.id_defensa " +
                       "LEFT JOIN tc_procedimiento ON tc_procedimiento.id_tipo_procedimiento = split_part(tr_actor.id_actor, '_', 2)::INTEGER " +
                       "WHERE tc_procedimiento.descripcion = ? " +
                       "AND tr_actor.id_actor LIKE ?;";

        try {
            ps = obj1.con.prepareStatement(query);
            ps.setString(1, proc);
            ps.setString(2, claveOrg + "_%_" + claveExp + "_%");
            rs = ps.executeQuery();

            // Verificar si hay al menos un registro
            if (!rs.isBeforeFirst()) {
                // Si no hay registros
                out.print("<center><label>Aún no se han registrado actores para el expediente "+claveExp+".</label></center>");
            } else {
                StringBuilder tableBuilder = new StringBuilder();
                tableBuilder.append("<table border='1' style='float: center;width: auto;'>");
                tableBuilder.append("<tr><th>ID_actor</th><th>Tipo de actor</th><th>Defensa</th></tr>");

                while (rs.next()) {
                    tableBuilder.append("<tr>")
                        .append("<td>").append(rs.getString("consecutivo")).append("</td>")
                        .append("<td>").append(rs.getString("tipo_actor")).append("</td>")
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


