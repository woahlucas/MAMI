PImage imgOriginal;
color corOriginal,corDestino;
float r,g,b,media;

void setup(){
  size(1000,267);
  imgOriginal = loadImage("img.png");
  image(imgOriginal,0,0);
  Ruido();
  image(imgOriginal,200,0);
  Cinza();
  image(imgOriginal,400,0);
  Vermelho();
  image(imgOriginal,600,0);
  Amarelo();
  image(imgOriginal,800,0);
}

void Ruido(){
  for(int x = 0; x < 200; x++){
    for (int y = 0; y < 267; y++){
      corOriginal = imgOriginal.get(x,y);
      r = red(corOriginal)+int(random(50));
      g = green(corOriginal)+int(random(50));
      b = blue(corOriginal)+int(random(50));
      corDestino = color(r,g,b);
      imgOriginal.set(x,y,corDestino);
    }
  }
}

void Cinza(){
  for(int x =0; x < 200; x++)
    for(int y = 0; y < 267; y++){
      corOriginal = imgOriginal.get(x,y);
      r = red(corOriginal);
      g = green(corOriginal);
      b = blue(corOriginal);
      media = (0.3*r + 0.59*g + 0.11*b);
      corDestino = color(media,media,media);
      imgOriginal.set(x,y,corDestino);
    }
}

void Vermelho(){
  for(int x =0; x < 200; x++)
    for(int y = 0; y < 267; y++){
      corOriginal = imgOriginal.get(x,y);
      r = red(corOriginal);
      g = green(corOriginal);
      b = blue(corOriginal);
      corDestino = color(200,g,b);
      imgOriginal.set(x,y,corDestino);
    }
}

void Amarelo(){
  for(int x =0; x < 200; x++)
    for(int y = 0; y < 267; y++){
      corOriginal = imgOriginal.get(x,y);
      r = red(corOriginal);
      g = green(corOriginal);
      b = blue(corOriginal);
      corDestino = color(r,g,0);
      imgOriginal.set(x,y,corDestino);
    }
}
