var x = 150;
var y = 265;
var vida = 0;
var duracion = 0;
var obs = [[1500,145],
		   [1500,232],
		   [1500,330],
		   [1500,415]];

$(document).ready(inicio);
$(document).keydown(capturaTeclado); 

function inicio(){
	var lienzo = $("#lienzo")[0];
	var contexto = lienzo.getContext("2d");
	var buffer = document.createElement("canvas");
	buffer.width = lienzo.width;
	buffer.height = lienzo.height;
	contextoBuffer = buffer.getContext("2d");
	contextoBuffer.fillStyle = "#ffffff"; 
	contextoBuffer.clearRect(0,0,1300,550);
	contextoBuffer.font = "bold 50px sans-serif";
	contextoBuffer.fillText("BIENVENIDO", 500, 200);
	contextoBuffer.fillStyle = "#006600"; 
	contextoBuffer.font = "bold 30px sans-serif";
	contextoBuffer.fillText("Juega Choque De Carros", 480, 230);
	contexto.clearRect(0,0,1300,550);
	contexto.drawImage(buffer, 0, 0);
	$('#acelerar')[0].play();
	$("button").click(function(){	
		x = 150;
		y = 265;	
		vida = 100;
		duracion = 0;
		run();		
	});
}

function aleatorio(tope){
	return Math.floor((Math.random() * tope) + 1);
} 

function capturaTeclado(event){
	//alert(event.which);
	if(event.which==38 || event.which==87)
		if (y>=115){
			y -= 10;
		}
	if(event.which==40 || event.which==83)
		if (y<=420){
			y += 10;
		}
	y = (550 + y)%550;
}

function Carro(){
	this.img = [$("#carro")[0],$("#carrochocado")[0]];
	
	this.dibujar = function(ctx,i){
		var img = this.img[i];
		ctx.drawImage(img, x, y);
		ctx.save();
		ctx.restore();
	}
	
	this.colision = function(xx,yy){
		var distancia=0;
		distancia=Math.sqrt( Math.pow( (xx-x), 2)+Math.pow( (yy-y),2));
		if(distancia>40)
		   return false;
		else
		   return true;	
	}
}

function Obstaculo(){
	this.img = [$("#aceite")[0], $("#hueco")[0], $("#retro")[0], $("#rocas")[0], $("#cono")[0]];			
	this.dibujar = function(ctx, x1, y1, j){
		var img = this.img[j];
		ctx.save();
		ctx.translate(x1,y1);
		ctx.drawImage(img,-img.width/2,-img.height/2);
		ctx.restore();
	}
}

function run(){ 
	var lienzo = $("#lienzo")[0];
	var contexto = lienzo.getContext("2d");
	var buffer = document.createElement("canvas");
	buffer.width = lienzo.width;
	buffer.height = lienzo.height;
	contextoBuffer = buffer.getContext("2d");
	contextoBuffer.fillStyle = "#ffffff"; 
	if(vida >= 0){  		
		duracion++;
		var objcarro = new Carro();
		var objobstaculo = [new Obstaculo(),new Obstaculo(),new Obstaculo(),
						   new Obstaculo()]; 
		contextoBuffer.clearRect(0,0,1300,550);

		contextoBuffer.font = "bold 25px sans-serif";
		contextoBuffer.fillText("vida = "+vida, 25, 25);
		contextoBuffer.fillText("puntos = "+parseInt(duracion/10), 250, 25);
		objcarro.dibujar(contextoBuffer,0);
		for(i=0;i<4;i++){
			
			objobstaculo[i].dibujar(contextoBuffer,obs[i][0],obs[i][1], 4);
			if(objcarro.colision(obs[i][0],obs[i][1])){
				vida -=1;
				objcarro.dibujar(contextoBuffer,1);
				$('#choque')[0].play();
			}
			obs[i][0]-= aleatorio(20);
			obs[i][0] = (1300 + obs[i][0])%1300;
		}
		contexto.clearRect(0,0,1300,550);
		contexto.drawImage(buffer, 0, 0);
		setTimeout("run()",20);
		$("button").css("display","none");
	}else{
		$('#acelerar')[0].pause();
		
		contextoBuffer.clearRect(0,0,1300,550);

		contextoBuffer.font = "bold 50px sans-serif";
		contextoBuffer.fillText("JUEGO TERMINADO", 500, 200);
		contextoBuffer.fillText(parseInt(duracion/10)+" pts", 500, 250);
		contexto.clearRect(0,0,700,500);
		contexto.drawImage(buffer, 0, 0);
		$("button").css("display","inline");
		
	}
}


