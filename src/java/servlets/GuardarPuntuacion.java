package servlets;

import contenido.Juego;
import contenido.Puntaje;
import datos.dbJuegos;
import datos.dbPuntuacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuardarPuntuacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            dbPuntuacion db = new dbPuntuacion();
            dbJuegos db2 = new dbJuegos();
            Puntaje p = new Puntaje();
            Juego j = new Juego();
            p.setUsuario(request.getParameter("user_login"));
            p.setJuego(request.getParameter("juego"));
            p.setPuntos(Integer.parseInt(request.getParameter("puntaje")));
            j.setNomJuego(p.getJuego());
            ResultSet r = db.obtener_puntaje(p.getJuego());
            db.insertar_puntaje(p);
            db2.sumar_veces_jugadas(j);
            String url = request.getParameter("urlJuego") + "?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login");
            response.sendRedirect(url);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
