package contenido;

public class Juego {

    private String nomJuego;
    private int vecesJugadas;

    public Juego() {
        this.nomJuego = "";
        this.vecesJugadas = 0;
    }

    public String getNomJuego() {
        return nomJuego;
    }

    public void setNomJuego(String nomJuego) {
        this.nomJuego = nomJuego;
    }

    public int getVecesJugadas() {
        return vecesJugadas;
    }

    public void setVecesJugadas(int vecesJugadas) {
        this.vecesJugadas = vecesJugadas;
    }

}
