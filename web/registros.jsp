<%-- 
    Document   : registros
    Created on : 22/03/2020, 09:03:50 AM
    Author     : david
--%>

<%@page import="datos.dbPuntuacion"%>
<%@page import="TiposUsuarios.Admin"%>
<%@page import="TiposUsuarios.Usuario"%>
<%@page import="datos.dbJuegos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("user_login");
    String pass = request.getParameter("pass_login");
    String juego = request.getParameter("juego");
    dbPuntuacion db = new dbPuntuacion();
    dbJuegos db2 = new dbJuegos();
    Admin a = new Admin();
    ResultSet res = db.obtener_puntaje(juego);
    ResultSet res2 = db2.obtener_juego(juego);
    boolean desicion = a.validar_admin(pass, user);
    if (!(desicion)) {
        response.sendRedirect("ErrorLogin.jsp");
    }
    String url = "?user_login=" + user + "&pass_login=" + pass;
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
                    <p><%=juego%></p>
                    <table align="center" border="+2">
                        <tr>
                            <td>id</td><td>Juego</td><td>Veces Jugadas</td>
                        </tr>
                        <%if (res2.next()) {%>
                        <tr>
                            <td><center><%=res2.getInt("id")%></center></td>
                        <td><center><%=res2.getString("nombreJuego")%></center></td>
                        <td><center><%=res2.getInt("veces")%></center></td>
                        </tr>
                        <%}%>
                    </table>
                    <br><br>
                    <table align="center" border="+2">
                        <tr>
                            <td>Juego</td><td>Usuario</td><td>Puntaje</td>
                        </tr>
                        <%while (res.next()) {%>
                        <tr>
                            <td><center><%=res.getString("juego")%></center></td>
                        <td><center><%=res.getString("usuario")%></center></td>
                        <td><center><%=res.getString("puntaje")%></center></td>
                        </tr>
                        <%}%>
                    </table>
                    <%String url2 = "InterfazAdmin.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
                    <a href=<%=url2%>><button>Volver</button></a> 
                </h1>
            </div>
        </div>

        <br>
        <div align="center">
            <a href="index.jsp">SALIR</a>
        </div>
    </body>
</html>
