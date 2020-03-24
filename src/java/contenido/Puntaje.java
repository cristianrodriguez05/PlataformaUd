package contenido;

public class Puntaje {

    private String usuario;
    private String juego;
    private int puntos;

    public Puntaje() {
        this.usuario = "";
        this.juego = "";
        this.puntos = 0;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getJuego() {
        return juego;
    }

    public void setJuego(String juego) {
        this.juego = juego;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

}
