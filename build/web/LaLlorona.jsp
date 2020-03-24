<%-- 
    Document   : LaLlorona
    Created on : 24/03/2020, 08:00:19 AM
    Author     : david
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="datos.dbPuntuacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  dbPuntuacion db = new dbPuntuacion();
    ResultSet res = db.obtener_puntaje("LaLlorona");
    ResultSet res2 = db.obtener_puntaje_individual("LaLlorona", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Juego llorona">
        <meta name="keywords" content="canvas colisiones jquery ajax">
        <meta name="author" content="Alejandro Daza">
        <title>La leyenda de la llorona</title>

        <link rel="stylesheet" type="text/css" href="estilosLlorona/default.css" media="screen">
        <script src="jsLlorona/jquery-1.11.0.min.js" language="JavaScript1.2"></script>
        <script src="jsLlorona/quica.js" language="JavaScript1.2"></script>
        <script src="jsLlorona/calaca.js" language="JavaScript1.2"></script>
        <script src="jsLlorona/script.js" language="JavaScript1.2"></script>



    </head>
    <body>
        <section>
            <canvas id="mi_canvas" width="640" height="480">
                Tu navegador no es compatible
            </canvas>			
        </section>
        <section>
            <div id="popup" style="display: none;">
                <div class="content-popup">
                    <div class="close"><a href="#" id="close"><img src="imagenesLlorona/close.png"/></a></div>
                    <div>
                        <h2>Teclas de juego</h2>
                        <img src="imagenesLlorona/teclado.png"/>
                        <h2>Creditos</h2>
                        <p>Alejandro Paolo Daza Corredor</p>
                        <p>UNIR</p>
                        <p>Computación en el Cliente</p>
                    </div>
                </div>
            </div>
            <h1>La Llorona</h1>
            <button id="instrucciones">Ver Instrucciones</button><br>
            <button id="iniciar">Iniciar</button>
            <form action="GuardarPuntuacion" method="post">
                <input type="hidden" id="urlJuego" name="urlJuego" value="LaLlorona.jsp"></input>
                <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
                <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
                <input type="hidden" id="puntaje" name="puntaje"></input>
                <input type="hidden" id="juego" name="juego" value="LaLlorona"></input>
                <div id="botonGuardarPuntuacion" style="display: none">
                    <input type="submit" value="Guardar Puntuacion"></input>
                </div>
            </form>
            <%String url = "InterfazUsuario.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
            <a href=<%=url%>><button>Volver</button></a>     
        </section>
        <br><br>
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
<audio id="pierde">
    <source src="sonidosLlorona/pierde_vida.ogg" type="audio/ogg">
    <source src="sonidosLlorona/pierde_vida.mp3" type="audio/mpeg">
    <source src="sonidosLlorona/pierde_vida.wav" type="audio/wav">
    Tu navegador no es compatible
</audio>

<img id="abajo" src="imagenesLlorona/kika.png"/>
<img id="arriba" src="imagenesLlorona/kika2.png"/>
<img id="salto" src="imagenesLlorona/kika.png"/>
<img id="sentado" src="imagenesLlorona/kika3.png"/>
<img id="calaca_1" src="imagenesLlorona/calaca_child.png"/>
<img id="calaca_2" src="imagenesLlorona/calaca_girl.png"/>
</body>
</html>
