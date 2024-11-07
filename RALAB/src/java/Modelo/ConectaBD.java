/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author octavio.lozano
 */
public class ConectaBD {
    private Connection conexion;

    public Connection getConexion() {
        return conexion;
    }
    public  Connection con;
    //String url="jdbc:oracle:thin:@cegopro_bd.inegi.gob.mx:1521/cegopro.inegi.gob.mx";
    String url="jdbc:postgresql://localhost:5432/Ralab";
    //String usuario="rietr_2014";
    String usuario="postgres";
    //String contrasena="r13tr_pr0d_2014";
    String contrasena="inegi";
    public Connection conectar()
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection(url, usuario, contrasena);
        }
        catch(Exception e)
        {
            System.out.println("Error en la conexion...");
            e.printStackTrace();
        }
        return con;
    }
    
    
     public ResultSet consultar(String sql) {
        ResultSet rst;
        try {
            Statement sentencia;
            sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            rst = sentencia.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("ERROR SQL AL CONSULTAR: " + e+" "+sql);
            return null;
        }
        return rst;
    }
    
    public void cerrar()
    {
        try
        {
            if(con != null)
            con.close();
        } 
        catch (Exception e)
        {
            System.out.println("Error: No se logro cerrar conexion:\n"+e);
        }
    }    
}
