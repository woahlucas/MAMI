//estados do elevador (também será usado para os estados do jogador)
final int primeiroandar = 0;
final int segundoandar1 = 1;
final int segundoandar2 = 2;
final int terceiroandar = 3;

//para o jogador não atravessar o elevador
boolean limiteElevador = false;
//a porta (um retângulo) irá estar fechada no início e abrirá depois de 60 frames 
boolean portaFechada = true;
//se o jogador está dentro do elevador e apertou espaço 
boolean dentroElevador = false;

//os estados iniciais
int estadoElevador = 0;
int estadoPersonagem = 0;

//o xPersonagem será controlado pelas setas do teclado, o yPersonagem e o yElevador serão controlados pelos estados 
int xPersonagem, yPersonagem;
int yElevador = 0;


int tempoElevador = 0;
int cor = 100;

void setup() {
  size(1000, 600);
  textSize(16);
  noStroke();
  rectMode(CENTER);
  xPersonagem = 50;
  yPersonagem = height-25;
}

void draw() {
  background(0);
  desenhaElevador();
  desenhaPorta();
  desenhaCenario();
  desenhaPersonagem();
  movimentaPersonagem();
  MEFelevador();
  MEFporta();
  personagemNoLimiteElevador();
  personagemDentroElevador();
  texto();
  println(estadoElevador, estadoPersonagem);
}

void desenhaCenario() {
  fill(60);
  rect(width/2, height/3, width, 20);
  rect(width/2, height/1.5, width, 20);
}

//o Y do elevador muda de acordo com o estado
void desenhaElevador() {
  fill(cor);
  if (estadoElevador == 3)
    yElevador = 100;
  if (estadoElevador == 1 || estadoElevador == 2)
    yElevador = 300;
  if (estadoElevador == 0)
    yElevador = 500;

  rect(width/2, yElevador, 200, 200);
}


//a porta do elevador é apenas um retângulo cinza escuro 
void desenhaPorta() {
  if (portaFechada) {
    fill(20);
    rect(width/2, yElevador, 200, 200);
  }
}

void desenhaPersonagem() {
  //utilizei os mesmos estados do elevador para o personagem, e o Y dele irá mudar de acordo com o estado
  if (dentroElevador && portaFechada)
    fill(20);
  else
    fill(#1A099B);
  if (estadoPersonagem == 0)
    yPersonagem = height-25;
  if (estadoPersonagem == 1)
    yPersonagem = 365;
  if (estadoPersonagem == 2)
    yPersonagem = 365;
  if (estadoPersonagem == 3)
    yPersonagem = 165;
  rect(xPersonagem, yPersonagem, 50, 50);
}

void movimentaPersonagem() {
  //se o jogador não estiver nos limites do elevador, ele poderá se movimentar
  if (limiteElevador == false) {
    if (keyPressed && keyCode == RIGHT && xPersonagem <= width-25) {
      xPersonagem = xPersonagem + 5;
    }
    if (keyPressed && keyCode == LEFT && xPersonagem >= 25) {
      xPersonagem = xPersonagem - 5;
    }
  }
}

void MEFelevador() {
  //o elevador ficará aberto por 200 frames, e depois irá para outro andar
  if (estadoElevador == primeiroandar) {
    tempoElevador++;
    if (tempoElevador >= 200) {
      tempoElevador = 0;
      estadoElevador = 1;
    }
  }

  if (estadoElevador == segundoandar1) {
    tempoElevador++;
    if (tempoElevador >= 200) {
      tempoElevador = 0;
      estadoElevador = 3;
    }
  }


  if (estadoElevador == terceiroandar) {
    tempoElevador++;
    if (tempoElevador >= 200) {
      tempoElevador = 0;
      estadoElevador = 2;
    }
  }

  if (estadoElevador == segundoandar2) {
    tempoElevador++;
    if (tempoElevador >= 200) {
      tempoElevador = 0;
      estadoElevador = 0;
    }
  }
}

void MEFporta() {
  //a porta começa fechada, quando se passa 60 frames, ela abre
  tempoElevador++;
  if (tempoElevador >= 60) {
    portaFechada = false;
  } else {
    portaFechada = true;
  }
}

void personagemNoLimiteElevador() {
  /*
  quando a porta está fechada, o usuário não poderá se movimentar ou passar por ela
  */
  if (xPersonagem >= width/2-100-25 && xPersonagem <= width/2+100+25 && portaFechada && estadoElevador == estadoPersonagem) {
    limiteElevador = true;
  } else if (xPersonagem >= width/2-100-25 && xPersonagem <= width/2+100+25 && portaFechada && estadoElevador == 2 && estadoPersonagem == 1) {
    limiteElevador = true;
  }else if (xPersonagem >= width/2-100-25 && xPersonagem <= width/2+100+25 && portaFechada && estadoElevador == 1 && estadoPersonagem == 2) {
    limiteElevador = true;
  } else {
    limiteElevador = false;
  }
}


/*
os primeiros dois ifs fazem o jogador "entrar" no elevador quando a barra de espaço é pressionada e a porta está aberta
 o terceiro if faz o jogador "sair" do elevador quando se movimenta para fora
 o quarto if faz o jogador seguir o elevador enquanto está dentro dele
 */
void personagemDentroElevador() {
  if (portaFechada == false && keyPressed && key == ' ' && xPersonagem >= width/2-100-25 && xPersonagem <= width/2+100+25 && estadoElevador == estadoPersonagem) {
    dentroElevador = true;
  }
  /*esse if leva em consideração que o elevador e o jogador estarão em estados diferentes (por exemplo, elevador no Meio1 e jogador no Meio2) e leva isso em consideração*/
  if (portaFechada == false && keyPressed && key == ' ' && xPersonagem >= width/2-100-25 && xPersonagem <= width/2+100+25 && estadoElevador == 2 && estadoPersonagem == 1 || estadoElevador == 1 && estadoPersonagem == 2) {
    dentroElevador = true;
  }
  if (xPersonagem <= width/2-100 || xPersonagem >= width/2+100) {
    dentroElevador = false;
  }
  if (dentroElevador) {
    estadoPersonagem = estadoElevador;
  }
}


//escrever texto explicando o funcionamento do jogo
void texto() {
  fill(255);
  text("Utilize as setas para se mover, aperte\na barra de espaço para entrar no elevador\ne saia no andar que preferir!", 30, 60);
}
