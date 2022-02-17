int larg, alt, a;
void setup() {
  size(800, 800);
  rectMode(CENTER);
  larg = width;
  alt = height;
  a = 800;
}

void draw() {
  background(100);
  desenho();
}

void desenho(){
  noStroke();
  fill(0);
  ellipse(width/2,height/2,a,a);
  fill(255);
  arc(width/2,height/2,a,a,PI/2,3*PI/2);
  fill(0);
  ellipse(larg/2,alt/2-a/4,a/2,a/2);
  fill(255);
  ellipse(larg/2,alt/2+a/4,a/2,a/2);
  ellipse(larg/2,alt/2-a/4,a/8,a/8);
  fill(0);
  ellipse(larg/2,alt/2+a/4,a/8,a/8);
  println(a);
}

void keyPressed(){
  a = a/2;
}
