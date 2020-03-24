package datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConexion {

    static String bd = "proyecto";
    static String login = "root";
    static String password = "mysql2019";
    static String url = "jdbc:mysql://localhost/" + bd;
    static String mensaje = "";

    Connection conexion = null;

    public dbConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url, login, password);

            if (conexion != null) {
                System.out.println("Conexión a base de datos " + bd + " OK");
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        } catch (ClassNotFoundException e) {
            mensaje = e.getMessage();
        }
    }

    /**
     * Metodo para retornar mensajes de control
     *
     * @return
     */
    public static String getMensaje() {
        return mensaje;
    }

    /**
     * Metodo para setear mensajes de control
     *
     * @param mensaje
     */
    public static void setMensaje(String mensaje) {
        dbConexion.mensaje = mensaje;
    }

    /**
     * metodo que retorna la conexion a la bd
     *
     * @return
     */
    public Connection getConexion() {
        return conexion;
    }

    /**
     * metodo que desconecta la base de datos
     */
    public void desconectar() {
        conexion = null;
    }

}
