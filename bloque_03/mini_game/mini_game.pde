int x, y, size, j, score, counter1, counter2, ui;
float vel, scale;
color c;
boolean dead;
ArrayList<BouncingBall> bballs;
Button start, info, backtomenu, restart;

float escalar(float x){
  float y;
  y= x*width/400;
  return y;
}

void setup() {
  fullScreen();
  //size(400, 600, P2D);
  bballs = new ArrayList<BouncingBall>();
  score=0;
  counter1=0;
  counter2=0;
  vel=1;
  size=30;
  ui=0;
  
  scale=width/4;
  //x->400 y->fullscreenWidth  x*fullscreenWidth/400=y
}

void draw() {
  background(0);
  fill(255);
  text(scale,width*0.5,30);
  if (ui==0) { ////////////// main menu
    //título
    textSize(32);
    textAlign(CENTER);
    fill(255);
    text("EYE", width*0.5, height*0.3);
    text("BRAIN", width*0.5, height*0.3+30);
    text("FINGUER", width*0.5, height*0.3+60);

    //botón de inicio
    start= new Button("START", width*0.5, height*0.5);
    start.display();

    //botón info
    info= new Button("INFO", width*0.5, height*0.5+50);
    info.display();

    //pelota rebotando
    if (bballs.isEmpty()) {
      x= int(random(0, width));
      y= int(random(0, height));
      bballs.add(new BouncingBall(x, y, size, vel));
    }
  } else if (ui==1) {   //////////////// info
    //text
    textSize(24);
    textAlign(CENTER);
    fill(255);
    text("as simple as tap", width*0.5, height*0.5);
    //2018 Sergio Lecuona Fornes sergiolecuona.es
    //botón return to menu
    backtomenu= new Button("BACK", width*0.5, height*0.75);
    backtomenu.display();
    //pelota rebotando
    if (bballs.isEmpty()) {
      x= int(random(0, width));
      y= int(random(0, height));
      bballs.add(new BouncingBall(x, y, size, vel));
    }
  } else if (ui==2) {//juego
    c = color(random(0, 245), random(0, 245), random(0, 245));
    if (bballs.isEmpty()) {
      x= int(random(0, width));
      y= int(random(0, height));
      bballs.add(new BouncingBall(x, y, size, vel));
    }
    for (int i = bballs.size()-1; i >= 0; i--) {
      BouncingBall bball = bballs.get(i);
      bball.walk();
      bball.display();
      dead = bball.delete();
      j = i;
    }
    fill(245);
    //stroke(2);
    textSize(24);
    text(score, width*0.5, height*0.2);
    if (bballs.size()>10) {
      bballs.clear();
      ui=3;
    }
  } else if (ui==3) {//puntuación
    //mostrar puntuación
    textAlign(CENTER);
    fill(245);
    textSize(18);
    text("score", width*0.5, height*0.4-20);
    textSize(24);
    text(score, width*0.5, height*0.4);
    //botón repetir
    restart = new Button("AGAIN", width*0.5, height*0.5);
    //botón return to menu
    backtomenu= new Button("BACK", width*0.5, height*0.5+50);
    backtomenu.display();
  }
}

void keyPressed() {
  bballs.clear();
  score=0;
  counter1=0;
  vel=1;
  ui=0;
}

void mouseReleased() {
    if (ui==0) {
      if (start.accionar(mouseX, mouseY, 2)==true) {
        ui=2;
      } else if (info.accionar(mouseX, mouseY, 1)==true) {
        ui=1;
      }
    } else if (ui==1) {
      if (backtomenu.accionar(mouseX, mouseY, 0)==true) {
        ui=0;
      }
    } else if (ui==2) {
      if (dead) {
        bballs.remove(j);
        score++;
        if (counter1<8) {
          counter1++;
        } else {
          vel=vel+0.5;
          counter1=0;
        }
      } else {
        x= int(random(0, width));
        y= int(random(0, height));
        bballs.add(new BouncingBall(x, y, size, vel));
      }
    } else if (ui==3) {
      if (backtomenu.accionar(mouseX, mouseY, 0)==true) {
        ui=0;
        score=0;
        vel=1;
        counter1=0;
      }
    }
}

//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////

class Button {
  String text;
  float xpos, ypos;
  int xsize, ysize, prescol, normcol, to;
  Button(String t, float x, float y) {
    text=t;
    xpos=x;
    ypos=y;
    xsize=100;
    ysize=35;
    normcol=245; //cambio de color al presionar
    prescol=190;
  }
  void display() {
    rectMode(CENTER);
    fill(245);
    rect(xpos, ypos, xsize, ysize);
    textAlign(CENTER);
    fill(0);
    textSize(24);
    text(text, xpos, ypos+(ysize*0.2));
  }
  boolean accionar(float mx, float my, int n) { //(coordX,coordY,ui a la que cambia)
    if (mx>xpos-(xsize)&&mx<xpos+(xsize)&&my>ypos-(ysize)&&my<ypos+(ysize)) {
      //to = n;
      //ui=n;
      return true;
    } else {
      return false;
    }
  }
}

class BouncingBall {
  int size, xpos, ypos;
  float vel, dirx, diry;
  color c;
  BouncingBall(int x, int y, int s, float v) {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    size=s;
    xpos=x;
    ypos=y;
    vel=v;
    dirx=random(1)>0.5?1:(-1);
    diry=random(1)>0.5?1:(-1);
  }
  void walk() {
    xpos=xpos+int(vel*dirx);
    ypos=ypos+int(vel*diry);
    if (xpos<0||xpos>width) {
      dirx=dirx*(-1);
    }
    if (ypos<=0||ypos>height) {
      diry=diry*(-1);
    }
  }
  void display() {
    fill(c);
    noStroke();
    ellipse(xpos, ypos, size, size);
  }
  boolean delete() {
    if (mousePressed) { 
      if (mouseX < xpos+size && mouseX > xpos-size && mouseY < ypos+size && mouseY > ypos-size) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
