int fondo, pos, sentido, circ, count;
PFont font; 
String a;
float angle;

void setup() {
  size(400, 400);
  font = loadFont("8bitOperatorPlus8-Regular-16.vlw");
  a= "Buenos días";
  textSize(48);
  noStroke();
  fondo=255;
  smooth();
  pos=0; //Posición del texto
  sentido=1; //Cambio de sentido del texto
  angle=0; //ángulo de giro
  circ=255; //Color y ctamaño del círculo
  count=0; //Contador de frames para el cambis de background
}

void draw() {
  background(fondo);
  fill(255, 255, 0);
  noStroke();
  //rectMode(0);
  rect(20, 20, 80, 80);
  rect(300, 20, 80, 80);
  rect(20, 300, 80, 80);
  rect(300, 300, 80, 80);

  if (mouseX >= 20 && mouseX<=100 && mouseY >= 20&& mouseY <= 100) {
    count++;
    if (count>=20) {
      fondo = int(random(0, 255));
      count=0;
    }
  } else if (mouseX >=20 && mouseX <=100 && mouseY >=300 && mouseY<=380) {
    fill(0);
    text(a, pos, height/2);
    pos= pos + sentido;
    if (pos >= width-270 || pos <= -10) {
      sentido = sentido*(-1);
    }
  } else if (mouseX >=300 && mouseX <=380 && mouseY >=20 && mouseY<=100) {
    fill(250, 0, 0, circ);
    ellipse(width/2, height/2, circ, circ);
    circ --;
    if ( circ <= 0) {
      circ = 255;
    }
  } else if (mouseX >= 300 && mouseX <= 380 && mouseY >=200 && mouseY>=280) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI+angle);
    fill(0,255,0);
    rect(-100,-100,200,200);
    popMatrix();
    angle=angle+0.05;
    if (angle>=360) {
      angle=0;
    }
  } else {
    if (count != 0) {
      count=0;
    } else if (circ!=255) {
      circ=255;
    } else if (pos!=0) {
      pos=0;
    } else if (fondo!=255) {
      fondo=255;
    } else if (angle!=0) {
      angle=0;
    }
  }
}