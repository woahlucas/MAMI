
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  line(width/2,height/2, mouseX, mouseY);
  fill(0);
  text(distancia2D(width/2,height/2,mouseX,mouseY),mouseX,mouseY);
}

int distancia2D(int x1,int y1,int x2,int y2){
  return int(sqrt(sq(x1 - y1)+sq(x2-y2)));
}
