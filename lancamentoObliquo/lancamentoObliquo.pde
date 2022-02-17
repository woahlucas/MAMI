float v0;
float ang;
float x;
float y;
float x0;
float y0;
float t;
float x_eixo, y_eixo;
float aux;
boolean bol30, bol45, bol60;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 190, 100);
  v0 = 75;
  x0 = width/8;
  y0 = height/2;
  x = 0;
  y = 0;
  ang = 0;
  t = 0;
  aux = 0.2;
  x_eixo = x0;
  y_eixo = y0;
  noStroke();
}

void draw() {
  eixos();
  opcoes();
  translate(x0, y0);
  fill(50, 0, 100);
  //rect(0-10, 0, width/1.3, 10);
  if (bol30) {
    ang30();
    lanObliquo();
  }
  if (bol45) {
    ang45();
    lanObliquo();
  }
  if (bol60) {
    ang60();
    lanObliquo();
  }
}

void ang30() {
  fill(0, 100, 100);
  ang = 30;
}

void ang45() {
  fill(240, 100, 100);
  ang = 45;
}

void ang60() {
  fill(100, 100, 100);
  ang = 60;
}

void lanObliquo() {
  for (float t = 0; t <=20; t+=aux) {
    x = v0 * cos(radians(ang))*t;
    y = v0 * sin(radians(ang))*t-9.8*t*t/2;
    if (y>=0) {
      ellipse(x, -y, 5, 5);
    }
  }
}

void eixos() {
  background(200, 70, 15);
  stroke(0, 0, 100); 
  strokeWeight(2);
  line(0, y0, width, y0);
  line(x0, 0, x0, height);

  for (x=(int)-x_eixo/100*100; x<=width; x+=100) {
    line(x0+x, y0-2, x0+x, y0+2);
    fill(0, 0, 100);
    text(Float.toString(x), x0+x-10, y0+15);
  }


  for (y=(int)-y_eixo/100*100; y<=height; y+=100) {
    stroke(0, 0, 100);
    line(x0-2, y0-y, x0+2, y0-y);
    fill(0, 0, 100);
    if (y!=0)text(Float.toString(y), x0+10, y0-y+5);
  }

  noStroke();
}

void opcoes() {
  fill(0, 100, 90);
  rect(250, 500, 80, 40);
  fill(240, 100, 90);
  rect(400, 500, 80, 40);
  fill(100, 100, 90);
  rect(550, 500, 80, 40);

  textAlign(LEFT, TOP);
  textSize(30);
  fill(0, 0, 100);
  text("30º", 267, 500);
  text("45º", 417, 500);
  text("60º", 567, 500);
  text("Escolha o ângulo:", 310, 400);
  textSize(12);
}

void mousePressed() {
  if (mouseX >= 250 && mouseX <= 330 && mouseY >= 500 && mouseY <= 540)
    bol30 = !bol30;
  if (mouseX >= 400 && mouseX <= 480 && mouseY >= 500 && mouseY <= 540)
    bol45 = !bol45;
  if (mouseX >= 550 && mouseX <= 630 && mouseY >= 500 && mouseY <= 540)
    bol60 = !bol60;
}
