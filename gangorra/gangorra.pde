//estados da gangorra (estados cíclicos)
final int GEsquerda = 0;
final int GMeio1 = 1;
final int GMeio2 = 2;
final int GDireita = 3;

//estados do Mario
final int parado = 0;
final int martelando = 1;

//estados iniciais 
int estadoGangorra = GEsquerda;
int estadoMarioJogador = parado;
int estadoMarioPC = parado;

//temporizadores
int tempo = 0;
int tempoParado = 0;
int tempoMartelando = 0;
int intervaloParado = 10;
int intervaloMartelando = 10;

//placar
int contagemJogador, contagemPC;

//imagens
PImage imgParado, imgMartelando, imgParado2, imgMartelando2, fundo, gangorrameio,
gangorraesquerda, gangorradireita;



void setup() {
  size(600, 400);
  stroke(255);
  textSize(20);
  imgParado = loadImage("parado.png");
  imgMartelando = loadImage("martelando.png");
  imgParado2 = loadImage("parado2.png");
  imgMartelando2 = loadImage("martelando2.png");
  fundo = loadImage("fundo.png");
  gangorrameio = loadImage("gangorrameio.png");
  gangorraesquerda = loadImage("gangorraesquerda.png");
  gangorradireita = loadImage("gangorradireita.png");
}

void draw() {
  image(fundo,0,0);
  MEFGangorra();
  MEFMarioJogador();
  MEFMarioPC();
  desenhaGangorra();
  desenhaMarioJogador();
  desenhaMarioPC();
  contagemPC();
  placar();
  println(contagemPC/10, "", contagemJogador);
}
/*
quando a gangorra estiver virada para a esquerda, o PC irá martelar por um 
intervalo definido 
*/
void MEFMarioPC() {
  if(estadoGangorra == 0){
  if (estadoMarioPC == parado) {
    tempoParado++;
    if (tempoParado >= intervaloParado) {
      tempoParado = 0;
      estadoMarioPC = martelando;
    } 
  }
  }
  if (estadoMarioPC == martelando) {
    tempoMartelando++;
    if (tempoMartelando >= intervaloMartelando) {
      tempoMartelando = 0;
      estadoMarioPC = parado;
    }
  }
}

//quando o jogador pressionar espaço, ele irá martelar

void MEFMarioJogador() {
  if (keyPressed == true && key == ' ') {
    estadoMarioJogador = martelando;
  } else {
    estadoMarioJogador = parado;
  }

}

//a gangorra é cíclica, então tem 4 estados: um na esquerda, dois no meio e um na direita

void MEFGangorra() {
  if (estadoGangorra == GEsquerda) {
    tempo++;
    if (tempo >= 60) {
      tempo = 0;
      estadoGangorra = GMeio1;
    }
  }

  if (estadoGangorra == GMeio1) {
    tempo++;
    if (tempo >= 60) {
      tempo = 0;
      estadoGangorra = GDireita;
    }
  }

  if (estadoGangorra == GDireita) {
    tempo++;
    if (tempo >= 60) {
      tempo = 0;
      estadoGangorra = GMeio2;
    }
  }

  if (estadoGangorra == GMeio2) {
    tempo++;
    if (tempo >= 60) {
      tempo = 0;
      estadoGangorra = GEsquerda;
    }
  }
}


/*fiz a gangorra no illustrator e importei, mudando o imageMode para o centro,
facilitando o posicionamento
*/

void desenhaGangorra() {
  imageMode(CENTER);
  if (estadoGangorra == GEsquerda) {
    image(gangorraesquerda, width/2,292);
  }

  if (estadoGangorra == GMeio1 || estadoGangorra == GMeio2) {
    image(gangorrameio, width/2-0.01,292);
  }

  if (estadoGangorra == GDireita) {
    image(gangorradireita, width/2,292);
  }
  imageMode(CORNER);
}

void desenhaMarioJogador() {
  if (estadoMarioJogador == parado) {
    image(imgParado, 415, 225);
  } else if (estadoMarioJogador == martelando) {
    image(imgMartelando, 435, 225);
  }
}

void desenhaMarioPC() {
  if (estadoMarioPC == parado) {
    image(imgParado2, 75, 225);
  } else if (estadoMarioPC == martelando) {
    image(imgMartelando2, 65, 215);
  }
}

//enquanto o PC martelar e a gangorra estiver na esquerda, ele ganhará ponto
void contagemPC() {
  if (estadoMarioPC == martelando && estadoGangorra == 0) {
    contagemPC++;
  }
}

/*
o placar do PC terá que ser divido por 10, que é o intervalo de frames que ele fica
martelando cada vez que martela

10 frames martelando = 1 martelada = 1 ponto

já o placar do jogador será normal, visto que o keyReleased só vai contar 1 vez: quando 
o jogador soltar a tecla espaço. antes tentei usar a variável keyPressed, mas acabava 
contando muitos pontos enquanto o usuário pressionasse espaço 
*/

void placar(){ 
  text("Jogador: " + contagemJogador,50,50);
  text("PC: " + contagemPC/10,50,75);
}

//se o jogador tá martelando e a gangorra está na direita, ele ganhará ponto
void keyReleased() {
  if (estadoMarioJogador == martelando && estadoGangorra == 3) {
    contagemJogador++;
  }
}
