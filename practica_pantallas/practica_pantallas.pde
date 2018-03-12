int pantalla;
PFont font;

void setup() {
  size(400, 400);
  frameRate(24);
  smooth();
  font = loadFont("8bitOperatorPlus8-Regular-16.vlw");

  pantalla=0;

  setupUno();
  setupDos();
  setupTres();
  setupCuatro();
  setupCinco();
}

void draw() {

  if (pantalla ==0) {
    background(255);
    fill(0);
    text("Haz clic para comenzar", 10, 15);
  } else if (pantalla ==1) {
    drawUno();
    interfaz("Cargando ...", "2", "3", "4", "5");
  } else if (pantalla ==2) {
    drawDos();
    interfaz("Pantalla 2", "1", "3", "4", "5");
  } else if (pantalla ==3) {
    drawTres();
    interfaz("Pantalla 3", "1", "2", "4", "5");
  } else if (pantalla ==4) {
    drawCuatro();
    interfaz("Pantalla 4", "1", "2", "3", "5");
  } else if (pantalla ==5) {
    drawCinco();
    interfaz("Pantalla 5", "1", "2", "3", "4");
  }
}

void mouseReleased() {
  if (pantalla ==0) {
    pantalla = 1;
  } else {
    //navegador(1, 2, 3, 4);
    if (mouseX <= 285+30 && mouseX >= 285 && mouseY >=365 && mouseY <= 365+30) { //b1
      if (pantalla == 1) {
        pantalla = 2;
      } else if (pantalla == 2) {
        pantalla = 1;
      } else if (pantalla == 3) {
        pantalla = 1;
      } else if (pantalla == 4) {
        pantalla = 1;
      } else if (pantalla == 5) {
        pantalla = 1;
      }
    } else if (mouseX <= 305+30 && mouseX >= 305 && mouseY >=365 && mouseY <= 365+30) { //b2
      if (pantalla == 1) {
        pantalla = 3;
      } else if (pantalla == 2) {
        pantalla = 3;
      } else if (pantalla == 3) {
        pantalla = 2;
      } else if (pantalla == 4) {
        pantalla = 2;
      } else if (pantalla == 5) {
        pantalla = 2;
      }
    } else if (mouseX <= 335+30 && mouseX >= 335 && mouseY >=365 && mouseY <= 365+30) { //b3
      if (pantalla == 1) {
        pantalla = 4;
      } else if (pantalla == 2) {
        pantalla = 4;
      } else if (pantalla == 3) {
        pantalla = 4;
      } else if (pantalla == 4) {
        pantalla = 3;
      } else if (pantalla == 5) {
        pantalla = 3;
      }
    } else if (mouseX <= 365+30 && mouseX >= 365 && mouseY >=365 && mouseY <= 365+30) { //b4
      if (pantalla == 1) {
        pantalla = 5;
      } else if (pantalla == 2) {
        pantalla = 5;
      } else if (pantalla == 3) {
        pantalla = 5;
      } else if (pantalla == 4) {
        pantalla = 5;
      } else if (pantalla == 5) {
        pantalla = 4;
      }
    }
  }
}

void interfaz(String actual, String b1, String b2, String b3, String b4) {
  stroke(0.5);
  if (mouseX <= 285+30 && mouseX >= 285 && mouseY >=365 && mouseY <= 365+30) {
    colorBoton(275);
  } else if (mouseX <= 305+30 && mouseX >= 305 && mouseY >=365 && mouseY <= 365+30) {
    colorBoton(305);
  } else if (mouseX <= 335+30 && mouseX >= 335 && mouseY >=365 && mouseY <= 365+30) {
    colorBoton(335);
  } else if (mouseX <= 365+30 && mouseX >= 365 && mouseY >=365 && mouseY <= 365+30) {
    colorBoton(365);
  }

  fill(0);
  text(b1, 295, 385);
  text(b2, 320, 385);
  text(b3, 345, 385);
  text(b4, 370, 385);
  text(actual, 10, 15);
}

void colorBoton(int botonX) {
  if (mousePressed) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
  rect(botonX, 365, 30, 30);
}

//void navegador(int n1, int n2, int n3, int n4) {
//}