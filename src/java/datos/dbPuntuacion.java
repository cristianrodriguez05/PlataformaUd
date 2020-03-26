package datos;

import contenido.Puntaje;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbPuntuacion {

    dbConexion db;

    public dbPuntuacion() {
        this.db = new dbConexion();
    }

    public void insertar_puntaje(Puntaje p) {
        try {
            String sql = "insert into puntajes(usuario,"
                    + "puntaje,"
                    + "juego)"
                    + "values(?,?,?)";
            PreparedStatement pstm = db.getConexion().prepareStatement(sql);
            pstm.setString(1, p.getUsuario());
            pstm.setInt(2, p.getPuntos());
            pstm.setString(3, p.getJuego());

            pstm.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public ResultSet obtener_puntaje(String juego) throws SQLException { //en uso
        String sql = "select * from puntajes where juego = ? ORDER BY puntaje DESC";
        PreparedStatement pstm = db.getConexion().prepareStatement(sql);
        pstm.setString(1, juego);
        ResultSet res = pstm.executeQuery();
        return res;
    }

    public ResultSet obtener_puntaje_individual(String juego, String user) throws SQLException { //en uso
        String sql = "select * from puntajes where juego = ? AND usuario = ? ORDER BY puntaje DESC";
        PreparedStatement pstm = db.getConexion().prepareStatement(sql);
        pstm.setString(1, juego);
        pstm.setString(2, user);
        ResultSet res = pstm.executeQuery();
        return res;
    }

}
