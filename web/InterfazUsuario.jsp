<%-- 
    Document   : InterfazUsuario
    Created on : 22/03/2020, 11:03:50 AM
    Author     : david
--%>

<%@page import="TiposUsuarios.Usuario"%>
<%@page import="datos.dbJuegos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="datos.dbUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("user_login");
    String pass = request.getParameter("pass_login");

    dbUsuarios db = new dbUsuarios();
    boolean desicion = db.login(user, pass);
    ResultSet res = db.obtener_usuario(user);
    Usuario u = new Usuario();
    if (desicion && res.next()) {
        u.setNombre(res.getString("nombre"));
        u.setApellido(res.getString("apellido"));
        u.setUsername(res.getString("usuario"));
        u.setPass(res.getString("pass"));
    } else {
        if (user.equals("administrador")) {
            String url = "InterfazAdmin.jsp?user_login=" + user + "&pass_login=" + pass + "";
            response.sendRedirect(url);
        } else {
            response.sendRedirect("ErrorLogin.jsp");
        }
    }
    String url = "?user_login=" + user + "&pass_login=" + pass + "";
    String juego;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home <%=u.getNombre()%></title>
        <link rel = "stylesheet">
        <link href = "https://fonts.googleapis.com/css?family=Lato:300,400|Work+Sans:300,400,700" rel="stylesheet">
        <link rel = "stylesheet" href="estiloPlataforma/style.min.css">
    </head>
    <body>
        <nav id = "header-navbar" class="navbar navbar-expand-lg py-4">
            <div class = "container">
                <a class = "navbar-brand d-flex align-items-center text-white">
                    <h3 class="font-weight-bolder mb-0">BIENVENIDO A JUEGOS UD</h3>
                </a>
            </div>
        </nav>


        <div class = "jumbotron jumbotron-single d-flex align-items-center" style="background-image: url(estiloPlataforma/blog-1.jpg)">
            <div class = "container text-center">
                <h1 class = "display-2 mb-4">
                    <p>Juegos</p>
                    <table align="center" border="0">
                        <tr><td>Asteroids</td><td>La Llorona</td><td>Trex</td></tr>
                        <tr>
                            <%juego = "Asteroids.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/Asteroides.png" height="300" width="300"></a></td>
                                    <%juego = "LaLlorona.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/llorona.png" height="300" width="300"></a></td>
                                    <%juego = "TRex.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/Rex.png" height="300" width="300"></a></td>
                        </tr>
                        <tr><td>Buscaminas</td><td>Flppymario</td><td>Break out</td></tr>
                        <tr>
                            <%juego = "BuscaMinas.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/Buscaminas.png" height="300" width="300"></a></td>
                                    <%juego = "Flappymario.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/Flappymario.png" height="300" width="300"></a></td>
                                    <%juego = "Breakout.jsp" + url;%>
                            <td><a href=<%=juego%>><img src="imgMin/Breakout.png" height="300" width="300"></a></td>
                        </tr>
                    </table>
                </h1>
            </div>
        </div>

        <br>
        <div align="center">
            <a href="index.jsp">SALIR</a>
        </div>
    </body>
</html>
