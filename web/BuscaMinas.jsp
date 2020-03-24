<%-- 
    Document   : BuscaMinas
    Created on : 24/03/2020, 09:01:39 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYE html>
<html>
    <head>
        <meta charste="utf-8">		
        <style>


            .tablero{
                width: 1260px;
                height: 420px;								
                border: 1px solid black;
                margin-left: 5%;
                margin-top: 5%;				
            }

            .tablero div{
                width: 40px;
                height: 40px;
                border: 1px solid black;
                float: left;
                background-color: #07b243;				
                font-size: 30;	
                text-align: center;
            }
        </style>
        <script>

            var minas = inicializaMatriz();
            var contadorcasilas = 0;

            var cronometro;

            function detenerse() {
                clearInterval(cronometro);
            }

            function carga()
            {
                contador_s = 0;
                contador_m = 0;
                s = document.getElementById("segundos");
                m = document.getElementById("minutos");
                cronometro = setInterval(
                        function () {
                            if (contador_s == 60) {
                                contador_s = 0;
                                contador_m++;
                                m.innerHTML = contador_m;
                                if (contador_m == 60) {
                                    contador_m = 0;
                                }
                            }
                            s.innerHTML = contador_s;
                            contador_s++;
                        }
                , 1000);
            }

            function ganar() {
                if (contadorcasilas == 240) {
                    alert("xX HAS GANADO Xx");
                    var person = prompt("Ingrese su nombre");
                    console.log(person);
                }
            }


            function inicializaMatriz() {
                var tabla = [];
                for (var i = 0; i < 10; i++) {
                    tabla[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                }
                return tabla;
            }

            function crearTablero() {
                for (var i = 0; i < 10; i++) {
                    for (var j = 0; j < 30; j++) {
                        var div = document.createElement("div");
                        div.id = i + "" + j;
                        div.idd = i + "." + j;
                        div.addEventListener("click", mostrarNumero, true);
                        tablerominas.appendChild(div);

                    }
                }

            }

            function mostrarNumero(e) {

                var auxstr = this.idd.split(".");
                console.log(auxstr);
                var myid = auxstr[0] + auxstr[1];
                divObj = document.getElementById(myid);
                console.log(myid);
                if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] == 0) {
                    divObj.style.backgroundColor = "white";
                    contadorcasilas++;
                    document.getElementById('resultado').innerHTML = contadorcasilas;
                    ganar();
                    abrirAlrededor(parseInt(auxstr[0], 10), parseInt(auxstr[1], 10), minas);
                } else {
                    if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] != "*") {
                        if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] == 1) {
                            document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:blue;font-weight:bold;'>" + minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] + "</p>";
                            divObj.style.backgroundColor = "white";
                            contadorcasilas++;
                            document.getElementById('resultado').innerHTML = contadorcasilas;
                            ganar();
                            console.log(contadorcasilas);
                        } else if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] == 2) {
                            document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:green;font-weight:bold;'>" + minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] + "</p>";
                            divObj.style.backgroundColor = "white";
                            contadorcasilas++;
                            document.getElementById('resultado').innerHTML = contadorcasilas;
                            ganar();
                            console.log(contadorcasilas);
                        } else if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] == 3) {
                            document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:red;font-weight:bold;'>" + minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] + "</p>";
                            divObj.style.backgroundColor = "white";
                            contadorcasilas++;
                            document.getElementById('resultado').innerHTML = contadorcasilas;
                            ganar();
                            console.log(contadorcasilas);
                        } else if (minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] == 4) {
                            document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:gray;font-weight:bold;'>" + minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] + "</p>";
                            divObj.style.backgroundColor = "white";
                            contadorcasilas++;
                            document.getElementById('resultado').innerHTML = contadorcasilas;
                            ganar();
                            console.log(contadorcasilas);
                        } else {
                            document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:black;font-weight:bold;'>" + minas[parseInt(auxstr[0], 10)][parseInt(auxstr[1], 10)] + "</p>";
                            divObj.style.backgroundColor = "white";
                            contadorcasilas++;
                            document.getElementById('resultado').innerHTML = contadorcasilas;
                            ganar();
                            console.log(contadorcasilas);
                        }
                    } else {
                        divObj.style.backgroundImage = "url(imgenesBuscaMinas/bombas.jpg)";
                        abrirTablero(minas);
                        alert("Has perdido (X_X)");
                        setTimeout("reiniciarJuego()", 200);
                    }
                }
            }

            function reiniciarJuego() {
                var opcion = confirm("Quieres volver a jugar?");
                if (opcion == true) {
                    location.reload();
                } else {
                    window.close();
                }
            }

            function bombasAlrededor(tablero) {
                for (var i = 0; i < 10; i++) {
                    for (var j = 0; j < 30; j++) {
                        if (tablero[i][j] == "*") {
                            if (i == 0 && j == 0) {
                                colocaNumeroBombas(i, j, i + 1, j + 1, tablero);
                            } else if (i == 0 && (j > 0 && j < 29)) {
                                colocaNumeroBombas(i, j - 1, i + 1, j + 1, tablero);
                            } else if (i == 0 && j == 29) {
                                colocaNumeroBombas(i, j - 1, i + 1, j, tablero);
                            } else if (j == 29 && (i > 0 && i < 9)) {
                                colocaNumeroBombas(i - 1, j - 1, i + 1, j, tablero);
                            } else if (i == 9 && j == 29) {
                                colocaNumeroBombas(i - 1, j - 1, i, j, tablero);
                            } else if (i == 9 && (j > 0 && j < 29)) {
                                colocaNumeroBombas(i - 1, j - 1, i, j + 1, tablero);
                            } else if (i == 9 && j == 0) {
                                colocaNumeroBombas(i - 1, j, i, j + 1, tablero);
                            } else if (j == 0 && (i > 0 && i < 9)) {
                                colocaNumeroBombas(i - 1, j, i + 1, j + 1, tablero);
                            } else {
                                colocaNumeroBombas(i - 1, j - 1, i + 1, j + 1, tablero);
                            }
                        }
                    }
                }
            }

            function colocaNumeroBombas(vari, varj, fini, finj, tablero) {
                for (var i = vari; i <= fini; i++) {
                    for (var j = varj; j <= finj; j++) {
                        if (tablero[i][j] != "*") {
                            tablero[i][j] = (parseInt(tablero[i][j]) + 1);
                        }
                    }
                }
            }

            function generarBombas(tablero) {
                var fil = 0;
                var col = 0;

                fil = Math.floor((Math.random() * 10) + 0);
                col = Math.floor((Math.random() * 30) + 0);

                for (var i = 0; i < 60; i++) {
                    while (tablero[fil][col] == "*") {
                        fil = Math.floor((Math.random() * 10) + 0);
                        col = Math.floor((Math.random() * 30) + 0);
                    }
                    tablero[fil][col] = "*";
                }
            }

            function abrirCeros(vari, varj, fini, finj, cori, corj, tablero) {
                for (var i = vari; i <= fini; i++) {
                    for (var j = varj; j <= finj; j++) {
                        var myid = i + "" + j;
                        var objDiv = document.getElementById(myid)
                        if (objDiv.textContent == "") {
                            if (tablero[i][j] == 0) {
                                if (i == cori && j == corj) {
                                    if (objDiv.style.backgroundColor != "white") {
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    }
                                    objDiv.textContent = "";
                                    objDiv.style.backgroundColor = "white";
                                    //contadorcasilas++;
                                    //console.log(contadorcasilas);
                                } else {
                                    if (objDiv.style.backgroundColor != "white") {
                                        abrirAlrededor(i, j, tablero);
                                    }
                                }

                            } else {
                                if (tablero[i][j] != "*") {
                                    if (tablero[i][j] == 1) {
                                        document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:blue;font-weight:bold;'>" + tablero[i][j] + "</p>";
                                        objDiv.style.backgroundColor = "white";
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    } else if (tablero[i][j] == 2) {
                                        document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:green;font-weight:bold;'>" + tablero[i][j] + "</p>";
                                        objDiv.style.backgroundColor = "white";
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    } else if (tablero[i][j] == 3) {
                                        document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:red;font-weight:bold;'>" + tablero[i][j] + "</p>";
                                        objDiv.style.backgroundColor = "white";
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    } else if (tablero[i][j] == 4) {
                                        document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:gray;font-weight:bold;'>" + tablero[i][j] + "</p>";
                                        objDiv.style.backgroundColor = "white";
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    } else {
                                        document.getElementById(myid).innerHTML = "<p style='margin-top:3px;color:black;font-weight:bold;'>" + tablero[i][j] + "</p>";
                                        objDiv.style.backgroundColor = "white";
                                        contadorcasilas++;
                                        document.getElementById('resultado').innerHTML = contadorcasilas;
                                        ganar();
                                        console.log(contadorcasilas);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            function abrirAlrededor(xi, xj, tablero) {
                if (xi == 0 && xj == 0) {
                    abrirCeros(xi, xj, xi + 1, xj + 1, xi, xj, tablero);
                } else if (xi == 0 && (xj > 0 && xj < 29)) {
                    abrirCeros(xi, xj - 1, xi + 1, xj + 1, xi, xj, tablero);
                } else if (xi == 0 && xj == 29) {
                    abrirCeros(xi, xj - 1, xi + 1, xj, xi, xj, tablero);
                } else if (xj == 29 && (xi > 0 && xi < 9)) {
                    abrirCeros(xi - 1, xj - 1, xi + 1, xj, xi, xj, tablero);
                } else if (xi == 9 && xj == 29) {
                    abrirCeros(xi - 1, xj - 1, xi, xj, xi, xj, tablero);
                } else if (xi == 9 && (xj > 0 && xj < 29)) {
                    abrirCeros(xi - 1, xj - 1, xi, xj + 1, xi, xj, tablero);
                } else if (xi == 9 && xj == 0) {
                    abrirCeros(xi - 1, xj, xi, xj + 1, xi, xj, tablero);
                } else if (xj == 0 && (xi > 0 && xi < 9)) {
                    abrirCeros(xi - 1, xj, xi + 1, xj + 1, xi, xj, tablero);
                } else {
                    abrirCeros(xi - 1, xj - 1, xi + 1, xj + 1, xi, xj, tablero);
                }
            }

            function abrirTablero(tablero) {
                for (var i = 0; i < 10; i++) {
                    for (var j = 0; j < 30; j++) {
                        var myid = i + "" + j;
                        var objDiv = document.getElementById(myid);
                        if (tablero[i][j] == "*") {
                            objDiv.style.backgroundImage = "url(imagenesBuscaMinas/bombas.jpg)";
                        }
                    }
                }
            }

        </script>
    </head>
    <body onload="cargarTablero();"style="background-color:#000000;"">


        <h1 align="center">
            <img src="img/bomba.png" width="40" height="40"> 
            <FONT FACE="impact" SIZE=7 COLOR="gray">
            BUSCAMINAS
            <img src="imgenesBuscaMinas/bomba.png" width="40" height="40">
            </FONT>
        </h1>

        <h2 align="center">
            <FONT FACE="impact" SIZE=5 COLOR="green">
            <span>Casillas destapadas</span>
            <span>_____</span>
            <span div id="resultado" ></span>
            <span>/240</span>
            <span>_____</span>
            <span> Total casillas por destapar </span>
        </h2>
        <h2 align="center">
            <FONT FACE="impact" SIZE=6 COLOR="gray">
            <span div id="minutos">0</span>:<span div id="segundos">0</span>
            </FONT>
        </h2>




        <div id="tablerominas" class="tablero">

        </div>

    </body>


    <script>

        function cargarTablero() {
            document.getElementById('resultado').innerHTML = contadorcasilas;
            crearTablero();
            generarBombas(minas);
            bombasAlrededor(minas);
            carga();
            ganar();
        }
    </script>

</html>
