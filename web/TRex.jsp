<%-- 
    Document   : TRex
    Created on : 24/03/2020, 08:45:06 AM
    Author     : david
--%>

<%@page import="datos.dbPuntuacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  dbPuntuacion db = new dbPuntuacion();
    ResultSet res = db.obtener_puntaje("Trex");
    ResultSet res2 = db.obtener_puntaje_individual("Trex", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html>
    <head>
         <script src="jsTrex/juego.js" language="JavaScript1.2"></script>
        <title>T Rex</title>
    </head>

    <body onload = "inicializar();">
        <canvas id = "canvas" width = "700" height = "300" style = "border: 2px solid #000000" ></canvas>
        <form action="GuardarPuntuacion" method="post">
            <input type="hidden" id="urlJuego" name="urlJuego" value="TRex.jsp"></input>
            <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
            <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
            <input type="hidden" id="puntaje" name="puntaje"></input>
            <input type="hidden" id="juego" name="juego" value="Trex"></input>
            <div id="botonGuardarPuntuacion" style="display: none">
                <input type="submit" value="Guardar Puntuacion"></input>
            </div>
        </form>
        <%String url = "InterfazUsuario.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
        <a href=<%=url%>><button>Volver</button></a>    
        <table>
            <td>
                <table border="1" style="font-family : arial; color : white; background-color : black;">
                    <tr>
                        <td colspan="2">Tus 5 Mejores Puntuaciones</td>
                    </tr>
                    <tr>
                        <td><center>Puntaje</center></td>
                    </tr>
                    <%contador = 0;%>
                    <%while (res2.next() && contador < 5) {%>
                    <tr>
                        <td><center><%=res2.getString("puntaje")%></center></td>
                    </tr>
                    <%contador++;}%>
                </table>
            </td>
            <td>
                <table border="1" style="font-family : arial; color : White; background-color : black;">
                    <tr>
                        <td colspan="2">Top 5 Puntuaciones</td>
                    </tr>  
                    <tr>
                        <td>Usuario</td><td>Puntaje</td>
                    </tr>
                    <%while (res.next() && contador < 5) {%>
                    <tr>
                        <td><%=res.getString("usuario")%></td>
                        <td><%=res.getString("puntaje")%></td>
                    </tr>
                    <%contador++;}%>
                </table>
            </td>
        </table>
    </body>
</html>	