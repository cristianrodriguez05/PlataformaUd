package datos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import TiposUsuarios.Usuario;

public class dbUsuarios {

    dbConexion db;

    public dbUsuarios() {
        this.db = new dbConexion();
    }

    public void insertar_usuario(Usuario u) {
        try {
            String sql = "insert into usuarios(nombre,"
                    + "apellido,"
                    + "usuario,"
                    + "pass)"
                    + "values(?,?,?,?)";
            PreparedStatement pstm = db.getConexion().prepareStatement(sql);
            pstm.setString(1, u.getNombre());
            pstm.setString(2, u.getApellido());
            pstm.setString(3, u.getUsername());
            pstm.setString(4, u.getPass());

            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean validar_usuario_existente(String username) throws SQLException { //en uso
        String sql = "select * from usuarios";
        PreparedStatement pstm = db.getConexion().prepareStatement(sql);
        ResultSet res = pstm.executeQuery();
        while (res.next()) {
            if (res.getString("usuario").equals(username)) {
                return true;
            }
        }
        return false;
    }

    public ResultSet obtener_usuario(String username) throws SQLException { //en uso
        String sql = "select * from usuarios where usuario = ?";
        PreparedStatement pstm = db.getConexion().prepareStatement(sql);
        pstm.setString(1, username);
        ResultSet res = pstm.executeQuery();
        return res;
    }

    public boolean login(String user, String pass) throws SQLException { //en uso
        String sql = "select usuario,pass from usuarios";
        PreparedStatement pstm = db.getConexion().prepareStatement(sql);
        ResultSet res = pstm.executeQuery();
        while (res.next()) {
            if (res.getString("usuario").equals(user) && res.getString("pass").equals(pass)) {
                return true;
            }
        }
        return false;
    }

}
