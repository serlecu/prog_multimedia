class Ser {
  //color c;  //propiedades o atributos
  int X;
  int Y;
  //float v; //velocidad
  int sh; //shape > forma
  int s; //tamaño
  
  int vida = 0;

  Ser(int tempSh, int tempS/*, color c*/) { //Constructor
    X = mouseX;
    Y = mouseY;
    //v = random(-4,4);
    sh = tempSh;
    s = tempS;
    //this.c = c;


  } 

  void walk() {
    X += int(random(-10, 10));
    Y += int(random(-10, 10));
    if (X > width) {
      X = 0;
    }
    if (Y == height) {
      Y = 0;
    }
  }

  void display() {
    // Display the circle
    fill(vida);
    //stroke(0,life);
    noStroke();

    if (sh == 0) {
      rect(X, Y, s, s);
    } else if (sh == 1) {
      ellipse(X, Y, s, s);
    } else if (sh == 2) {
      triangle(X, Y, X+s, Y, X+(s/2), Y-(s/2));
    }
  }

  boolean muerte() {
    // Balls fade out
    vida++;
    if (vida > 255) {
      return true;
    } else {
      return false;
    }
  }
}