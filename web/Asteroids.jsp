<%-- 
    Document   : Asteroids
    Created on : 23/03/2020, 02:49:18 AM
    Author     : FAMILIA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="datos.dbPuntuacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  dbPuntuacion db = new dbPuntuacion();
    ResultSet res = db.obtener_puntaje("Asteroids");
    ResultSet res2 = db.obtener_puntaje_individual("Asteroids", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Juego asteroids">
        <meta name="keywords" content="juego transformaciones asteroids colisiones jquery canvas ajax">
        <meta name="author" content="Alejandro Paolo Daza">
        <title>Asteroids HTML5</title>
        <link rel="stylesheet" type="text/css" href="estilosAsteroids/estilosf.css" media="screen">
        <script src="jsAsteroids/jquery-1.11.0.min.js" language="JavaScript1.2"></script>
        <script src="jsAsteroids/asteroides.js" language="JavaScript1.2"></script>
    </head>
    <body>
        <aside>
            <img id="ship" src="imagenesAsteroids/ship.png"/><br>
            <img id="asteroid" src="imagenesAsteroids/asteroid.png"/><br>
            <img id="explosion" src="imagenesAsteroids/explosion.png"/><br>
            <h1>Elude Asteroids</h1>
            <hr>
            <h3>Controles del juego</h3>
            <img id="contrles" src="imagenesAsteroids/wasd.png"/>
            <img id="contrles" src="imagenesAsteroids/arrows.png"/>
            <br>
            <div id="recomendaciones"></div>
            <button>iniciar</button>
            <hr><form action="GuardarPuntuacion" method="post">
                <input type="hidden" id="urlJuego" name="urlJuego" value="Asteroids.jsp"></input>
                <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
                <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
                <input type="hidden" id="puntaje" name="puntaje"></input>
                <input type="hidden" id="juego" name="juego" value="Asteroids"></input>
                <div id="botonGuardarPuntuacion" style="display: none">
                    <input type="submit" value="Guardar Puntuacion"></input>
                </div>
            </form>
            <%String url = "InterfazUsuario.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
            <a href=<%=url%>><button>Volver</button></a> 
            <br>
            <p>Copyright @2014 Alejandro Paolo Daza</p>
        </aside>
        <section>

            <canvas id="lienzo" width="700" height="500">
                Tu navegador no es compatible
            </canvas>

            <audio id="brisa">
                <source src="sonidosAsteroids/brisa.ogg" type="audio/ogg">
                <source src="sonidosAsteroids/brisa.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio>
            <audio id="explode">
                <source src="sonidosAsteroids/explode.ogg" type="audio/ogg">
                <source src="sonidosAsteroids/explode.mp3" type="audio/mpeg">
                Tu navegador no es compatible
            </audio> 

        </section>
        <table>
            <td>
                <table border="1" style="font-family : arial; color : White; background-color : black;">
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
<%contador++;
                          }%>
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
        <%contador++;
                                }%>
    </table>
</td>
</table>
</body>
</html>
