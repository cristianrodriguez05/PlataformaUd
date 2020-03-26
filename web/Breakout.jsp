<%-- 
    Document   : Breakout
    Created on : 25/03/2020, 09:24:31 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="datos.dbPuntuacion"%>
<%@page import="java.sql.ResultSet"%>
<%  dbPuntuacion db = new dbPuntuacion();
    ResultSet res = db.obtener_puntaje("Breakout");
    ResultSet res2 = db.obtener_puntaje_individual("Breakout", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Breakout</title>
        <style>
            * { padding: 0; margin: 0; }
            canvas { background: #0e0d0d; display: block; margin: 0 auto; }
        </style>

    </head>
    <body background="imagenesBreakout/fondo.jpg">
        <canvas id="mi_canvas" width="580" height="420"></canvas>
        <script type="text/javascript">
            var micanvas = document.getElementById("mi_canvas");
            var contexto = micanvas.getContext("2d");
            var x = micanvas.width / 2;
            var y = micanvas.height / 2;
            var radio = 10;
            var cambioX = 2;
            var cambioY = 2.5;
            var altoRaqueta = 10;
            var anchoRaqueta = 120;
            var posicionRaqueta = micanvas.width / 2;
            var keyRight = false;
            var keyLeft = false;
            var colorbola = 1000;
            var puntos = 0;
            var puntosMostrar = 0;

            var filaLadrillos = 2;
            var columnaLadrillos = 6;
            var anchoLadrillos = 75;
            var altoLadrillos = 20;
            var espacioEntreLadrillo = 10;
            var margenSuperiorLadrillo = 30;
            var margenIzquierdaLadrillo = 30;
            var ladrillos = [];


            for (c = 0; c < columnaLadrillos; c++) {
                ladrillos[c] = [];
                for (r = 0; r < filaLadrillos; r++) {
                    ladrillos[c][r] = {x: 0, y: 0, estado: 1};
                }
            }

            document.addEventListener("keydown", presionTecla, false);
            document.addEventListener("keyup", levantarTecla, false);

            function dibujarBola() {
                contexto.beginPath();
                contexto.arc(x, y, radio, 0, Math.PI * 2, false);

                if (cambioY > -2) {
                    contexto.fillStyle = "#ff" + colorbola;

                } else {
                    contexto.fillStyle = "blue";

                }
                contexto.fill();
                contexto.closePath();
            }

            function juego() {
                contexto.clearRect(0, 0, micanvas.width, micanvas.height);
                dibujarLadrillos();
                dibujarBola();
                dibujarRaqueta();
                dibujarPuntos();
                deteccionColicion();
                x += cambioX;
                y += cambioY;
                if (y + cambioY < radio) {
                    cambioY = -cambioY;
                } else if (y + cambioY > micanvas.height - radio) {
                    if (x > posicionRaqueta && x < posicionRaqueta + anchoRaqueta) {
                        cambioY = -cambioY
                    } else {
                        contexto.font = "bold 22px sans-serif";
                        contexto.fillText("Fin juego", micanvas.height / 2, micanvas.width / 2);
                        sleep();
                        document.location.reload();
                    }
                }

                if (x + cambioX > micanvas.width - radio || x + cambioX < radio) {
                    cambioX = -cambioX;
                }

                if (keyRight && posicionRaqueta < micanvas.width - anchoRaqueta) {
                    posicionRaqueta += 7;
                } else if (keyLeft && posicionRaqueta > 0) {
                    posicionRaqueta -= 7;
                }
            }

            function dibujarRaqueta() {
                contexto.beginPath();
                contexto.rect(posicionRaqueta, micanvas.height - altoRaqueta, anchoRaqueta, altoRaqueta);
                contexto.fillStyle = "blue";
                contexto.fill();
                contexto.closePath();
            }

            function presionTecla(evento) {
                if (evento.keyCode == 39) {
                    keyRight = true;
                } else if (evento.keyCode == 37) {
                    keyLeft = true;
                }
            }

            function levantarTecla(evento) {
                if (evento.keyCode == 39) {
                    keyRight = false;
                } else if (evento.keyCode == 37) {
                    keyLeft = false;
                }
            }

            function deteccionColicion() {
                for (c = 0; c < columnaLadrillos; c++) {
                    for (r = 0; r < filaLadrillos; r++) {
                        var b = ladrillos[c][r];
                        if (b.estado == 1) {
                            if (x > b.x && x < b.x + anchoLadrillos && y > b.y && y < b.y + altoLadrillos) {
                                cambioY = -cambioY;
                                b.estado = 0;
                                puntos++;
                                puntosMostrar++;
                                colorbola = Math.floor(Math.random() * 10000);
                                if (puntos == filaLadrillos * columnaLadrillos && filaLadrillos < 4) {
                                    alert("SIGUIENTE NIVEL!");
                                    filaLadrillos++;
                                    cambioY += 0.5;
                                    cambioX += 0.5;
                                    puntos = 0;
                                    for (c = 0; c < columnaLadrillos; c++) {
                                        ladrillos[c] = [];
                                        for (r = 0; r < filaLadrillos; r++) {
                                            ladrillos[c][r] = {x: 0, y: 0, estado: 1};
                                        }
                                    }
                                    x = micanvas.width / 2;
                                    y = micanvas.height / 2;
                                    posicionRaqueta = micanvas.width / 2;
                                    //    document.location.reload();

                                }
                                if (puntos == filaLadrillos * columnaLadrillos && filaLadrillos == 4) {
                                    alert("ganaste waaaaaaaaaaaapo");
                                    document.location.reload();
                                }

                            }
                        }
                    }
                }
            }

            function dibujarPuntos() {
                contexto.font = "16px Arial";
                contexto.fillStyle = "#0492DD";
                contexto.fillText("Puntos: " + puntosMostrar, 8, 20);
                document.getElementById("puntaje").value = puntos;
            }


            function dibujarLadrillos() {
                for (c = 0; c < columnaLadrillos; c++) {
                    for (r = 0; r < filaLadrillos; r++) {
                        if (ladrillos[c][r].estado == 1) {
                            var colorLadrillo = Math.floor(Math.random() * 1000);
                            var ladrilloX = (c * (anchoLadrillos + espacioEntreLadrillo)) + margenIzquierdaLadrillo;
                            var ladrilloY = (r * (altoLadrillos + espacioEntreLadrillo)) + margenSuperiorLadrillo;
                            ladrillos[c][r].x = ladrilloX;
                            ladrillos[c][r].y = ladrilloY;
                            contexto.beginPath();
                            contexto.rect(ladrilloX, ladrilloY, anchoLadrillos, altoLadrillos);
                            contexto.fillStyle = "#f09" + colorLadrillo;
                            contexto.fill();
                            contexto.closePath();
                        }
                    }
                }
            }



            setInterval(juego, 10);

        </script>
        <form action="GuardarPuntuacion" method="post">
            <input type="hidden" id="urlJuego" name="urlJuego" value="Breakout.jsp"></input>
            <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
            <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
            <input type="hidden" id="puntaje" name="puntaje"></input>
            <input type="hidden" id="juego" name="juego" value="Breakout"></input>
            <div id="botonGuardarPuntuacion">
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