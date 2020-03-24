package TiposUsuarios;

public class Admin {

    private final String AdminName = "administrador";
    private final String Password = "juegosud";

    public String getAdminName() {
        return AdminName;
    }

    public String getPassword() {
        return Password;
    }

    public boolean validar_admin(String pass, String user) {
        if (this.Password.equals(pass) && this.AdminName.equals(user)) {
            return true;
        } else {
            return false;
        }
    }
}
