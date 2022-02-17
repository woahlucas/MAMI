void setup() {
  size(800, 600);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);
  fill(30);
  /*rect(width/2, height/2, 560, 315); 
   virou: */
  quad(120, 142.5, 120+560, 142.5, 120+560, 142.5+315, 120, 142.5+315);
  fill(0,0,255);
  mapping();
}

void mapping() {
  float posX = map(mouseX, 0, width, dist(0, 0, 120+40, 0), dist(0, 0, 560+120-40, 0));
  float posY = map(mouseY,0,height,dist(0,0,0,142.5+40),dist(0,0,0,142.5+315-40));
  ellipse(posX,posY,80,80);
}
