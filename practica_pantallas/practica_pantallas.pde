int pantalla;
PFont font;

void setup() {
  size(400, 400);
  frameRate(24);
  smooth();
  font = loadFont("8bitOperatorPlus8-Regular-16.vlw");

  pantalla=1;

  setupUno();
  setupDos();
  setupTres();
}

void draw() {


  if (pantalla ==0) {
    background(255);
    fill(0);
    text("Haz clic para comenzar", 10, 15);
  } else if (pantalla ==1) {
    drawUno();
    interfaz("Cargando ...", "2", "3");
  } else if (pantalla ==2) {
    drawDos();
    interfaz("Pantalla 2", "1", "3");
  } else if (pantalla ==3) {
    drawTres();
    interfaz("Pantalla 3", "1", "2");
  }
}

void mouseReleased() {
  if (pantalla ==0) {
    pantalla = 1;
  } else {
    if (mouseX <= 335+30 && mouseX >= 335 && mouseY >=365 && mouseY <= 365+30) {
      if (pantalla == 1) {
        pantalla = 2;
      }else if (pantalla == 2) {
        pantalla = 3;
      }else if (pantalla == 3) {
        pantalla = 1;
      }
    } else if (mouseX <= 365+30 && mouseX >= 365 && mouseY >=365 && mouseY <= 365+30) {
      if (pantalla == 1) {
        pantalla = 3;
      }else if (pantalla == 2) {
        pantalla = 3;
      }else if (pantalla == 3) {
        pantalla = 2;
      }
    }
  }
}

void interfaz(String actual, String b1, String b2) {
  stroke(0.5);

  if (mouseX <= 335+30 && mouseX >= 335 && mouseY >=365 && mouseY <= 365+30) {
    if (mousePressed) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }

    rect(335, 365, 30, 30);
  } else if (mouseX <= 365+30 && mouseX >= 365 && mouseY >=365 && mouseY <= 365+30) {
    if (mousePressed) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    rect(365, 365, 30, 30);
  }
  fill(0);
  text(b1, 345, 385);
  text(b2, 370, 385);
  text(actual, 10, 15);
}