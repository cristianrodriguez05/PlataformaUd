<%-- 
    Document   : InterfazAdmin
    Created on : 22/03/2020, 06:34:25 AM
    Author     : david
--%>

<%@page import="TiposUsuarios.Admin"%>
<%@page import="datos.dbJuegos"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="datos.dbUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("user_login");
    String pass = request.getParameter("pass_login");

    Admin a = new Admin();
    boolean desicion = a.validar_admin(pass, user);
    if (!desicion) {
        response.sendRedirect("ErrorLogin.jsp");
    }
    String url = "?user_login=" + user + "&pass_login=" + pass;
    String prueba, juego;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home <%=a.getAdminName()%></title>
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
                        <tr><td>Asteroids</td><td>La Llorona</td></tr>
                        <tr>
                            <%juego = "Asteroids";%>
                            <%prueba = "registros.jsp" + url + "&juego=" + juego + "";%>
                            <td><a href=<%=prueba%>><img src="imgMin/Asteroides.png" height="300" width="300"></a></td>
                                    <%juego = "LaLlorona";%>
                                    <%prueba = "registros.jsp" + url + "&juego=" + juego + "";%>
                            <td><a href=<%=prueba%>><img src="imgMin/llorona.png" height="300" width="300"></a></td>
                        </tr>
                        <tr><td>T-rex</td><td>Buscaminas</td></tr>
                        <tr>
                            <%juego = "Trex";%>
                            <%prueba = "registros.jsp" + url + "&juego=" + juego + "";%>
                            <td><a href=<%=prueba%>><img src="imgMin/Rex.png" height="300" width="300"></a></td>
                                    <%juego = "Buscaminas";%>
                                    <%prueba = "registros.jsp" + url + "&juego=" + juego + "";%>
                            <td><a href=<%=prueba%>><img src="imgMin/Buscaminas.png" height="300" width="300"></a></td>
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
