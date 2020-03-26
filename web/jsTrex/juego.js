//INICIO EVENTO BARRA ESPACIADORA
document.addEventListener('keydown', function (evento) {
    if (evento.keyCode == 32) {
        document.getElementById("botonGuardarPuntuacion").style.display = "none";
        if (nivel.muerto == false) {
            if (trex.saltando == false) {
                saltar();
            }
        } else {
            nivel.velocidad = 9;
            nube.velocidad = 1;
            cactus.x = ancho + 100;
            nube.x = ancho + 100;
            nivel.puntuacion = 0;
            nivel.muerto = false;
        }
    }
});
//FIN EVENTO BARRA ESPACIADORA


//INICIO CANVAS E IMAGENES
var imgRex, imgNube, imgCactus, imgSuelo;

function cargaImagenes() {

    imgRex = new Image();
    imgRex.src = 'imagenesTrex/rex.png';
    imgNube = new Image();
    imgNube.src = 'imagenesTrex/nube.png';
    imgCactus = new Image();
    imgCactus.src = 'imagenesTrex/cactus.png';
    imgSuelo = new Image();
    imgSuelo.src = 'imagenesTrex/suelo.png';

}

var ancho = 700;
var alto = 300;
var canvas, ctx;

function inicializar() {

    canvas = document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    cargaImagenes();

}

function borraCanvas() {

    canvas.width = ancho;
    canvas.height = alto;

}
//FIN CANVAS E IMAGENES


//INICIO ESTRUCTURAS DE OBJETOS
var suelo = 200;
var trex = {y: suelo, vy: 0, gravedad: 2, salto: 24, vymax: 9, saltando: false};
var cactus = {x: ancho + 100, y: suelo - 25};
var nube = {x: 400, y: 50, velocidad: 2};
var nivel = {velocidad: 9, puntuacion: 0, muerto: false};
var suelog = {x: 0, y: suelo + 30};
//FIN ESTRUCTURAS DE OBJETOS


//INICIO FUNCIONES DIBUJAR()
function dibujaRex() {
    ctx.drawImage(imgRex, 0, 0, 57, 63, 100, trex.y, 50, 50);
}

function dibujaCactus() {
    ctx.drawImage(imgCactus, 0, 0, 43, 65, cactus.x, cactus.y, 38, 75);
}

function dibujaNube() {
    ctx.drawImage(imgNube, 0, 0, 65, 33, nube.x, nube.y, 82, 31);
}

function dibujaSuelo() {
    ctx.drawImage(imgSuelo, suelog.x, 0, 1000, 119, 0, suelog.y, 700, 30);
}
//FIN FUNCIONES DIBUJAR();


//INICIO FUNCIONES LOGICAS DEL JUEGO
function logicaCactus() {
    if (cactus.x < -100) {
        cactus.x = ancho + 100;
        nivel.puntuacion++; /////////////contador
        if (nivel.velocidad < 20) {
            nivel.velocidad++;
        }
    } else {
        cactus.x -= nivel.velocidad;
    }
}

function logicaNube() {
    if (nube.x < -100) {
        nube.x = ancho + 100;
    } else {
        nube.x -= nube.velocidad;
    }
}

function logicaSuelo() {
    if (suelog.x > 700) {
        suelog.x = 0;
    } else {
        suelog.x += nivel.velocidad;
    }
}

function saltar() {
    trex.saltando = true;
    trex.vy = trex.salto;
}

function gravedad() {
    if (trex.saltando == true) {
        if (trex.y - trex.vy - trex.gravedad > suelo) {
            trex.saltando = false
            trex.vy = 0;
            trex.y = suelo;
        } else {
            trex.vy -= trex.gravedad;
            trex.y -= trex.vy;
        }
    }
}

function colision() {
    if (cactus.x >= 90 && cactus.x <= 135) {
        if (trex.y >= suelo - 25) {
            nivel.muerto = true;
            nivel.velocidad = 0;
            nube.velocidad = 0;
            ctx.font = "60px impact";
            ctx.fillStyle = '#555555';
            ctx.fillText(`JUEGO TERMINADO`, 160, 150);
            document.getElementById("puntaje").value = nivel.puntuacion;
            document.getElementById("botonGuardarPuntuacion").style.display = "block";
        }
    }
}

function puntuacion() {
    ctx.font = "30px impact";
    ctx.fillStyle = '#555555';
    ctx.fillText(`${nivel.puntuacion}`, 600, 50);
}


//FIN FUNCIONES LOGICAS DEL JUEGO


//INICIO BUCLE PRINCIPAL
var FPS = 50;

setInterval(function () {
    principal();
}, 1000 / FPS);

function principal() {
    borraCanvas();
    gravedad();
    colision();
    puntuacion();
//	logicaSuelo();
    logicaCactus();
    logicaNube();
    dibujaSuelo();
    dibujaCactus();
    dibujaRex();
    dibujaNube();
}
//FIN BUCLE PRINCIPAL


